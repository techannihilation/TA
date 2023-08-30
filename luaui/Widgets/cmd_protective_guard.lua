function widget:GetInfo()
	return {
		name	= "Protective Guard",
		desc	= "guards rather than follows vulnerable units",
		author  = "zoggop",
		date 	= "February 2014",
		license	= "whatever",
		layer 	= 0,
		enabled	= false
	}
end



-- LOCAL DEFINITIONS

local sqrt = math.sqrt
local random = math.random
local pi = math.pi
local halfPi = pi / 2
local twicePi = pi * 2
local cos = math.cos
local sin = math.sin
local atan2 = math.atan2
local abs = math.abs
local max = math.max
local min = math.min
local ceil = math.ceil

local mapBuffer = 32

local targets = {}
local guards = {}
local defSpeed = {}
local defKind = {} -- 1 is immobile, 2 is mobile without weapons, 3 is mobile with weapons
local defSize = {}
local defRange = {}
local widgetCommands = {}

local sizeX = Game.mapSizeX
local sizeZ = Game.mapSizeZ
local bufferedSizeX = sizeX - mapBuffer
local bufferedSizeZ = sizeZ - mapBuffer

-- commands that cause guarding to stop
local interruptCmd = {
	[0] = true,
	[10] = true,
	[15] = true,
	[16] = true,
	[20] = true,
	[21] = true,
	[25] = true,
	[40] = true,
	[90] = true,
	[125] = true,
	[130] = true,
	[140] = true,
}



--- LOCAL FUNCTIONS

local function ConstrainToMap(x, z)
	x = max(min(x, bufferedSizeX), mapBuffer)
	z = max(min(z, bufferedSizeZ), mapBuffer)
	return x, z
end

local function RandomAway(x, z, dist, angle)
	if angle == nil then angle = random() * twicePi end
	local nx = x + dist * cos(angle)
	local nz = z - dist * sin(angle)
	return ConstrainToMap(nx, nz)
end

local function Distance(x1, z1, x2, z2)
	local xd = x1 - x2
	local zd = z1 - z2
	return sqrt(xd*xd + zd*zd)
end

local function ApplyVector(x, z, vx, vz, frames)
	if frames == nil then frames = 30 end
	return ConstrainToMap(x + (vx * 30), z + (vz * 30))
end

local function ManhattanDistance(x1, z1, x2, z2)
	local xd = abs(x1 - x2)
	local yd = abs(z1 - z2)
	return xd + yd
end

local function GetLongestWeaponRange(unitDefID)
	local weaponRange = 0
	local unitDef = UnitDefs[unitDefID]
	local weapons = unitDef["weapons"]
	for i=1, #weapons do
		local weaponDefID = weapons[i]["weaponDef"]
		local weaponDef = WeaponDefs[weaponDefID]
		if weaponDef["range"] > weaponRange then
			weaponRange = weaponDef["range"]
		end
	end
	return weaponRange
end

local function GetUnitDefInfo()
	local speeds = {}
	local types = {}
	local sizes = {}
	local ranges = {}
	for uDefID, uDef in pairs(UnitDefs) do
		speeds[uDefID] = uDef.speed
		if uDef.canMove then
			if uDef.canAttack and not uDef.canAssist and not uDef.canRepair and not uDef.canFly then
				types[uDefID] = 3
			else
				types[uDefID] = 2
			end
		else
			types[uDefID] = 1
		end
		local x = uDef.xsize * 8
		local z = uDef.zsize * 8
		sizes[uDefID] = ceil(sqrt((x^2) + (z)^2))
		ranges[uDefID] = GetLongestWeaponRange(uDefID)
	end
	return speeds, types, sizes, ranges
end

local function GiveCommand(unitID, cmdID, cmdParams)
	local command = Spring.GiveOrderToUnit(unitID, cmdID, cmdParams, {})
	if command == true then
		local cmd = { unitID = unitID, cmdID = cmdID, cmdParams = cmdParams }
		table.insert(widgetCommands, cmd)
	end
end

local function SetGuardMoveState(guard, moveState)
	if guard.moveState ~= moveState then
		Spring.GiveOrderToUnit(guard.unitID, CMD.MOVE_STATE, {moveState}, {})
		guard.moveState = moveState
	end
end

local function AssignGuard(guardID, targetID)
	local guardDefID = Spring.GetUnitDefID(guardID)
	local targetDefID = Spring.GetUnitDefID(targetID)
	if defSpeed[guardDefID] > defSpeed[targetDefID] then
		if targets[targetID] == nil then
			-- make a new target
			targets[targetID] = { defID = targetDefID, guards = {}, guardDistance = (defSize[targetDefID] / 2) + 100 }
			if defKind[targetDefID] == 1 then
				-- if it's a building, store the position
				targets[targetID].x, targets[targetID].y, targets[targetID].z = Spring.GetUnitPosition(targetID)
			end
		end
		local target = targets[targetID]
		local states = Spring.GetUnitStates(guardID)
		local guard = { unitID = guardID, defID = Spring.GetUnitDefID(guardID), guarding = true, initialMoveState = states["movestate"], moveState = states["movestate"] }
		table.insert(target.guards, guard)
		guards[guardID] = targetID
		SetGuardMoveState(guard, 0)
	end
end

local function RemoveGuard(guardID)
	local targetID = guards[guardID]
	local target = targets[targetID]
	if target == nil then return false end
	for gi, guard in pairs(target.guards) do
		if guard.unitID == guardID then
			if guard.angle then target.needSlotting = true end
			Spring.GiveOrderToUnit(guard.unitID, CMD.MOVE_STATE, {guard.initialMoveState}, {})
			table.remove(target.guards, gi)
			if #target.guards == 0 then
				targets[targetID] = nil
			end
			guards[guardID] = nil
			return true
		end
	end
	return false
end

local function RemoveTarget(targetID)
	local target = targets[targetID]
	if target == nil then return false end
	for gi, guard in pairs(target.guards) do
		guards[guard.unitID] = nil
	end
	targets[targetID] = nil
	return true
end



-- SPRING CALLINS

function widget:Initialize()
	if Spring.IsReplay() or Spring.GetGameFrame() > 0 then
	    widget:PlayerChanged()
  	end
	defSpeed, defKind, defSize, defRange = GetUnitDefInfo()
end

function widget:PlayerChanged(playerID)
	if Spring.GetSpectatingState() and Spring.GetGameFrame() > 0 then
		widgetHandler:RemoveWidget(self)
	end
end

function widget:GameStart()
	widget:PlayerChanged()
end

function widget:UnitCommand(unitID, unitDefID, unitTeam, cmdID, cmdOpts, cmdParams, cmdTag)
	if not interruptCmd[cmdID] or cmdID<0 then return end
	-- check if this is a command issued from this widget
	for ci, cmd in pairs(widgetCommands) do
		if unitID == cmd.unitID and cmdID == cmd.cmdID then
			local paramsMatch = true
			for pi, param in pairs(cmdParams) do
				if cmd.cmdParams[pi] ~= param then
					paramsMatch = false
					break
				end
			end
			if paramsMatch then
				table.remove(widgetCommands, ci)
				return
			end
		end
	end
	-- this is not a widget command
	if cmdID == CMD.GUARD then
		if defKind[unitDefID] == 3 then
			local targetID = cmdParams[1]
			local currentTargetID = guards[unitID]
			if currentTargetID ~= targetID then
				if currentTargetID ~= nil then
					-- if already guarding something, stop
					RemoveGuard(unitID)
				end
				AssignGuard(unitID, targetID)
			end
		end
	else
		if guards[unitID] then
			RemoveGuard(unitID)
		end
	end
end

function widget:UnitDestroyed(unitID, unitDefID, teamID, attackerID, attackerDefID, attackerTeamID)
	if guards[unitID] then
		RemoveGuard(unitID)
	elseif targets[unitID] then
		RemoveTarget(unitID)
	end
end

function widget:UnitTaken(unitID, unitDefID, unitTeam, newTeam)
	if guards[unitID] then
		RemoveGuard(unitID)
	end
end

function widget:GameFrame(gameFrame)
	if gameFrame % 30 == 0 then
		for targetID, target in pairs(targets) do
			if target.underFire ~= nil then
				-- target is no longer under fire after 5 seconds
				if gameFrame > target.underFire + 150 then
					target.underFire = nil
				end
			end
			local tx = target.x
			local tz = target.z
			local ty = target.y
			local vx = 0
			local vz = 0
			local vy = 0
			if tx == nil then
				vx, vy, vz = Spring.GetUnitVelocity(targetID)
				tx, ty, tz = Spring.GetUnitPosition(targetID)
				tx, tz = ApplyVector(tx, tz, vx, vz)
			end
			local slotThese = {}
			for gi, guard in pairs(target.guards) do
				local gx, gy, gz = Spring.GetUnitPosition(guard.unitID)
				local dist = Distance(tx, tz, gx, gz)
				if dist > target.guardDistance * 3 then
					if not guard.guarding then
						GiveCommand(guard.unitID, CMD.GUARD, {targetID})
						SetGuardMoveState(guard, 0)
						guard.guarding = true
					end
					if guard.angle then target.needSlotting = true end
					guard.angle = nil
				else
					guard.guarding = false
					if guard.angle == nil then target.needSlotting = true end
					if target.underFire then
						SetGuardMoveState(guard, 2)
					else
						SetGuardMoveState(guard, 1)
					end
					table.insert(slotThese, guard)
				end
			end
			-- find angle slots if needed and move units to them
			local divisor = #slotThese
			local guardVolume = 0
			if divisor > 0 then
				local angles
				if divisor < 3 and (target.lastVX ~= vx or target.lastVZ ~= vz) then target.needSlotting = true end -- one or two guards should guard in front of unit first
				if target.needSlotting then
					local angleAdd = twicePi / divisor
					local angle
					if divisor < 3 and (abs(vx) > 0 or abs(vz) > 0) then 
						 -- one or two guards should guard in front of unit first
						angle = atan2(-vz, vx)
						target.lastAngle = angle
					elseif target.lastAngle then
						angle = target.lastAngle
					else
						angle = random() * twicePi
						target.lastAngle = angle
					end
					angles = {}
					for i = 1, divisor do
						local a = angle + (angleAdd * (i - 1))
						if a > twicePi then a = a - twicePi end 
						table.insert(angles, a)
					end
				end
				local guardDist = target.guardDistance
				if target.underFire then guardDist = guardDist * 0.75 end
				for gi, guard in pairs(slotThese) do
					local attacking
					local cmdQueue = Spring.GetUnitCommands(guard.unitID, 1)
					if cmdQueue[1] then
						if cmdQueue[1].id == CMD.ATTACK then attacking = true end
					end
					local maxDist = defSize[guard.defID]
					if attacking then
						if target.underFire then
							maxDist = (defRange[guard.defID] + defSpeed[guard.defID]) * 0.25
						else
							maxDist = (defRange[guard.defID] + defSpeed[guard.defID]) * 0.75
						end
					end
					if target.needSlotting then
						guardVolume = guardVolume + defSize[guard.defID]
						local bestAngle
						if guard.angle == nil then
							local leastDist = 1000
							for ai, a in pairs(angles) do
								local mx, mz = RandomAway(tx, tz, guardDist, a)
								local slotDist = Distance(tx, tz, mx, mz)
								if slotDist < leastDist then
									leastDist = slotDist
									bestAngle = ai
								end
							end
						else
							local leastDist = twicePi
							for ai, a in pairs(angles) do
								local angleDist
								if a > pi and guard.angle < pi then
									angleDist = (a - pi) + guard.angle
								elseif a < pi and guard.angle > pi then
									angleDist = a + (guard.angle - pi)
								else
									angleDist = abs(a - guard.angle)
								end
								if angleDist < leastDist then
									leastDist = angleDist
									bestAngle = ai
								end
							end
						end
						if bestAngle then
							guard.angle = table.remove(angles, bestAngle)
						else
							guard.angle = table.remove(angles)
						end
					end
					-- move into position if needed
					local mx, mz = RandomAway(tx, tz, guardDist, guard.angle)
					local slotDist = Distance(tx, tz, mx, mz)
					if slotDist > maxDist then
						local my = Spring.GetGroundHeight(mx, mz)
						GiveCommand(guard.unitID, CMD.MOVE, {mx, my, mz})
					end
				end
			end
			if target.needSlotting then
				target.guardDistance = (defSize[target.defID] / 2) + max(100, ceil(guardVolume / 7.5))
			end
			target.needSlotting = false
			target.lastVX = vx
			target.lastVZ = vz
		end
	end
end

function widget:UnitDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponDefID, projectileID, attackerID, attackerDefID, attackerTeam)
	for targetID, target in pairs(targets) do
		if target.unitID == unitID then
			target.underFire = Spring.GetGameFrame()
		else
			for gi, guard in pairs(target.guards) do
				if guard.unitID == unitID and not guard.guarding then
					target.underFire = Spring.GetGameFrame()
					break
				end
			end
		end
		if target.underFire then break end
	end
end
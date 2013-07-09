function gadget:GetInfo()
  return {
    name      = "Mission Script Engine",
    desc      = "Runs mission triggers and event scripts",
    author    = "Deadnight Warrior",
    date      = "14 Jul 2012",
    license   = "GNU LGPL, v2 or later",
    layer     = 0,
    enabled   = true --  loaded by default?
  }
end

local abs = math.abs
local floor = math.floor
local ceil = math.ceil
local sqrt = math.sqrt
local pairs = pairs
local spGetGameFrame = Spring.GetGameFrame
local spGetGroundHeight = Spring.GetGroundHeight
local tainsert = table.insert
local taremove = table.remove

local modOptions = Spring.GetModOptions()
local gaiaTeamID = Spring.GetGaiaTeamID()
local teams = Spring.GetTeamList()
for i=1, #teams do
	if teams[i] == gaiaTeamID then
		taremove(teams, i)
		break
	end
end


if (gadgetHandler:IsSyncedCode()) then	-- SYNCED

local spEcho = Spring.Echo
local spGetGameSeconds = Spring.GetGameSeconds

local spGetTeamInfo = Spring.GetTeamInfo
local spSetTeamResource = Spring.SetTeamResource
local spAddTeamResource = Spring.AddTeamResource
local spGetTeamResources = Spring.GetTeamResources
local spUseTeamResource = Spring.UseTeamResource

local spGetUnitDefID = Spring.GetUnitDefID
local spCreateUnit = Spring.CreateUnit
local spCreateFeature = Spring.CreateFeature
local spDestroyUnit = Spring.DestroyUnit
local spTransferUnit = Spring.TransferUnit
local spSetUnitPosition = Spring.SetUnitPosition
local spGetUnitHealth = Spring.GetUnitHealth
local spGetUnitExperience = Spring.GetUnitExperience
local spSetUnitExperience = Spring.SetUnitExperience

local spGetUnitsInCylinder = Spring.GetUnitsInCylinder
local spGetUnitsInRectangle = Spring.GetUnitsInRectangle
local spGetTeamUnits = Spring.GetTeamUnits
local spGetTeamUnitsSorted = Spring.GetTeamUnitsSorted
local spGetTeamUnitCount = Spring.GetTeamUnitCount
local spGetTeamUnitDefCount = Spring.GetTeamUnitDefCount
local spGetTeamUnitsByDefs = Spring.GetTeamUnitsByDefs
local spGetTeamStartPosition = Spring.GetTeamStartPosition
local spGetPlayerInfo = Spring.GetPlayerInfo

local spPlaySoundFile = Spring.PlaySoundFile
local spSpawnCEG = Spring.SpawnCEG
local spSetCameraTarget = Spring.SetCameraTarget

local triggers, switches, timers, vars = {}, {}, {}, {}
local killCounter, deathCounter = {}, {}
local killCounterType = {}
local gameData, spawnData, missionTriggers, locations = {}, {}, {}, {}
local campaignData = {}
local cmpgName = Game.modShortName .. "_cmpg"

local commanderList = {	-- XTA specific
	arm_commander = 50,
	arm_decoy_commander = 0,
	arm_u0commander = 50,
	arm_ucommander = 1000,
	arm_u2commander = 1500,
	arm_u3commander = 4000,
	arm_u4commander = 9000,
	arm_scommander = 50,
	armcom = 200,
	arm_base = 0,
	arm_nincommander = 50,
	core_commander = 50,
	core_decoy_commander = 0,
	core_u0commander = 50,
	core_ucommander = 1000,
	core_u2commander = 1500,
	core_u3commander = 4000,
	core_u4commander = 9000,
	core_scommander = 50,
	corcom = 200,
	core_base = 0,
	core_nincommander = 50,
}

local function initTriggers()	-- pre-parse triggers
	for teamID, trig in pairs(missionTriggers) do
		triggers[teamID] = {}
		killCounter[teamID] = {}
		killCounter[teamID]["total"] = 0
		for _, enemyTeam in pairs(teams) do
			killCounter[teamID][enemyTeam] = {}
			killCounter[teamID][enemyTeam]["total"] = 0
		end
		killCounterType[teamID] = {}
		for no, val in pairs(trig) do
			triggers[teamID][no] = {}
			triggers[teamID][no].conditions = {}
			for cond, text in pairs(val.conditions) do
				triggers[teamID][no].conditions[cond] = {}
				local idx = 1
				for w in text:gmatch("[^%s]+") do
					triggers[teamID][no].conditions[cond][idx] = tonumber(w) or w
					idx = idx + 1
				end
			end
			triggers[teamID][no].actions = {}
			for actn, text in pairs(val.actions) do
				triggers[teamID][no].actions[actn] = {}
				local idx = 1
				for w in text:gmatch("[^%s]+") do
					if idx==1 and w=="Echo" or w=="Play" then 
						triggers[teamID][no].actions[actn][1] = w
						triggers[teamID][no].actions[actn][2] = text:sub(6,-1)
						break
					end
					triggers[teamID][no].actions[actn][idx] = tonumber(w) or w
					idx = idx + 1
				end
			end
			if val.once and val.once == true then
				triggers[teamID][no].once = true
			end
			triggers[teamID][no].wait = 0
		end
	end
	for i, teamID in pairs(teams) do
		deathCounter[teamID] = {}
		deathCounter[teamID]["total"] = 0
	end
	for i=1, 32 do
		switches[i]=false
	end
end

function gadget:Initialize()
	if modOptions and modOptions.mission then
		local mission = "Missions/" .. modOptions.mission ..".lua"
		if VFS.FileExists(mission) then
			gameData, spawnData, missionTriggers, locations = include(mission)
			if gameData.game == Game.modShortName then
				if gameData.map ~= Game.mapName then
					spEcho('Mission "' .. modOptions.mission .. "\" was started on a wrong map or you don't have " .. spawnData.map)
					spEcho("Swiching to standard skirmish mode")
					gadgetHandler:RemoveGadget()
				else
					initTriggers()			-- pre-parse trigger strings
					if spawnData.features then	-- spawn features in initialize phase so players can see them before game start
						for _, fData in pairs(spawnData.features) do
							spCreateFeature(fData[1], fData[2], spGetGroundHeight(fData[2], fData[3]), fData[3], fData[4], fData[5])
						end
					end
					missionTriggers = nil	-- kill table once not needed
				end
			else
				spEcho('This mission is intended for "' .. gameData.game .. '"')
				gadgetHandler:RemoveGadget()				
			end
		else
			spEcho("Mission parameter incorrect or wrong mission file")
			gadgetHandler:RemoveGadget()
		end
	else
		gadgetHandler:RemoveGadget()
	end
end

local locMsgQueue = {}
function gadget:RecvLuaMsg(msg, playerID)
	local _, _, playerIsSpec, playerTeam = spGetPlayerInfo(playerID)
	if not playerIsSpec then
		local tokens = {}
		for token in msg:gmatch("[^%s]+") do
			tokens[#tokens + 1] = token
		end
		-- changing game-state directly from here is unsafe
		if (tokens[1] == cmpgName and #tokens == 4) then
			locMsgQueue[#locMsgQueue + 1] = {tokens[2], tokens[3], tokens[4]}
		end
	end
end

function gadget:GameStart()
	for _, teamID in pairs(teams) do
		-- set start resources, either from mod options or custom team keys
		spSetTeamResource(teamID, "ms", 0)
		spSetTeamResource(teamID, "es", 0)	

		if spawnData.teams then		-- spawn units and structures defined by mission data
			for _, unitData in pairs(spawnData.teams[teamID]) do
				--local x, z = 16*floor((unitData[2]+8)/16), 16*floor((unitData[3]+8)/16)	-- snap to 16x16 grid, fails for odd footprint sizes
				--local x, z = 8*floor((unitData[2]+4)/8), 8*floor((unitData[3]+4)/8)	-- snap to 8x8 grid
				local x, z = unitData[2], unitData[3]	-- don't snap to grid, not needed if mission dumper was used
				local y = spGetGroundHeight(x, z)
				spCreateUnit(unitData[1], x, y, z, unitData[4], teamID)
			end
		end

		local teamOptions = select(7, spGetTeamInfo(teamID))
		local m = teamOptions.startmetal  or modOptions.startmetal  or 1000
		local e = teamOptions.startenergy or modOptions.startenergy or 1000
		if (m and tonumber(m) ~= 0) then
			spSetTeamResource(teamID, "m", 0)
			spAddTeamResource(teamID, "m", tonumber(m))
		end
		if (e and tonumber(e) ~= 0) then
			spSetTeamResource(teamID, "e", 0)
			spAddTeamResource(teamID, "e", tonumber(e))
		end
	end
	for _, unitData in pairs(locMsgQueue) do	-- units carried over from last mission (with XP)
		teamID = tonumber(unitData[3])
		local bonusUnit
		if commanderList[unitData[1]] then	-- carry over commander XP from last mission, this can be avoided if only first mission
											-- spawns a commander and each succesive mission gets its commander as a bonus unit
			local comms = spGetTeamUnitsByDefs(teamID, UnitDefNames[unitData[1]].id)
			bonusUnit = comms[1]
		else
			local x,y,z = spGetTeamStartPosition(teamID)
			bonusUnit = spCreateUnit(unitData[1],x,y,z,0,teamID)
		end
		spSetUnitExperience(bonusUnit, tonumber(unitData[2]))
	end
	local i=1
	while i <= #teams do	-- remove from team list all teams that have no triggers
		if triggers[teams[i]] then
			i=i+1
		else
			taremove(teams, i)
		end
	end
	if #teams == 0 then
		gadgetHandler:RemoveGadget()	-- this mission has no triggers, we're done
	end
	spawnData = nil		-- kill table once not needed
	gadgetHandler:RemoveCallIn("RecvLuaMsg")
end

local function testCondition(cond, teamID)
	local comm, qty, utype, idx = cond[1], cond[2], cond[3], cond[4]
	if type(qty)=="string" then
		qty = vars[qty]
	end
	
	-- Always   - Unconditional trigger
	if comm=="Always" then
		return true
	
	-- Ctrl quantity (unitname|ANY) [locIdx]
	elseif comm=="Ctrl" then
		local loc = locations[idx]
		local unitsInArea = {}
		if loc==nil then
			if utype=="ANY" then
				unitsInArea = spGetTeamUnits(teamID)
			else
				unitsInArea = spGetTeamUnitsByDefs(teamID, UnitDefNames[utype].id)
			end
			local count = 0
			for i=1, #unitsInArea do
				local _, _, _, _, build = spGetUnitHealth(unitsInArea[i])
				if build>=1 then
					count = count + 1
				end
			end			
			if qty >= 0 then
				return count >= qty
			else
				return count < qty
			end	
		elseif loc.shape == "C" then
			unitsInArea = spGetUnitsInCylinder(loc.X,loc.Z,loc.r,teamID)
		elseif loc.shape == "R" then
			unitsInArea = spGetUnitsInRectangle(loc.X1,loc.Z1,loc.X2,loc.Z2,teamID)
		end
		if utype=="ANY" then
			local count = 0
			for i=1, #unitsInArea do
				local _, _, _, _, build = spGetUnitHealth(unitsInArea[i])
				if build>=1 then
					count = count + 1
				end
			end
			if qty >= 0 then
				return count >= qty
			else
				return count < qty
			end
		else
			local count, uDefID = 0, UnitDefNames[utype].id
			for i=1, #unitsInArea do
				if spGetUnitDefID(unitsInArea[i]) == uDefID then
					local _, _, _, _, build = spGetUnitHealth(unitsInArea[i])
					if build>=1 then
						count = count + 1
					end
				end
			end
			if qty >= 0 then
				return count >= qty
			else
				return count < qty
			end
		end
		
	-- Death quantity (unitname|ANY) [ownerID]
	elseif comm=="Death" then
		local team = idx or teamID
		if utype == "ANY" then
			if qty >= 0 then	--total deaths
				return deathCounter[team]["total"] >= qty
			else
				return deathCounter[team]["total"] < qty
			end
		else
			if qty >= 0 then	--deaths by unitname
				return (deathCounter[team][UnitDefNames[utype].id] or 0)>= qty
			else
				return (deathCounter[team][UnitDefNames[utype].id] or 0) < qty
			end
		end			

	-- Kill quantity (unitname|ANY) [ownerID]
	elseif comm=="Kill" then
		if cond[4] then
			if utype == "ANY" then
				if qty >= 0 then	-- total kills by enemy team
					return killCounter[teamID][idx]["total"] >= qty
				else
					return killCounter[teamID][idx]["total"] < qty
				end
			else
				if qty >= 0 then	-- kills by enemy team by unitname
					return (killCounter[teamID][idx][UnitDefNames[utype].id] or 0) >= qty
				else
					return (killCounter[teamID][idx][UnitDefNames[utype].id] or 0) < qty
				end
			end			
		else
			if utype == "ANY" then
				if qty >= 0 then	-- total number of kills
					return killCounter[teamID]["total"] >= qty
				else
					return killCounter[teamID]["total"] < qty
				end
			else
				if qty >= 0 then	-- total number of unitname kills
					return (killCounterType[teamID][UnitDefNames[utype].id] or 0) >= qty
				else
					return (killCounterType[teamID][UnitDefNames[utype].id] or 0) < qty
				end
			end
		end

	-- Res quantity (M|E|ME) [teamID]
	elseif comm=="Res" then
		local team = cond[4] or teamID
		local currentM = spGetTeamResources(team, "metal")
		local currentE = spGetTeamResources(team, "energy")
		if utype=="M" then
			if qty>= 0 then
				return currentM >= qty
			else
				return currentM < qty
			end
		elseif utype=="E" then
			if qty>= 0 then
				return currentE >= qty
			else
				return currentE < qty
			end
		elseif utype=="ME" then
			if qty>= 0 then
				return currentM >= qty and currentE >= qty
			else
				return currentM < qty and currentE < qty
			end
		else
			return false
		end

	-- Switch (number|name) (true|false)
	elseif comm=="Switch" then
		if utype=="true" then
			return switches[cond[2]]==true
		elseif utype=="false" then
			return switches[cond[2]]==false
		else
			return false
		end

	-- Time quantity
	elseif comm=="Time" then
		if qty>= 0 then
			return spGetGameSeconds() >= qty
		else
			return spGetGameSeconds() < qty
		end	
		
	-- Timer (number|name)
	elseif comm=="Timer" then
		if timers[cond[2]] then
			return timers[cond[2]]<=0
		end	

	-- Var name (>|>=|=|<=|<|~=) value
	elseif comm=="Var" then
		local var, op, val = cond[2], cond[3], cond[4]
		if type(val)=="string" then
			val = vars[val]
		end
		if op==">" then
			return vars[var] > val
		elseif op==">=" then
			return vars[var] >= val
		elseif op=="=" then
			return vars[var] == val
		elseif op=="<=" then
			return vars[var] <= val
		elseif op=="<" then
			return vars[var] < val
		elseif op=="~=" then
			return vars[var] ~= val
		end

	--Unknown condition
	else
		return false
	end
end

local function testConditions(conditions, teamID)
	for i=1, #conditions do
		if testCondition(conditions[i], teamID)==false then
			return false
		end
	end
	return true
end

local function DoActions(actions, teamID, trigNo)
	for i=1, #actions do
		local actn = actions[i]
		local comm = actn[1]
		
		-- Bonus (unitname|ANY) minXP [locIdx]
		if comm=="Bonus" then
			local xp = actn[3]
			if type(xp)=="string" then
				xp = vars[xp]
			end
			local unitsInArea = {}
			if actn[4] then
				local loc = locations[actn[4]]
				if loc.shape == "C" then
					unitsInArea = spGetUnitsInCylinder(loc.X,loc.Z,loc.r,teamID)
				elseif loc.shape == "R" then
					unitsInArea = spGetUnitsInRectangle(loc.X1,loc.Z1,loc.X2,loc.Z2,teamID)
				end
				if actn[2]=="ANY" then
					for i=1, #unitsInArea do
						local myXP = spGetUnitExperience(unitsInArea[i])
						if myXP >= xp then
							SendToUnsynced("BonusUnits", unitsInArea[i])
						end
					end
				else
					local uDefID = UnitDefNames[actn[2]].id
					for i=1, #unitsInArea do
						if spGetUnitDefID(unitsInArea[i]) == uDefID then
							local myXP = spGetUnitExperience(unitsInArea[i])
							if myXP >= xp then
								SendToUnsynced("BonusUnits", unitsInArea[i])
							end
						end
					end
				end
			else
				if actn[2]=="ANY" then
					unitsInArea = spGetTeamUnits(teamID)
					for i=1, #unitsInArea do
						local myXP = spGetUnitExperience(unitsInArea[i])
						if myXP >= xp then
							SendToUnsynced("BonusUnits", unitsInArea[i])
						end
					end
				else
					local uDefID = UnitDefNames[actn[2]].id
					local unitsInArea = spGetTeamUnitsByDefs(teamID, uDefID)
					for i=1, #unitsInArea do
						local myXP = spGetUnitExperience(unitsInArea[i])
						if myXP >= xp then
							SendToUnsynced("BonusUnits", unitsInArea[i])
						end
					end
				end
			end
		
		-- Cam (locIdx|x y z) [transTime]
		elseif comm=="Cam" then
			if #actn==5 then
				spSetCameraTarget(actn[2],actn[3],actn[4],actn[5])
			elseif #actn==4 then
				spSetCameraTarget(actn[2],actn[3],actn[4])
			elseif #actn==3 then
				local x,z
				local loc = locations[actn[3]]
				if loc.shape == "C" then
					x, z = loc.X, loc.Z
				elseif loc.shape == "R" then
					x, z = (loc.X1 + loc.X2)*0.5, (loc.Z1 + loc.Z2)*0.5
				else
					return
				end
				spSetCameraTarget(x,spGetGroundHeight(x,z),z,actn[3])
			elseif #actn==2 then
				local x,z
				local loc = locations[actn[3]]
				if loc.shape == "C" then
					x, z = loc.X, loc.Z
				elseif loc.shape == "R" then
					x, z = (loc.X1 + loc.X2)*0.5, (loc.Z1 + loc.Z2)*0.5
				else
					return
				end
				spSetCameraTarget(x,spGetGroundHeight(x,z),z)
			end
			
		-- CEG cegname (x y z dx dy dz r dam|locIdx h)
		elseif comm=="CEG" then
			if #actn==10 then
				spSpawnCEG(actn[2],actn[3],actn[4],actn[5],actn[6],actn[7],actn[8],actn[9],actn[10])
			else
				local x,z
				local loc = locations[actn[3]]
				if loc.shape == "C" then
					x, z = loc.X, loc.Z
				elseif loc.shape == "R" then
					x, z = (loc.X1 + loc.X2)*0.5, (loc.Z1 + loc.Z2)*0.5
				else
					return
				end
				local y = spGetGroundHeight(x,z) + actn[4]
				spSpawnCEG(actn[2],x,y,z,0,1,0,1,1)
			end

		-- Defeat [teamID]
		elseif comm=="Defeat" then
			Spring.KillTeam(actn[2] or teamID)

		-- Echo Any kind of message.
		elseif comm=="Echo" then
			--spEcho(actn[2])
			SendToUnsynced("ScreenMessage", actn[2], actn[2]:len()/6, teamID)

		-- Eco quantity (M|E|ME) [teamID]
		elseif comm=="Eco" then
			local team = actn[4] or teamID
			local qty = actn[2]
			if type(qty)=="string" then
				qty = vars[qty]
			end
			if actn[3]=="M" then
				if qty>=0 then
					spAddTeamResource(team, "metal", qty)
				else
					spUseTeamResource(team, "metal", 0-qty)
				end
			elseif actn[3]=="E" then
				if qty>=0 then
					spAddTeamResource(team, "energy", qty)
				else
					spUseTeamResource(team, "energy", 0-qty)
				end			
			elseif actn[3]=="ME" then
				if qty>=0 then
					spAddTeamResource(team, "metal", qty)
					spAddTeamResource(team, "energy", qty)
				else
					spUseTeamResource(team, {metal=0-qty, energy=0-qty})
				end			
			end

		-- Give quantity unitname locIdx [teamID]
		elseif comm=="Give" then
			local loc = locations[actn[4]]
			local qty = actn[2]
			if type(qty)=="string" then
				qty = vars[qty]
			end
			local team = actn[5] or teamID
			local unitname = actn[3]
			local x, z, xr, zr
			if loc.shape == "C" then
				x, z = loc.X, loc.Z
			elseif loc.shape == "R" then
				x, z = (loc.X1 + loc.X2)*0.5, (loc.Z1 + loc.Z2)*0.5
			else
				return
			end
			local xs, zs = UnitDefs[UnitDefNames[unitname].id].xsize*8, UnitDefs[UnitDefNames[unitname].id].zsize*8
			xr = ceil(sqrt(qty))
			zr = ceil(qty/xr)-1
			local dz, dx = zr*0.5*zs, (xr-1)*0.5*xs
			for zp=z-dz, z+dz-zs, zs do
				for xp=x-dx, x+dx, xs do
					local y = spGetGroundHeight(xp,zp)
					spCreateUnit(unitname, xp, y, zp, 0,team)
				end
			end
			local zp = z+dz
			for i=0, qty-xr*zr-1 do
				local xp = x-dx+i*xs
				local y = spGetGroundHeight(xp, zp)
				spCreateUnit(unitname, xp, y, zp, 0, team)
			end

		-- Kill (unitname|ANY) teamID [locIdx]
		elseif comm=="Kill" then
			local team = actn[3]	
			local unitsInArea = {}
			if actn[4] then
				local loc = locations[actn[4]]
				if loc.shape == "C" then
					unitsInArea = spGetUnitsInCylinder(loc.X,loc.Z,loc.r,team)
				elseif loc.shape == "R" then
					unitsInArea = spGetUnitsInRectangle(loc.X1,loc.Z1,loc.X2,loc.Z2,team)
				end
				if actn[2]=="ANY" then
					for i=1, #unitsInArea do
						spDestroyUnit(unitsInArea[i], false, false, teamID)
					end
				else
					local uDefID = UnitDefNames[actn[2]].id
					for i=1, #unitsInArea do
						if spGetUnitDefID(unitsInArea[i]) == uDefID then
							spDestroyUnit(unitsInArea[i], false, false, teamID)
						end
					end
				end
			else
				if actn[2]=="ANY" then
					unitsInArea = spGetTeamUnits(team)
					for i=1, #unitsInArea do
						spDestroyUnit(unitsInArea[i], false, false, teamID)
					end
				else
					local unitsInArea = spGetTeamUnitsByDefs(team, UnitDefNames[actn[2]].id)
					for i=1, #unitsInArea do
						spDestroyUnit(unitsInArea[i], false, false, teamID)
					end
				end
			end
			
		-- Loc (number|name) (true|false|flip)
		elseif comm=="Loc" then
			local num = actn[2]
			if actn[3]=="true" then
				locations[num].visible = true
			elseif actn[3]=="false" then
				locations[num].visible = false
			elseif actn[3]=="flip" then
				locations[num].visible = not (locations[num].visible==true)
			end
			SendToUnsynced("LocationVisibilty", num, locations[num].visible)

		-- Move (unitname|ANY) src dest [teamID]
		elseif comm=="Move" then
			local src = locations[actn[3]]
			local dest = locations[actn[4]]
			local team = actn[5] or teamID
			local allUnitsInArea = {}
			local unitsInArea = {}
			if src.shape == "C" then
				allUnitsInArea = spGetUnitsInCylinder(src.X,src.Z,src.r,team)
			elseif src.shape == "R" then
				allUnitsInArea = spGetUnitsInRectangle(src.X1,src.Z1,src.X2,src.Z2,team)
			end
			if actn[2]=="ANY" then
				unitsInArea = allUnitsInArea
			else
				local uDefID = UnitDefNames[actn[2]].id
				local i = 1
				for j=1, #allUnitsInArea do
					if spGetUnitDefID(allUnitsInArea[j]) == uDefID then
						unitsInArea[i] = allUnitsInArea[j]
						i = i + 1
					end
				end
			end
			local xs, zs = 1, 1
			for i=1, #unitsInArea do
				local def = UnitDefs[spGetUnitDefID(unitsInArea[i])]
				if def.xsize > xs then xs = def.xsize end
				if def.zsize > zs then zs = def.zsize end				
			end
			xs, zs = xs*8, zs*8
			local x, z, xr, zr
			if dest.shape == "C" then
				x, z = dest.X, dest.Z
			elseif dest.shape == "R" then
				x, z = (dest.X1 + dest.X2)*0.5, (dest.Z1 + dest.Z2)*0.5
			else
				return
			end
			local qty, i = #unitsInArea, 1
			xr = ceil(sqrt(qty))
			zr = ceil(qty/xr)-1
			local dz, dx = zr*0.5*zs, (xr-1)*0.5*xs
			for zp=z-dz, z+dz-zs, zs do
				for xp=x-dx, x+dx, xs do
					spSetUnitPosition(unitsInArea[i], xp, zp)
					i = i + 1
				end
			end
			local zp = z+dz
			for j=0, qty-xr*zr-1 do
				local xp = x-dx+j*xs
				spSetUnitPosition(unitsInArea[i], xp, zp)
				i = i + 1
			end

		-- Play soundfile
		elseif comm=="Play" then
			spPlaySoundFile(actn[2])

		-- Share (unitname|ANY) teamID [locIdx]
		elseif comm=="Share" then
			local team = actn[3]
			local unitsInArea = {}
			if actn[4] then
				local loc = locations[actn[4]]
				if loc.shape == "C" then
					unitsInArea = spGetUnitsInCylinder(loc.X,loc.Z,loc.r,teamID)
				elseif loc.shape == "R" then
					unitsInArea = spGetUnitsInRectangle(loc.X1,loc.Z1,loc.X2,loc.Z2,teamID)
				end
				if actn[2]=="ANY" then
					for i=1, #unitsInArea do
						spTransferUnit(unitsInArea[i], team)
					end
				else
					local uDefID = UnitDefNames[actn[2]].id
					for i=1, #unitsInArea do
						if spGetUnitDefID(unitsInArea[i]) == uDefID then
							spTransferUnit(unitsInArea[i], team)
						end
					end
				end
			else
				if actn[2]=="ANY" then
					unitsInArea =spGetTeamUnits(teamID)
					for i=1, #unitsInArea do
						spTransferUnit(unitsInArea[i], team)
					end
				else
					unitsInArea = spGetTeamUnitsByDefs(team, UnitDefNames[actn[2]].id)
					for i=1, #unitsInArea do
						spTransferUnit(unitsInArea[i], team)
					end
				end
			end
			
		-- Switch (number|name) (true|false|flip)
		elseif comm=="Switch" then
			local num = actn[2]
			if actn[3]=="true" then
				switches[num] = true
			elseif actn[3]=="false" then
				switches[num] = false
			elseif actn[3]=="flip" then
				switches[num] = not (switches[num]==true)
			end

		-- Timer (number|name) quantity
		elseif comm=="Timer" then
			timers[actn[2]] = actn[3]

		-- Var (name) (number|name) [operator (number|name)]
		elseif comm=="Var" then
			if #actn==3 then
				if type(actn[3])=="string" then
					vars[actn[2]] = vars[actn[3]]
				else
					vars[actn[2]] = actn[3]
				end
			else
				local vr = actn[3]
				if type(vr)=="string" then
					vr = vars[actn[3]]
				end
				local qty = actn[5]
				if type(qty)=="string" then
					qty = vars[actn[5]]
				end
				local oper = actn[4]
				if oper=="+" then
					vars[actn[2]] = vr + qty		
				elseif oper=="-" then
					vars[actn[2]] = vr - qty		
				elseif oper=="*" then
					vars[actn[2]] = vr * qty		
				elseif oper=="/" then
					vars[actn[2]] = vr / qty		
				elseif oper=="%" then
					vars[actn[2]] = vr % qty		
				elseif oper=="^" then
					vars[actn[2]] = vr ^ qty
				end
			end
		
		-- Victory
		elseif comm=="Victory" then
			local allyTeam = select(6,spGetTeamInfo(teamID))
			Spring.GameOver({allyTeam})

		-- Wait time
		elseif comm=="Wait" then
			triggers[teamID][trigNo].wait = actn[2]
		end
	end
end

function gadget:UnitDestroyed(unitID, unitDefID, teamID, attackerID, attackerDefID, attackerTeamID)
	local _, _, _, _, build = spGetUnitHealth(unitID)
	if build>=1 then	-- don't count destruction of unfinished units
		-- don't track gaia team's kills, but if a gaia unit is killed, it counts under per unit type kill
		if attackerID and attackerTeamID and killCounter[attackerTeamID] and attackerTeamID ~= gaiaTeamID and teamID ~= attackerTeamID then
			if teamID ~= gaiaTeamID then	-- don't track per team kills for gaia units
				if killCounter[attackerTeamID][teamID][unitDefID] then -- player's per team per unit type kills
					killCounter[attackerTeamID][teamID][unitDefID] = killCounter[attackerTeamID][teamID][unitDefID] + 1
				else
					killCounter[attackerTeamID][teamID][unitDefID] = 1
				end
				killCounter[attackerTeamID][teamID]["total"] = killCounter[attackerTeamID][teamID]["total"] + 1 -- player's per team kills
			end
			if killCounterType[attackerTeamID][unitDefID] then -- players' per unit type kills
				killCounterType[attackerTeamID][unitDefID] = killCounterType[attackerTeamID][unitDefID] + 1
			else
				killCounterType[attackerTeamID][unitDefID] = 1		
			end
			killCounter[attackerTeamID]["total"] = killCounter[attackerTeamID]["total"] + 1	-- player's total kills
		end
		if teamID ~= gaiaTeamID then	-- don't track deaths of gaia team
			if deathCounter[teamID][unitDefID] then
				deathCounter[teamID][unitDefID] = deathCounter[teamID][unitDefID] + 1	-- per unit type deaths
			else
				deathCounter[teamID][unitDefID] = 1
			end
			deathCounter[teamID]["total"] = deathCounter[teamID]["total"] + 1 -- total deaths
		end
	end
end

function gadget:GameFrame(n)
	-- check triggers once per second, but spread teams accross gameframes, less lag
	-- we assume one player per team and multiple teams per allied AI controlled side
	-- we also assume < 31 teams in total and only one human player, usualy team 0
	-- this is for campaign after all, but should work with more human players in
	-- form of special game modes or LOLmaps
	local index = n%30 + 1
	if index==1 then
		for i in pairs(timers) do	-- timers can have arbitrary indexes, as they are added in-game
			timer[i] = timer[i]-1
		end
	end
	local teamID = teams[index]
	if teamID and n>29 then		-- skip first second of game and look for teams with triggers
		local _, _, teamDead = spGetTeamInfo(teamID)
		if teamDead==false then
			local trigger = triggers[teamID]
			local i = 1
			while i <= #trigger do	-- process triggers, can't use for loop due to one-shot triggers
				local trg = trigger[i]
				if trg.wait <= 0 then	
					if testConditions(trg.conditions, teamID)==true then
						DoActions(trg.actions, teamID, i)
						if trg.once and trg.once==true then
							taremove(triggers[teamID], i) -- disable one-shot trigger
							i = i - 1	-- prevent skiping a trigger after table removal
						end
					end
				else
					trg.wait = trg.wait - 1			
				end
				i = i + 1
			end
		else
			taremove(teams, index)	-- remove dead team from teams list
		end
	end
end


else	--UNSYNCED


local glColor = gl.Color
local glLineWidth = gl.LineWidth
local glDrawGroundCircle = gl.DrawGroundCircle
local glDrawGroundQuad = gl.DrawGroundQuad
local glBeginText = gl.BeginText
local glEndText = gl.EndText
local glText = gl.Text
local glPushMatrix = gl.PushMatrix
local glTranslate = gl.Translate
local glPopMatrix = gl.PopMatrix
local glBeginEnd = gl.BeginEnd
local glVertex = gl.Vertex
local glDepthMask = gl.DepthMask
local glDepthTest = gl.DepthTest
local glCallList = gl.CallList
local glBlending = gl.Blending
local spGetMyTeamID = Spring.GetMyTeamID

local sin = math.sin
local cos = math.cos

local lastGameFrame = 0
local lastMessageFrame = -1

local X, Y = Spring.GetViewGeometry()
local msgX, msgY = X/4, Y*0.0625
local fs = 20*Y/1200
local pi2 = 6.283185307179586
local segs = 24
local step = pi2/segs

local gameData, locations, missionTriggers, messages = {}, {}, {}, {}

local function LocationVisibilty(_, locnum, vis)
	locations[locnum].visible = vis
end

local function BonusUnits(_, unitID)
	Script.LuaUI.SetBonusUnits(unitID)
end

local function ScreenMessage(_, mess, dur, teamID)
	if teamID==spGetMyTeamID() then
		if dur>0 then
			local n = spGetGameFrame()
			if n == lastMessageFrame then
				tainsert(messages, #messages, {text = mess, TTL = dur})
			else
				messages[#messages+1] = {text = mess, TTL = dur}
				lastMessageFrame = n
			end
		else
			taremove(messages, -dur)
		end
	end
end

function gadget:ViewResize(viewSizeX, viewSizeY)
	X, Y = Spring.GetViewGeometry()
	msgX, msgY = X/4, Y*0.0625
	fs = 20*Y/1200
end

local locCircles = {}

function gadget:Initialize()
	if modOptions and modOptions.mission then
		local mission = "Missions/" .. modOptions.mission ..".lua"
		if VFS.FileExists(mission) then
			gameData, _, missionTriggers, locations = include(mission)
			if gameData.game == Game.modShortName then
				if gameData.map ~= Game.mapName then
					gadgetHandler:RemoveGadget()
				else
					local no_loc, no_trig = 0, 0
					for _, v in pairs(locations) do	-- must manualy count the number of locations and triggers
						no_loc = no_loc+1			-- as # operator fails on those tables
					end
					for _, v in pairs(missionTriggers) do
						no_trig = no_trig+1
					end
					if no_loc==0 and no_trig==0 then	-- no triggers and locations, nothing to do, unload
						gadgetHandler:RemoveGadget()
					else
						if no_loc==0 then	-- no locations, no rendering needed
							gadgetHandler:RemoveCallIn("DrawWorldPreUnit")
						else
							gadgetHandler:AddSyncAction('LocationVisibilty', LocationVisibilty)
							for ln, loc in pairs(locations) do	-- Create one display list for each circular location
								if loc.shape == "C" then
									local x,z,r = loc.X, loc.Z, loc.r
									locCircles[ln] = gl.CreateList(function()
										glBeginEnd(GL.TRIANGLE_FAN,function()
											glVertex(x, spGetGroundHeight(x, z), z)
											for t=0.0, pi2, step do
												rx, rz = x + r*cos(t), z + r*sin(t)
												glVertex(rx, spGetGroundHeight(rx, rz), rz)
											end
										end)
									end)
								end
							end
						end
						if no_trig==0 then	-- no triggers, no mission messages or bonus units possible
							gadgetHandler:RemoveCallIn("Update")
							gadgetHandler:RemoveCallIn("DrawScreen")
						else
							gadgetHandler:AddSyncAction('ScreenMessage', ScreenMessage)
							gadgetHandler:AddSyncAction('BonusUnits', BonusUnits)
						end
					end
					gameData, missionTriggers = nil, nil	-- kill tables, not needed any more
				end
			else
				gadgetHandler:RemoveGadget()
			end
		else
			gadgetHandler:RemoveGadget()
		end
	else
		gadgetHandler:RemoveGadget()
	end
end

function gadget:Update()
	local n = spGetGameFrame()
	if n ~= lastGameFrame then
		if (n%30)==0 then
			local i = 1
			while i <= #messages do
				local msg = messages[i]
				msg.TTL = msg.TTL - 1
				if msg.TTL<=0 then
					taremove(messages, i)
				else
					i=i+1
				end
			end
		end
		lastGameFrame = n
	end
end

function gadget:DrawWorldPreUnit()
	local alpha = abs(spGetGameFrame() % 60 - 30)/30
	--glLineWidth(10)
	--glDepthMask(false)
	glDepthTest(GL.LEQUAL)
	glPushMatrix()
	glTranslate(0, 1, 0)
	for ln, loc in pairs(locations) do
		if loc.visible then
			if loc.RGB then
				local c = loc.RGB
				glColor(c[1], c[2], c[3], alpha)
			else
				glColor(1.0, 1.0, 1.0, alpha)
			end
			if loc.shape=="C" then
				--glDrawGroundCircle(loc.X, spGetGroundHeight(loc.X, loc.Z), loc.Z, loc.r-3, 24)
				glCallList(locCircles[ln])
			elseif loc.shape=="R" then
				glDrawGroundQuad(loc.X1, loc.Z1, loc.X2, loc.Z2)
			end
		end
	end
	glPopMatrix()
end

function gadget:DrawScreen()
	if #messages>0 then
		glBeginText()
		for i=1, #messages, 1 do
			glText(messages[i].text, msgX, msgY+i*(fs+2)-fs, fs, "do")
		end
		glEndText()
	end
end

end
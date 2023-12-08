
function widget:GetInfo()
	return {
		name      = "Mex Snap",
		desc      = "Snaps mexes to give 100% metal",
		author    = "Niobium",
		version   = "v1.2",
		date      = "November 2010",
		license   = "GNU GPL, v2 or later",
		layer     = 0,
		enabled   = true,
		handler   = true
	}
end

------------------------------------------------------------
-- Blacklist
------------------------------------------------------------
local mapBlackList = {
						"Brazillian_Battlefield_Remake_V2",
						"Techno Lands Final v4.0",
						"Techno Lands Final v4.5",
						"Techno Lands Final v5.0",
					 }

------------------------------------------------------------
-- Speedups
------------------------------------------------------------
local spGetActiveCommand = Spring.GetActiveCommand
local spGetMouseState = Spring.GetMouseState
local spTraceScreenRay = Spring.TraceScreenRay

local gameStarted = Spring.GetGameFrame()
local isMex = {}
for uDefID, uDef in pairs(UnitDefs) do
	if uDef.extractsMetal > 0 then
		isMex[uDefID] = true
	end
end

------------------------------------------------------------
-- Functions
------------------------------------------------------------
local function GetClosestMetalSpot(x, z)
	local bestSpot
	local bestDist = math.huge
	local metalSpots = WG.metalSpots
	for i = 1, #metalSpots do
		local spot = metalSpots[i]
		local dx, dz = x - spot.x, z - spot.z
		local dist = dx*dx + dz*dz
		if dist < bestDist then
			bestSpot = spot
			bestDist = dist
		end
	end
	return bestSpot
end

local function GetClosestMexPosition(spot, x, z, uDefID, facing)
	local bestPos
	local bestDist = math.huge
	local positions = WG.GetMexPositions(spot, uDefID, facing, true)
	for i = 1, #positions do
		local pos = positions[i]
		local dx, dz = x - pos[1], z - pos[3]
		local dist = dx*dx + dz*dz
		if dist < bestDist then
			bestPos = pos
			bestDist = dist
		end
	end
	return bestPos
end

local function GiveNotifyingOrder(cmdID, cmdParams, cmdOpts)
	
	if widgetHandler:CommandNotify(cmdID, cmdParams, cmdOpts) then
		return
	end
	
	Spring.GiveOrder(cmdID, cmdParams, cmdOpts.coded)
end

local function DoLine(x1, y1, z1, x2, y2, z2)
    gl.Vertex(x1, y1, z1)
    gl.Vertex(x2, y2, z2)
end

------------------------------------------------------------
-- Callins
------------------------------------------------------------

function widget:Initialize()
	if Spring.IsReplay() or Spring.GetGameFrame() > 0 then
	    widget:PlayerChanged()
  	end
	
	for key,value in ipairs(mapBlackList) do
		if (Game.mapName == value) then
			Spring.Echo("<Snap Mex> This map is incompatible - removing mex snap widget.")
			widgetHandler:RemoveWidget(self)
		end
	end
end

function widget:PlayerChanged(playerID)
	if Spring.GetSpectatingState() and Spring.GetGameFrame() > 0 then
		widgetHandler:RemoveWidget(self)
	end
end

function widget:GameStart()
	widget:PlayerChanged()
end

function widget:GameFrame(n)
	if n > 0 then
		gameStarted = n
	end
end

function widget:DrawWorld()
	
	-- Check command is to build a mex
	local cmdID
	if gameStarted > 0 then 
		_, cmdID = spGetActiveCommand()
	elseif WG["PreGameCommand"] then
		cmdID = WG["PreGameCommand"].cmdID
	end

	if not (cmdID and isMex[-cmdID]) then return end
	
	-- Attempt to get position of command
	local mx, my = spGetMouseState()
	local _, pos = spTraceScreenRay(mx, my, true)
	if not pos then return end
	
	-- Find build position and check if it is valid (Would get 100% metal)
	local bx, by, bz = Spring.Pos2BuildPos(-cmdID, pos[1], pos[2], pos[3])
	local closestSpot = GetClosestMetalSpot(bx, bz)
	if not closestSpot or WG.IsMexPositionValid(closestSpot, bx, bz) then return end
	
	-- Get the closet position that would give 100%
	local bface = Spring.GetBuildFacing()
	local bestPos = GetClosestMexPosition(closestSpot, bx, bz, -cmdID, bface)
	if not bestPos then
		if gameStarted == 0 then 
			WG["PreGameMexPos"] = nil
		end
		return
	end
	WG["PreGameMexPos"] = {cmdID = cmdID, bx = bestPos[1], by = bestPos[2], bz = bestPos[3], buildFacing = bface}

	-- Draw !
	gl.DepthTest(false)
	
	gl.LineWidth(1.49)
    gl.Color(1, 1, 0, 0.5)
    gl.BeginEnd(GL.LINE_STRIP, DoLine, bx, by, bz, bestPos[1], bestPos[2], bestPos[3])
	gl.LineWidth(1.0)
	
	gl.DepthTest(true)
	gl.DepthMask(true)
	
	gl.Color(1, 1, 1, 0.5)
	gl.PushMatrix()
		gl.Translate(bestPos[1], bestPos[2], bestPos[3])
		gl.Rotate(90 * bface, 0, 1, 0)
		gl.UnitShape(-cmdID, Spring.GetMyTeamID(), false, true , true)
	gl.PopMatrix()
	
	gl.DepthTest(false)
	gl.DepthMask(false)
end

--[[
function widget:MousePress(mx, my, mButton)
	if gameStarted > 0 then return end
	if mButton == 1 then
		if WG["PreGameCommand"] then
			local cmdID = WG["PreGameCommand"].cmdID
			local bx = WG["PreGameCommand"].x
			local bz = WG["PreGameCommand"].z
			local bface = WG["PreGameCommand"].buildFacing
			cmdID = -cmdID
			local cmdParams = {bx, _ ,bz, bface}
			--widget:CommandNotify(cmdID, cmdParams, "")
		end
	end
end
--]]

function widget:CommandNotify(cmdID, cmdParams, cmdOpts)
	if isMex[-cmdID] then
		local bx, bz = cmdParams[1], cmdParams[3]
		local closestSpot = GetClosestMetalSpot(bx, bz)
		if closestSpot and not WG.IsMexPositionValid(closestSpot, bx, bz) then
			local bface = cmdParams[4]
			local bestPos = GetClosestMexPosition(closestSpot, bx, bz, -cmdID, bface)
			if bestPos and gameStarted > 0 then
				GiveNotifyingOrder(cmdID, {bestPos[1], bestPos[2], bestPos[3], bface}, cmdOpts)
				return true
			end
		end
	end
end

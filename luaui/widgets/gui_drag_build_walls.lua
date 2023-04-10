local version = "1.1"

function widget:GetInfo()
	return {
		name      = "Drag Build Walls",
		desc      = "Version " .. version .. ": Allows for building walls (and other buildings) of any shape, drag with left mouse button and space while teeth or wall is selected.",
		author    = "Masta Ali",
		date      = "10/04/23",
		license   = "Public",
		layer     = 0,
		enabled   = true
	}
end


-------------------
-- Changelog:
-- 1.0 initial version
-- -Masta Ali -09/04/23
-- 1.1 changed to using space/neta to avoid lots of issues
-- added buildspacing
-- updated code to allow for more general uses and implemented for winds and llts
-- -Masta Ali -10/04/23
--
-------------------

-------------------
-- TO DO:
--
-- enable build splitting over constructors with shift + space (see Niobium's build split widget)
--
-- widget gives orders instantly, it would be more intuitive to
-- store the orders while dragging and then give the order array
--
-- dragging too fast gives a wall with gaps, order array might fix this
--
-- Generalize usage for more buildings?
--
-- ..
--
-------------------

-- locally defining these functions makes them teensy bit faster (its also good reference)
local spGetActiveCommand 	= Spring.GetActiveCommand
local spGetModKeyState      = Spring.GetModKeyState
local spGetSelectedUnits    = Spring.GetSelectedUnits
local spGetGameSeconds      = Spring.GetGameSeconds
local spGetActiveCommand 	= Spring.GetActiveCommand
local spGetActiveCmdDesc 	= Spring.GetActiveCmdDesc
local spGetMouseState       = Spring.GetMouseState
local spTraceScreenRay      = Spring.TraceScreenRay
local spGetMyPlayerID       = Spring.GetMyPlayerID
local spGetPlayerInfo       = Spring.GetPlayerInfo
local spEcho                = Spring.Echo
local spPos2BuildPos 		= Spring.Pos2BuildPos
local spGiveOrderToUnit		= Spring.GiveOrderToUnit
local spTestBuildOrder 		= Spring.TestBuildOrder
local spGetSelUnitsSorted 	= Spring.GetSelectedUnitsSorted
local spGetSpectatingState	= Spring.GetSpectatingState
local spGetBuildSpacing		= Spring.GetBuildSpacing

local floor                 = math.floor
local abs					= math.abs

-- table with building id as key and size as value
local b_ids = {
	-- walls
	--[54] = 16, --armteeth
	--[63] = 16, --armseateeth
	--[75] = 16, --armwall
	--[228] = 16, --corteeth
	--[239] = 16, --corseateeth
	--[248] = 16, --corwall
	---- winds
	--[175] = 32, --armwind
	--[355] = 32, --corwind
	---- defences
	--[95] = 16, --armllt
	--[271] = 16 --corllt
}

-- obligatory checking if widget user is a spectator
function widget:Initialize()
	if spGetSpectatingState() then
		widgetHandler:RemoveWidget()
	end

	for id, udefs in ipairs(UnitDefs) do
		if udefs.isImmobile then
			b_ids[id] = (udefs.xsize * udefs.zsize)
		end
	end
end

function widget:PlayerChanged()
	if spGetSpectatingState() then
		widgetHandler:RemoveWidget()
	end
end

-- using mouse api ensures we only get this behaviour when we want it
local on = false
function widget:MousePress(x, y, b)
	local _, cmd_id, _, _ = spGetActiveCommand()
	if not cmd_id then return false end
	local alt,ctrl,meta,shif = spGetModKeyState()
	if not meta then return false end
	if alt or ctrl or shif then return false end
	if b ~= 1 then return false end
	if not b_ids[-cmd_id] then return false end
	on = true
	return true
end

function widget:MouseRelease(x, y, b)
	on = false
	return false
end

-- we need to cancel the command otherwise the orders we gave will be overwritten
function widget:CommandNotify(id, params, options)
	local alt,ctrl,meta,shif = spGetModKeyState()
	if not meta then return false end
	if alt or ctrl or shif then return false end
	if not b_ids[-id] then return false end
	return true
end

-- update api call
function widget:Update()
	if on then
		update()
	end
end

-- some important variables
-- defining them here instead of in the function increases performance
-- (I think, saves memory at least)
local centerX = 0
local centerY = 0
local centerZ = 0
local last_build_pos = {0, 0, 0, 1}
local coords = {0, 0, 0, 1}
local params = {0, 0, 0, 1}
local selUnits = {}
local builders = {}
local builderCount = 0
local prox = wall_size
function update()
	local mx,my,lmb,mmb,rmb = spGetMouseState()
	local alt,ctrl,meta,shif = spGetModKeyState()
	
	-- check if left mouse button is held and no meta keys (to preserve other build behaviour)
	if not lmb then return end
	if not meta then return end
	if alt or ctrl or shif then return end
	
	-- check were actually trying to build a wall
	local idx, cmd_id, _, _ = spGetActiveCommand()
	if not cmd_id then return end
	if not b_ids[-cmd_id] then return end
	local cmdDesc = spGetActiveCmdDesc( idx )
	if cmdDesc["type"] ~= 20 then return end
		
	-- get an array of all builders selected
	selUnits = spGetSelUnitsSorted()
	selUnits.n = nil
	builders = {}
	builderCount = 0
	for uDefID, uIDs in pairs(selUnits) do
		for ui=1, #uIDs do
			builderCount = builderCount + 1
			builders[builderCount] = uIDs[ui]
		end
	end
	
	-- get map coordinates from mouse coordinates and snap to the build grid
	_, coords = spTraceScreenRay(mx, my, true, true)
	if not coords then return end
	centerX, centerY, centerZ = spPos2BuildPos( -cmd_id, coords[1], coords[2], coords[3] )
	
	prox = b_ids[-cmd_id] + b_ids[-cmd_id] * spGetBuildSpacing()
	-- we dont want to issue build orders for overlapping walls
	if abs(centerX - last_build_pos[1]) > prox or abs(centerZ - last_build_pos[3]) > prox then
		params = {centerX, centerY, centerZ, 1}
		if spTestBuildOrder(-cmd_id, centerX, centerY, centerZ, 1) ~= 0 then -- if nothing is in the way
			for bi=1, builderCount do
				spGiveOrderToUnit(builders[bi],CMD.INSERT,{-1,cmd_id,CMD.OPT_SHIFT, unpack(params)},{"alt"}) -- then give the build order(s)
			end
		end
		last_build_pos = {centerX, centerY, centerZ, 1} -- save this location to compare in the next iteration of this loop (to avoid giving multiple orders in the same location or overlapping)
	end
end

-- game is over, bye bye!
function widget:GameOver()
    widgetHandler:RemoveWidget()
end

	
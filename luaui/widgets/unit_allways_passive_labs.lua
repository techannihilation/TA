--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:GetInfo()
  return {
	name		= "Passive labs",
	desc		= "Sets labs to passive", --needs unit_buildspeed gadget
	author		= "nixtux",
	date		= "Jan 22, 2016",
	license		= "GNU GPL, v2 or later",
	layer		= 0,
	enabled		= false  --  loaded by default?
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local CMD_BUILDSPEED 		= 33455

local spGetGameFrame		= Spring.GetGameFrame
local spGetMyTeamID			= Spring.GetMyTeamID
local spGetTeamUnits		= Spring.GetTeamUnits
local spGetUnitCommands		= Spring.GetUnitCommands
local spGetUnitDefID		= Spring.GetUnitDefID
local spGetUnitPosition		= Spring.GetUnitPosition
local spGiveOrderToUnit		= Spring.GiveOrderToUnit



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- set labs to passive on creation

local function IsFactory(ud)
	return ud and ud.isBuilder and ud.isFactory
end

function widget:PlayerChanged(playerID)
	if Spring.GetSpectatingState() and Spring.GetGameFrame() > 0 then
		widgetHandler:RemoveWidget(self)
	end
end

function widget:GameStart()
	widget:PlayerChanged()
end

function widget:Initialize()
	if Spring.IsReplay() or Spring.GetGameFrame() > 0 then
	    widget:PlayerChanged()
  	end
	for _,unitID in ipairs(spGetTeamUnits(spGetMyTeamID())) do
		local unitDefID = spGetUnitDefID(unitID)
		if IsFactory(UnitDefs[unitDefID]) then
			spGiveOrderToUnit(unitID, CMD_BUILDSPEED, { 0 }, {})
		end
	end
end


function widget:UnitCreated(unitID, unitDefID, unitTeam)
	if unitTeam ~= spGetMyTeamID() then
		return
	end
	if IsFactory(UnitDefs[unitDefID]) then
		spGiveOrderToUnit(unitID, CMD_BUILDSPEED, { 0 }, {})
	end
end


function widget:UnitGiven(unitID, unitDefID, unitTeam)
	widget:UnitCreated(unitID, unitDefID, unitTeam)
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

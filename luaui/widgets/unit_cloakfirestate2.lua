--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:GetInfo()
	return {
		name      = "Cloak Fire State 2",
		desc      = "Sets units to Hold Fire when cloaked, reverts to original state when decloaked",
		author    = "KingRaptor (L.J. Lim)",
		date      = "Feb 14, 2010",
		license   = "GNU GPL, v2 or later",
		layer     = -1,
		enabled   = true  --  loaded by default?
	}
end

local function CheckEnable()
	if Spring.GetSpectatingState() then
    	widgetHandler:RemoveWidget(self)
	end
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Speedups
local GiveOrderToUnit  = Spring.GiveOrderToUnit
local GetUnitStates    = Spring.GetUnitStates

local STATIC_STATE_TABLE = {0}
local CMD_CLOAK = 37382
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local myTeam

local exceptionList = { --add exempt units here
	--mines
	"armmine1",
	"armmine2",
	"armmine3",
	"armmine5",
	"armmine6",
	"armmine7",
	"armfmine3",
	"cormine1",
	"cormine2",
	"cormine3",
	"cormine5",
	"cormine6",
	"cormine7",
	"tllmine1",
	"tllmine2",
	"tllmine3",
	"tllmine4",
	"tllmine5",
	"tllmine6",
	--Crawling Bomb
	"corsktl",
	"armvader",
	"coretnt",
	"corroach",
	"tllcrawlb",
	--Other
	"armpb",
	"armamb",
	"armpacko",
	--Snipers
	"armsnipe", 
	"corprot"
}

local exceptionArray = {}
for _,name in pairs(exceptionList) do
	local ud = UnitDefNames[name]
	if ud then
		exceptionArray[ud.id] = true
	end
end

local cloakUnit = {} --stores the desired fire state when decloaked of each unitID

function widget:UnitCommand(unitID, unitDefID, teamID, cmdID, cmdParams)
if cmdID == CMD_CLOAK and cmdParams[1] == 1 then
	if (not enabled) or (teamID ~= myTeam) or exceptionArray[unitDefID] then 
		return
	end
	local states = GetUnitStates(unitID)
	cloakUnit[unitID] = states.firestate --store last state
	if states.firestate ~= 0 then
		STATIC_STATE_TABLE[1] = 0
		GiveOrderToUnit(unitID, CMD.FIRE_STATE, STATIC_STATE_TABLE, 0)
	end
elseif cmdID == CMD_CLOAK and cmdParams[1] == 0 then

	if (not enabled) or (teamID ~= myTeam) or exceptionArray[unitDefID] or (not cloakUnit[unitID]) then 
		return
	end
	local states = GetUnitStates(unitID)
	if states.firestate == 0 then
		local targetState = cloakUnit[unitID]
		STATIC_STATE_TABLE[1] = targetState
		GiveOrderToUnit(unitID, CMD.FIRE_STATE, STATIC_STATE_TABLE, 0) --revert to last state
		--Spring.Echo("Unit compromised - weapons free!")
	end
	cloakUnit[unitID] = nil
end
end

function widget:PlayerChanged()
	myTeam = Spring.GetMyTeamID()
	CheckEnable()
end

function widget:Initialize()
	myTeam = Spring.GetMyTeamID()
	CheckEnable()
end

function widget:UnitCreated(unitID, unitDefID, unitTeam)
	if (not enabled) then
		return
	end
	if unitTeam == myTeam then
		local states = GetUnitStates(unitID)
		cloakUnit[unitID] = states.firestate
	else
		cloakUnit[unitID] = nil
	end
end

function widget:UnitGiven(unitID, unitDefID, unitTeam)
	widget:UnitCreated(unitID, unitDefID, unitTeam)
end

function widget:UnitDestroyed(unitID, unitDefID, unitTeam)
	if cloakUnit[unitID] then
		cloakUnit[unitID] = nil
	end
end

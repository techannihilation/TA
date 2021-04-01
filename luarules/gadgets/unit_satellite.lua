
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "High Altitude",
    desc      = "High altitude Fly for Satellite",
    author    = "Skymyj",
    date      = "April, 2021",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--synced
if (gadgetHandler:IsSyncedCode()) then

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--Speed-ups
local GetUnitDefID    = Spring.GetUnitDefID
local FindUnitCmdDesc = Spring.FindUnitCmdDesc
local spGetTeamResources = Spring.GetTeamResources
local spInsertUnitCmdDesc = Spring.InsertUnitCmdDesc
local spEditUnitCmdDesc = Spring.EditUnitCmdDesc
local spRemoveUnitCmdDesc = Spring.RemoveUnitCmdDesc
local SpGetUnitPosition = Spring.GetUnitPosition
local SpSpawnCEG = Spring.SpawnCEG
local uDefs = UnitDefs
local SpGetUnitHealth = Spring.GetUnitHealth
local SpAddUnitDamage = Spring.AddUnitDamage
local spSetUnitRulesParam  = Spring.SetUnitRulesParam

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local satellite = {
  --Arm
  [UnitDefNames["sat_radar"].id] = true,

  --Core

  --Tll

  --Talon

}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


function gadget:UnitCreated(unitID, unitDefID, teamID, builderID)
	local ud = UnitDefs[unitDefID]
	if satellite[unitDefID] then
		-- Need to find parameter with high altitude
	end
end

function gadget:UnitDestroyed(unitID, _, teamID)

end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--synced
else


end

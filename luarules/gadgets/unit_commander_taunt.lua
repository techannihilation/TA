--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "LOL",
    desc      = "LOL",
    author    = "nixtux",
    date      = "Nov 02, 2014",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

if (not gadgetHandler:IsSyncedCode()) then
  return false
end

local COMMANDER = {
  --Core
  [UnitDefNames["corcom"].id] = 7, --Set weapon number here 
  [UnitDefNames["corcom1"].id] = 4,
  [UnitDefNames["corcom3"].id] = 4,
  [UnitDefNames["corcom5"].id] = 4,
  [UnitDefNames["corcom6"].id] = 4,
  [UnitDefNames["corcom7"].id] = 4,
  --Arm 
  [UnitDefNames["armcom"].id] = 7,
  [UnitDefNames["armcom1"].id] = 4,
  [UnitDefNames["armcom4"].id] = 4,
  [UnitDefNames["armcom5"].id] = 4,
  [UnitDefNames["armcom6"].id] = 4,
  [UnitDefNames["armcom7"].id] = 4,
  --The lost legacy
  [UnitDefNames["tllcom"].id] = 7,
  [UnitDefNames["tllcom3"].id] = 4,
  [UnitDefNames["tllcom5"].id] = 4,
  [UnitDefNames["tllcom6"].id] = 4,
  [UnitDefNames["tllcom7"].id] = 4,
}

local comms = {}

function gadget:UnitCreated(unitID, unitDefID, teamID)
	if COMMANDER[unitDefID] then
		comms[unitID] = true
	end
end

function gadget:UnitDestroyed(unitID , unitDefID, unitTeam, attackerID, attackerDefID, attackerTeam)
  if COMMANDER[unitDefID] then
      comms[unitID] = nil
      for uID,_ in pairs(comms) do
      local teamID = Spring.GetUnitTeam(uID)
      local enemyinrange = Spring.GetUnitNearestEnemy(uID,200)
      if teamID == attackerTeam and enemyinrange == nil then
	local commanderID = Spring.GetUnitDefID(uID)
	Spring.SetUnitCOBValue(uID, 1028, COMMANDER[commanderID])
	Spring.CallCOBScript(uID, "FireworkControl", 0)
        --Spring.Echo(uID, teamID, attackerTeam, COMMANDER[commanderID])
      end
    end
  end
end
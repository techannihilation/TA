-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "Commando Auto Decloak",
    desc      = "Disables on/off for Stunned Units",
    author    = "Nixtux",
    date      = "Feb 13, 2018",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

if (gadgetHandler:IsSyncedCode()) then
	return false
end

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

local CMD_CAPTURE = CMD.CAPTURE
local CMD_CLOAK = CMD.CLOAK

local commandoID = UnitDefNames["commando"].id

function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions, cmdTag, synced)
  Spring.Echo(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions, cmdTag, synced)
  Spring.Echo(CMD_CAPTURE,Spring.GetUnitIsCloaked(unitID),commandoID)
  if (cmdID == CMD_CAPTURE) and Spring.GetUnitIsCloaked(unitID) and commandoID == unitDefID then
    Spring.GiveOrderToUnit(unitID, CMD_CLOAK, { 0 }, { "alt" })
    return false
  else
    return true
  end
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "Trans Control",
    desc      = "Locks com transport for a set time at game start",
    author    = "Nixtux",
    date      = "Nov 13, 2014",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
local unlocktime = tonumber(Spring.GetModOptions().mo_comtranslock) or 0

if unlocktime then
  unlocktime = unlocktime * 60
end

if (not gadgetHandler:IsSyncedCode()) then
	return false
end

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

local CMD_UNLOAD_UNIT = CMD.UNLOAD_UNIT

local COMMANDER = {
  --Core
  [UnitDefNames["corcom"].id] = true, 
  [UnitDefNames["corcom1"].id] = true,
  [UnitDefNames["corcom3"].id] = true,
  [UnitDefNames["corcom5"].id] = true,
  [UnitDefNames["corcom6"].id] = true,
  [UnitDefNames["corcom7"].id] = true,
  --Arm 
  [UnitDefNames["armcom"].id] = true,
  [UnitDefNames["armcom1"].id] = true,
  [UnitDefNames["armcom4"].id] = true,
  [UnitDefNames["armcom5"].id] = true,
  [UnitDefNames["armcom6"].id] = true,
  [UnitDefNames["armcom7"].id] = true,
  --The lost legacy
  [UnitDefNames["tllcom"].id] = true,
  [UnitDefNames["tllcom1"].id] = true,
  [UnitDefNames["tllcom3"].id] = true,
  [UnitDefNames["tllcom5"].id] = true,
  [UnitDefNames["tllcom6"].id] = true,
  [UnitDefNames["tllcom7"].id] = true,
}

function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions, cmdTag, synced)
  local Gametime = Spring.GetGameSeconds()
  --Spring.Echo(Gametime,unlocktime)
  if (cmdID == 75) then
     for i = 1, #cmdParams do
     local unitToLoad = Spring.GetUnitDefID(cmdParams[i])
     --spring.Echo("unittoload ",unitToLoad)
      if COMMANDER[unitToLoad] and ( Gametime < unlocktime ) then
	local eta = math.floor(unlocktime - Gametime)
	Spring.SendMessageToTeam(teamID,"\255\255\255\001Warning Commander Transport lock please wait " .. eta  .. " secs")
	--Spring.Echo("Not loaded")
        return false
      end
    end
  end
  return true
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
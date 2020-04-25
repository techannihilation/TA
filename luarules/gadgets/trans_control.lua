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

local COMMANDER = VFS.Include("luarules/configs/comDefs.lua")

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
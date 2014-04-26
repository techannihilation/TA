function gadget:GetInfo()
  return {
    name      = "Teleport",
    desc      = "Teleport effect.",
    author    = "quantum, TheFatController",
    date      = "June 22, 2007",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

local enabled = tonumber(Spring.GetModOptions().mo_comgate) or 0

if (enabled == 0) then 
  return false
end

--synced
if (gadgetHandler:IsSyncedCode()) then

local hiddenUnits = {}
local gameStart = false
local gaiaTeamID = Spring.GetGaiaTeamID()


function gadget:UnitCreated(unitID, unitDefID, teamID)
	if (not gameStart) and not hiddenUnits[unitID] then
		local x,y,z = Spring.GetUnitPosition(unitID)
		hiddenUnits[unitID] = {x,y,z,teamID}
		Spring.SetUnitNoDraw(unitID,true) 
	end
end

function gadget:GameFrame(n)
  if (not gameStart) and (n > 5) then
    gameStart = true
    Spring.Echo("Teleport Active")   
  end
  if (n == 6) then
    for unitID,data in pairs(hiddenUnits) do
		Spring.CallCOBScript(unitID, "TeleportControl", 0)
    end
  end
  if (n == 140) then
    for unitID,_ in pairs(hiddenUnits) do
		Spring.SetUnitNoDraw(unitID,false)
    end
    Spring.Echo("Teleport Complete")
    gadgetHandler:RemoveGadget()
  end
end

function gadget:AllowCommand(unitID, unitDefID, unitTeam, cmdID, cmdParams, cmdOptions, cmdTag, synced)
	local n = Spring.GetGameFrame()
	if n < 140 then return false end
	return true
end

--unsynced
else

end

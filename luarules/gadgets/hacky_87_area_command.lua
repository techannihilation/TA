function gadget:GetInfo()
  return {
    name      = "Hacky unreached Command workaround",
    desc      = "Set smaller move goal for builder commands",
    author    = "Pako",
    date      = "15 March 2012",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true
  }
end

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

if (not gadgetHandler:IsSyncedCode()) then
    return
end
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
local CMD_RECLAIM = CMD.RECLAIM
local CMD_RESURRECT = CMD.RESURRECT
local CMD_REPAIR = CMD.REPAIR

local builders = {}

function gadget:UnitCreated(unitID, unitDefID, unitTeam, builderID)
  if unitDefID and tonumber(UnitDefs[unitDefID].buildSpeed) and UnitDefs[unitDefID].buildSpeed > 0 then
    builders[unitID] = true
  else
    builders[unitID] = nil
  end
end
--buildDistance
function gadget:GameFrame(f)
	if f%37 == 0 then
	  local allUnits = Spring.GetAllUnits()
	  for i=1,#allUnits,1 do
	    local unitID = allUnits[i]
	    if builders[unitID] then
	      local fCmd = Spring.GetUnitCommands(unitID)[1]
		if fCmd then  
		  local cmdID = fCmd.id
	      if (cmdID == CMD_RECLAIM or cmdID == CMD_RESURRECT or cmdID == CMD_REPAIR or (tonumber(cmdID) and cmdID < 0)) then
		local ufID = fCmd.params[1]
		local x,y,z
		if Spring.ValidUnitID(ufID) then
		  x,y,z = Spring.GetUnitPosition(ufID)
		  elseif ufID and Spring.ValidFeatureID(ufID-Game.maxUnits) then
		    x,y,z = Spring.GetFeaturePosition(ufID-Game.maxUnits)
		end
		if x then
		Spring.SetUnitMoveGoal(unitID,x,y,z,40)
		end
	      end
		end
	    end
	  end
	end
end

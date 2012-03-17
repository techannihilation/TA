function gadget:GetInfo()
  return {
    name      = "Hacky unreached Command workaround 4",
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
  if unitDefID and tonumber(UnitDefs[unitDefID].buildSpeed) and UnitDefs[unitDefID].buildSpeed > 0  and tonumber(UnitDefs[unitDefID].speed) and UnitDefs[unitDefID].speed>0 then
    builders[unitID] = tonumber(UnitDefs[unitDefID].buildDistance) or nil
  else
    builders[unitID] = nil
  end
end

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
  builders[unitID] = nil
end

local function distance(x1,z1,x2,z2)
  local dx,dz = x1-x2,z1-z2
  return ((dx*dx)+(dz*dz))^0.5
end

function gadget:GameFrame(f)
  local framemod=f%37
	  for unitID,buildDistance in pairs(builders) do
	    if unitID%37 == framemod then
	     local fCmd = Spring.GetUnitCommands(unitID)[1]
	     if fCmd then
		  local cmdID = fCmd.id
	      if (cmdID == CMD_RECLAIM or cmdID == CMD_RESURRECT or cmdID == CMD_REPAIR or (tonumber(cmdID) and cmdID < 0)) then
		local ufID = fCmd.params[1]
		local x,y,z,radius
		radius = 18
		if Spring.ValidUnitID(ufID) then
		    x,y,z = Spring.GetUnitPosition(ufID)
		    radius = Spring.GetUnitRadius(ufID)
		 elseif ufID and Spring.ValidFeatureID(ufID-Game.maxUnits) then
		    x,y,z = Spring.GetFeaturePosition(ufID-Game.maxUnits)
		end
		if x then
		  local xb,_,zb = Spring.GetUnitPosition(unitID)
		  if buildDistance < (distance(x,z,xb,zb)-radius) then --TODO radius
		    Spring.SetUnitMoveGoal(unitID,x,y,z,18)
		  end
		end
	      end
	     end
	    end
	  end
end

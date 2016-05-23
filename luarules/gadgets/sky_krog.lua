function gadget:GetInfo()
  return {
    name      = "SkyKrog",
    desc      = "Increase stats when a commander is loaded",
    author    = "nixtux",
    date      = "23/05/16",
    license   = "GPL2",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

local validCommanders = {
    [UnitDefNames['armcom7'].id] = true,
    [UnitDefNames['corcom7'].id] = true,
    [UnitDefNames['armcom7'].id] = true,
}

local skyKrogID = UnitDefNames["skykrogoth"].id

if (gadgetHandler:IsSyncedCode()) then

function gadget:UnitLoaded(unitID, unitDefID, unitTeam, transportID, transportTeam)
    --Spring.Echo("UnitLoaded", unitDefID, transportID)
    if ((not unitDefID) or (not transportID)) then return end
    local transportDef = Spring.GetUnitDefID(transportID)
    if validCommanders[unitDefID] and skyKrogID == transportDef then
    	local unitHealth,unitMaxHealth = Spring.GetUnitHealth(unitID)
    	local transportHealth,transportMaxHealth = Spring.GetUnitHealth(transportID)
    	local newMaxHealth = transportMaxHealth + unitMaxHealth
    	Spring.SetUnitMaxHealth(transportID, newMaxHealth)
    	local newHealth = transportHealth + unitHealth
    	Spring.SetUnitHealth(transportID, newHealth)
    	local newXP = Spring.GetUnitExperience(transportID) + Spring.GetUnitExperience(unitID)
    	Spring.SetUnitExperience(transportID, newXP)
    end
end

function gadget:UnitUnloaded(unitID, unitDefID, teamID, transportID)
    if ((not unitDefID) or (not transportID)) then return end
    local transportDef = Spring.GetUnitDefID(transportID)
    if validCommanders[unitDefID] and skyKrogID == transportDef then
    	local unitHealth,unitMaxHealth = Spring.GetUnitHealth(unitID)
    	local transportHealth,transportMaxHealth = Spring.GetUnitHealth(transportID)
    	local oldMaxHealth = transportMaxHealth - unitMaxHealth
    	if unitHealth > oldMaxHealth then
    		Spring.SetUnitMaxHealth(transportID, oldMaxHealth)
 		else
 			Spring.SetUnitMaxHealth(transportID, oldMaxHealth)
    		local oldHealth = transportHealth - unitHealth
    		Spring.SetUnitHealth(transportID, oldHealth)
    	end
    	local oldXP = Spring.GetUnitExperience(transportID) - Spring.GetUnitExperience(unitID)
    	Spring.SetUnitExperience(transportID, oldXP)
    end
end

else

end



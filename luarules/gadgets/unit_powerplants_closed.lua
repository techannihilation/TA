function gadget:GetInfo()
  return {
    name      = "Closed PowerPlants",
    desc      = "Closed PowerPlantsar collectors don't produce energy",
    author    = "Bluestone",
    date      = "",
    license   = "Hats",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

if (not gadgetHandler:IsSyncedCode()) then
  return
end

local noClosedE = {
    [UnitDefNames.corsolar.id] = true,
    [UnitDefNames.armsolar.id] = true,
    [UnitDefNames.crnns.id] = true,
    [UnitDefNames.tllsolar.id] = true,
    [UnitDefNames.tllsolarns.id] = true,
    [UnitDefNames.tlladvsolar.id] = true,
}

function gadget:UnitCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)
    if noClosedE[unitDefID] and cmdID==CMD.ONOFF then
        local on = (cmdParams[1]==1) --invert because the command hasn't yet taken effect
        local _,_,eMake,_ = Spring.GetUnitResources(unitID)
        if on then
            Spring.SetUnitResourcing(unitID, "ume", UnitDefs[unitDefID].energyMake - eMake)
        else
            Spring.SetUnitResourcing(unitID, "ume", -eMake)
        end
    end
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

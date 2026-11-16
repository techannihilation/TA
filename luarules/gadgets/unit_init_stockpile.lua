--------------------------------------------------------------------------------
--  unit_initial_stockpile.lua
--  Gives certain units a ready-built magazine the moment they finish.
--------------------------------------------------------------------------------
function gadget:GetInfo()
    return {
        name      = "Initial Stockpile",
        desc      = "Spawns units with N rounds already built",
        author    = "zagszy",
        date      = "2025-06-02",
        license   = "MIT",
        layer     = 10,        -- after your stockpile-limit gadget (layer 0)
        enabled   = true,
    }
end

if not gadgetHandler:IsSyncedCode() then
    return 
end

local initialStockpile = {
    [UnitDefNames.armanni.id] = 2,  -- ARM Annihilator
    [UnitDefNames.armanni1.id] = 3, -- ARM Advanced Annihilator
}

local SetUnitStockpile = Spring.SetUnitStockpile -- small alias

-------------------------------------------------------------------------------
-- Engine call-in: fires the frame the unit becomes fully built
-------------------------------------------------------------------------------

function gadget:UnitFinished(unitID, unitDefID, unitTeam)
    local qty = initialStockpile[unitDefID]
    if qty then
        SetUnitStockpile(unitID, qty, 1) -- 1 = set stockpile, 0 = add to stockpile
        -- Spring.Echo("Unit " .. unitDefID .. " finished, setting stockpile to " .. qty)
    end
end
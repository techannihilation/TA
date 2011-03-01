function gadget:GetInfo()
	return {
		name      = "Anti Stock",
		desc      = "Stocks 1 missile in antis when they finish",
		author    = "Niobium",
		date      = "Sep 5, 2010",
		license   = "GNU GPL, v2 or later",
		layer     = 0,
		enabled   = true
	}
end

--------------------------------------------------------------------------------
-- Synced only
--------------------------------------------------------------------------------
if not gadgetHandler:IsSyncedCode() then
	return false
end

--------------------------------------------------------------------------------
-- Speedups
--------------------------------------------------------------------------------
local isAnti = {
		[UnitDefNames['armamd'].id] = true, -- Protector
		[UnitDefNames['corfmd'].id] = true, -- Fortitude
		[UnitDefNames['armamd1'].id] = true, -- Adv Protector
		[UnitDefNames['corfmd1'].id] = true, -- Adv Fortitude
		[UnitDefNames['tllantinuke'].id] = true, -- Antinuke
		[UnitDefNames['armcarry'].id] = true, -- Colossus (Arm carrier)
		[UnitDefNames['corcarry'].id] = true, -- Hive (Core carrier)
	}

local spSetUnitStockpile = Spring.SetUnitStockpile

--------------------------------------------------------------------------------
-- Callins
--------------------------------------------------------------------------------
function gadget:UnitFinished(uID, uDefID, uTeam)
	if isAnti[uDefID] then
		spSetUnitStockpile(uID, 1)
	end
end

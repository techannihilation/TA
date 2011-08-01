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
		[UnitDefNames['armamd1'].id] = true, -- Adv Protector
		[UnitDefNames['armscab'].id] = true, -- Mobile Anti
		[UnitDefNames['armscab1'].id] = true, -- Mobile Anti
		[UnitDefNames['armcarry'].id] = true, -- Colossus (Arm carrier)
		
		[UnitDefNames['corfmd'].id] = true, -- Fortitude
		[UnitDefNames['corfmd1'].id] = true, -- Adv Fortitude
		[UnitDefNames['corfmd2'].id] = true, -- T3 Anti
		[UnitDefNames['cormabm'].id] = true, -- Mobile Anti
		[UnitDefNames['cormabm1'].id] = true, -- Mobile Anti
		[UnitDefNames['corcarry'].id] = true, -- Hive (Core carrier)

		[UnitDefNames['tllantinuke'].id] = true, -- Antinuke
		[UnitDefNames['tllgiant'].id] = true, -- Giant (Tll carrier)
		[UnitDefNames['tllturtle'].id] = true, -- Mobile Anti


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

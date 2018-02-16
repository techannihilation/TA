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
		--Arm
		[UnitDefNames['armamd'].id] = true, -- Protector
		[UnitDefNames['armamd1'].id] = true, -- Adv Protector
		[UnitDefNames['armamd2'].id] = true, -- T3 Antinuke
		--[UnitDefNames['armscab'].id] = true, -- Mobile Antinuke
		--[UnitDefNames['armscab1'].id] = true, -- Mobile Antinuke
		[UnitDefNames['armcarry'].id] = true, -- Colossus (Arm carrier)
		--Core
		[UnitDefNames['corfmd'].id] = true, -- Fortitude
		[UnitDefNames['corfmd1'].id] = true, -- Adv Fortitude
		[UnitDefNames['corfmd2'].id] = true, -- T3 Antinuke
		--[UnitDefNames['cormabm'].id] = true, -- Mobile Antinuke
		--[UnitDefNames['cormabm1'].id] = true, -- Mobile Antinuke
		[UnitDefNames['corcarry'].id] = true, -- Hive (Core carrier)
		--The Lost Legacy
		[UnitDefNames['tllantinuke'].id] = true, -- Antinuke
		[UnitDefNames['tllantinuke1'].id] = true, -- Adv Antinuke
		[UnitDefNames['tllgazelle'].id] = true, -- T3 Antinuke
		--[UnitDefNames['tllturtle'].id] = true, -- Mobile Antinuke
        [UnitDefNames['tllgiant'].id] = true, -- Giant (Tll carrier)
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

function gadget:GetInfo()
	return {
		name = "TSAR Stock",
		desc = "Stocks 1 missile in TSAR when they finish",
		author = "Niobium",
		date = "Sep 5, 2010",
		license = "GNU GPL, v2 or later",
		layer = 0,
		enabled = true
	}
end

--------------------------------------------------------------------------------
-- Synced only
--------------------------------------------------------------------------------
if not gadgetHandler:IsSyncedCode() then return false end

--------------------------------------------------------------------------------
-- Speedups
--------------------------------------------------------------------------------
local TSAR = {
	[UnitDefNames["armtabi"].id] = true,
	[UnitDefNames["tllvanya"].id] = true,
	[UnitDefNames["corflu"].id] = true
}

local SetUnitStockpile = Spring.SetUnitStockpile

--------------------------------------------------------------------------------
-- Callins
--------------------------------------------------------------------------------
function gadget:UnitFinished(uID, uDefID, uTeam)
	if TSAR[uDefID] then
		SetUnitStockpile(uID, 1)
	end
end
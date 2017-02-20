
function gadget:GetInfo()
	return {
		name      = "Disabled Passengers",
		desc      = "Disabled crawling bombs when passengers",
		author    = "Nixtux",
		date      = "Feb 20, 2017",
		license   = "GNU GPL, v2 or later",
		layer     = 0,
		enabled   = true
	}
end

----------------------------------------------------------------
-- Synced only
----------------------------------------------------------------
if not gadgetHandler:IsSyncedCode() then
	return false
end

----------------------------------------------------------------
-- Vars
----------------------------------------------------------------
local crawlingBombs = {
	[UnitDefNames.tllcrawlb.id] = true,
	[UnitDefNames.corroach.id] = true,
	[UnitDefNames.armvader.id] = true,
}

----------------------------------------------------------------
-- Callins
----------------------------------------------------------------

function gadget:UnitLoaded(uID, uDefID, uTeam, transID, transTeam)
	if crawlingBombs[uDefID] then
 	 	Spring.SetUnitHealth(uID, { paralyze = 1.0e9 })
	end
end

function gadget:UnitUnloaded(uID, uDefID, tID, transID)
	if crawlingBombs[uDefID] then
		Spring.SetUnitHealth(uID, { paralyze = -1})
	end
end

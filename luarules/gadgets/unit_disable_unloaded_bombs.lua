
function gadget:GetInfo()
	return {
		name      = "Disable unloaded bombs",
		desc      = "Temp disables crawling once unloaded",
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
	[UnitDefNames.armvader.id] = true,
	[UnitDefNames.corroach.id] = true,
	[UnitDefNames.corsktl.id] = true,
	[UnitDefNames.tllcrawlb.id] = true,
	[UnitDefNames.coretnt.id] = true,
}

---------------------------------------------------------------
-- Callins
----------------------------------------------------------------

function gadget:UnitUnloaded(unitID, unitDefID, teamID, transportID)
	if unitID == nil or unitDefID == nil or transportID == nil then return end
	if crawlingBombs[unitDefID] then	
       	local x,y,z = Spring.GetUnitBasePosition(unitID)
        local h = y - Spring.GetGroundHeight(x,z)
       	Spring.SetUnitHealth(unitID, { paralyze = h*10 })
	end
end
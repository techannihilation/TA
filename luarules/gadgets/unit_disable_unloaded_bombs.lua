
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
local frameDelay = 45

local crawlingBombs = {
	[UnitDefNames.armvader.id] = true,
	[UnitDefNames.corroach.id] = true,
	[UnitDefNames.corsktl.id] = true,
	[UnitDefNames.tllcrawlb.id] = true,
	[UnitDefNames.coretnt.id] = true,
}

local disabledUnit = {}
----------------------------------------------------------------
-- Callins
----------------------------------------------------------------

function gadget:UnitUnloaded(unitID, unitDefID, teamID, transportID)
	if unitID == nil or unitDefID == nil or transportID == nil then return end
	if crawlingBombs[unitDefID] then		
       	local frame = Spring.GetGameFrame() + frameDelay
       	Spring.SetUnitHealth(unitID, { paralyze = 1.0e9 })
       	disabledUnit[unitID] = frame
	end
end

function gadget:UnitDestroyed(unitID)
    disabledUnit[unitID] = nil
end

function gadget:GameFrame(frame)
    -- prevent unloaded units from sliding across the map
    for unitID,endframe in pairs(disabledUnit) do
    	--Spring.Echo(frame,i,endframe)
        if frame == endframe then
			Spring.SetUnitHealth(unitID, { paralyze = -1})
            disabledUnit[unitID] = nil
        end
    end
end

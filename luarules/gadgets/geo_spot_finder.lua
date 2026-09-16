function gadget:GetInfo()
	return {
		name      = "Geothermal Spot Finder Gadget",
		desc      = "Publishes geothermal vents before and after game start",
		author    = "TechAI",
		version   = "v1.0",
		date      = "September 2026",
		license   = "GNU GPL, v2 or later",
		layer     = 0,
		enabled   = true
	}
end

--------------------------------------------------------------------------------
-- SYNCED
--------------------------------------------------------------------------------
if (gadgetHandler:IsSyncedCode()) then

local GeoScanner = VFS.Include('LuaRules/Configs/techai_geo.lua')

-- The pre-game pass enumerates the map's vents; after game start a couple of
-- re-checks pick up vents that maps or other gadgets create in GameStart (the
-- same window in which some maps also write their metal).
local RESCAN_FRAMES = { 1, 180 }

local spots, rescanIndex = {}, 1

local function byPos()
	local index = {}
	for i, spot in ipairs(spots) do
		local x, z = math.floor((spot.x or 0) / 16), math.floor((spot.z or 0) / 16)
		index[x] = index[x] or {}
		index[x][z] = i
	end
	return index
end

local function publish(updated)
	spots = updated
	GG.geoSpots = spots
	GG.geoSpotsByPos = byPos()
	_G.geoSpots = spots
end

local function scan()
	publish(GeoScanner.Scan(spots))
end

function gadget:Initialize()
	scan()
end

function gadget:GameFrame(n)
	if rescanIndex <= #RESCAN_FRAMES then
		if n >= RESCAN_FRAMES[rescanIndex] then
			scan()
			rescanIndex = rescanIndex + 1
		end
		if rescanIndex > #RESCAN_FRAMES then
			gadgetHandler:RemoveCallIn('GameFrame')
		end
	end
end

end
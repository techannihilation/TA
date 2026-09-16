-- Geothermal vents are discrete map features whose defs carry the geoThermal
-- flag, so unlike metal there is no texture to sample — the features can be
-- enumerated directly. Features are readable in synced LuaRules before game
-- start, and maps or gadgets may surface new vents around GameStart, so the
-- same collector serves both the pre-game pass and the post-game re-checks.
-- Re-scans merge into the existing list (deduplicating by position) and never
-- drop a vent that was already known.
local M = {}
local MERGE_DISTANCE = 64

local function append(spots, spot)
	if type(spot) ~= 'table' or type(spot.x) ~= 'number' or type(spot.z) ~= 'number' then return end
	for _, old in ipairs(spots) do
		local dx, dz = spot.x - old.x, spot.z - old.z
		if dx * dx + dz * dz <= MERGE_DISTANCE * MERGE_DISTANCE then return end
	end
	local copy = {}
	for key, value in pairs(spot) do copy[key] = value end
	spots[#spots + 1] = copy
end

local function copySpots(existing)
	local spots = {}
	for _, spot in ipairs(type(existing) == 'table' and existing or {}) do append(spots, spot) end
	return spots
end

function M.Scan(existingSpots)
	local spots = copySpots(existingSpots)
	if not Spring.GetAllFeatures then return spots end
	local features = Spring.GetAllFeatures()
	if type(features) ~= 'table' then return spots end
	for _, featureID in ipairs(features) do
		local def = FeatureDefs[Spring.GetFeatureDefID(featureID)]
		if def and def.geoThermal then
			local x, y, z = Spring.GetFeaturePosition(featureID)
			if type(x) == 'number' and type(z) == 'number' then
				append(spots, { x = x, y = y or 0, z = z, defID = Spring.GetFeatureDefID(featureID), name = def.name, featureID = featureID })
			end
		end
	end
	return spots
end

return M
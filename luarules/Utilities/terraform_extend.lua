local ExtendGeometry = {
	GRID_SIZE = 8,
	MIN_LINE_LENGTH = 8,
	MAX_PROFILE_SAMPLES = 256,
	MAX_STRIP_POINTS = 20000,
	MAX_COMMAND_PARAMS = 16000,
}

local abs = math.abs
local ceil = math.ceil
local floor = math.floor
local max = math.max
local min = math.min
local sqrt = math.sqrt
local EPSILON = 0.0001

local function snapToGrid(value)
	return floor(value / ExtendGeometry.GRID_SIZE + 0.5) * ExtendGeometry.GRID_SIZE
end

local function getLineData(firstPoint, secondPoint)
	local diffX = secondPoint.x - firstPoint.x
	local diffZ = secondPoint.z - firstPoint.z
	local length = sqrt(diffX * diffX + diffZ * diffZ)
	if length < ExtendGeometry.MIN_LINE_LENGTH then
		return
	end

	return {
		diffX = diffX,
		diffZ = diffZ,
		length = length,
		unitX = diffX / length,
		unitZ = diffZ / length,
		normalX = -diffZ / length,
		normalZ = diffX / length,
	}
end

local function getStripCorners(firstPoint, secondPoint, width, lineData)
	lineData = lineData or getLineData(firstPoint, secondPoint)
	if not lineData then
		return
	end

	local offsetX = lineData.normalX * width
	local offsetZ = lineData.normalZ * width
	return {
		{x = firstPoint.x, z = firstPoint.z},
		{x = secondPoint.x, z = secondPoint.z},
		{x = secondPoint.x + offsetX, z = secondPoint.z + offsetZ},
		{x = firstPoint.x + offsetX, z = firstPoint.z + offsetZ},
	}
end

function ExtendGeometry.SnapPoint(x, z, mapSizeX, mapSizeZ)
	return {
		x = max(0, min(mapSizeX, snapToGrid(x))),
		z = max(0, min(mapSizeZ, snapToGrid(z))),
	}
end

function ExtendGeometry.GetProfileSampleCount(firstPoint, secondPoint)
	local lineData = getLineData(firstPoint, secondPoint)
	if not lineData then
		return
	end
	return ceil(lineData.length / ExtendGeometry.GRID_SIZE) + 1
end

function ExtendGeometry.SampleProfile(firstPoint, secondPoint, heightGetter)
	local sampleCount = ExtendGeometry.GetProfileSampleCount(firstPoint, secondPoint)
	if not sampleCount or sampleCount > ExtendGeometry.MAX_PROFILE_SAMPLES then
		return nil, sampleCount and "too_large" or "short"
	end

	local profile = {}
	for i = 1, sampleCount do
		local ratio = (i - 1) / (sampleCount - 1)
		local x = firstPoint.x + (secondPoint.x - firstPoint.x) * ratio
		local z = firstPoint.z + (secondPoint.z - firstPoint.z) * ratio
		profile[i] = heightGetter(x, z)
	end
	return profile
end

function ExtendGeometry.GetSignedWidth(firstPoint, secondPoint, x, z)
	local lineData = getLineData(firstPoint, secondPoint)
	if not lineData then
		return 0
	end
	return (x - firstPoint.x) * lineData.normalX
		+ (z - firstPoint.z) * lineData.normalZ
end

function ExtendGeometry.IsStripValid(
		firstPoint,
		secondPoint,
		width,
		mapSizeX,
		mapSizeZ,
		maxAreaSize
)
	if abs(width) < ExtendGeometry.GRID_SIZE then
		return false
	end

	local corners = getStripCorners(firstPoint, secondPoint, width)
	if not corners then
		return false
	end

	local left = mapSizeX
	local right = 0
	local top = mapSizeZ
	local bottom = 0
	for i = 1, #corners do
		local corner = corners[i]
		if corner.x < -EPSILON or corner.x > mapSizeX + EPSILON
				or corner.z < -EPSILON or corner.z > mapSizeZ + EPSILON then
			return false
		end
		left = min(left, corner.x)
		right = max(right, corner.x)
		top = min(top, corner.z)
		bottom = max(bottom, corner.z)
	end

	local rasterLeft = max(0, floor(left / ExtendGeometry.GRID_SIZE)
		* ExtendGeometry.GRID_SIZE)
	local rasterRight = min(mapSizeX, ceil(right / ExtendGeometry.GRID_SIZE)
		* ExtendGeometry.GRID_SIZE)
	local rasterTop = max(0, floor(top / ExtendGeometry.GRID_SIZE)
		* ExtendGeometry.GRID_SIZE)
	local rasterBottom = min(mapSizeZ, ceil(bottom / ExtendGeometry.GRID_SIZE)
		* ExtendGeometry.GRID_SIZE)
	return rasterRight - rasterLeft <= maxAreaSize + EPSILON
		and rasterBottom - rasterTop <= maxAreaSize + EPSILON
end

function ExtendGeometry.ClampStripWidth(
		firstPoint,
		secondPoint,
		width,
		mapSizeX,
		mapSizeZ,
		maxAreaSize
)
	local direction = width < 0 and -1 or 1
	local magnitude = floor(abs(width) / ExtendGeometry.GRID_SIZE)
		* ExtendGeometry.GRID_SIZE

	while magnitude >= ExtendGeometry.GRID_SIZE do
		local candidate = magnitude * direction
		if ExtendGeometry.IsStripValid(
				firstPoint,
				secondPoint,
				candidate,
				mapSizeX,
				mapSizeZ,
				maxAreaSize
		) then
			return candidate
		end
		magnitude = magnitude - ExtendGeometry.GRID_SIZE
	end
	return 0
end

function ExtendGeometry.BuildStripPoints(
		firstPoint,
		secondPoint,
		width,
		mapSizeX,
		mapSizeZ,
		maxAreaSize
)
	local lineData = getLineData(firstPoint, secondPoint)
	if not lineData then
		return nil, "short"
	end
	if not ExtendGeometry.IsStripValid(
			firstPoint,
			secondPoint,
			width,
			mapSizeX,
			mapSizeZ,
			maxAreaSize
	) then
		return nil, "invalid"
	end

	local corners = getStripCorners(firstPoint, secondPoint, width, lineData)
	local left = mapSizeX
	local right = 0
	local top = mapSizeZ
	local bottom = 0
	for i = 1, #corners do
		left = min(left, corners[i].x)
		right = max(right, corners[i].x)
		top = min(top, corners[i].z)
		bottom = max(bottom, corners[i].z)
	end
	left = max(0, floor(left / ExtendGeometry.GRID_SIZE) * ExtendGeometry.GRID_SIZE)
	right = min(mapSizeX, ceil(right / ExtendGeometry.GRID_SIZE) * ExtendGeometry.GRID_SIZE)
	top = max(0, floor(top / ExtendGeometry.GRID_SIZE) * ExtendGeometry.GRID_SIZE)
	bottom = min(mapSizeZ, ceil(bottom / ExtendGeometry.GRID_SIZE) * ExtendGeometry.GRID_SIZE)

	local halfGrid = ExtendGeometry.GRID_SIZE * 0.5
	local minimumNormal = min(0, width) - halfGrid
	local maximumNormal = max(0, width) + halfGrid
	local points = {}
	for x = left, right, ExtendGeometry.GRID_SIZE do
		for z = top, bottom, ExtendGeometry.GRID_SIZE do
			local fromStartX = x - firstPoint.x
			local fromStartZ = z - firstPoint.z
			local along = fromStartX * lineData.unitX + fromStartZ * lineData.unitZ
			local normal = fromStartX * lineData.normalX + fromStartZ * lineData.normalZ
			if along >= -halfGrid
					and along <= lineData.length + halfGrid
					and normal >= minimumNormal
					and normal <= maximumNormal then
				points[#points + 1] = {
					x = x,
					z = z,
					ratio = max(0, min(1, along / lineData.length)),
				}
				if #points > ExtendGeometry.MAX_STRIP_POINTS then
					return nil, "too_large"
				end
			end
		end
	end

	if #points == 0 then
		return nil, "empty"
	end
	return points
end

function ExtendGeometry.InterpolateProfile(profile, ratio)
	if #profile == 1 then
		return profile[1]
	end

	local position = max(0, min(1, ratio)) * (#profile - 1) + 1
	local firstIndex = floor(position)
	local secondIndex = min(#profile, firstIndex + 1)
	local blend = position - firstIndex
	return profile[firstIndex]
		+ (profile[secondIndex] - profile[firstIndex]) * blend
end

return ExtendGeometry

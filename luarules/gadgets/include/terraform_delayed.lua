local DelayedTerraform = {}

local abs = math.abs
local max = math.max
local min = math.min
local sqrt = math.sqrt

local GRID_SIZE = 8
local MAX_ABSOLUTE_HEIGHT = 3000
local MAX_EDGE_POINTS = 9000
local HEIGHT_EPSILON = 0.0001
local SMOOTH_PASSES = 3
local SMOOTH_KERNEL = {1, 4, 6, 4, 1}
local SMOOTH_KERNEL_RADIUS = 2
local SMOOTH_KERNEL_WEIGHT = 16

local mapSizeX = Game.mapSizeX
local mapSizeZ = Game.mapSizeZ

local directions = {
	{x = -GRID_SIZE, z = 0},
	{x = GRID_SIZE, z = 0},
	{x = 0, z = -GRID_SIZE},
	{x = 0, z = GRID_SIZE},
}

local function isInsideMap(x, z)
	return x > 0 and x < mapSizeX and z > 0 and z < mapSizeZ
end

local function isHeightmapPoint(x, z)
	return x >= 0 and x <= mapSizeX and z >= 0 and z <= mapSizeZ
end

local function removeAreaPoint(area, x, z)
	if area[x] then
		area[x][z] = nil
	end
end

local function preparePoint(terraformData, point, aimHeight)
	local x = point.x
	local z = point.z
	if not isHeightmapPoint(x, z) then
		point.diffHeight = 0
		point.structure = true
		removeAreaPoint(terraformData.area, x, z)
		return false
	end

	local currentHeight = Spring.GetGroundHeight(x, z)

	point.orHeight = currentHeight
	point.prevHeight = currentHeight
	point.aimHeight = aimHeight

	point.structure = false
	point.diffHeight = aimHeight - currentHeight
	if not terraformData.area[x] then
		terraformData.area[x] = {}
	end
	terraformData.area[x][z] = true
	return abs(point.diffHeight) > HEIGHT_EPSILON
end

local function getSmoothCoreBounds(segments, segmentCount)
	local left = mapSizeX
	local right = 0
	local top = mapSizeZ
	local bottom = 0
	local hasPoint = false

	for i = 1, segmentCount do
		local segment = segments[i]
		for j = 1, segment.points do
			local point = segment.point[j]
			if isHeightmapPoint(point.x, point.z) then
				left = min(left, point.x)
				right = max(right, point.x)
				top = min(top, point.z)
				bottom = max(bottom, point.z)
				hasPoint = true
			end
		end
	end

	if hasPoint then
		return left, right, top, bottom
	end
end

local function snapshotSmoothHeights(left, right, top, bottom)
	local heights = {}
	for x = left, right, GRID_SIZE do
		heights[x] = {}
		local sampleX = max(0, min(mapSizeX, x))
		for z = top, bottom, GRID_SIZE do
			local sampleZ = max(0, min(mapSizeZ, z))
			heights[x][z] = Spring.GetGroundHeight(sampleX, sampleZ)
		end
	end
	return heights
end

local function runSmoothPass(source, left, right, top, bottom)
	local radius = SMOOTH_KERNEL_RADIUS * GRID_SIZE
	local outputLeft = left + radius
	local outputRight = right - radius
	local outputTop = top + radius
	local outputBottom = bottom - radius
	local horizontal = {}

	for x = outputLeft, outputRight, GRID_SIZE do
		horizontal[x] = {}
		for z = top, bottom, GRID_SIZE do
			local weightedHeight = 0
			for kernelIndex = 1, #SMOOTH_KERNEL do
				local offset = (kernelIndex - SMOOTH_KERNEL_RADIUS - 1) * GRID_SIZE
				weightedHeight = weightedHeight
					+ source[x + offset][z] * SMOOTH_KERNEL[kernelIndex]
			end
			horizontal[x][z] = weightedHeight / SMOOTH_KERNEL_WEIGHT
		end
	end

	local filtered = {}
	for x = outputLeft, outputRight, GRID_SIZE do
		filtered[x] = {}
		for z = outputTop, outputBottom, GRID_SIZE do
			local weightedHeight = 0
			for kernelIndex = 1, #SMOOTH_KERNEL do
				local offset = (kernelIndex - SMOOTH_KERNEL_RADIUS - 1) * GRID_SIZE
				weightedHeight = weightedHeight
					+ horizontal[x][z + offset] * SMOOTH_KERNEL[kernelIndex]
			end
			filtered[x][z] = weightedHeight / SMOOTH_KERNEL_WEIGHT
		end
	end

	return filtered, outputLeft, outputRight, outputTop, outputBottom
end

local function prepareSmoothSegments(segments, segmentCount)
	local left, right, top, bottom = getSmoothCoreBounds(segments, segmentCount)
	if not left then
		return false
	end

	local passRadius = SMOOTH_KERNEL_RADIUS * GRID_SIZE
	local halo = SMOOTH_PASSES * passRadius
	left = left - halo
	right = right + halo
	top = top - halo
	bottom = bottom + halo

	local filtered = snapshotSmoothHeights(left, right, top, bottom)
	for _ = 1, SMOOTH_PASSES do
		filtered, left, right, top, bottom = runSmoothPass(
			filtered,
			left,
			right,
			top,
			bottom
		)
	end

	local hasHeightChange = false
	for i = 1, segmentCount do
		local segment = segments[i]
		for j = 1, segment.points do
			local point = segment.point[j]
			if not isHeightmapPoint(point.x, point.z) then
				preparePoint(segment, point, 0)
			elseif preparePoint(segment, point, filtered[point.x][point.z]) then
				hasHeightChange = true
			end
		end
	end

	return hasHeightChange
end

function DelayedTerraform.PrepareSegment(terraformData, terraformType, terraformHeight)
	local hasHeightChange = false

	for i = 1, terraformData.points do
		local point = terraformData.point[i]
		if not isHeightmapPoint(point.x, point.z) then
			preparePoint(terraformData, point, 0)
		else
			local currentHeight = Spring.GetGroundHeight(point.x, point.z)
			local aimHeight

			if terraformType == 1 then
				aimHeight = terraformHeight
			elseif terraformType == 5 then
				aimHeight = Spring.GetGroundOrigHeight(point.x, point.z)
			else
				aimHeight = currentHeight
			end

			if preparePoint(terraformData, point, aimHeight) then
				hasHeightChange = true
			end
		end
	end

	return hasHeightChange
end

function DelayedTerraform.PrepareSegments(segments, segmentCount, terraformType, terraformHeight)
	if terraformType == 3 then
		return prepareSmoothSegments(segments, segmentCount)
	end

	local hasHeightChange = false
	for i = 1, segmentCount do
		if DelayedTerraform.PrepareSegment(segments[i], terraformType, terraformHeight) then
			hasHeightChange = true
		end
	end
	return hasHeightChange
end

function DelayedTerraform.PrepareRamp(terraformData)
	local hasHeightChange = false

	for i = 1, terraformData.points do
		local point = terraformData.point[i]
		if preparePoint(terraformData, point, point.y) then
			hasHeightChange = true
		end
	end

	return hasHeightChange
end

local function updateBorder(frozen, x, z)
	if x < frozen.border.left then
		frozen.border.left = x
	end
	if x > frozen.border.right then
		frozen.border.right = x
	end
	if z < frozen.border.top then
		frozen.border.top = z
	end
	if z > frozen.border.bottom then
		frozen.border.bottom = z
	end
end

local function addFrozenPoint(frozen, point)
	local x = point.x
	local z = point.z
	if not frozen.pointMap[x] then
		frozen.pointMap[x] = {}
	end

	local existingIndex = frozen.pointMap[x][z]
	if existingIndex then
		return frozen.points[existingIndex], false
	end

	frozen.count = frozen.count + 1
	frozen.points[frozen.count] = point
	frozen.pointMap[x][z] = frozen.count
	updateBorder(frozen, x, z)
	return point, true
end

local function addCorePoints(frozen, segments, segmentCount)
	local hasHeightChange = false

	for i = 1, segmentCount do
		local segment = segments[i]
		for j = 1, segment.points do
			local source = segment.point[j]
			if isHeightmapPoint(source.x, source.z) then
				local initialHeight = source.orHeight
					or Spring.GetGroundHeight(source.x, source.z)
				local finalHeight = source.aimHeight or initialHeight

				local frozenPoint, added = addFrozenPoint(frozen, {
					x = source.x,
					z = source.z,
					initialHeight = initialHeight,
					finalHeight = finalHeight,
					isCore = true,
					isEdge = false,
				})

				if not added and not frozenPoint.isCore then
					frozenPoint.initialHeight = initialHeight
					frozenPoint.finalHeight = finalHeight
					frozenPoint.isCore = true
					frozenPoint.isEdge = false
				end

				if abs(finalHeight - initialHeight) > HEIGHT_EPSILON then
					hasHeightChange = true
				end
			end
		end
	end

	return hasHeightChange
end

local function addEdgePoint(edgeState, source, x, z)
	if not isInsideMap(x, z) then
		return false
	end

	local frozen = edgeState.frozen
	local existingIndex = frozen.pointMap[x] and frozen.pointMap[x][z]
	if existingIndex and frozen.points[existingIndex].isCore then
		return false
	end

	local distanceFromSupport = sqrt(
		(x - source.supportX) * (x - source.supportX) +
		(z - source.supportZ) * (z - source.supportZ)
	)
	local allowedDifference = distanceFromSupport * edgeState.maxHeightDifference / GRID_SIZE
	local groundHeight = Spring.GetGroundHeight(x, z)
	local targetHeight

	if source.direction > 0 and source.supportHeight - groundHeight > allowedDifference then
		targetHeight = source.supportHeight - allowedDifference
	elseif source.direction < 0 and source.supportHeight - groundHeight < -allowedDifference then
		targetHeight = source.supportHeight + allowedDifference
	else
		return false
	end

	if abs(targetHeight) > MAX_ABSOLUTE_HEIGHT then
		edgeState.invalidHeight = true
		return false
	end

	if existingIndex then
		local existing = frozen.points[existingIndex]
		if existing.direction ~= source.direction then
			return false
		end
		if source.direction > 0 and targetHeight <= existing.finalHeight then
			return false
		end
		if source.direction < 0 and targetHeight >= existing.finalHeight then
			return false
		end

		existing.finalHeight = targetHeight
		existing.supportX = source.supportX
		existing.supportZ = source.supportZ
		existing.supportHeight = source.supportHeight
		edgeState.queue[#edgeState.queue + 1] = existingIndex
		return true
	end

	if edgeState.edgeCount >= MAX_EDGE_POINTS then
		edgeState.limitReached = true
		return false
	end

	local point
	point, _ = addFrozenPoint(frozen, {
		x = x,
		z = z,
		initialHeight = groundHeight,
		finalHeight = targetHeight,
		isCore = false,
		isEdge = true,
		direction = source.direction,
		supportX = source.supportX,
		supportZ = source.supportZ,
		supportHeight = source.supportHeight,
	})
	edgeState.edgeCount = edgeState.edgeCount + 1
	edgeState.queue[#edgeState.queue + 1] = frozen.pointMap[x][z]
	return true
end

local function buildEdgePoints(frozen, maxHeightDifference)
	local edgeState = {
		frozen = frozen,
		maxHeightDifference = maxHeightDifference,
		queue = {},
		edgeCount = 0,
	}

	local coreCount = frozen.count
	for i = 1, coreCount do
		local point = frozen.points[i]
		local difference = point.finalHeight - point.initialHeight
		if point.isCore and abs(difference) > HEIGHT_EPSILON then
			local source = {
				direction = difference > 0 and 1 or -1,
				supportX = point.x,
				supportZ = point.z,
				supportHeight = point.finalHeight,
			}
			for j = 1, #directions do
				addEdgePoint(
					edgeState,
					source,
					point.x + directions[j].x,
					point.z + directions[j].z
				)
			end
		end
	end

	local queueIndex = 1
	while queueIndex <= #edgeState.queue
			and queueIndex <= MAX_EDGE_POINTS * 8
			and not edgeState.invalidHeight
			and not edgeState.limitReached do
		local pointIndex = edgeState.queue[queueIndex]
		local source = frozen.points[pointIndex]
		queueIndex = queueIndex + 1

		for i = 1, #directions do
			addEdgePoint(
				edgeState,
				source,
				source.x + directions[i].x,
				source.z + directions[i].z
			)
		end
	end
	if queueIndex <= #edgeState.queue then
		edgeState.limitReached = true
	end

	return edgeState
end

local function calculateWork(frozen)
	local work = 0
	for i = 1, frozen.count do
		local point = frozen.points[i]
		work = work + abs(point.finalHeight - point.initialHeight)
	end
	frozen.work = work
end

function DelayedTerraform.FreezeSegments(segments, segmentCount, maxHeightDifference)
	local frozen = {
		points = {},
		pointMap = {},
		count = 0,
		work = 0,
		border = {
			left = mapSizeX,
			right = 0,
			top = mapSizeZ,
			bottom = 0,
		},
	}

	if segmentCount < 1
			or not addCorePoints(frozen, segments, segmentCount) then
		return nil, "nochange"
	end

	for i = 1, frozen.count do
		if abs(frozen.points[i].finalHeight) > MAX_ABSOLUTE_HEIGHT then
			return nil, "height"
		end
	end

	local edgeState = buildEdgePoints(frozen, maxHeightDifference)
	if edgeState.invalidHeight then
		return nil, "height"
	end
	if edgeState.limitReached then
		return nil, "pointlimit"
	end

	calculateWork(frozen)
	if frozen.work <= HEIGHT_EPSILON then
		return nil, "nochange"
	end

	return frozen
end

local function updateTerrainTexture(frozen)
	if not GG.Terrain_Texture_changeBlockList then
		return
	end

	local drawingList = {}
	local drawingArea = {}

	local function addPoint(point)
		local x = point.x
		local z = point.z
		if x < 0 or x > mapSizeX - GRID_SIZE or z < 0 or z > mapSizeZ - GRID_SIZE then
			return
		end
		if not drawingArea[x] then
			drawingArea[x] = {}
		end
		if drawingArea[x][z] then
			if point.isEdge then
				drawingArea[x][z].edge = true
			end
			return
		end

		local entry = {x = x, z = z, tex = 1, edge = point.isEdge}
		drawingArea[x][z] = entry
		drawingList[#drawingList + 1] = entry
	end

	for i = 1, frozen.count do
		addPoint(frozen.points[i])
	end

	for i = 1, #drawingList do
		local entry = drawingList[i]
		local sampleX = entry.x + 4
		local sampleZ = entry.z + 4
		local originalHeight = Spring.GetGroundOrigHeight(sampleX, sampleZ)
		local currentHeight = Spring.GetGroundHeight(sampleX, sampleZ)

		if abs(originalHeight - currentHeight) < 1 then
			entry.tex = 0
		else
			local normal = select(2, Spring.GetGroundNormal(sampleX, sampleZ))
			if (entry.edge and normal > 0.8) or (not entry.edge and normal > 0.892) then
				entry.tex = 1
			elseif (entry.edge and normal > 0.41) or (not entry.edge and normal > 0.585) then
				entry.tex = 2
			else
				entry.tex = 3
			end
		end
		entry.edge = nil
	end

	GG.Terrain_Texture_changeBlockList(drawingList)
end

function DelayedTerraform.Apply(frozen, updateTexture)
	for i = 1, frozen.count do
		if abs(frozen.points[i].finalHeight) > MAX_ABSOLUTE_HEIGHT then
			Spring.Log("Terraformers", LOG.WARNING, "Ignoring terraform with an unsafe frozen height")
			return false
		end
	end

	Spring.SetHeightMapFunc(function()
		for i = 1, frozen.count do
			local point = frozen.points[i]
			Spring.SetHeightMap(point.x, point.z, point.finalHeight)
		end
	end)

	if updateTexture then
		updateTerrainTexture(frozen)
	end
	return true
end

function DelayedTerraform.OverlapsStructure(frozen, structureData)
	if frozen.border.right < structureData.minx
		or frozen.border.left > structureData.maxx
		or frozen.border.bottom < structureData.minz
		or frozen.border.top > structureData.maxz then
		return false
	end

	for i = 1, frozen.count do
		local point = frozen.points[i]
		if point.x >= structureData.minx
			and point.x <= structureData.maxx
			and point.z >= structureData.minz
			and point.z <= structureData.maxz then
			return true
		end
	end
	return false
end

function DelayedTerraform.FindClosestPoint(frozen, x, z)
	local closestPoint
	local closestDistance

	for i = 1, frozen.count do
		local point = frozen.points[i]
		if abs(point.finalHeight - point.initialHeight) > HEIGHT_EPSILON then
			local dx = point.x - x
			local dz = point.z - z
			local distance = dx * dx + dz * dz
			if not closestDistance or distance < closestDistance then
				closestPoint = point
				closestDistance = distance
			end
		end
	end

	return closestPoint, closestDistance
end

return DelayedTerraform

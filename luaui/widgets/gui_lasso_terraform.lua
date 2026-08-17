function widget:GetInfo()
	return {
		name      = "Lasso Terraform GUI",
		desc      = "Interface for area terraform.",
		author    = "Google Frog",
		version   = "v1",
		date      = "Nov, 2009",
		license   = "GNU GPL, v2 or later",
		layer     = math.huge,
		enabled   = true,
		handler   = true,
	}
end

include("keysym.h.lua")

--------------------------------------------------------------------------------
-- Speedups
--------------------------------------------------------------------------------

local osclock	= os.clock

local GL_LINES			= GL.LINES
local glBlending        = gl.Blending
local glCreateShader    = gl.CreateShader
local glCulling         = gl.Culling
local glDeleteShader    = gl.DeleteShader
local glDepthTest		= gl.DepthTest
local glGetShaderLog    = gl.GetShaderLog
local glGetUniformLocation = gl.GetUniformLocation
local glGetVAO          = gl.GetVAO
local glGetVBO          = gl.GetVBO
local glText            = gl.Text
local glUniform         = gl.Uniform
local glUniformMatrix   = gl.UniformMatrix
local glUseShader       = gl.UseShader

local spGetActiveCommand 	= Spring.GetActiveCommand
local spSetActiveCommand	= Spring.SetActiveCommand

local spIsAboveMiniMap		= Spring.IsAboveMiniMap --
--local spGetMiniMapGeometry	= (Spring.GetMiniMapGeometry or Spring.GetMouseMiniMapState)

local spGetSelectedUnits	= Spring.GetSelectedUnits

local spGiveOrder			= Spring.GiveOrder
local spGetUnitDefID 		= Spring.GetUnitDefID
local spGiveOrderToUnit   	= Spring.GiveOrderToUnit
local spGetModKeyState		= Spring.GetModKeyState

local spTraceScreenRay		= Spring.TraceScreenRay
local spGetGroundHeight		= Spring.GetGroundHeight
local spGetCurrentTooltip	= Spring.GetCurrentTooltip
local spGetViewGeometry    = Spring.GetViewGeometry

local spSendCommands 		= Spring.SendCommands

local mapWidth, mapHeight 	= Game.mapSizeX, Game.mapSizeZ
local maxUnits = Game.maxUnits

local st_find = string.find

local sqrt	= math.sqrt
local floor = math.floor
local ceil = math.ceil 
local abs = math.abs
local modf = math.modf
local string_format = string.format

local team = Spring.GetMyTeamID()
local terraformerDefs = VFS.Include("luarules/configs/comDefIDs.lua") or {}
for unitDefID in pairs(VFS.Include("luarules/configs/terraformerDefIDs.lua") or {}) do
	terraformerDefs[unitDefID] = true
end
local extendGeometry = VFS.Include("luarules/Utilities/terraform_extend.lua")

-- command IDs
local CMD_RAMP = 39734
local CMD_EXTEND = 39735
local CMD_LEVEL = 39736
local CMD_SMOOTH = 39738
local CMD_RESTORE = 39739
local CMD_TERRAFORM_INTERNAL = 39801

local Grid = 16 -- grid size, do not change without other changes.

---------------------------------
--Config
---------------------------------

-- for command canceling when the command has been given and shift is de-pressed
local originalCommandGiven = false

-- max difference of height around terraforming, Makes Shraka Pyramids. Not used
local maxHeightDifference = 100

-- Elmos per vertical mouse pixel while selecting terraform height.
local mouseSensitivity = 2
local initialHeightSnapRange = mouseSensitivity * 10
local rectangleDragThreshold = 4
local minTerraformHeight = -2000
local maxTerraformHeight = 2000
local maxRampGradient = 5

-- max sizes of non-ramp command, reduces slowdown MUST AGREE WITH GADGET VALUES
local maxAreaSize = 1000 -- max width or length
local generatedAreaPadding = Grid
local maxRectangleSpan = floor((maxAreaSize - generatedAreaPadding) / Grid) * Grid
local minSmoothRadius = Grid
local maxSmoothRadius = floor(
	(maxAreaSize - generatedAreaPadding) / (2 * Grid)
) * Grid

-- Ramp dimensions. These values MUST AGREE WITH GADGET VALUES.
local maxRampLength = 3000
local minRampLength = 32
local fixedRampWidth = 100

-- max slope of certain units, changes ramp colour
local botPathingGrad = 1.375
local vehPathingGrad = 0.498

-- Colours used during height selection
local negVolume   = {1, 0, 0, 0.1} -- negative volume
local posVolume   = {0, 1, 0, 0.1} -- posisive volume
local groundGridColor  = {0.3, 0.2, 1, 0.8} -- grid representing new ground height

-- Colour of the selected area outline.
local selectionColor = {0.2, 1.0, 0.2, 1.0}

-- colour of ramp
local vehPathingColor = {0.2, 1.0, 0.2, 1.0}
local botPathingColor = {0.78, .78, 0.39, 1.0}
local noPathingColor = {1.0, 0.2, 0.2, 1.0}

----------------------------------
-- Global Vars

local drawingRectangle = false
local drawingRamp = false
local setHeight = false
local terraform_type = 0 -- 1 = level, 2 = extend, 3 = smooth, 4 = ramp, 5 = restore

local smoothCircle = {
	active = false,
	centerX = 0,
	centerZ = 0,
	radius = minSmoothRadius,
	polygon = {},
	outline = {},
}

local extend = {
	phase = "idle",
	firstPoint = nil,
	secondPoint = nil,
	profile = {},
	stripPoints = {},
	stripPointMap = {},
	width = 0,
	meshDirty = true,
}

local volumeSelection = 0

local mouseBuilding = false

local terraformHeight = 0
local orHeight = 0 -- store ground height
local storedHeight = 0 -- for snap to height
local modifierHeightSelection = false
local initialHeightSnapped = false
local loop = 0

local point = {}
local points = 0

local drawPoint = {}
local drawPoints = 0

local lineShader
local lineViewProjectionLoc
local lineViewportSizeLoc
local lineWidthLoc
local lineTerraformHeightLoc
local lineVolumeSelectionLoc
local lineNegativeVolumeColorLoc
local linePositiveVolumeColorLoc
local lineRendererFailed = false
local lineMeshFailureReported = false

local volumeMesh = {vao = nil, vbo = nil, capacity = 0, vertexCount = 0}
local groundGridMesh = {vao = nil, vbo = nil, capacity = 0, vertexCount = 0}
local mouseGridMesh = {vao = nil, vbo = nil, capacity = 0, vertexCount = 0}
local transientMesh = {vao = nil, vbo = nil, capacity = 0, vertexCount = 0}

local mouseX, mouseY
local rectangleStartMouseX, rectangleStartMouseY
local rectangleEndX, rectangleEndZ
local rectangleDragged = false
local rectangleAwaitingSecondClick = false

---------------

local lineVertexShader = [[
#version 330 core

layout(location = 0) in vec3 position;
layout(location = 1) in vec4 color;
layout(location = 2) in vec2 vertexParams;

uniform mat4 viewprojection;
uniform float terraformHeight;
uniform float volumeSelection;
uniform vec4 negativeVolumeColor;
uniform vec4 positiveVolumeColor;

out vec4 vertexColor;

void main()
{
	vec3 worldPosition = position;
	float vertexMode = vertexParams.x;
	float groundHeight = vertexParams.y;
	vertexColor = color;

	if (vertexMode > 0.5 && (vertexMode < 1.5 || vertexMode > 2.5)) {
		worldPosition.y = terraformHeight;
	}
	if (vertexMode > 1.5) {
		bool isNegativeVolume = terraformHeight < groundHeight;
		bool suppressVolume = (isNegativeVolume && volumeSelection > 0.5 && volumeSelection < 1.5)
			|| (!isNegativeVolume && volumeSelection > 1.5);
		vertexColor = isNegativeVolume ? negativeVolumeColor : positiveVolumeColor;
		if (suppressVolume) {
			vertexColor.a = 0.0;
		}
	}

	gl_Position = viewprojection * vec4(worldPosition, 1.0);
}
]]

local lineGeometryShader = [[
#version 330 core

layout(lines) in;
layout(triangle_strip, max_vertices = 4) out;

in vec4 vertexColor[];
out vec4 fragmentColor;

uniform vec2 viewportSize;
uniform float lineWidth;

void EmitLineVertex(vec4 clipPosition, vec2 offset, vec4 color)
{
	fragmentColor = color;
	gl_Position = clipPosition;
	gl_Position.xy += offset * clipPosition.w;
	EmitVertex();
}

void main()
{
	vec4 startClip = gl_in[0].gl_Position;
	vec4 endClip = gl_in[1].gl_Position;
	if (startClip.w <= 0.0001 || endClip.w <= 0.0001) {
		return;
	}
	vec2 startScreen = (startClip.xy / startClip.w) * viewportSize * 0.5;
	vec2 endScreen = (endClip.xy / endClip.w) * viewportSize * 0.5;
	vec2 direction = endScreen - startScreen;
	float directionLength = length(direction);

	if (directionLength < 0.001) {
		return;
	}

	vec2 normal = vec2(-direction.y, direction.x) / directionLength;
	vec2 offset = normal * (lineWidth / viewportSize);

	EmitLineVertex(startClip, offset, vertexColor[0]);
	EmitLineVertex(startClip, -offset, vertexColor[0]);
	EmitLineVertex(endClip, offset, vertexColor[1]);
	EmitLineVertex(endClip, -offset, vertexColor[1]);
	EndPrimitive();
}
]]

local lineFragmentShader = [[
#version 330 core

in vec4 fragmentColor;
out vec4 fragColor;

void main()
{
	if (fragmentColor.a <= 0.0) {
		discard;
	}
	fragColor = fragmentColor;
}
]]

local function destroyLineMesh(mesh)
	if mesh.vao then
		mesh.vao:Delete()
	end
	if mesh.vbo then
		mesh.vbo:Delete()
	end
	mesh.vao = nil
	mesh.vbo = nil
	mesh.capacity = 0
	mesh.vertexCount = 0
end

local function clearLineMeshes()
	volumeMesh.vertexCount = 0
	groundGridMesh.vertexCount = 0
	mouseGridMesh.vertexCount = 0
	transientMesh.vertexCount = 0
end

local function destroyLineRenderer()
	destroyLineMesh(volumeMesh)
	destroyLineMesh(groundGridMesh)
	destroyLineMesh(mouseGridMesh)
	destroyLineMesh(transientMesh)

	if lineShader then
		glDeleteShader(lineShader)
		lineShader = nil
	end
end

local function initLineRenderer()
	if lineShader then
		return true
	end
	if lineRendererFailed then
		return false
	end
	if not glCreateShader or not glDeleteShader or not glGetUniformLocation
			or not glGetVAO or not glGetVBO or not glUniform
			or not glUniformMatrix or not glUseShader then
		lineRendererFailed = true
		return false
	end

	lineShader = glCreateShader({
		vertex = lineVertexShader,
		geometry = lineGeometryShader,
		fragment = lineFragmentShader,
	})
	if not lineShader or lineShader == 0 then
		Spring.Echo("[Lasso Terraform GUI] Failed to create the line shader:", glGetShaderLog and glGetShaderLog() or "no shader log")
		lineShader = nil
		lineRendererFailed = true
		return false
	end

	lineViewProjectionLoc = glGetUniformLocation(lineShader, "viewprojection")
	lineViewportSizeLoc = glGetUniformLocation(lineShader, "viewportSize")
	lineWidthLoc = glGetUniformLocation(lineShader, "lineWidth")
	lineTerraformHeightLoc = glGetUniformLocation(lineShader, "terraformHeight")
	lineVolumeSelectionLoc = glGetUniformLocation(lineShader, "volumeSelection")
	lineNegativeVolumeColorLoc = glGetUniformLocation(lineShader, "negativeVolumeColor")
	linePositiveVolumeColorLoc = glGetUniformLocation(lineShader, "positiveVolumeColor")
	return true
end

local function ensureLineMeshCapacity(mesh, vertexCount)
	if mesh.vao and mesh.vbo and vertexCount <= mesh.capacity then
		return true
	end

	local capacity = math.max(mesh.capacity, 64)
	while capacity < vertexCount do
		capacity = capacity * 2
	end

	local newVAO = glGetVAO()
	local newVBO = glGetVBO(GL.ARRAY_BUFFER, true)
	if not newVAO or not newVBO then
		if newVAO then
			newVAO:Delete()
		end
		if newVBO then
			newVBO:Delete()
		end
		return false
	end

	newVBO:Define(capacity, {
		{id = 0, name = "position", size = 3},
		{id = 1, name = "color", size = 4},
		{id = 2, name = "vertexParams", size = 2},
	})
	newVAO:AttachVertexBuffer(newVBO)

	if mesh.vao then
		mesh.vao:Delete()
	end
	if mesh.vbo then
		mesh.vbo:Delete()
	end

	mesh.vao = newVAO
	mesh.vbo = newVBO
	mesh.capacity = capacity
	return true
end

local function uploadLineMesh(mesh, data)
	local vertexCount = #data / 9
	mesh.vertexCount = 0
	if vertexCount == 0 then
		return true
	end
	if not ensureLineMeshCapacity(mesh, vertexCount) then
		if not lineMeshFailureReported then
			Spring.Echo("[Lasso Terraform GUI] Failed to allocate a line mesh.")
			lineMeshFailureReported = true
		end
		return false
	end

	mesh.vbo:Upload(data)
	mesh.vertexCount = vertexCount
	return true
end

local function addLine(data, x1, y1, z1, x2, y2, z2, color, startMode, endMode, groundHeight)
	local index = #data
	startMode = startMode or 0
	endMode = endMode or 0
	groundHeight = groundHeight or 0
	data[index + 1] = x1
	data[index + 2] = y1
	data[index + 3] = z1
	data[index + 4] = color[1]
	data[index + 5] = color[2]
	data[index + 6] = color[3]
	data[index + 7] = color[4]
	data[index + 8] = startMode
	data[index + 9] = groundHeight
	data[index + 10] = x2
	data[index + 11] = y2
	data[index + 12] = z2
	data[index + 13] = color[1]
	data[index + 14] = color[2]
	data[index + 15] = color[3]
	data[index + 16] = color[4]
	data[index + 17] = endMode
	data[index + 18] = groundHeight
end

local function addLineStrip(data, vertices, color)
	for i = 1, #vertices - 1 do
		local startPoint = vertices[i]
		local endPoint = vertices[i + 1]
		addLine(
			data,
			startPoint[1], startPoint[2], startPoint[3],
			endPoint[1], endPoint[2], endPoint[3],
			color
		)
	end
end

local function clampTerraformHeight(height)
	return math.max(minTerraformHeight, math.min(maxTerraformHeight, height))
end

function extend.Reset()
	extend.phase = "idle"
	extend.firstPoint = nil
	extend.secondPoint = nil
	extend.profile = {}
	extend.stripPoints = {}
	extend.stripPointMap = {}
	extend.width = 0
	extend.meshDirty = true
end

function extend.StartLine(x, z)
	local snapped = extendGeometry.SnapPoint(x, z, mapWidth, mapHeight)
	extend.firstPoint = snapped
	extend.secondPoint = {x = snapped.x, z = snapped.z}
	extend.phase = "line"
	extend.meshDirty = true
end

function extend.UpdateLine(x, z)
	local snapped = extendGeometry.SnapPoint(x, z, mapWidth, mapHeight)
	if snapped.x ~= extend.secondPoint.x or snapped.z ~= extend.secondPoint.z then
		extend.secondPoint = snapped
		extend.meshDirty = true
	end
end

function extend.FinishLine()
	local profile, errorReason = extendGeometry.SampleProfile(
		extend.firstPoint,
		extend.secondPoint,
		spGetGroundHeight
	)
	if not profile then
		return false, errorReason
	end
	for i = 1, #profile do
		if profile[i] < minTerraformHeight or profile[i] > maxTerraformHeight then
			return false, "height"
		end
	end
	if not extendGeometry.IsStripValid(
			extend.firstPoint,
			extend.secondPoint,
			extendGeometry.GRID_SIZE,
			mapWidth,
			mapHeight,
			maxAreaSize
		) and not extendGeometry.IsStripValid(
			extend.firstPoint,
			extend.secondPoint,
			-extendGeometry.GRID_SIZE,
			mapWidth,
			mapHeight,
			maxAreaSize
		) then
		return false, "too_large"
	end

	extend.profile = profile
	extend.width = 0
	extend.stripPoints = {}
	extend.stripPointMap = {}
	extend.phase = "width"
	extend.meshDirty = true
	return true
end

function extend.UpdateWidth(x, z)
	local requestedWidth = extendGeometry.GetSignedWidth(
		extend.firstPoint,
		extend.secondPoint,
		x,
		z
	)
	local width = extendGeometry.ClampStripWidth(
		extend.firstPoint,
		extend.secondPoint,
		requestedWidth,
		mapWidth,
		mapHeight,
		maxAreaSize
	)
	if width == extend.width then
		return true
	end

	extend.width = width
	extend.stripPoints = {}
	extend.stripPointMap = {}
	if width ~= 0 then
		local stripPoints = extendGeometry.BuildStripPoints(
			extend.firstPoint,
			extend.secondPoint,
			width,
			mapWidth,
			mapHeight,
			maxAreaSize
		)
		if not stripPoints then
			extend.width = 0
			extend.meshDirty = true
			return false
		end
		extend.stripPoints = stripPoints
		for i = 1, #stripPoints do
			local stripPoint = stripPoints[i]
			stripPoint.groundHeight = spGetGroundHeight(stripPoint.x, stripPoint.z)
			stripPoint.targetHeight = extendGeometry.InterpolateProfile(
				extend.profile,
				stripPoint.ratio
			)
			if not extend.stripPointMap[stripPoint.x] then
				extend.stripPointMap[stripPoint.x] = {}
			end
			extend.stripPointMap[stripPoint.x][stripPoint.z] = stripPoint
		end
	end
	extend.meshDirty = true
	return true
end


local function stopCommand()
	drawingRectangle = false
	drawingRamp = false
	smoothCircle.active = false
	smoothCircle.polygon = {}
	smoothCircle.outline = {}
	setHeight = false
	modifierHeightSelection = false
	initialHeightSnapped = false
	extend.Reset()
	clearLineMeshes()
	volumeSelection = 0
	points = 0
	loop = 0
	rectangleStartMouseX = nil
	rectangleStartMouseY = nil
	rectangleEndX = nil
	rectangleEndZ = nil
	rectangleDragged = false
	rectangleAwaitingSecondClick = false
	terraform_type = 0
end

local function completelyStopCommand()
	spSetActiveCommand(-1)
	originalCommandGiven = false
	drawingRectangle = false
	smoothCircle.active = false
	smoothCircle.polygon = {}
	smoothCircle.outline = {}
	setHeight = false
	modifierHeightSelection = false
	initialHeightSnapped = false
	extend.Reset()
	clearLineMeshes()
	drawingRamp = false
	volumeSelection = 0
	points = 0
	loop = 0
	rectangleStartMouseX = nil
	rectangleStartMouseY = nil
	rectangleEndX = nil
	rectangleEndZ = nil
	rectangleDragged = false
	rectangleAwaitingSecondClick = false
	terraform_type = 0
end

local function SendCommand()
	local selectedUnits = spGetSelectedUnits()
	local terraformers = {}
	for i = 1, #selectedUnits do
		local unitDefID = spGetUnitDefID(selectedUnits[i])
		if unitDefID and terraformerDefs[unitDefID] then
			terraformers[#terraformers + 1] = selectedUnits[i]
		end
	end

	if terraform_type == 2 then
		if #terraformers == 0 then
			return false
		end
		local parameterCount = 11 + #extend.profile + #terraformers
		if parameterCount > extendGeometry.MAX_COMMAND_PARAMS then
			Spring.Echo("Terraform Command Too Large")
			return false
		end

		local params = {
			terraform_type,
			team,
			0,
			extend.width,
			#extend.profile,
			#terraformers,
			0,
		}
		local parameterIndex = 8
		params[parameterIndex] = extend.firstPoint.x
		params[parameterIndex + 1] = extend.firstPoint.z
		params[parameterIndex + 2] = extend.secondPoint.x
		params[parameterIndex + 3] = extend.secondPoint.z
		parameterIndex = parameterIndex + 4
		for i = 1, #extend.profile do
			params[parameterIndex] = extend.profile[i]
			parameterIndex = parameterIndex + 1
		end
		for i = 1, #terraformers do
			params[parameterIndex] = terraformers[i]
			parameterIndex = parameterIndex + 1
		end

		local _, _, _, shift = spGetModKeyState()
		if shift then
			spGiveOrderToUnit(terraformers[1], CMD_TERRAFORM_INTERNAL, params, {"shift"})
			originalCommandGiven = true
		else
			spGiveOrderToUnit(terraformers[1], CMD_TERRAFORM_INTERNAL, params, {})
			spSetActiveCommand(-1)
			originalCommandGiven = false
		end
		points = 0
		return true
	end

	if terraform_type == 4 then
		if (#terraformers > 0) then 
			local params = {}
			params[1] = terraform_type -- 1 = level, 3 = smooth, 4 = ramp
			params[2] = team -- teamID of the team doing the terraform
			params[3] = loop -- true or false
			params[4] = fixedRampWidth
			params[5] = points -- number of selected points (2 for ramp)
			params[6] = #terraformers
			params[7] = volumeSelection -- 0 = none, 1 = only raise, 2 = only lower
			local i = 8
			for j = 1, points do
				params[i] = point[j].x
				params[i + 1] = point[j].y
				params[i + 2] = point[j].z
				i = i + 3
			end
					
			for j = 1, #terraformers do
				params[i] = terraformers[j]
				i = i + 1
			end
			
			local a,c,m,s = spGetModKeyState()
			
			if s then
				Spring.GiveOrderToUnit(terraformers[1], CMD_TERRAFORM_INTERNAL, params, {"shift"})
				originalCommandGiven = true
			else
				Spring.GiveOrderToUnit(terraformers[1], CMD_TERRAFORM_INTERNAL, params, {})
				spSetActiveCommand(-1)
				originalCommandGiven = false
			end
		end
	else
		if (#terraformers > 0) then 
			local params = {}
			params[1] = terraform_type
			params[2] = team
			params[3] = loop
			params[4] = terraformHeight 
			params[5] = points
			params[6] = #terraformers
			params[7] = volumeSelection
			local i = 8
			for j = 1, points do
				params[i] = point[j].x
				params[i + 1] = point[j].z
				i = i + 2
			end
			
			for j = 1, #terraformers do
				params[i] = terraformers[j]
				i = i + 1
			end
			
			local a,c,m,s = spGetModKeyState()
			
			if s then
				Spring.GiveOrderToUnit(terraformers[1], CMD_TERRAFORM_INTERNAL, params, {"shift"})
				originalCommandGiven = true
			else
				Spring.GiveOrderToUnit(terraformers[1], CMD_TERRAFORM_INTERNAL, params, {})
				spSetActiveCommand(-1)
				originalCommandGiven = false
			end
		end
	end
	points = 0
	return true
end

---------------

local function rebuildVolumeMesh()
	local data = {}

	for i = 1, drawPoints do
		local drawCell = drawPoint[i]
		for lx = 0, 12, 4 do
			for lz = 0, 12, 4 do
				addLine(
					data,
					drawCell.x + lx, drawCell.ytl, drawCell.z + lz,
					drawCell.x + lx, drawCell.ytl, drawCell.z + lz,
					posVolume,
					2, 3, drawCell.ytl
				)
			end
		end
	end

	return uploadLineMesh(volumeMesh, data)
end

local function rebuildGroundGridMesh()
	local data = {}

	for i = 1, drawPoints do
		local drawCell = drawPoint[i]
		addLine(
			data,
			drawCell.x, drawCell.ytl, drawCell.z,
			drawCell.x + Grid, drawCell.ytr, drawCell.z,
			groundGridColor
		)
		addLine(
			data,
			drawCell.x, drawCell.ytl, drawCell.z,
			drawCell.x, drawCell.ybl, drawCell.z + Grid,
			groundGridColor
		)

		if drawCell.Right then
			addLine(
				data,
				drawCell.x + Grid, drawCell.ytr, drawCell.z,
				drawCell.x + Grid, drawCell.ybr, drawCell.z + Grid,
				groundGridColor
			)
		end
		if drawCell.Bottom then
			addLine(
				data,
				drawCell.x, drawCell.ybl, drawCell.z + Grid,
				drawCell.x + Grid, drawCell.ybr, drawCell.z + Grid,
				groundGridColor
			)
		end
	end

	return uploadLineMesh(groundGridMesh, data)
end

local function rebuildMouseGridMesh()
	local data = {}

	for i = 1, drawPoints do
		local drawCell = drawPoint[i]
		addLine(
			data,
			drawCell.x, terraformHeight, drawCell.z,
			drawCell.x + Grid, terraformHeight, drawCell.z,
			groundGridColor,
			1, 1
		)
		addLine(
			data,
			drawCell.x, terraformHeight, drawCell.z,
			drawCell.x, terraformHeight, drawCell.z + Grid,
			groundGridColor,
			1, 1
		)

		if drawCell.Right then
			addLine(
				data,
				drawCell.x + Grid, terraformHeight, drawCell.z,
				drawCell.x + Grid, terraformHeight, drawCell.z + Grid,
				groundGridColor,
				1, 1
			)
		end
		if drawCell.Bottom then
			addLine(
				data,
				drawCell.x, terraformHeight, drawCell.z + Grid,
				drawCell.x + Grid, terraformHeight, drawCell.z + Grid,
				groundGridColor,
				1, 1
			)
		end
	end

	return uploadLineMesh(mouseGridMesh, data)
end

local function calculateAreaPoints(mPoint, mPoints)
	local border = {left = Game.mapSizeX, right = 0, top = Game.mapSizeZ, bottom = 0}
	
	local gPoint = {}
	local gPoints = 1
	
	mPoints = mPoints + 1
	mPoint[mPoints] = mPoint[1]
	
	mPoint[1].x = floor((mPoint[1].x)/16)*16
	mPoint[1].z = floor((mPoint[1].z)/16)*16
	
	gPoint[1] = {x = floor((mPoint[1].x)/16)*16, z = floor((mPoint[1].z)/16)*16}
	
	if gPoint[gPoints].x < border.left then
		border.left = gPoint[gPoints].x 
	end
	if gPoint[gPoints].x > border.right then
		border.right = gPoint[gPoints].x 
	end
	if gPoint[gPoints].z < border.top then
		border.top = gPoint[gPoints].z
	end
	if gPoint[gPoints].z > border.bottom then
		border.bottom = gPoint[gPoints].z 
	end
	
	for i = 2, mPoints, 1 do
		mPoint[i].x = floor((mPoint[i].x)/16)*16
		mPoint[i].z = floor((mPoint[i].z)/16)*16
		
		local diffX = mPoint[i].x - mPoint[i-1].x
		local diffZ = mPoint[i].z - mPoint[i-1].z
		local a_diffX = abs(diffX)
		local a_diffZ = abs(diffZ)
			
		if a_diffX <= 16 and a_diffZ <= 16 then
			gPoints = gPoints + 1
			gPoint[gPoints] = {x = mPoint[i].x, z = mPoint[i].z}
			if gPoint[gPoints].x < border.left then
				border.left = gPoint[gPoints].x 
			end
			if gPoint[gPoints].x > border.right then
				border.right = gPoint[gPoints].x 
			end
			if gPoint[gPoints].z < border.top then
				border.top = gPoint[gPoints].z
			end
			if gPoint[gPoints].z > border.bottom then
				border.bottom = gPoint[gPoints].z 
			end
		else

			-- prevent holes inbetween points
			if a_diffX > a_diffZ then
				local m = diffZ/diffX
				local sign = diffX/a_diffX
				for j = 0, a_diffX, 16 do	
					gPoints = gPoints + 1
					gPoint[gPoints] = {x = mPoint[i-1].x + j*sign, z = floor((mPoint[i-1].z + j*m*sign)/16)*16}
					if gPoint[gPoints].x < border.left then
						border.left = gPoint[gPoints].x 
					end
					if gPoint[gPoints].x > border.right then
						border.right = gPoint[gPoints].x 
					end
					if gPoint[gPoints].z < border.top then
						border.top = gPoint[gPoints].z
					end
					if gPoint[gPoints].z > border.bottom then
						border.bottom = gPoint[gPoints].z 
					end
				end
			else
				local m = diffX/diffZ
				local sign = diffZ/a_diffZ
				for j = 0, a_diffZ, 16 do	
					gPoints = gPoints + 1
					gPoint[gPoints] = {x = floor((mPoint[i-1].x + j*m*sign)/16)*16, z = mPoint[i-1].z + j*sign}
					if gPoint[gPoints].x < border.left then
						border.left = gPoint[gPoints].x 
					end
					if gPoint[gPoints].x > border.right then
						border.right = gPoint[gPoints].x 
					end
					if gPoint[gPoints].z < border.top then
						border.top = gPoint[gPoints].z
					end
					if gPoint[gPoints].z > border.bottom then
						border.bottom = gPoint[gPoints].z 
					end
				end
			end
			
		end
	end
	
	if border.right-border.left + generatedAreaPadding > maxAreaSize
			or border.bottom-border.top + generatedAreaPadding > maxAreaSize then
		Spring.Echo("Terraform Command Too Large")
		stopCommand()
		return
	end
	
	local area = {}
	
	for i = border.left-32,border.right+32,16 do
		area[i] = {}
	end
	
	for i = 1, gPoints do
		area[gPoint[i].x][gPoint[i].z] = 2
	end
	
	for i = border.left,border.right,16 do
		for j = border.top,border.bottom,16 do
			if area[i][j] ~= 2 then
				area[i][j] = 1
			end
		end
	end
	
	for i = border.left,border.right,16 do
		if area[i][border.top] ~= 2 then
			area[i][border.top] = -1
		end
		if area[i][border.bottom] ~= 2 then
			area[i][border.bottom] = -1
		end
	end
	for i = border.top,border.bottom,16 do
		if area[border.left][i] ~= 2 then
			area[border.left][i] = -1
		end
		if area[border.right][i] ~= 2 then
			area[border.right][i] = -1
		end
	end
	
	local continue = true

	while continue do
		continue = false
		for i = border.left,border.right,16 do
			for j = border.top,border.bottom,16 do
				if area[i][j] == -1 then
					if area[i+16][j] == 1 then
						area[i+16][j] = -1
						continue = true
					end
					if area[i-16][j]  == 1 then
						area[i-16][j]  = -1
						continue = true
					end
					if area[i][j+16] == 1 then
						area[i][j+16] = -1
						continue = true
					end
					if area[i][j-16] == 1 then
						area[i][j-16] = -1
						continue = true
					end
					area[i][j] = false
				end
			end
		end
		
	end
	
	drawPoint = {}
	drawPoints = 0
	
	for i = border.left, border.right, 16 do
		for j = border.top, border.bottom, 16 do
			if area[i][j] then
				drawPoints = drawPoints + 1
				drawPoint[drawPoints] = {x = i,z = j, 
					ytl = spGetGroundHeight(i,j), 
					ytr = spGetGroundHeight(i+16,j),
					ybl = spGetGroundHeight(i,j+16), 
					ybr = spGetGroundHeight(i+16,j+16),
				}
			end
		end
	end
	
	for i = 1, drawPoints do
		
		if not area[drawPoint[i].x+16][drawPoint[i].z] then
			drawPoint[i].Right = true
		end
		if not area[drawPoint[i].x][drawPoint[i].z+16] then
			drawPoint[i].Bottom = true
		end
		
	end
	
end

--------------------------------------------------------------------------------
-- Mouse/keyboard Callins
--------------------------------------------------------------------------------

local function legalPos(pos)
	return pos and pos[1] > 0 and pos[3] > 0 and pos[1] < Game.mapSizeX and pos[3] < Game.mapSizeZ
end

local function clipPolygonToBoundary(vertices, axis, limit, keepGreater)
	if #vertices == 0 then
		return vertices
	end

	local function isInside(vertex)
		if keepGreater then
			return vertex[axis] >= limit
		end
		return vertex[axis] <= limit
	end

	local output = {}
	local previous = vertices[#vertices]
	local previousInside = isInside(previous)

	for i = 1, #vertices do
		local current = vertices[i]
		local currentInside = isInside(current)
		if currentInside ~= previousInside then
			local axisDistance = current[axis] - previous[axis]
			local factor = axisDistance ~= 0
				and (limit - previous[axis]) / axisDistance
				or 0
			local intersection = {
				x = previous.x + (current.x - previous.x) * factor,
				z = previous.z + (current.z - previous.z) * factor,
			}
			intersection[axis] = limit
			output[#output + 1] = intersection
		end
		if currentInside then
			output[#output + 1] = current
		end
		previous = current
		previousInside = currentInside
	end

	return output
end

local function buildSmoothCirclePolygon(centerX, centerZ, radius)
	local segmentCount = math.max(16, ceil(2 * math.pi * radius / Grid))
	local vertices = {}
	for i = 0, segmentCount - 1 do
		local angle = 2 * math.pi * i / segmentCount
		vertices[#vertices + 1] = {
			x = centerX + math.cos(angle) * radius,
			z = centerZ + math.sin(angle) * radius,
		}
	end

	vertices = clipPolygonToBoundary(vertices, "x", 0, true)
	vertices = clipPolygonToBoundary(vertices, "x", mapWidth, false)
	vertices = clipPolygonToBoundary(vertices, "z", 0, true)
	vertices = clipPolygonToBoundary(vertices, "z", mapHeight, false)

	local snapped = {}
	for i = 1, #vertices do
		local x = floor(vertices[i].x / Grid + 0.5) * Grid
		local z = floor(vertices[i].z / Grid + 0.5) * Grid
		x = math.max(0, math.min(mapWidth, x))
		z = math.max(0, math.min(mapHeight, z))
		local previous = snapped[#snapped]
		if not previous or previous.x ~= x or previous.z ~= z then
			snapped[#snapped + 1] = {x = x, z = z}
		end
	end

	if #snapped > 1 then
		local first = snapped[1]
		local last = snapped[#snapped]
		if first.x == last.x and first.z == last.z then
			snapped[#snapped] = nil
		end
	end

	return snapped
end

local function rebuildSmoothCircleOutline()
	local cells = {}
	local selectedCells = {}
	for i = 1, drawPoints do
		local cell = drawPoint[i]
		if cell.x >= 0 and cell.x < mapWidth
				and cell.z >= 0 and cell.z < mapHeight then
			if not cells[cell.x] then
				cells[cell.x] = {}
			end
			cells[cell.x][cell.z] = true
			selectedCells[#selectedCells + 1] = cell
		end
	end

	local function hasCell(x, z)
		return cells[x] and cells[x][z]
	end

	local outline = {}
	local function addEdge(x1, z1, x2, z2)
		outline[#outline + 1] = {x1 = x1, z1 = z1, x2 = x2, z2 = z2}
	end

	for i = 1, #selectedCells do
		local cell = selectedCells[i]
		if not hasCell(cell.x, cell.z - Grid) then
			addEdge(cell.x, cell.z, cell.x + Grid, cell.z)
		end
		if not hasCell(cell.x + Grid, cell.z) then
			addEdge(cell.x + Grid, cell.z, cell.x + Grid, cell.z + Grid)
		end
		if not hasCell(cell.x, cell.z + Grid) then
			addEdge(cell.x + Grid, cell.z + Grid, cell.x, cell.z + Grid)
		end
		if not hasCell(cell.x - Grid, cell.z) then
			addEdge(cell.x, cell.z + Grid, cell.x, cell.z)
		end
	end

	smoothCircle.outline = outline
end

local function updateSmoothCircle(mx, my)
	if spIsAboveMiniMap(mx, my) then
		return false
	end

	local _, pos = spTraceScreenRay(mx, my, true)
	if not legalPos(pos) then
		return false
	end

	local dx = pos[1] - smoothCircle.centerX
	local dz = pos[3] - smoothCircle.centerZ
	local radius = floor(sqrt(dx * dx + dz * dz) / Grid + 0.5) * Grid
	radius = math.max(minSmoothRadius, math.min(maxSmoothRadius, radius))
	if radius ~= smoothCircle.radius or #smoothCircle.polygon == 0 then
		smoothCircle.radius = radius
		smoothCircle.polygon = buildSmoothCirclePolygon(
			smoothCircle.centerX,
			smoothCircle.centerZ,
			radius
		)
		local previewPolygon = {}
		for i = 1, #smoothCircle.polygon do
			previewPolygon[i] = {
				x = smoothCircle.polygon[i].x,
				z = smoothCircle.polygon[i].z,
			}
		end
		calculateAreaPoints(previewPolygon, #previewPolygon)
		if smoothCircle.active then
			rebuildSmoothCircleOutline()
		end
	end
	return #smoothCircle.polygon >= 3
end

local function confirmSmoothCircle()
	if #smoothCircle.polygon < 3 then
		return false
	end

	point = {}
	for i = 1, #smoothCircle.polygon do
		point[i] = {
			x = smoothCircle.polygon[i].x,
			z = smoothCircle.polygon[i].z,
		}
	end
	points = #point
	loop = 1
	terraformHeight = 0
	volumeSelection = 0
	calculateAreaPoints(point, points)
	if points == 0 then
		return false
	end

	SendCommand()
	stopCommand()
	return true
end


local function snapToHeight(heightArray, snapHeight, arrayCount)
	local smallest = abs(heightArray[1] - snapHeight)
	local smallestIndex = 1
	for i=2, arrayCount do
		local diff = abs(heightArray[i] - snapHeight)
		if diff < smallest then
			smallest = diff
			smallestIndex = i
		end
	end
	return smallestIndex
end

local function updateRampEndpoint(mx, my)
	local _, pos = spTraceScreenRay(mx, my, true)
	if not legalPos(pos) then
		return false
	end

	local diffX = pos[1] - point[1].x
	local diffZ = pos[3] - point[1].z
	local distance = sqrt(diffX * diffX + diffZ * diffZ)
	if distance <= 0.0001 then
		return false
	end

	local rampLength = distance
	if rampLength < minRampLength then
		rampLength = minRampLength
	elseif rampLength > maxRampLength then
		rampLength = maxRampLength
	end

	local endX = point[1].x + rampLength * diffX / distance
	local endZ = point[1].z + rampLength * diffZ / distance
	local endGroundHeight = spGetGroundHeight(endX, endZ)
	local endHeight = clampTerraformHeight(endGroundHeight)
	local maxHeightDifference = rampLength * maxRampGradient
	local heightDifference = endHeight - point[1].y
	if heightDifference > maxHeightDifference then
		endHeight = point[1].y + maxHeightDifference
	elseif heightDifference < -maxHeightDifference then
		endHeight = point[1].y - maxHeightDifference
	end
	point[2] = {
		x = endX,
		y = endHeight,
		z = endZ,
		ground = endGroundHeight,
	}
	return true
end

local function updateRectangleEndpoint(mx, my)
	local _, pos = spTraceScreenRay(mx, my, true)
	if not legalPos(pos) then
		return false
	end

	local x = floor((pos[1])/16)*16
	local z = floor((pos[3])/16)*16
	x = math.max(point[1].x - maxRectangleSpan, math.min(point[1].x + maxRectangleSpan, x))
	z = math.max(point[1].z - maxRectangleSpan, math.min(point[1].z + maxRectangleSpan, z))
	if x == point[1].x then
		x = x + 16 <= mapWidth and x + 16 or x - 16
	end
	if z == point[1].z then
		z = z + 16 <= mapHeight and z + 16 or z - 16
	end
	rectangleEndX = x
	rectangleEndZ = z

	point[2].x = math.min(math.max(point[1].x, x) + generatedAreaPadding, mapWidth)
	point[3].x = math.min(point[1].x, x)
	point[2].z = math.min(math.max(point[1].z, z) + generatedAreaPadding, mapHeight)
	point[3].z = math.min(point[1].z, z)

	return true
end

function widget:MousePress(mx, my, button)
	if extend.phase == "line" then
		if button == 1 then
			local _, pos = spTraceScreenRay(mx, my, true)
			if legalPos(pos) then
				extend.UpdateLine(pos[1], pos[3])
				local finished, errorReason = extend.FinishLine()
				if not finished then
					if errorReason == "too_large" then
						Spring.Echo("Terraform Command Too Large")
					elseif errorReason == "height" then
						Spring.Echo("Terraform rejected: the terrain profile exceeds the height limit.")
					else
						Spring.Echo("Terraform line is too short")
					end
					completelyStopCommand()
				end
			end
			return true
		elseif button == 3 then
			completelyStopCommand()
			return true
		end
		return true
	elseif extend.phase == "width" then
		if button == 1 then
			local _, pos = spTraceScreenRay(mx, my, true)
			if legalPos(pos) then
				extend.UpdateWidth(pos[1], pos[3])
			end
			if extend.width == 0 then
				Spring.Echo("Terraform strip is too narrow")
			elseif SendCommand() then
				stopCommand()
			else
				completelyStopCommand()
			end
			return true
		end
		if button == 3 then
			completelyStopCommand()
		end
		return true
	end

	if smoothCircle.active then
		if button == 1 then
			if updateSmoothCircle(mx, my) then
				confirmSmoothCircle()
			end
			return true
		elseif button == 3 then
			completelyStopCommand()
			return true
		end
	end

	if drawingRectangle then
		if button == 1 then
			updateRectangleEndpoint(mx, my)
			return true
		elseif button == 3 then
			completelyStopCommand()
			return true
		end
	end

	local toolTip = Spring.GetCurrentTooltip()
	if not (toolTip == "" or st_find(toolTip, "TechLevel") or st_find(toolTip, "Terrain type") or st_find(toolTip, "Metal:")) then
		return false
	end

	local activeCmdIndex, activeid = spGetActiveCommand()
	
	if activeid == CMD_EXTEND
			and extend.phase == "idle"
			and not (setHeight or drawingRectangle or drawingRamp or smoothCircle.active) then
		if button == 1 then
			if not spIsAboveMiniMap(mx, my) then
				local _, pos = spTraceScreenRay(mx, my, true)
				if legalPos(pos) then
					widgetHandler:UpdateWidgetCallIn("DrawWorld", self)
					extend.Reset()
					extend.StartLine(pos[1], pos[3])
					terraform_type = 2
					terraformHeight = 0
					volumeSelection = 0
					loop = 0
					return true
				end
			end
		else
			spSetActiveCommand(-1)
			originalCommandGiven = false
			return true
		end

	elseif activeid == CMD_SMOOTH
			and not (setHeight or drawingRectangle or drawingRamp or smoothCircle.active) then
		if button == 1 then
			if not spIsAboveMiniMap(mx, my) then
				local _, pos = spTraceScreenRay(mx, my, true)
				if legalPos(pos) then
					widgetHandler:UpdateWidgetCallIn("DrawWorld", self)
					smoothCircle.active = true
					smoothCircle.centerX = floor(pos[1] / Grid) * Grid
					smoothCircle.centerZ = floor(pos[3] / Grid) * Grid
					smoothCircle.radius = minSmoothRadius
					terraform_type = 3
					terraformHeight = 0
					volumeSelection = 0
					loop = 1
					points = 0
					updateSmoothCircle(mx, my)
					return true
				end
			end
		else
			spSetActiveCommand(-1)
			originalCommandGiven = false
			return true
		end

	elseif ((activeid == CMD_LEVEL) or (activeid == CMD_RESTORE))
			and not (setHeight or drawingRectangle or drawingRamp or smoothCircle.active) then
	
		if button == 1 then
			if not spIsAboveMiniMap(mx, my) then
		
				local _, pos = spTraceScreenRay(mx, my, true)
				if legalPos(pos) then	
					widgetHandler:UpdateWidgetCallIn("DrawWorld", self)
					orHeight = spGetGroundHeight(pos[1],pos[3])
					drawingRectangle = true
					rectangleStartMouseX = mx
					rectangleStartMouseY = my
					rectangleEndX = nil
					rectangleEndZ = nil
					rectangleDragged = false
					rectangleAwaitingSecondClick = false
					points = 3
					point[1] = {x = floor((pos[1])/16)*16, y = orHeight, z = floor((pos[3])/16)*16}
					point[2] = {x = point[1].x, y = orHeight, z = point[1].z}
					point[3] = {x = point[1].x, y = orHeight, z = point[1].z}
					
					if (activeid == CMD_LEVEL) then
						terraform_type = 1
						terraformHeight = clampTerraformHeight(point[1].y)
						storedHeight = terraformHeight
					elseif (activeid == CMD_RESTORE) then
						terraform_type = 5
						terraformHeight = 0
						storedHeight = 0
					end
					
					return true
				end
			end
		else
			spSetActiveCommand(-1)
			originalCommandGiven = false
			return true
		end
		
	elseif (activeid == CMD_RAMP)
			and not (setHeight or drawingRectangle or drawingRamp or smoothCircle.active) then
		if button == 1 then
			if not spIsAboveMiniMap(mx, my) then
		
				local _, pos = spTraceScreenRay(mx, my, true)
				if legalPos(pos) then	
				
					widgetHandler:UpdateWidgetCallIn("DrawWorld", self)
					orHeight = spGetGroundHeight(pos[1],pos[3])
					
					local startHeight = clampTerraformHeight(orHeight)
					point[1] = {x = pos[1], y = startHeight, z = pos[3], ground = orHeight}
					point[2] = {x = pos[1], y = startHeight, z = pos[3], ground = orHeight}
					points = 2
					drawingRamp = 1
					terraform_type = 4
					loop = 0
					return true
					
				end
			end
		end
		
	end
	
	if setHeight and button == 1 then
		
		SendCommand()
		stopCommand()
		return true
	end
	
	if drawingRamp == 2 and button == 1 then
		if updateRampEndpoint(mx, my) then
			SendCommand()
			stopCommand()
		end
		return true
	end
	
	if setHeight or drawingRamp or drawingRectangle or smoothCircle.active
			or extend.phase ~= "idle" then
		if button == 3 then
			completelyStopCommand()
			return true
		end
	end
	
	return false
end

function widget:MouseMove(mx, my, dx, dy, button)
	if extend.phase ~= "idle" then
		return true
	end

	if smoothCircle.active then
		updateSmoothCircle(mx, my)
		return true
	elseif drawingRectangle then
		if not rectangleAwaitingSecondClick and button == 1
				and rectangleStartMouseX and rectangleStartMouseY
				and (abs(mx - rectangleStartMouseX) >= rectangleDragThreshold
					or abs(my - rectangleStartMouseY) >= rectangleDragThreshold) then
			rectangleDragged = true
		end
		updateRectangleEndpoint(mx, my)
		
		return true
		
	elseif drawingRamp then
		return true
	
	end
	
	return false
end

function widget:Update(n)

	if extend.phase == "line" or extend.phase == "width" then
		local mx, my = Spring.GetMouseState()
		local _, pos = spTraceScreenRay(mx, my, true)
		if legalPos(pos) then
			if extend.phase == "line" then
				extend.UpdateLine(pos[1], pos[3])
			else
				extend.UpdateWidth(pos[1], pos[3])
			end
		end
	elseif smoothCircle.active then
		local mx, my = Spring.GetMouseState()
		updateSmoothCircle(mx, my)
	elseif drawingRectangle and rectangleAwaitingSecondClick then
		local mx, my = Spring.GetMouseState()
		updateRectangleEndpoint(mx, my)
	elseif setHeight then
		local mx,my = Spring.GetMouseState()
		local a,c = spGetModKeyState()
		if c then
			initialHeightSnapped = false
			local _, pos = spTraceScreenRay(mx, my, true)
			if legalPos(pos) then	
				terraformHeight = clampTerraformHeight(spGetGroundHeight(pos[1],pos[3]))
				storedHeight = terraformHeight
				mouseX = mx
				mouseY = my
			end
			modifierHeightSelection = true
		elseif a then
			initialHeightSnapped = false
			Spring.WarpMouse (mouseX,mouseY)
			storedHeight = storedHeight + (my-mouseY)*mouseSensitivity
			local heightArray = {
				-2,
				orHeight,
				-23,
			}
			terraformHeight = clampTerraformHeight(heightArray[snapToHeight(heightArray,storedHeight,3)])
			modifierHeightSelection = true
		else
			Spring.WarpMouse (mouseX,mouseY)
			if modifierHeightSelection then
				storedHeight = terraformHeight
				modifierHeightSelection = false
			end
			storedHeight = clampTerraformHeight(storedHeight + (my-mouseY)*mouseSensitivity)
			local initialHeight = clampTerraformHeight(orHeight)
			if abs(storedHeight - initialHeight) <= initialHeightSnapRange then
				terraformHeight = initialHeight
				initialHeightSnapped = true
			else
				terraformHeight = storedHeight
				initialHeightSnapped = false
			end
		end
	
	elseif drawingRamp == 2 then
		local mx,my = Spring.GetMouseState()
		updateRampEndpoint(mx, my)
	end

end

function widget:MouseRelease(mx, my, button)
	if extend.phase ~= "idle" then
		return true
	end

	if smoothCircle.active and button == 1 then
		return true
	elseif drawingRectangle then
	
		if button == 1 then
			updateRectangleEndpoint(mx, my)
			if not rectangleAwaitingSecondClick then
				if rectangleStartMouseX and rectangleStartMouseY
						and (abs(mx - rectangleStartMouseX) >= rectangleDragThreshold
							or abs(my - rectangleStartMouseY) >= rectangleDragThreshold) then
					rectangleDragged = true
				end
				if not rectangleDragged then
					rectangleAwaitingSecondClick = true
					return true
				end
			end

			rectangleStartMouseX = nil
			rectangleStartMouseY = nil
			rectangleDragged = false
			rectangleAwaitingSecondClick = false
			--spSetActiveCommand(-1)
			
			if terraform_type == 1 then
				setHeight = true
				modifierHeightSelection = false
				initialHeightSnapped = true
				drawingRectangle = false
				mouseX = mx
				mouseY = my
				
				local x = rectangleEndX
					or (point[1].x + 16 <= mapWidth and point[1].x + 16 or point[1].x - 16)
				local z = rectangleEndZ
					or (point[1].z + 16 <= mapHeight and point[1].z + 16 or point[1].z - 16)
				
				points = 5
				point[2] = {x = point[1].x, z = z}
				point[3] = {x = x, z = z}
				point[4] = {x = x, z = point[1].z}
				point[5] = {x = point[1].x, z = point[1].z}
				loop = 1
				calculateAreaPoints(point,points)
				rebuildGroundGridMesh()
				rebuildVolumeMesh()
				rebuildMouseGridMesh()
				
			elseif terraform_type == 5 then
			
				local x = rectangleEndX
					or (point[1].x + 16 <= mapWidth and point[1].x + 16 or point[1].x - 16)
				local z = rectangleEndZ
					or (point[1].z + 16 <= mapHeight and point[1].z + 16 or point[1].z - 16)
						
				points = 5
				point[2] = {x = point[1].x, z = z}
				point[3] = {x = x, z = z}
				point[4] = {x = x, z = point[1].z}
				point[5] = {x = point[1].x, z = point[1].z}
				loop = 1
				calculateAreaPoints(point,points)

				if points ~= 0 then
					SendCommand()
				end
				stopCommand()
				
			end
			
			return true
		elseif button == 4 or button == 5 then
			stopCommand()
		else
			return true
		end
	
	elseif drawingRamp == 1 then
	
		if button == 1 then
			--spSetActiveCommand(-1)
			drawingRamp = 2
			return true
		elseif button == 4 or button == 5 then
			drawingRamp = false
			points = 0
		else
			return true
		end
	
	end
	return false
end

function widget:KeyRelease(key)
	if (key == KEYSYMS.LSHIFT or key == KEYSYMS.RSHIFT) and originalCommandGiven then
		completelyStopCommand()
	end
end

function widget:KeyPress(key)
	
	if key == KEYSYMS.ESCAPE then
		if setHeight or drawingRamp or drawingRectangle or smoothCircle.active
				or extend.phase ~= "idle" then
			completelyStopCommand()
			return true
		end
	end

	if key == KEYSYMS.SPACE and ( 
		(terraform_type == 1 and setHeight) or 
		(terraform_type == 4 and drawingRamp)
	) then
		volumeSelection = volumeSelection+1
		if volumeSelection > 2 then
			volumeSelection = 0
		end
		return true
	end
end

--------------------------------------------------------------------------------
-- Drawing
--------------------------------------------------------------------------------

local function rebuildTransientMesh()
	local data = {}

	if terraform_type == 2 then
		if extend.phase == "line" then
			local profile = extendGeometry.SampleProfile(
				extend.firstPoint,
				extend.secondPoint,
				spGetGroundHeight
			)
			local vertices = {}
			if profile then
				for i = 1, #profile do
					local ratio = (i - 1) / (#profile - 1)
					vertices[i] = {
						extend.firstPoint.x
							+ (extend.secondPoint.x - extend.firstPoint.x) * ratio,
						profile[i] + 2,
						extend.firstPoint.z
							+ (extend.secondPoint.z - extend.firstPoint.z) * ratio,
					}
				end
			else
				vertices[1] = {
					extend.firstPoint.x,
					spGetGroundHeight(extend.firstPoint.x, extend.firstPoint.z) + 2,
					extend.firstPoint.z,
				}
			end
			addLineStrip(data, vertices, selectionColor)
		elseif extend.phase == "width" then
			local profileVertices = {}
			for i = 1, #extend.profile do
				local ratio = (i - 1) / (#extend.profile - 1)
				profileVertices[i] = {
					extend.firstPoint.x
						+ (extend.secondPoint.x - extend.firstPoint.x) * ratio,
					extend.profile[i] + 2,
					extend.firstPoint.z
						+ (extend.secondPoint.z - extend.firstPoint.z) * ratio,
				}
			end
			addLineStrip(data, profileVertices, selectionColor)

			local gridSize = extendGeometry.GRID_SIZE
			for i = 1, #extend.stripPoints do
				local stripPoint = extend.stripPoints[i]
				local groundHeight = stripPoint.groundHeight + 2
				local targetHeight = stripPoint.targetHeight + 2
				local targetColor = stripPoint.targetHeight < stripPoint.groundHeight
					and noPathingColor or vehPathingColor
				local xNeighbor = extend.stripPointMap[stripPoint.x + gridSize]
					and extend.stripPointMap[stripPoint.x + gridSize][stripPoint.z]
				local zNeighbor = extend.stripPointMap[stripPoint.x]
					and extend.stripPointMap[stripPoint.x][stripPoint.z + gridSize]

				if xNeighbor then
					addLine(
						data,
						stripPoint.x, targetHeight, stripPoint.z,
						xNeighbor.x, xNeighbor.targetHeight + 2, xNeighbor.z,
						targetColor
					)
				end
				if zNeighbor then
					addLine(
						data,
						stripPoint.x, targetHeight, stripPoint.z,
						zNeighbor.x, zNeighbor.targetHeight + 2, zNeighbor.z,
						targetColor
					)
				end
				if abs(stripPoint.targetHeight - stripPoint.groundHeight) > 0.0001 then
					addLine(
						data,
						stripPoint.x, groundHeight, stripPoint.z,
						stripPoint.x, targetHeight, stripPoint.z,
						targetColor
					)
				end
			end
		end
	elseif terraform_type == 4 then
		local distance = sqrt((point[1].x - point[2].x)^2 + (point[1].z - point[2].z)^2)
		if distance <= 0.0001 then
			addLine(
				data,
				point[1].x, point[1].y, point[1].z,
				point[1].x, point[1].ground, point[1].z,
				vehPathingColor
			)
		else
			local gradient = abs(point[1].y - point[2].y) / distance
			local color
			if gradient <= vehPathingGrad then
				color = vehPathingColor
			elseif gradient <= botPathingGrad then
				color = botPathingColor
			else
				color = noPathingColor
			end

			local halfRampWidth = fixedRampWidth * 0.5
			local perpendicularX = halfRampWidth * (point[1].z - point[2].z) / distance
			local perpendicularZ = -halfRampWidth * (point[1].x - point[2].x) / distance
			local startTopPlus = {point[1].x + perpendicularX, point[1].y, point[1].z + perpendicularZ}
			local startGroundPlus = {point[1].x + perpendicularX, point[1].ground, point[1].z + perpendicularZ}
			local startGroundMinus = {point[1].x - perpendicularX, point[1].ground, point[1].z - perpendicularZ}
			local startTopMinus = {point[1].x - perpendicularX, point[1].y, point[1].z - perpendicularZ}
			local endTopMinus = {point[2].x - perpendicularX, point[2].y, point[2].z - perpendicularZ}
			local endTopPlus = {point[2].x + perpendicularX, point[2].y, point[2].z + perpendicularZ}
			local endGroundMinus = {point[2].x - perpendicularX, point[2].ground, point[2].z - perpendicularZ}
			local endGroundPlus = {point[2].x + perpendicularX, point[2].ground, point[2].z + perpendicularZ}

			addLineStrip(data, {
				startTopPlus,
				startGroundPlus,
				startGroundMinus,
				startTopMinus,
			}, color)
			addLineStrip(data, {
				endTopMinus,
				startTopMinus,
				startTopPlus,
				endTopPlus,
				endTopMinus,
				endGroundMinus,
				endGroundPlus,
				endTopPlus,
			}, color)
		end
	elseif smoothCircle.active then
		for i = 1, #smoothCircle.outline do
			local edge = smoothCircle.outline[i]
			addLine(
				data,
				edge.x1, spGetGroundHeight(edge.x1, edge.z1) + 2, edge.z1,
				edge.x2, spGetGroundHeight(edge.x2, edge.z2) + 2, edge.z2,
				selectionColor
			)
		end
	elseif drawingRectangle then
		addLineStrip(data, {
			{point[3].x, point[1].y, point[3].z},
			{point[3].x, point[1].y, point[2].z},
			{point[2].x, point[1].y, point[2].z},
			{point[2].x, point[1].y, point[3].z},
			{point[3].x, point[1].y, point[3].z},
		}, selectionColor)
	end

	return uploadLineMesh(transientMesh, data)
end

local function drawLineMesh(mesh)
	if mesh.vao and mesh.vertexCount > 0 then
		mesh.vao:DrawArrays(GL_LINES, mesh.vertexCount, 0)
	end
end

local function drawMouseText(y,text)

	local mx,my = Spring.GetMouseState()
	glText(text, mx+40, my+y, 22,"")

end


function widget:DrawWorld()

	if not (setHeight or drawingRectangle or drawingRamp or smoothCircle.active
			or extend.phase ~= "idle") then
		widgetHandler:RemoveWidgetCallIn("DrawWorld", self)
		return
	end

	if not initLineRenderer() then
		return
	end
	if terraform_type == 2 then
		if extend.meshDirty then
			rebuildTransientMesh()
			extend.meshDirty = false
		end
	elseif terraform_type == 4 or drawingRectangle or smoothCircle.active then
		rebuildTransientMesh()
	else
		transientMesh.vertexCount = 0
	end

	local viewSizeX, viewSizeY = spGetViewGeometry()
	if not viewSizeX or not viewSizeY or viewSizeX <= 0 or viewSizeY <= 0 then
		return
	end

	glDepthTest(false)
	glCulling(false)
	glBlending("alpha")

	if glUseShader(lineShader) then
		glUniformMatrix(lineViewProjectionLoc, "viewprojection")
		glUniform(lineViewportSizeLoc, viewSizeX, viewSizeY)
		glUniform(lineWidthLoc, 3.0)
		glUniform(lineTerraformHeightLoc, terraformHeight)
		glUniform(lineVolumeSelectionLoc, volumeSelection)
		glUniform(lineNegativeVolumeColorLoc, negVolume[1], negVolume[2], negVolume[3], negVolume[4])
		glUniform(linePositiveVolumeColorLoc, posVolume[1], posVolume[2], posVolume[3], posVolume[4])

		if terraform_type == 2 or terraform_type == 4
				or drawingRectangle or smoothCircle.active then
			drawLineMesh(transientMesh)
		elseif setHeight then
			drawLineMesh(groundGridMesh)
			drawLineMesh(volumeMesh)
			drawLineMesh(mouseGridMesh)
		end
	end
	glUseShader(0)

	glBlending("reset")
	glCulling(false)
	glDepthTest(false)
end

function widget:DrawScreen()

	if terraform_type == 1 then
		if setHeight then
			local relativeHeight = terraformHeight - orHeight
			local relativeSign = relativeHeight >= 0 and "+" or ""
			drawMouseText(0, string_format("%.0f (%s%.0f rel)", terraformHeight, relativeSign, relativeHeight))
			if initialHeightSnapped then
				drawMouseText(-30, "Snapped to first ground point")
			end
		end
	elseif terraform_type == 2 then
		if extend.phase == "line" then
			drawMouseText(0, "Click the second profile point")
		elseif extend.phase == "width" then
			drawMouseText(0, string_format("Extend width: %.0f", abs(extend.width)))
			drawMouseText(-30, "Click to confirm")
		end
	elseif terraform_type == 4 then
		if drawingRamp == 1 then
			drawMouseText(0,floor(point[1].y))
		elseif drawingRamp == 2 then
			if point[2].y == 0 then
				drawMouseText(0,point[2].y .. " Water Level")
			elseif point[2].y == point[1].y then
				drawMouseText(0,floor(point[2].y) .. " Flat")
			else
				drawMouseText(0,floor(point[2].y))
			end
		end
	end
	
	if terraform_type == 1 or terraform_type == 4 then
		local volumeTextY = initialHeightSnapped and -60 or -30
		if volumeSelection == 1 then
			drawMouseText(volumeTextY,"Only raise")
		elseif volumeSelection == 2 then
			drawMouseText(volumeTextY,"Only lower")
		end
	end

end
--------------------------------------------------------------------------------
-- Spring Callins
--------------------------------------------------------------------------------

function widget:Initialize()
	if not initLineRenderer() then
		Spring.Echo("[Lasso Terraform GUI] Modern line rendering is unavailable; disabling the widget.")
		widgetHandler:RemoveWidget(self)
		return
	end

	if Spring.IsReplay() or Spring.GetGameFrame() > 0 then
		widget:PlayerChanged()
	end
end

function widget:PlayerChanged(playerID)
	if Spring.GetSpectatingState() and Spring.GetGameFrame() > 0 then
		widgetHandler:RemoveWidget(self)
	end
end

function widget:GameStart()
	widget:PlayerChanged()
end

function widget:Shutdown()
	destroyLineRenderer()
end

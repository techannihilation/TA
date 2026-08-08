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

local GL_LINE_STRIP		= GL.LINE_STRIP
local GL_LINES			= GL.LINES
local glVertex			= gl.Vertex
local glLineStipple 	= gl.LineStipple
local glLineWidth   	= gl.LineWidth
local glColor       	= gl.Color
local glBeginEnd    	= gl.BeginEnd
local glPushMatrix		= gl.PushMatrix
local glPopMatrix		= gl.PopMatrix
local glScale			= gl.Scale
local glTranslate		= gl.Translate
local glLoadIdentity	= gl.LoadIdentity
local glCallList        = gl.CallList
local glCreateList      = gl.CreateList
local glDepthTest		= gl.DepthTest
local glBillboard       = gl.Billboard
local glText            = gl.Text

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
local commanderDefs = VFS.Include("luarules/configs/comDefIDs.lua") or {}

-- command IDs
local CMD_RAMP = 39734
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

-- Elmos per vertical mouse pixel while selecting terraform dimensions.
local mouseSensitivity = 2
local rectangleDragThreshold = 4
local minTerraformHeight = -2000
local maxTerraformHeight = 2000
local maxRampGradient = 5

-- max sizes of non-ramp command, reduces slowdown MUST AGREE WITH GADGET VALUES
local maxAreaSize = 1000 -- max width or length
local generatedAreaPadding = Grid
local maxRectangleSpan = floor((maxAreaSize - generatedAreaPadding) / Grid) * Grid

-- Ramp length and half-width limits. The gadget receives twice the half-width.
-- These values MUST AGREE WITH GADGET VALUES.
local maxRampLength = 3000
local maxRampWidth = 800
local minRampLength = 32
local minRampWidth = 12

local startRampWidth = 60

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
local terraform_type = 0 -- 1 = level, 3 = smooth, 4 = ramp, 5 = restore

local volumeSelection = 0

local mouseBuilding = false

local terraformHeight = 0
local orHeight = 0 -- store ground height
local storedHeight = 0 -- for snap to height
local loop = 0

local point = {}
local points = 0

local drawPoint = {}
local drawPoints = 0
--draw list--
local volumeDraw
local groundGridDraw
local mouseGridDraw
----
local mouseX, mouseY
local rectangleStartMouseX, rectangleStartMouseY
local rectangleEndX, rectangleEndZ
local rectangleDragged = false
local rectangleAwaitingSecondClick = false

---------------

local function clampTerraformHeight(height)
	return math.max(minTerraformHeight, math.min(maxTerraformHeight, height))
end


local function stopCommand()
	drawingRectangle = false
	setHeight = false
	if (volumeDraw) then 
		gl.DeleteList(volumeDraw)
		gl.DeleteList(mouseGridDraw)
	end
	if (groundGridDraw) then 
		gl.DeleteList(groundGridDraw)
	end
	volumeDraw = false
	groundGridDraw = false
	mouseGridDraw = false
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
	setHeight = false
	if (volumeDraw) then 
		gl.DeleteList(volumeDraw)
		gl.DeleteList(mouseGridDraw)
	end
	if (groundGridDraw) then 
		gl.DeleteList(groundGridDraw)
	end
	volumeDraw = false
	groundGridDraw = false
	mouseGridDraw = false
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
	local constructor = {}
	for i = 1, #selectedUnits do
		local unitDefID = spGetUnitDefID(selectedUnits[i])
		if unitDefID and commanderDefs[unitDefID] then
			constructor[#constructor + 1] = selectedUnits[i]
		end
	end

	if terraform_type == 4 then
		if (#constructor > 0) then 
			local params = {}
			params[1] = terraform_type -- 1 = level, 3 = smooth, 4 = ramp
			params[2] = team -- teamID of the team doing the terraform
			params[3] = loop -- true or false
			params[4] = terraformHeight -- width of the ramp
			params[5] = points -- number of selected points (2 for ramp)
			params[6] = #constructor -- selected commander candidates
			params[7] = volumeSelection -- 0 = none, 1 = only raise, 2 = only lower
			local i = 8
			for j = 1, points do
				params[i] = point[j].x
				params[i + 1] = point[j].y
				params[i + 2] = point[j].z
				i = i + 3
			end
					
			for j = 1, #constructor do
				params[i] = constructor[j]
				i = i + 1
			end
			
			local a,c,m,s = spGetModKeyState()
			
			if s then
				Spring.GiveOrderToUnit(constructor[1], CMD_TERRAFORM_INTERNAL, params, {"shift"})
				originalCommandGiven = true
			else
				Spring.GiveOrderToUnit(constructor[1], CMD_TERRAFORM_INTERNAL, params, {})
				spSetActiveCommand(-1)
				originalCommandGiven = false
			end
		end
	else
		if (#constructor > 0) then 
			local params = {}
			params[1] = terraform_type
			params[2] = team
			params[3] = loop
			params[4] = terraformHeight 
			params[5] = points
			params[6] = #constructor -- selected commander candidates
			params[7] = volumeSelection
			local i = 8
			for j = 1, points do
				params[i] = point[j].x
				params[i + 1] = point[j].z
				i = i + 2
			end
			
			for j = 1, #constructor do
				params[i] = constructor[j]
				i = i + 1
			end
			
			local a,c,m,s = spGetModKeyState()
			
			if s then
				Spring.GiveOrderToUnit(constructor[1], CMD_TERRAFORM_INTERNAL, params, {"shift"})
				originalCommandGiven = true
			else
				Spring.GiveOrderToUnit(constructor[1], CMD_TERRAFORM_INTERNAL, params, {})
				spSetActiveCommand(-1)
				originalCommandGiven = false
			end
		end
	end
	points = 0		
end

---------------

local function lineVolumeLevel()

	for i = 1, drawPoints do
		repeat -- emulating continue
			if (terraformHeight < drawPoint[i].ytl) then
				if (volumeSelection == 1) then
					break -- continue
				end
				glColor(negVolume)
			else
				if (volumeSelection == 2) then
					break -- continue
				end
				glColor(posVolume)
			end
			
			for lx = 0,12,4 do
				for lz = 0,12,4 do
					glVertex(drawPoint[i].x+lx ,drawPoint[i].ytl,drawPoint[i].z+lz)
					glVertex(drawPoint[i].x+lx ,terraformHeight,drawPoint[i].z+lz)
				end
			end
		until true --do not repeat
	end

end

local function groundGrid()

	for i = 1, drawPoints do
	
		glColor(groundGridColor)
		
		glVertex(drawPoint[i].x,drawPoint[i].ytl,drawPoint[i].z)
		glVertex(drawPoint[i].x+Grid,drawPoint[i].ytr,drawPoint[i].z)

		glVertex(drawPoint[i].x,drawPoint[i].ytl,drawPoint[i].z)
		glVertex(drawPoint[i].x,drawPoint[i].ybl,drawPoint[i].z+Grid)
		
		if drawPoint[i].Right then
			glVertex(drawPoint[i].x+16,drawPoint[i].ytr,drawPoint[i].z)
			glVertex(drawPoint[i].x+16,drawPoint[i].ybr,drawPoint[i].z+Grid)
		end
		
		if drawPoint[i].Bottom then
			glVertex(drawPoint[i].x,drawPoint[i].ybl,drawPoint[i].z+16)
			glVertex(drawPoint[i].x+Grid,drawPoint[i].ybr,drawPoint[i].z+16)
		end
		
	end

end

local function mouseGridLevel()

	for i = 1, drawPoints do
	
		glColor(groundGridColor)
		
		glVertex(drawPoint[i].x,terraformHeight,drawPoint[i].z)
		glVertex(drawPoint[i].x+Grid,terraformHeight,drawPoint[i].z)

		glVertex(drawPoint[i].x,terraformHeight,drawPoint[i].z)
		glVertex(drawPoint[i].x,terraformHeight,drawPoint[i].z+Grid)
		
		if drawPoint[i].Right then
			glVertex(drawPoint[i].x+16,terraformHeight,drawPoint[i].z)
			glVertex(drawPoint[i].x+16,terraformHeight,drawPoint[i].z+Grid)
		end
		
		if drawPoint[i].Bottom then
			glVertex(drawPoint[i].x,terraformHeight,drawPoint[i].z+16)
			glVertex(drawPoint[i].x+Grid,terraformHeight,drawPoint[i].z+16)
		end
		
	end

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
	
	if ((activeid == CMD_LEVEL) or (activeid == CMD_SMOOTH) or (activeid == CMD_RESTORE))
			and not (setHeight or drawingRectangle or drawingRamp) then
	
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
					elseif (activeid == CMD_SMOOTH) then
						terraform_type = 3
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
		
	elseif (activeid == CMD_RAMP) and not (setHeight or drawingRectangle or drawingRamp) then
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
					terraformHeight = startRampWidth -- width
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
			drawingRamp = 3
		end
		return true
	end
	
	if setHeight or drawingRamp or drawingRectangle then
		if button == 3 then
			completelyStopCommand()
			return true
		end
	end
	
	return false
end

function widget:MouseMove(mx, my, dx, dy, button)

	if drawingRectangle then
		if not rectangleAwaitingSecondClick and button == 1
				and rectangleStartMouseX and rectangleStartMouseY
				and (abs(mx - rectangleStartMouseX) >= rectangleDragThreshold
					or abs(my - rectangleStartMouseY) >= rectangleDragThreshold) then
			rectangleDragged = true
		end
		updateRectangleEndpoint(mx, my)
		
		return true
		
	elseif drawingRamp == 1 or drawingRamp == 3 then
		return true
	
	end
	
	return false
end

function widget:Update(n)

	if drawingRectangle and rectangleAwaitingSecondClick then
		local mx, my = Spring.GetMouseState()
		updateRectangleEndpoint(mx, my)
	elseif setHeight then
		local mx,my = Spring.GetMouseState()
			
		if terraform_type == 1 then
			local a,c,m,s = spGetModKeyState()
			if c then
				local _, pos = spTraceScreenRay(mx, my, true)
				if legalPos(pos) then	
					terraformHeight = clampTerraformHeight(spGetGroundHeight(pos[1],pos[3]))
					storedHeight = terraformHeight
					mouseX = mx
					mouseY = my
				end
			elseif a then
				Spring.WarpMouse (mouseX,mouseY)
				storedHeight = storedHeight + (my-mouseY)*mouseSensitivity
				local heightArray = {
					-2,
					orHeight,
					-23,
				}
				terraformHeight = clampTerraformHeight(heightArray[snapToHeight(heightArray,storedHeight,3)])
			else
				Spring.WarpMouse (mouseX,mouseY)
				terraformHeight = clampTerraformHeight(terraformHeight + (my-mouseY)*mouseSensitivity)
				storedHeight = terraformHeight
			end
			if (volumeDraw) then 
				gl.DeleteList(volumeDraw); volumeDraw=nil
				gl.DeleteList(mouseGridDraw); mouseGridDraw=nil
			end
			volumeDraw = glCreateList(glBeginEnd, GL_LINES, lineVolumeLevel)
			mouseGridDraw = glCreateList(glBeginEnd, GL_LINES, mouseGridLevel)
		elseif terraform_type == 4 then
			Spring.WarpMouse (mouseX,mouseY)
			terraformHeight = terraformHeight + (my-mouseY)*mouseSensitivity
			if terraformHeight < minRampWidth then
				terraformHeight = minRampWidth
			end
			if terraformHeight > maxRampWidth then
				terraformHeight = maxRampWidth
			end
		end
	
	elseif drawingRamp == 2 then
		local mx,my = Spring.GetMouseState()
		updateRampEndpoint(mx, my)
	end

end

function widget:MouseRelease(mx, my, button)
	
	if drawingRectangle then
	
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
				if (groundGridDraw) then gl.DeleteList(groundGridDraw); groundGridDraw=nil end
				groundGridDraw = glCreateList(glBeginEnd, GL_LINES, groundGrid)
				
				if (volumeDraw) then
					gl.DeleteList(volumeDraw); volumeDraw=nil
					gl.DeleteList(mouseGridDraw); mouseGridDraw=nil
				end
				volumeDraw = glCreateList(glBeginEnd, GL_LINES, lineVolumeLevel)
				mouseGridDraw = glCreateList(glBeginEnd, GL_LINES, mouseGridLevel)
				
			elseif terraform_type == 3 or terraform_type == 5 then
			
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
	
	elseif drawingRamp == 3 then
	
		if button == 1 then
			mouseX = mx
			mouseY = my
			setHeight = true
			drawingRamp = false
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
		if setHeight or drawingRamp or drawingRectangle then
			completelyStopCommand()
			return true
		end
	end

	if key == KEYSYMS.SPACE and ( 
		(terraform_type == 1 and setHeight) or 
		(terraform_type == 4 and (setHeight or drawingRamp))
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

local function DrawRectangleLine()

	glVertex(point[3].x,point[1].y,point[3].z)
	glVertex(point[3].x,point[1].y,point[2].z)
	glVertex(point[2].x,point[1].y,point[2].z)
	glVertex(point[2].x,point[1].y,point[3].z)
	glVertex(point[3].x,point[1].y,point[3].z)
	
end

local function DrawRampFirstSetHeight(dis)
	
	glVertex(point[1].x,point[1].y,point[1].z)
	glVertex(point[1].x,point[1].ground,point[1].z)
	
end

local function DrawRampStart(dis)

	local perpendicular = {x = terraformHeight*(point[1].z-point[2].z)/dis, z = -terraformHeight*(point[1].x-point[2].x)/dis}
	
	glVertex(point[1].x+perpendicular.x,point[1].y,point[1].z+perpendicular.z)
	glVertex(point[1].x+perpendicular.x,point[1].ground,point[1].z+perpendicular.z)
	glVertex(point[1].x-perpendicular.x,point[1].ground,point[1].z-perpendicular.z)
	glVertex(point[1].x-perpendicular.x,point[1].y,point[1].z-perpendicular.z)
	
end

local function DrawRampMiddleEnd(dis)
	
	local perpendicular = {x = terraformHeight*(point[1].z-point[2].z)/dis, z = -terraformHeight*(point[1].x-point[2].x)/dis}
	
	glVertex(point[2].x-perpendicular.x,point[2].y,point[2].z-perpendicular.z)
	glVertex(point[1].x-perpendicular.x,point[1].y,point[1].z-perpendicular.z)
	glVertex(point[1].x+perpendicular.x,point[1].y,point[1].z+perpendicular.z)
	glVertex(point[2].x+perpendicular.x,point[2].y,point[2].z+perpendicular.z)
	glVertex(point[2].x-perpendicular.x,point[2].y,point[2].z-perpendicular.z)
	glVertex(point[2].x-perpendicular.x,point[2].ground,point[2].z-perpendicular.z)
	glVertex(point[2].x+perpendicular.x,point[2].ground,point[2].z+perpendicular.z)
	glVertex(point[2].x+perpendicular.x,point[2].y,point[2].z+perpendicular.z)
	
end

local function drawMouseText(y,text)

	local mx,my = Spring.GetMouseState()
	glText(text, mx+40, my+y, 22,"")

end


function widget:DrawWorld()
	
	if not (setHeight or drawingRectangle or drawingRamp) then
		widgetHandler:RemoveWidgetCallIn("DrawWorld", self)
		return
	end
	
	--// draw the lines
	--glLineStipple(2, 4095)
	glLineWidth(3.0)
	
	if terraform_type == 4 then
	
		local dis = sqrt((point[1].x-point[2].x)^2 + (point[1].z-point[2].z)^2)
		
		if dis == 0 then
			glColor(vehPathingColor)
			glBeginEnd(GL_LINES, DrawRampFirstSetHeight)
		else
			local grad = abs(point[1].y-point[2].y)/dis
			if grad <= vehPathingGrad then
				glColor(vehPathingColor)
			elseif grad <= botPathingGrad then
				glColor(botPathingColor)
			else
			   glColor(noPathingColor)
			end
			glBeginEnd(GL_LINE_STRIP, DrawRampStart, dis)
			glBeginEnd(GL_LINE_STRIP, DrawRampMiddleEnd, dis)
		end
	
	else
	
		if setHeight then	
			--glDepthTest(true)
			glCallList(groundGridDraw)
			glCallList(volumeDraw)
			glCallList(mouseGridDraw)
			
			--glDepthTest(false)
		elseif drawingRectangle then
			glColor(selectionColor)
			glBeginEnd(GL_LINE_STRIP, DrawRectangleLine)
		end
		
	end

	glColor(1, 1, 1, 1)
	glLineWidth(1.0)
	--glLineStipple(false)
end

function widget:DrawScreen()

	if terraform_type == 1 then
		if setHeight then
			drawMouseText(0, string_format("%+.0f", terraformHeight - orHeight))
		end
	elseif terraform_type == 4 then
		if drawingRamp == 1 then
			drawMouseText(0,floor(point[1].y))
		elseif drawingRamp == 3 then
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
		if volumeSelection == 1 then
			drawMouseText(-30,"Only raise")
		elseif volumeSelection == 2 then
			drawMouseText(-30,"Only lower")
		end
	end

end
--------------------------------------------------------------------------------
-- Spring Callins
--------------------------------------------------------------------------------

function widget:Initialize()
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
	if (volumeDraw) then 
		gl.DeleteList(volumeDraw); volumeDraw=nil
		gl.DeleteList(mouseGridDraw); mouseGridDraw=nil
	end
	if (groundGridDraw) then 
		gl.DeleteList(groundGridDraw); groundGridDraw=nil 
	end
end

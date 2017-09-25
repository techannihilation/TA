
function widget:GetInfo()
return {
	name    = "Options",
	desc    = "",
	author  = "Floris",
	date    = "September 2016",
	layer   = 2,
	enabled = true,
	handler = true,
}
end

--local show = true

local loadedFontSize = 32
local font = gl.LoadFont(LUAUI_DIRNAME.."Fonts/FreeSansBold.otf", loadedFontSize, 16,2)

local bgcorner = LUAUI_DIRNAME.."Images/bgcorner.png"
local bgcorner1 = ":n:"..LUAUI_DIRNAME.."Images/bgcorner1.png" -- only used to draw dropdown arrow

local backwardTex = LUAUI_DIRNAME.."Images/backward.dds"
local forwardTex = LUAUI_DIRNAME.."Images/forward.dds"

local cbackground, cborder, cbuttonbackground = include("Configs/ui_config.lua")
local triggered = nil
local update = 0.5

local bgMargin = 6

local closeButtonSize = 30
local screenHeight = 520-bgMargin-bgMargin
local screenWidth = 1050-bgMargin-bgMargin

local textareaMinLines = 10		-- wont scroll down more, will show at least this amount of lines 

local customScale = 1

local startLine = 1

local vsx,vsy = Spring.GetViewGeometry()
local screenX = (vsx*0.5) - (screenWidth/2)
local screenY = (vsy*0.5) + (screenHeight/2)

local wsx,wsy,wpx,wpy = Spring.GetWindowGeometry()
local ssx,ssy,spx,spy = Spring.GetScreenGeometry()

local spIsGUIHidden = Spring.IsGUIHidden

local glColor = gl.Color
local glLineWidth = gl.LineWidth
local glPolygonMode = gl.PolygonMode
local glRect = gl.Rect
local glTexRect = gl.TexRect
local glRotate = gl.Rotate
local glTexture = gl.Texture
local glText = gl.Text
local glShape = gl.Shape
local glGetTextWidth = gl.GetTextWidth
local glGetTextHeight = gl.GetTextHeight

local bgColorMultiplier = 0

local glCreateList = gl.CreateList
local glCallList = gl.CallList
local glDeleteList = gl.DeleteList

local glPopMatrix = gl.PopMatrix
local glPushMatrix = gl.PushMatrix
local glTranslate = gl.Translate
local glScale = gl.Scale

local GL_FILL = GL.FILL
local GL_FRONT_AND_BACK = GL.FRONT_AND_BACK
local GL_LINE_STRIP = GL.LINE_STRIP

local widgetScale = 1
local vsx, vsy = Spring.GetViewGeometry()
local resolutionX, resolutionY = Spring.GetScreenGeometry()

local myTeamID = Spring.GetMyTeamID()
local amNewbie = (Spring.GetTeamRulesParam(myTeamID, 'isNewbie') == 1)

local options = {}
local optionGroups = {}
local optionButtons = {}
local optionHover = {}
local optionSelect = {}
local fullWidgetsList = {}
local addedWidgetOptions = false

local luaShaders = tonumber(Spring.GetConfigInt("ForceShaders",1) or 0)

local mapExt = {'VR Grid','Map','None'}
local presetNames = {'lowest','low','medium','high','ultra'}
local presets = {
	lowest = {
		bloom = 0,
		water = 1,
		lighteffects = false,
		lups = false,
		snow = false,
		xrayshader = false,
		particles = 5000,
		nanoparticles = 500,
		grounddetail = 50,
		grassdetail = 0,
		treeradius = 0,
		advsky = false,
		outline = false,
		guishader = false,
		shadows = false,
		advmapshading = false,
		advmodelshading = false,
		decals = 0,
		darkenmap_darkenfeatures = false,
	},
	low = {
		bloom = 0,
		water = 2,
		lighteffects = false,
		lups = true,
		snow = false,
		xrayshader = false,
		particles = 10000,
		nanoparticles = 700,
		grounddetail = 80,
		grassdetail = 0,
		treeradius = 200,
		advsky = false,
		outline = false,
		guishader = false,
		shadows = false,
		advmapshading = true,
		advmodelshading = true,
		decals = 0,
		darkenmap_darkenfeatures = false,
	},
	medium = {
		bloom = 1,
		water = 4,
		lighteffects = true,
		lups = true,
		snow = true,
		xrayshader = false,
		particles = 15000,
		nanoparticles = 1000,
		grounddetail = 120,
		grassdetail = 0,
		treeradius = 400,
		advsky = false,
		outline = false,
		guishader = false,
		shadows = false,
		advmapshading = true,
		advmodelshading = true,
		decals = 1,
		darkenmap_darkenfeatures = false,
	},
	high = {
		bloom = 1,
		water = 5,
		lighteffects = true,
		lups = true,
		snow = true,
		xrayshader = false,
		particles = 20000,
		nanoparticles = 1500,
		grounddetail = 160,
		grassdetail = 0,
		treeradius = 800,
		advsky = true,
		outline = true,
		guishader = true,
		shadows = true,
		advmapshading = true,
		advmodelshading = true,
		decals = 2,
		darkenmap_darkenfeatures = false,
	},
	ultra = {
		bloom = 2,
		water = 3,
		lighteffects = true,
		lups = true,
		snow = true,
		xrayshader = false,
		particles = 25000,
		nanoparticles = 2500,
		grounddetail = 160,
		grassdetail = 0,
		treeradius = 800,
		advsky = true,
		outline = true,
		guishader = true,
		shadows = true,
		advmapshading = true,
		advmodelshading = true,
		decals = 3,
		darkenmap_darkenfeatures = true,
	},
}

function widget:ViewResize()
  vsx,vsy = Spring.GetViewGeometry()
  screenX = (vsx*0.5) - (screenWidth/2)
  screenY = (vsy*0.5) + (screenHeight/2)
  widgetScale = (0.75 + (vsx*vsy / 7500000)) * customScale
  if windowList then gl.DeleteList(windowList) end
  windowList = gl.CreateList(DrawWindow)
end


local showOnceMore = false		-- used because of GUI shader delay

local function DrawRectRound(px,py,sx,sy,cs, tl,tr,br,bl)
	gl.TexCoord(0.8,0.8)
	gl.Vertex(px+cs, py, 0)
	gl.Vertex(sx-cs, py, 0)
	gl.Vertex(sx-cs, sy, 0)
	gl.Vertex(px+cs, sy, 0)
	
	gl.Vertex(px, py+cs, 0)
	gl.Vertex(px+cs, py+cs, 0)
	gl.Vertex(px+cs, sy-cs, 0)
	gl.Vertex(px, sy-cs, 0)
	
	gl.Vertex(sx, py+cs, 0)
	gl.Vertex(sx-cs, py+cs, 0)
	gl.Vertex(sx-cs, sy-cs, 0)
	gl.Vertex(sx, sy-cs, 0)
	
	local offset = 0.07		-- texture offset, because else gaps could show
	
	-- bottom left
	if ((py <= 0 or px <= 0)  or (bl ~= nil and bl == 0)) and bl ~= 2   then o = 0.5 else o = offset end
	gl.TexCoord(o,o)
	gl.Vertex(px, py, 0)
	gl.TexCoord(o,1-o)
	gl.Vertex(px+cs, py, 0)
	gl.TexCoord(1-o,1-o)
	gl.Vertex(px+cs, py+cs, 0)
	gl.TexCoord(1-o,o)
	gl.Vertex(px, py+cs, 0)
	-- bottom right
	if ((py <= 0 or sx >= vsx) or (br ~= nil and br == 0)) and br ~= 2   then o = 0.5 else o = offset end
	gl.TexCoord(o,o)
	gl.Vertex(sx, py, 0)
	gl.TexCoord(o,1-o)
	gl.Vertex(sx-cs, py, 0)
	gl.TexCoord(1-o,1-o)
	gl.Vertex(sx-cs, py+cs, 0)
	gl.TexCoord(1-o,o)
	gl.Vertex(sx, py+cs, 0)
	-- top left
	if ((sy >= vsy or px <= 0) or (tl ~= nil and tl == 0)) and tl ~= 2   then o = 0.5 else o = offset end
	gl.TexCoord(o,o)
	gl.Vertex(px, sy, 0)
	gl.TexCoord(o,1-o)
	gl.Vertex(px+cs, sy, 0)
	gl.TexCoord(1-o,1-o)
	gl.Vertex(px+cs, sy-cs, 0)
	gl.TexCoord(1-o,o)
	gl.Vertex(px, sy-cs, 0)
	-- top right
	if ((sy >= vsy or sx >= vsx)  or (tr ~= nil and tr == 0)) and tr ~= 2   then o = 0.5 else o = offset end
	gl.TexCoord(o,o)
	gl.Vertex(sx, sy, 0)
	gl.TexCoord(o,1-o)
	gl.Vertex(sx-cs, sy, 0)
	gl.TexCoord(1-o,1-o)
	gl.Vertex(sx-cs, sy-cs, 0)
	gl.TexCoord(1-o,o)
	gl.Vertex(sx, sy-cs, 0)
end
function RectRound(px,py,sx,sy,cs, tl,tr,br,bl)		-- (coordinates work differently than the RectRound func in other widgets)
	gl.Texture(bgcorner)
	gl.BeginEnd(GL.QUADS, DrawRectRound, px,py,sx,sy,cs, tl,tr,br,bl)
	gl.Texture(false)
end

function DrawButton()
  glPolygonMode(GL_FRONT_AND_BACK, GL_FILL)
	RectRound(0,0,4.5,1.05,0.25, 2,2,0,0)
	local vertices = {
		{v = {0, 1, 0}},
		{v = {0, 0, 0}},
		{v = {1, 0, 0}},
	}
	glShape(GL_LINE_STRIP, vertices)
  glText("[ Options ]", textMargin, textMargin, textSize, "no")
end
	
function lines(str)
  local t = {}
  local function helper(line) table.insert(t, line) return "" end
  helper((str:gsub("(.-)\r?\n", helper)))
  return t
end

function tableMerge(t1, t2)
	for k,v in pairs(t2) do
		if type(v) == "table" then
			if type(t1[k] or false) == "table" then
				tableMerge(t1[k] or {}, t2[k] or {})
			else
				t1[k] = v
			end
		else
			t1[k] = v
		end
	end
	return t1
end

function deepcopy(orig)
	local orig_type = type(orig)
	local copy
	if orig_type == 'table' then
		copy = {}
		for orig_key, orig_value in next, orig, nil do
			copy[deepcopy(orig_key)] = deepcopy(orig_value)
		end
		setmetatable(copy, deepcopy(getmetatable(orig)))
	else -- number, string, boolean, etc
		copy = orig
	end
	return copy
end

function getOptionByID(id)
	for i, option in pairs(options) do
		if option.id == id then
			return i
		end
	end
	return false
end

function checkWidgets()

	-- bloom
	local bloomValue = 0
	if widgetHandler.orderList["Bloom Shader"] ~= nil and widgetHandler.orderList["Bloom Shader"] > 0 then
		bloomValue = 1
		if WG['bloom'] ~= nil and WG['bloom'].getAdvBloom() then
			bloomValue = 2
		end
	end
	options[getOptionByID('bloom')].value = bloomValue
	
	-- cursors
	local cursorsets = {}
	local cursor = 1
	local cursoroption
	if (WG['cursors'] ~= nil) then
		cursorsets = WG['cursors'].getcursorsets()
		local cursorname = WG['cursors'].getcursor()
		for i,c in pairs(cursorsets) do
			if c == cursorname then
				cursor = i
				break
			end
		end
		table.insert(options, {id="cursor", group="control", name="Cursor", type="select", options=cursorsets, value=cursor})
	end
	-- Darken map
	if (WG['darkenmap'] ~= nil) then
		table.insert(options, {id="darkenmap", group="gfx", name="Darken map", min=0, max=0.5, step=0.01, type="slider", value=WG['darkenmap'].getMapDarkness(), description='Darkens the whole map (not the units)\n\nRemembers setting per map\nUse /resetmapdarkness if you want to reset all stored map settings'})
		if WG['darkenmap'].getDarkenFeatures ~= nil then
			table.insert(options, {id="darkenmap_darkenfeatures", group="gfx", name="Darken features with map", type="bool", value=WG['darkenmap'].getDarkenFeatures(), description='Darkens features (trees, wrecks, ect..) along with darken map slider above\n\nNOTE: This setting can be CPU intensive because it cycles through all visible features \nand renders then another time.'})
		end
	end
	-- Highlight Selected Units
	if (WG['highlightselunits'] ~= nil) then
		table.insert(options, {id="highlightselunits_opacity", group="ui", name="Selected units opacity", min=0.15, max=0.3, step=0.002, type="slider", value=WG['highlightselunits'].getOpacity(), description='Set the opacity of the highlight on selected units'})
	end
	-- Smart Select
	if (WG['smartselect'] ~= nil) then
		table.insert(options, {id="smartselect_includebuildings", group="ui", name="Include buildings in area-selection", type="bool", value=WG['smartselect'].getIncludeBuildings(), description='When rectangle-drag-selecting an area, include building units too?\nIf disabled: non-mobile units will not be selected\n(nanos always will be selected)'})
	end
	-- Ota Icons
	if (WG['OtaIcons'] ~= nil) then
		table.insert(options, {id="otaicons", group="ui", name="Ota Icons", type="bool", value=WG['OtaIcons'], description='Switch to Ota Type BuildMenu Icons'})
	end
	orderOptions()
end


function orderOptions()
	local groupOptions = {}
	for id,group in pairs(optionGroups) do
		groupOptions[group.id] = {}
	end
	for oid,option in pairs(options) do
		if option.type ~= 'label' then
			table.insert(groupOptions[option.group], option)
		end
	end
	local newOptions = {}
	for id,group in pairs(optionGroups) do
		grOptions = groupOptions[group.id]
		if #grOptions > 0 then
			local name = group.name
			if group.id == 'gfx' then
				name = group.name..'                                      \255\130\130\130'..vsx..' x '..vsy
			end
			table.insert(newOptions, {id="group_"..group.id, name=name, type="label"})
		end
		for oid,option in pairs(grOptions) do
			table.insert(newOptions, option)
		end
	end
	options = deepcopy(newOptions)
end


local startColumn = 1		-- used for navigation
local maxShownColumns = 3
local maxColumnRows = 0 	-- gets calculated
local totalColumns = 0 		-- gets calculated
function DrawWindow()
	orderOptions()

	-- add widget options
	if not addedWidgetOptions then
		addedWidgetOptions = true
		checkWidgets()
	end

  local x = screenX --rightwards
  local y = screenY --upwards
	-- background
	RectRound(x-bgMargin,y-screenHeight-bgMargin,x+screenWidth+bgMargin,y+bgMargin,8, 0,1,1,1)
	-- content area
	gl.Color(0.33,0.33,0.33,0.15)
	RectRound(x,y-screenHeight,x+screenWidth,y,6)
	
	--[[ close button
	local size = closeButtonSize*0.7
	local width = size*0.055
  gl.Color(1,1,1,1)
	gl.PushMatrix()
		gl.Translate(screenX+screenWidth-(closeButtonSize/2),screenY-(closeButtonSize/2),0)
  	gl.Rotate(-45,0,0,1)
  	gl.Rect(-width,size/2,width,-size/2)
  	gl.Rotate(90,0,0,1)
  	gl.Rect(-width,size/2,width,-size/2)
	gl.PopMatrix()]]--
	
	-- title
	local title = "Options"
	local titleFontSize = 18
	gl.Color(0,0,0,0.8)
	titleRect = {x-bgMargin, y+bgMargin, x+(glGetTextWidth(title)*titleFontSize)+27-bgMargin, y+37}
	RectRound(titleRect[1], titleRect[2], titleRect[3], titleRect[4], 8, 1,1,0,0)
	
	font:Begin()
	font:SetTextColor(1,1,1,1)
	font:SetOutlineColor(0,0,0,0.4)
	font:Print(title, x-bgMargin+(titleFontSize*0.75), y+bgMargin+8, titleFontSize, "on")
	font:End()
	
	local width = screenWidth/3
	--gl.Color(0.66,0.66,0.66,0.08)
	--RectRound(x+width+width+6,y-screenHeight,x+width+width+width,y,6)
	
	-- description background
	gl.Color(0.62,0.5,0.22,0.14)
	RectRound(x,y-screenHeight,x+width+width,y-screenHeight+90,6)

	-- draw options
	local oHeight = 15
	local oPadding = 6
	y = y - oPadding - 11
	local oWidth = (screenWidth/3)-oPadding-oPadding
	local yHeight = screenHeight-102-oPadding
	local xPos = x + oPadding + 5
	local xPosMax = xPos + oWidth - oPadding - oPadding
	local yPosMax = y-yHeight
	local boolPadding = 3.5
	local boolWidth = 40
	local sliderWidth = 110
	local selectWidth = 140
	local i = 0
	local rows = 0
	local column = 1
	local drawColumnPos = 1
	if totalColumns == 0 or maxColumnRows == 0 then
		maxColumnRows = math.floor((y-yPosMax+oPadding) / (oHeight+oPadding+oPadding))
		totalColumns = 1 + math.floor(#options / maxColumnRows)
	end
	optionButtons = {}
	optionHover = {}


	-- draw navigation... backward/forward
	if totalColumns > maxShownColumns then
		local buttonSize = 52
		local buttonMargin = 13
		local startX = x+screenWidth
		local startY = screenY-screenHeight+buttonMargin

		glColor(1,1,1,1)

		if (startColumn-1) + maxShownColumns  <  totalColumns then
			optionButtonForward = {startX-buttonSize-buttonMargin, startY, startX-buttonMargin, startY+buttonSize}
			glColor(1,1,1,1)
			glTexture(forwardTex)
			glTexRect(optionButtonForward[1], optionButtonForward[2], optionButtonForward[3], optionButtonForward[4])
		else
			optionButtonForward = nil
		end

		glColor(1,1,1,0.4)
		glText(math.ceil(startColumn/maxShownColumns)..' / '..math.ceil(totalColumns/maxShownColumns), startX-(buttonSize*2.6)-buttonMargin, startY+buttonSize/2.6, buttonSize/2.9, "rn")

		if startColumn > 1 then
			if optionButtonForward == nil then
				optionButtonBackward = {startX-buttonSize-buttonMargin, startY, startX-buttonMargin, startY+buttonSize }
			else
				optionButtonBackward = {startX-(buttonSize*2)-buttonMargin-(buttonMargin/1.5), startY, startX-(buttonSize*1)-buttonMargin-(buttonMargin/1.5), startY+buttonSize}
			end
			glColor(1,1,1,1)
			glTexture(backwardTex)
			glTexRect(optionButtonBackward[1], optionButtonBackward[2], optionButtonBackward[3], optionButtonBackward[4])
		else
			optionButtonBackward = nil
		end
	end

	-- draw options
	for oid,option in pairs(options) do
		yPos = y-(((oHeight+oPadding+oPadding)*i)-oPadding)
		if yPos-oHeight < yPosMax then
			i = 0
		  	column = column + 1
			if column >= startColumn and rows > 0 then
				drawColumnPos = drawColumnPos + 1
			end
			if drawColumnPos > 3 then
				break
			end
			if rows > 0 then
				xPos = x + (( (screenWidth/3))*(drawColumnPos-1))
				xPosMax = xPos + oWidth
			end
			yPos = y-(((oHeight+oPadding+oPadding)*i)-oPadding)
		end

		if column >= startColumn then
			rows = rows + 1
			--option name
			color = '\255\225\225\225  '
			if option.type == 'label' then
				color = '\255\235\200\125'
			end
			glText(color..option.name, xPos+(oPadding/2), yPos-(oHeight/3)-oPadding, oHeight, "no")

			-- define hover area
			optionHover[oid] = {xPos, yPos-oHeight-oPadding, xPosMax, yPos+oPadding}

			-- option controller
			local rightPadding = 4
			if option.type == 'bool' then
				optionButtons[oid] = {}
				optionButtons[oid] = {xPosMax-boolWidth-rightPadding, yPos-oHeight, xPosMax-rightPadding, yPos}
				glColor(1,1,1,0.11)
				RectRound(xPosMax-boolWidth-rightPadding, yPos-oHeight, xPosMax-rightPadding, yPos, 3)
				--Spring.Echo(option.name,option.value)
				if option.value == true then
					glColor(0.66,0.92,0.66,1)
                    RectRound(xPosMax-oHeight+boolPadding-rightPadding, yPos-oHeight+boolPadding, xPosMax-boolPadding-rightPadding, yPos-boolPadding, 2.5)
                    
                    
                else
                	glColor(0.92,0.66,0.66,1)
					RectRound(xPosMax-boolWidth+boolPadding-rightPadding, yPos-oHeight+boolPadding, xPosMax-boolWidth+oHeight-boolPadding-rightPadding, yPos-boolPadding, 2.5)
                end
			elseif option.type == 'slider' then
				local sliderSize = oHeight*0.75
				local sliderPos = (option.value-option.min) / (option.max-option.min)
				glColor(1,1,1,0.11)
				RectRound(xPosMax-(sliderSize/2)-sliderWidth-rightPadding, yPos-((oHeight/7)*4.2), xPosMax-(sliderSize/2)-rightPadding, yPos-((oHeight/7)*2.8), 1)
				glColor(0.8,0.8,0.8,1)
				RectRound(xPosMax-(sliderSize/2)-sliderWidth+(sliderWidth*sliderPos)-(sliderSize/2)-rightPadding, yPos-oHeight+((oHeight-sliderSize)/2), xPosMax-(sliderSize/2)-sliderWidth+(sliderWidth*sliderPos)+(sliderSize/2)-rightPadding, yPos-((oHeight-sliderSize)/2), 3)
				optionButtons[oid] = {xPosMax-(sliderSize/2)-sliderWidth+(sliderWidth*sliderPos)-(sliderSize/2)-rightPadding, yPos-oHeight+((oHeight-sliderSize)/2), xPosMax-(sliderSize/2)-sliderWidth+(sliderWidth*sliderPos)+(sliderSize/2)-rightPadding, yPos-((oHeight-sliderSize)/2)}
				optionButtons[oid].sliderXpos = {xPosMax-(sliderSize/2)-sliderWidth-rightPadding, xPosMax-(sliderSize/2)-rightPadding}

			elseif option.type == 'select' then
				optionButtons[oid] = {xPosMax-selectWidth-rightPadding, yPos-oHeight, xPosMax-rightPadding, yPos}
				glColor(1,1,1,0.11)
				RectRound(xPosMax-selectWidth-rightPadding, yPos-oHeight, xPosMax-rightPadding, yPos, 3)
				if option.options[tonumber(option.value)] ~= nil then
				glText(option.options[tonumber(option.value)], xPosMax-selectWidth+5-rightPadding, yPos-(oHeight/3)-oPadding, oHeight*0.85, "no")
			end
				glColor(1,1,1,0.11)
				RectRound(xPosMax-oHeight-rightPadding, yPos-oHeight, xPosMax-rightPadding, yPos, 2.5)
				--[[
				glColor(1,1,1,0.16)
				glTexture(bgcorner1)
				glPushMatrix()
				glTranslate(xPosMax-(oHeight*0.5)-rightPadding, yPos-(oHeight*0.33), 0)
					glRotate(-45,0,0,1)
					glTexRect(-(oHeight*0.25),-(oHeight*0.25),(oHeight*0.25),(oHeight*0.25))
				glPopMatrix()
				--]]
			end
		end
		i = i + 1
	end
end


function correctMouseForScaling(x,y)
	local interfaceScreenCenterPosX = (screenX+(screenWidth/2))/vsx
	local interfaceScreenCenterPosY = (screenY-(screenHeight/2))/vsy
	x = x - (((x/vsx)-interfaceScreenCenterPosX) * vsx)*((widgetScale-1)/widgetScale)
	y = y - (((y/vsy)-interfaceScreenCenterPosY) * vsy)*((widgetScale-1)/widgetScale)
	return x,y
end


function widget:DrawScreen()

  if spIsGUIHidden() then return end
  
  -- draw the window
  if not windowList then
    windowList = gl.CreateList(DrawWindow)
  end
  
  -- update new slider value
	if sliderValueChanged then
		gl.DeleteList(windowList)
		windowList = gl.CreateList(DrawWindow)
		sliderValueChanged = nil
  end
  
  if show or showOnceMore then
  	
		-- draw the options panel
		glPushMatrix()
			glTranslate(-(vsx * (widgetScale-1))/2, -(vsy * (widgetScale-1))/2, 0)
			glScale(widgetScale, widgetScale, 1)
			gl.Color(WG["background_opacity_custom"])
			glCallList(windowList)
			if (WG['guishader_api'] ~= nil) then
				local rectX1 = ((screenX-bgMargin) * widgetScale) - ((vsx * (widgetScale-1))/2)
				local rectY1 = ((screenY+bgMargin) * widgetScale) - ((vsy * (widgetScale-1))/2)
				local rectX2 = ((screenX+screenWidth+bgMargin) * widgetScale) - ((vsx * (widgetScale-1))/2)
				local rectY2 = ((screenY-screenHeight-bgMargin) * widgetScale) - ((vsy * (widgetScale-1))/2)
				WG['guishader_api'].InsertRect(rectX1, rectY2, rectX2, rectY1, 'options')
				--WG['guishader_api'].setBlurIntensity(0.0017)
				--WG['guishader_api'].setScreenBlur(true)
			end
			showOnceMore = false
			
			-- draw button hover
			local usedScreenX = (vsx*0.5) - ((screenWidth/2)*widgetScale)
			local usedScreenY = (vsy*0.5) + ((screenHeight/2)*widgetScale)
			
			-- mouseover (highlight and tooltip)

		  local description = ''
			local x,y = Spring.GetMouseState()
			local cx, cy = correctMouseForScaling(x,y)

		  if optionButtonForward ~= nil and IsOnRect(cx, cy, optionButtonForward[1], optionButtonForward[2], optionButtonForward[3], optionButtonForward[4]) then
			  glColor(1,1,1,0.12)
			  RectRound(optionButtonForward[1], optionButtonForward[2], optionButtonForward[3], optionButtonForward[4], (optionButtonForward[4]-optionButtonForward[2])/8)
		  end
		  if optionButtonBackward ~= nil and IsOnRect(cx, cy, optionButtonBackward[1], optionButtonBackward[2], optionButtonBackward[3], optionButtonBackward[4]) then
			  glColor(1,1,1,0.12)
			  RectRound(optionButtonBackward[1], optionButtonBackward[2], optionButtonBackward[3], optionButtonBackward[4], (optionButtonBackward[4]-optionButtonBackward[2])/8)
		  end

			if not showSelectOptions then
				for i, o in pairs(optionHover) do
					if IsOnRect(cx, cy, o[1], o[2], o[3], o[4]) and options[i].type ~= 'label' then
						glColor(1,1,1,0.055)
						RectRound(o[1]-4, o[2], o[3]+4, o[4], 4)
						if options[i].description ~= nil then
							description = options[i].description
							glText('\255\235\200\125'..options[i].description, screenX+15, screenY-screenHeight+64.5, 16, "no")
						end
					end
				end
			end
			for i, o in pairs(optionButtons) do
				if IsOnRect(cx, cy, o[1], o[2], o[3], o[4]) then
					glColor(1,1,1,0.08)
					RectRound(o[1], o[2], o[3], o[4], 2.5)
					if WG['tooltip'] ~= nil and options[i].type == 'slider' then
						local value = options[i].value
						local decimalValue, floatValue = math.modf(options[i].step)
						if floatValue ~= 0 then
							value = string.format("%."..string.len(string.sub(''..options[i].step, 3)).."f", value)	-- do rounding via a string because floats show rounding errors at times
						end
						WG['tooltip'].ShowTooltip('options_showvalue', value)
					end
				end
			end
			
			-- draw select options
			if showSelectOptions ~= nil then
				local oHeight = optionButtons[showSelectOptions][4] - optionButtons[showSelectOptions][2]
				local oPadding = 4
				y = optionButtons[showSelectOptions][4] -oPadding
				local yPos = y
				--Spring.Echo(oHeight)
				optionSelect = {}
				for i, option in pairs(options[showSelectOptions].options) do
					yPos = y-(((oHeight+oPadding+oPadding)*i)-oPadding)
				end
				glColor(0.22,0.22,0.22,0.85)
				RectRound(optionButtons[showSelectOptions][1], yPos-oHeight-oPadding, optionButtons[showSelectOptions][3], optionButtons[showSelectOptions][4], 4)
				glColor(1,1,1,0.07)
				RectRound(optionButtons[showSelectOptions][1], optionButtons[showSelectOptions][2], optionButtons[showSelectOptions][3], optionButtons[showSelectOptions][4], 4)
				for i, option in pairs(options[showSelectOptions].options) do
					yPos = y-(((oHeight+oPadding+oPadding)*i)-oPadding)
					if IsOnRect(cx, cy, optionButtons[showSelectOptions][1], yPos-oHeight-oPadding, optionButtons[showSelectOptions][3], yPos+oPadding) then
						glColor(1,1,1,0.1)
						RectRound(optionButtons[showSelectOptions][1], yPos-oHeight-oPadding, optionButtons[showSelectOptions][3], yPos+oPadding, 4)
					end
					table.insert(optionSelect, {optionButtons[showSelectOptions][1], yPos-oHeight-oPadding, optionButtons[showSelectOptions][3], yPos+oPadding, i})
					glText('\255\255\255\255'..option, optionButtons[showSelectOptions][1]+7, yPos-(oHeight/2.25)-oPadding, oHeight*0.85, "no")
				end
			end
		glPopMatrix()
	else
		if (WG['guishader_api'] ~= nil) then
			local removed = WG['guishader_api'].RemoveRect('options')
			if removed then
				--WG['guishader_api'].setBlurIntensity()
			  WG['guishader_api'].setScreenBlur(false)
			end
		end
	end
end

function applyOptionValue(i, skipRedrawWindow)
	if options[i] == nil then return end
	local id = options[i].id
	if options[i].type == 'bool' then
		local value = 0
		if options[i].value then
			value = 1
		end
		if id == 'advmapshading' then
			Spring.SendCommands("AdvMapShading "..value)
			Spring.SetConfigInt("AdvMapShading",value)
		elseif id == 'advmodelshading' then
			Spring.SendCommands("AdvModelShading "..value)
			Spring.SetConfigInt("AdvModelShading",value)
		elseif id == 'advsky' then
			Spring.SetConfigInt("AdvSky",value)
		elseif id == 'shadows' then
			Spring.SendCommands("Shadows "..value)
		elseif id == 'vsync' then
			Spring.SendCommands("Vsync "..value)
			Spring.SetConfigInt("Vsync",value)
		elseif id == 'fullscreen' then
			Spring.SendCommands("Fullscreen "..value)
			Spring.SetConfigInt("Fullscreen",value)
		elseif id == 'borderless' then
			Spring.SetConfigInt("WindowBorderless",value)
			if value == 1 then
				Spring.SetConfigInt("WindowPosX",0)
				Spring.SetConfigInt("WindowPosY",0)
				Spring.SetConfigInt("XResolutionWindowed",resolutionX)
				Spring.SetConfigInt("YResolutionWindowed",resolutionY)
				Spring.SetConfigInt("WindowState",0)
			else
				Spring.SetConfigInt("WindowPosX",0)
				Spring.SetConfigInt("WindowPosY",0)
				Spring.SetConfigInt("WindowState",1)
			end
		elseif id == 'screenedgemove' then
			Spring.SetConfigInt("FullscreenEdgeMove",value)
			Spring.SetConfigInt("WindowedEdgeMove",value)
		elseif id == 'hwcursor' then
			Spring.SendCommands("HardwareCursor "..value)
			Spring.SetConfigInt("HardwareCursor",value)
		elseif id == 'edgemovedynamic' then
			Spring.SendCommands("EdgeMoveDynamic "..value)
			Spring.SetConfigInt("EdgeMoveDynamic",value)
		elseif id == 'fpstimespeed' then
			Spring.SendCommands("fps "..value)
			Spring.SendCommands("clock "..value)
			Spring.SendCommands("speed "..value)
		elseif id == 'otaicons' then
			if value == 0 then 
				WG['OtaIcons'] = false
			else
				WG['OtaIcons'] = true
			end
		elseif id == 'allyair' then
			if value == 1 then
				WG['defrange'].enabled.ally.air = true
			else
				WG['defrange'].enabled.ally.air = false
			end
		elseif id == 'allyground' then
			if value == 1 then
				WG['defrange'].enabled.ally.ground = true
			else
				WG['defrange'].enabled.ally.ground = false
			end
		elseif id == 'allynuke' then
			if value == 1 then
				WG['defrange'].enabled.ally.nuke = true
			else
				WG['defrange'].enabled.ally.nuke = false
			end
		elseif id == 'enemyair' then
			if value == 1 then
				WG['defrange'].enabled.enemy.air = true
			else
				WG['defrange'].enabled.enemy.air = false
			end
		elseif id == 'enemyground' then
			if value == 1 then
				WG['defrange'].enabled.enemy.ground = true
			else
				WG['defrange'].enabled.enemy.ground = false
			end
		elseif id == 'enemynuke' then
			if value == 1 then
				WG['defrange'].enabled.enemy.nuke = true
			else
				WG['defrange'].enabled.enemy.nuke = false
			end
		elseif id == 'darkenmap_darkenfeatures' then
			WG['darkenmap'].setDarkenFeatures(options[i].value)
		elseif id == 'smartselect_includebuildings' then
			WG['smartselect'].setIncludeBuildings(options[i].value)
		elseif id == 'lighteffects' then
			if value ~= 0 then
				if widgetHandler.orderList["Deferred rendering"] ~= nil then
					widgetHandler:EnableWidget("Deferred rendering")
				end
				widgetHandler:EnableWidget("Light Effects")
			else
				if widgetHandler.orderList["Deferred rendering"] ~= nil then
					widgetHandler:DisableWidget("Deferred rendering")
				end
				widgetHandler:DisableWidget("Light Effects")
			end
		end
		
		if options[i].widget ~= nil then
			if value ~= 0 then
				if id == 'bloom' or id == 'guishader' or id == 'xrayshader' or id == 'snow' or id == 'mapedgeextensions' then
					if luaShaders ~= 1 and not enabledLuaShaders then
						Spring.SetConfigInt("ForceShaders", 1)
						enabledLuaShaders = true
					end
				end
				widgetHandler:EnableWidget(options[i].widget)
			else
				widgetHandler:DisableWidget(options[i].widget)
			end
			if id == "teamcolors" then
      	Spring.SendCommands("luarules reloadluaui")	-- cause several widgets are still using old colors
			end
		end
	
	elseif options[i].type == 'slider' then
		local value =  options[i].value
		if id == 'fsaa' then
			Spring.SetConfigInt("FSAALevel",value)
		elseif id == 'shadowslider' then
			local enabled = 1
			if value == options[i].min then 
				enabled = 0
			end
			Spring.SendCommands("shadows "..enabled.." "..value)
			Spring.SetConfigInt("shadows", value)
		elseif id == 'windowposx' then
			Spring.SetConfigInt("WindowPosX ", value)
		elseif id == 'windowposy' then
			Spring.SetConfigInt("WindowPosY ", value)
		elseif id == 'windowresx' then
			Spring.SetConfigInt("XResolutionWindowed ", value)
		elseif id == 'windowresy' then
			Spring.SetConfigInt("YResolutionWindowed ", value)
		elseif id == 'decals' then
			Spring.SetConfigInt("GroundDecals", value)
			Spring.SendCommands("GroundDecals "..value)
		elseif id == 'scrollspeed' then
			Spring.SetConfigInt("ScrollWheelSpeed",value)
		elseif id == 'disticon' then
			--Spring.SetConfigInt("UnitIconDist "..value)
			Spring.SendCommands("disticon "..value)
		elseif id == 'treeradius' then
			Spring.SetConfigInt("TreeRadius",value)
		elseif id == 'particles' then
			Spring.SetConfigInt("MaxParticles",value)
		elseif id == 'nanoparticles' then
			Spring.SetConfigInt("MaxNanoParticles",value)
		elseif id == 'grassdetail' then
			Spring.SetConfigInt("GrassDetail",value)
		elseif id == 'edgemovewidth' then
			Spring.SetConfigInt("EdgeMoveWidth", value)
			Spring.SendCommands("EdgeMoveWidth "..value)
		elseif id == 'grounddetail' then
			Spring.SetConfigInt("GroundDetail", value)
			Spring.SendCommands("grounddetail "..value)
		elseif id == 'sndvolmaster' then
			Spring.SetConfigInt("snd_volmaster", value)
		elseif id == 'sndvolbattle' then
			Spring.SetConfigInt("snd_volbattle", value)
		elseif id == 'sndvoui' then
			Spring.SetConfigInt("snd_volui", value)
		elseif id == 'sndvolunitreply' then
			Spring.SetConfigInt("snd_volunitreply", value)
		elseif id == 'sndvolmusic' then
			Spring.SetConfigInt("snd_volmusic", value)
		elseif id == 'crossalpha' then
			Spring.SendCommands("cross "..tonumber(Spring.GetConfigInt("CrossSize",1) or 10).." "..value)
			Spring.SetConfigInt("CrossAlpha", value)
		elseif id == 'darkenmap' then
			WG['darkenmap'].setMapDarkness(value)
		elseif id == 'uibgcolor' then
			if value <= 0.4 then
				WG["background_opacity_custom"][4] = WG["background_color"]
			else
				WG["background_opacity_custom"][4] = (value)
			end
		elseif id == 'musicvolume' then
			Spring.SetSoundStreamVolume(value)
			WG["music_volume"] = value
		elseif id == 'highlightselunits_opacity' then
			WG['highlightselunits'].setOpacity(value)
		elseif id == 'bloom' then
			if value > 0 then
				widgetHandler:EnableWidget(options[i].widget)
				if luaShaders ~= 1 and not enabledLuaShaders then
					Spring.SetConfigInt("ForceShaders", 1)
					enabledLuaShaders = true
				end
			end
			if value == 1 then
				WG['bloom'].setAdvBloom(false)
			elseif value == 2 then
				WG['bloom'].setAdvBloom(true)
			else
				widgetHandler:DisableWidget(options[i].widget)
			end
		end
		
	elseif options[i].type == 'select' then
		local value =  options[i].value
		if id == 'preset' then
			Spring.Echo('Loading preset:   '..options[i].options[value])
			options[i].value = 0
			loadPreset(presetNames[value])
		elseif id == 'mapedgeextensions' then
			if options[i].options[value] == 'VR Grid' then
				widgetHandler:EnableWidget("Map External VR Grid")
				widgetHandler:DisableWidget("Map Edge Extension")
			elseif options[i].options[value] == 'Map' then
				widgetHandler:EnableWidget("Map Edge Extension")
				widgetHandler:DisableWidget("Map External VR Grid")
			else
				widgetHandler:DisableWidget("Map External VR Grid")
				widgetHandler:DisableWidget("Map Edge Extension")
			end
		elseif id == 'water' then
			Spring.SendCommands("water "..(value-1))
		elseif id == 'camera' then
			Spring.SetConfigInt("CamMode",(value-1))
			if value == 1 then 
				Spring.SendCommands('viewfps')
			elseif value == 2 then 
				Spring.SendCommands('viewta')
			elseif value == 3 then 
				Spring.SendCommands('viewspring')
			elseif value == 4 then 
				Spring.SendCommands('viewrot')
			elseif value == 5 then 
				Spring.SendCommands('viewfree')
			end
		elseif id == 'cursor' then
			WG['cursors'].setcursor(options[i].options[value])
		end
	end
	if skipRedrawWindow == nil then
		if windowList then gl.DeleteList(windowList) end
		windowList = gl.CreateList(DrawWindow)
	end
end


function loadPreset(preset)
	for optionID, value in pairs(presets[preset]) do
		local i = getOptionByID(optionID)
		if options[i] ~= nil then
			options[i].value = value
			applyOptionValue(i, true)
		end
	end

	if windowList then gl.DeleteList(windowList) end
	windowList = gl.CreateList(DrawWindow)
end


function widget:KeyPress(key)
	if key == 27 then	-- ESC
		show = false
	end
end

function IsOnRect(x, y, BLcornerX, BLcornerY,TRcornerX,TRcornerY)
	
	-- check if the mouse is in a rectangle
	return x >= BLcornerX and x <= TRcornerX
	                      and y >= BLcornerY
	                      and y <= TRcornerY
end

function widget:IsAbove(x, y)
	-- on window
	if show then
		local rectX1 = ((screenX-bgMargin) * widgetScale) - ((vsx * (widgetScale-1))/2)
		local rectY1 = ((screenY+bgMargin) * widgetScale) - ((vsy * (widgetScale-1))/2)
		local rectX2 = ((screenX+screenWidth+bgMargin) * widgetScale) - ((vsx * (widgetScale-1))/2)
		local rectY2 = ((screenY-screenHeight-bgMargin) * widgetScale) - ((vsy * (widgetScale-1))/2)
		return IsOnRect(x, y, rectX1, rectY2, rectX2, rectY1)
	else
		return false
	end
end

function widget:GetTooltip(mx, my)
	if show and widget:IsAbove(mx,my) then
		return string.format(
			"")
	end
end

function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    if num >= 0 then return math.floor(num * mult + 0.5) / mult
    else return math.ceil(num * mult - 0.5) / mult end
end

function getSliderValue(draggingSlider, cx)
	local sliderWidth = optionButtons[draggingSlider].sliderXpos[2] - optionButtons[draggingSlider].sliderXpos[1]
	local value = (cx - optionButtons[draggingSlider].sliderXpos[1]) / sliderWidth
	value = options[draggingSlider].min + ((options[draggingSlider].max - options[draggingSlider].min) * value)
	if value < options[draggingSlider].min then value = options[draggingSlider].min end
	if value > options[draggingSlider].max then value = options[draggingSlider].max end
	if options[draggingSlider].step ~= nil then
		value = math.floor(value / options[draggingSlider].step) * options[draggingSlider].step
	end
	return value	-- is a string now :(
end

function widget:MouseWheel(up, value)
	local x,y = Spring.GetMouseState()
	local cx, cy = correctMouseForScaling(x,y)
	if show then	
		return true
	end
end

function widget:MouseMove(x, y)
	if draggingSlider ~= nil then
		local cx, cy = correctMouseForScaling(x,y)
		options[draggingSlider].value = getSliderValue(draggingSlider,cx)
		sliderValueChanged = true
		applyOptionValue(draggingSlider)
	end
end

function widget:MousePress(x, y, button)
	return mouseEvent(x, y, button, false)
end

function widget:MouseRelease(x, y, button)
	return mouseEvent(x, y, button, true)
end

function mouseEvent(x, y, button, release)
	if spIsGUIHidden() then return false end

	if show then
		local cx, cy = correctMouseForScaling(x,y)
  
		if release then

			-- navigation buttons
			if optionButtonForward ~=nil and IsOnRect(cx, cy, optionButtonForward[1], optionButtonForward[2], optionButtonForward[3], optionButtonForward[4]) then
				startColumn = startColumn + maxShownColumns
				if startColumn > totalColumns + (maxShownColumns-1) then
					startColumn = (totalColumns-maxShownColumns) + 1
				end
				if windowList then gl.DeleteList(windowList) end
				windowList = gl.CreateList(DrawWindow)
				return
			end
			if optionButtonBackward ~= nil and IsOnRect(cx, cy, optionButtonBackward[1], optionButtonBackward[2], optionButtonBackward[3], optionButtonBackward[4]) then
				startColumn = startColumn - maxShownColumns
				if startColumn < 1 then startColumn = 1 end
				if windowList then gl.DeleteList(windowList) end
				windowList = gl.CreateList(DrawWindow)
				return
			end

		 	-- apply new slider value
			if draggingSlider ~= nil then
				options[draggingSlider].value = getSliderValue(draggingSlider,cx)
				applyOptionValue(draggingSlider)
				draggingSlider = nil
				return
			end
			
			-- select option
			if showSelectOptions ~= nil then
				for i, o in pairs(optionSelect) do
					if IsOnRect(cx, cy, o[1], o[2], o[3], o[4]) then
						options[showSelectOptions].value = o[5]
						applyOptionValue(showSelectOptions)
					end
				end
				if selectClickAllowHide ~= nil or not IsOnRect(cx, cy, optionButtons[showSelectOptions][1], optionButtons[showSelectOptions][2], optionButtons[showSelectOptions][3], optionButtons[showSelectOptions][4]) then
					showSelectOptions = nil
					selectClickAllowHide = nil
				else
					selectClickAllowHide = true
				end
				return
			end
		end
		
		-- on window
		local rectX1 = ((screenX-bgMargin) * widgetScale) - ((vsx * (widgetScale-1))/2)
		local rectY1 = ((screenY+bgMargin) * widgetScale) - ((vsy * (widgetScale-1))/2)
		local rectX2 = ((screenX+screenWidth+bgMargin) * widgetScale) - ((vsx * (widgetScale-1))/2)
		local rectY2 = ((screenY-screenHeight-bgMargin) * widgetScale) - ((vsy * (widgetScale-1))/2)
		if IsOnRect(x, y, rectX1, rectY2, rectX2, rectY1) then
			
			
			if release then
			
				-- select option
				if showSelectOptions == nil then
					if showPresetButtons then
						for preset, pp in pairs(presets) do
							if IsOnRect(cx, cy, pp.pos[1], pp.pos[2], pp.pos[3], pp.pos[4]) then
								loadPreset(preset)
							end
						end
					end
						
					for i, o in pairs(optionButtons) do
						if options[i].type == 'bool' and IsOnRect(cx, cy, o[1], o[2], o[3], o[4]) then
							options[i].value = not options[i].value
							applyOptionValue(i)
						elseif options[i].type == 'slider' and IsOnRect(cx, cy, o[1], o[2], o[3], o[4]) then
						
						elseif options[i].type == 'select' and IsOnRect(cx, cy, o[1], o[2], o[3], o[4]) then
							
						end
					end
				end
			else -- mousepress
				if not showSelectOptions then
					for i, o in pairs(optionButtons) do
						if options[i].type == 'slider' and (IsOnRect(cx, cy, o.sliderXpos[1], o[2], o.sliderXpos[2], o[4]) or IsOnRect(cx, cy, o[1], o[2], o[3], o[4])) then
							draggingSlider = i
							options[draggingSlider].value = getSliderValue(draggingSlider,cx)
							applyOptionValue(draggingSlider)
						elseif options[i].type == 'select' and IsOnRect(cx, cy, o[1], o[2], o[3], o[4]) then
							if showSelectOptions == nil then
								showSelectOptions = i
							elseif showSelectOptions == i then
								--showSelectOptions = nil
							end
						end
					end
				end
			end
			--[[ on close button
			local brectX1 = rectX2 - ((closeButtonSize+bgMargin+bgMargin) * widgetScale)
			local brectY2 = rectY1 - ((closeButtonSize+bgMargin+bgMargin) * widgetScale)
			if IsOnRect(x, y, brectX1, brectY2, rectX2, rectY1) then
				if release then
					showOnceMore = true		-- show once more because the guishader lags behind, though this will not fully fix it
					show = not show
				end
				return true
			end]]--
			
			if button == 1 or button == 3 then
				return true
			end
		elseif titleRect == nil or not IsOnRect(x, y, (titleRect[1] * widgetScale) - ((vsx * (widgetScale-1))/2), (titleRect[2] * widgetScale) - ((vsy * (widgetScale-1))/2), (titleRect[3] * widgetScale) - ((vsx * (widgetScale-1))/2), (titleRect[4] * widgetScale) - ((vsy * (widgetScale-1))/2)) then
			if release and draggingSlider == nil then
				showOnceMore = true		-- show once more because the guishader lags behind, though this will not fully fix it
				show = false
			end
			return true
		end
		
		if show then
			if windowList then gl.DeleteList(windowList) end
			windowList = gl.CreateList(DrawWindow)
		end
		
  end
end


function widget:Initialize()

	WG['options'] = {}
	WG['options'].toggle = function(state)
		if state ~= nil then
			show = state
		else
			show = not show
		end
	end
	
	-- get widget list
  for name,data in pairs(widgetHandler.knownWidgets) do
		fullWidgetsList[name] = data
  end

	--local bloomValue = 0
	
	-- if you want to add an option it should be added here, and in applyOptionValue(), if option needs shaders than see the code below the options definition
	optionGroups = {
		{id='preset', name='Preset'},
		{id='gfx', name='Graphics'},
		{id='snd', name='Sound'},
		{id='control', name='Control'},
		{id='ui', name='Interface'},
		{id='game', name='Game'},
		{id='dr', name='Defenisve Range'},
	}
	options = {
		-- PRESET
		{id="preset", group="preset", name="Load graphics preset", type="select", options=presetNames, value=0, description='Loads a preset.\n\nIt wont set the preset every time you restart a game. So feel free to adjust things.'},

		--GFX
		--{id="windowposx", group="gfx", name="Window position X", type="slider", min=0, max=math.ceil(ssx/3), step=1, value=tonumber(Spring.GetConfigInt("WindowPosX",1) or 0), description='Set where on the screen the window is positioned on the X axis'},
		--{id="windowposy", group="gfx", name="Window position Y", type="slider", min=0, max=math.ceil(ssy/3), step=1, value=tonumber(Spring.GetConfigInt("WindowPosY",1) or 0), description='Set where on the screen the window is positioned on the Y axis'},
		--{id="windowresx", group="gfx", name="Window resolution X", type="slider", min=math.floor(ssx/3), max=ssx, step=1, value=tonumber(Spring.GetConfigInt("XResolutionWindowed",1) or 0), description='Set where on the screen the window is positioned on the X axis'},
		--{id="windowresy", group="gfx", name="Window resolution Y", type="slider", min=math.floor(ssy/3), max=ssy, step=1, value=tonumber(Spring.GetConfigInt("YResolutionWindowe",1) or 0), description='Set where on the screen the window is positioned on the Y axis'},
		{id="fullscreen", group="gfx", name="Fullscreen", type="bool", value=tonumber(Spring.GetConfigInt("Fullscreen",1) or 1) == 1},
		{id="borderless", group="gfx", name="Borderless window", type="bool", value=tonumber(Spring.GetConfigInt("WindowBorderless",1) or 1) == 1, description="Changes will be applied next game.\n\n(dont forget to turn off the \'fullscreen\' option next game)"},
		{id="vsync", group="gfx", name="V-sync", type="bool", value=tonumber(Spring.GetConfigInt("Vsync",1) or 1) == 1, description=''},
		{id="fsaa", group="gfx", name="Anti Aliasing", type="slider", min=0, max=16, step=1, value=tonumber(Spring.GetConfigInt("FSAALevel",1) or 2), description='Changes will be applied next game'},
		{id="advmapshading", group="gfx", name="Advanced map shading", type="bool", value=tonumber(Spring.GetConfigInt("AdvMapShading",1) or 1) == 1, description='When disabled: map shadows aren\'t rendered as well'},
		{id="advmodelshading", group="gfx", name="Advanced model shading", type="bool", value=tonumber(Spring.GetConfigInt("AdvModelShading",1) or 1) == 1},
		
		-- only one of these shadow options are shown, depending if "Shadow Quality Manager" widget is active
		{id="shadows", group="gfx", name="Shadows", type="bool", value=tonumber(Spring.GetConfigInt("Shadows",1) or 1) == 1, description='Shadow detail is currently controlled by "Shadow Quality Manager" widget\n...this widget will auto reduce detail when fps gets low.\n\nShadows requires "Advanced map shading" option to be enabled'},
		{id="shadowslider", group="gfx", name="Shadows", type="slider", min=1500, max=6000, step=500, value=tonumber(Spring.GetConfigInt("ShadowMapSize",1) or 2000), description='Set shadow detail\nSlider positioned the very left means shadows will be disabled\n\nShadows requires "Advanced map shading" option to be enabled'},

		--{id="bloom", group="gfx", widget="Bloom Shader", name="Bloom shader", type="bool", value=widgetHandler.orderList["Bloom Shader"] ~= nil and (widgetHandler.orderList["Bloom Shader"] > 0), description='Bloom will make the map and units glow'},
		{id="bloom", group="gfx", widget="Bloom Shader", name="Bloom shader", type="slider", min=0, max=2, step=1, value=0, description='Bloom will make the map and units glow\n\nSetting the slider all the way will stress your GPU more'},
		{id="decals", group="gfx", name="Ground decals", type="slider", min=0, max=5, step=1, value=tonumber(Spring.GetConfigInt("GroundDecals",1) or 1), description='Set how long map decals will stay.\n\nDecals are ground scars, footsteps/tracks and shading under buildings'},
		{id="guishader", group="gfx", widget="GUI-Shader", name="GUI blur shader", type="bool", value=widgetHandler.orderList["GUI-Shader"] ~= nil and (widgetHandler.orderList["GUI-Shader"] > 0), description='Blurs the world under every user interface element\n\nIntel Graphics have trouble with this'},

		{id="mapedgeextensions", group="gfx", name="Map Edge Extensions", type="select", options=mapExt, value=0, description='Select from the various map edge extensions\n\nEnable shaders for best result'},

		{id="water", group="gfx", name="Water type", type="select", options={'basic','reflective','dynamic','reflective&refractive','bump-mapped'}, value=(tonumber(Spring.GetConfigInt("Water",1) or 1)+1)},
		{id="lups", group="gfx", widget="LupsManager", name="Lups particle/shader effects", type="bool", value=widgetHandler.orderList["LupsManager"] ~= nil and (widgetHandler.orderList["LupsManager"] > 0), description='Toggle unit particle effects: jet beams, ground flashes, fusion energy balls'},
		{id="xrayshader", group="gfx", widget="XrayShader", name="Unit xray shader", type="bool", value=widgetHandler.orderList["XrayShader"] ~= nil and (widgetHandler.orderList["XrayShader"] > 0), description='Highlights all units, highlight effect dissolves on close camera range.\n\nFades out and disables at low fps\nWorks less on dark teamcolors'},
		{id="outline", group="gfx", widget="Outline", name="Unit Outline (tiny)", type="bool", value=widgetHandler.orderList["Outline"] ~= nil and (widgetHandler.orderList["Outline"] > 0), description='Adds a small outline to all units which makes them crisp\n\nLimits total outlined units to 1200.\nStops rendering outlines when average fps falls below 13.'},
		{id="particles", group="gfx", name="Max particles", type="slider", min=5000, max=25000, step=100, value=tonumber(Spring.GetConfigInt("MaxParticles",1) or 1000), description='Particles used for explosions, smoke, fire and missiletrails\n\nSetting a low value will mean that various effects wont show properly'},
		{id="nanoparticles", group="gfx", name="Max nano particles", type="slider", min=500, max=5000, step=100, value=tonumber(Spring.GetConfigInt("MaxNanoParticles",1) or 500), description='NOTE: Nano particles are more expensive regarding the CPU'},
		{id="grounddetail", group="gfx", name="Ground mesh detail", type="slider", min=50, max=200, step=10, value=tonumber(Spring.GetConfigInt("GroundDetail",1) or 60), description='Ground geometry mesh detail'},
		{id="grassdetail", group="gfx", name="Grass", type="slider", min=0, max=10, step=1, value=tonumber(Spring.GetConfigInt("GrassDetail",1) or 5), description='Amount of grass rendered\n\nChanges will be applied next game'},
		{id="treeradius", group="gfx", name="Tree render distance", type="slider", min=0, max=2000, step=50, value=tonumber(Spring.GetConfigInt("TreeRadius",1) or 1000), description='Applies to SpringRTS engine default trees\n\nChanges will be applied next game'},
		{id="advsky", group="gfx", name="Advanced sky", type="bool", value=tonumber(Spring.GetConfigInt("AdvSky",1) or 1) == 1, description='Enables high resolution clouds\n\nChanges will be applied next game'},
		{id="snow", group="gfx", widget="Snow", name="Snow", type="bool", value=widgetHandler.orderList["Snow"] ~= nil and (widgetHandler.orderList["Snow"] > 0), description='Snows at winter maps, auto reduces amount when fps gets lower and unitcount higher\n\nUse /snow to toggle snow for current map (it remembers)'},

		{id="edgemovedynamic", group="gfx", name="EdgeMove scrolling area", type="bool", value=tonumber(Spring.GetConfigInt("EdgeMoveDynamic",1) or 1) == 1},
		{id="edgemovewidth", group="gfx", name="EdgeMove scrolling speed", type="slider", min=0, max=2, step=0.02, value=tonumber(Spring.GetConfigInt("EdgeMoveWidth",1) or 2), description='Changes will be applied next game'},

		-- SND
		{id="sndvolmaster", group="snd", name="Master volume", type="slider", min=0, max=200, step=10, value=tonumber(Spring.GetConfigInt("snd_volmaster",1) or 100)},
		{id="musicplayer", group="snd", widget="Music Player", name="Music Player", type="bool", value=widgetHandler.orderList["Music Player"] ~= nil and (widgetHandler.orderList["Music Player"] > 0), description='Plays music based on situation'},
		{id="musicvolume", group="snd", name="Music Volume", type="slider", min=0, max=1, step=0.01, value=WG["music_volume"] or 0.4},

		--{id="sndvolbattle", group="snd", name="Battle volume", type="slider", min=0, max=200, step=10, value=tonumber(Spring.GetConfigInt("snd_volbattle",1) or 100)},
		--{id="sndvolui", group="snd", name="Interface volume", type="slider", min=0, max=200, step=10, value=tonumber(Spring.GetConfigInt("snd_volui",1) or 100)},
		--{id="sndvolunitreply", group="snd", name="Unit reply volume", type="slider", min=0, max=200, step=10, value=tonumber(Spring.GetConfigInt("snd_volunitreply",1) or 100)},
		--{id="sndvolmusic", group="snd", name="Music volume", type="slider", min=0, max=200, step=10, value=tonumber(Spring.GetConfigInt("snd_volmusic",1) or 100)},

		-- CONTROL
		{id="camera", group="control", name="Camera", type="select", options={'fps','overhead','spring','rot overhead','free'}, value=(tonumber((Spring.GetConfigInt("CamMode",1)+1) or 2))},
		{id="camerashake", group="control", widget="CameraShake", name="Camera shake", type="bool", value=widgetHandler.orderList["CameraShake"] ~= nil and (widgetHandler.orderList["CameraShake"] > 0), description='Shakes camera on explosions'},
		{id="scrollspeed", group="control", name="Zoom direction/speed", type="slider", min=-45, max=45, step=5, value=tonumber(Spring.GetConfigInt("ScrollWheelSpeed",1) or 25), description='Leftside of the slider means inversed scrolling direction!\nNOTE: Having the slider centered means no mousewheel zooming at all!\n\nChanges will be applied next game'},

		{id="hwcursor", group="control", name="Hardware cursor", type="bool", value=tonumber(Spring.GetConfigInt("hardwareCursor",1) or 1) == 1, description="When disabled: the mouse cursor refresh rate will be the same as your ingame fps"},
		{id="crossalpha", group="control", name="Mouse cross alpha", type="slider", min=0, max=1, step=0.05, value=tonumber(Spring.GetConfigInt("CrossAlpha",1) or 1), description='Opacity of mouse icon in center of screen when you are in camera pan mode\n\n(The\'icon\' has a dot in center with 4 arrows pointing in all directions)'},
		{id="screenedgemove", group="control", name="Screen edge moves camera", type="bool", value=tonumber(Spring.GetConfigInt("FullscreenEdgeMove",1) or 1) == 1, description="If mouse is close to screen edge this will move camera\n\nChanges will be applied next game"},

		-- UI
		{id="disticon", group="ui", name="Unit icon distance", type="slider", min=0, max=800, step=50, value=tonumber(Spring.GetConfigInt("UnitIconDist",1) or 800)},
		{id="teamcolors", group="ui", widget="Player Color Palette", name="Team colors based on a palette", type="bool", value=widgetHandler.orderList["Player Color Palette"] ~= nil and (widgetHandler.orderList["Player Color Palette"] > 0), description='Replaces lobby team colors for a color palette based one\n\nNOTE: reloads all widgets because these need to update their teamcolors'},

		{id="uibgcolor", group="ui", name="UI background opacity", type="slider", min=0.40, max=1, step=0.001, value=WG["background_opacity_custom"][4] or 0.69, description='Adjust Darkness of UI background'},

		--{id="fancyselunits", group="gfx", widget="Fancy Selected Units", name="Fancy Selected Units", type="bool", value=widgetHandler.orderList["Fancy Selected Units"] ~= nil and (widgetHandler.orderList["Fancy Selected Units"] > 0), description=''},

		--{id="fpstimespeed", group="ui", name="Display FPS, GameTime and Speed", type="bool", value=tonumber(Spring.GetConfigInt("ShowFPS",1) or 1) == 1, description='Located at the top right of the screen\n\nIndividually toggle them with /fps /clock /speed'},
		{id="fpstimespeed-widget", group="ui", widget="AdvPlayersList info", name="Time/speed/fps on top of playerlist", type="bool", value=widgetHandler.orderList["AdvPlayersList info"] ~= nil and (widgetHandler.orderList["AdvPlayersList info"] > 0), description='Shows time, gamespeed and fps on top of the (adv)playerslist'},

		{id="displaydps", group="ui", widget="Display DPS", name="Display DPS", type="bool", value=widgetHandler.orderList["Display DPS"] ~= nil and (widgetHandler.orderList["Display DPS"] > 0), description='Display the \'Damage Per Second\' done where target are hit'},

		{id="idlebuilders", group="ui", widget="Idle Builders", name="Display idle builders", type="bool", value=widgetHandler.orderList["Idle Builders"] ~= nil and (widgetHandler.orderList["Idle Builders"] > 0), description='Displays a row containing a list of idle builder units (if there are any)'},

		{id="teamplatter", group="ui", widget="TeamPlatter", name="Unit team platters", type="bool", value=widgetHandler.orderList["TeamPlatter"] ~= nil and (widgetHandler.orderList["TeamPlatter"] > 0), description='Shows a team color platter above all visible units'},
		


		{id="pausescreen", group="ui", widget="Pause Screen", name="Show pause screen", type="bool", value=widgetHandler.orderList["Pause Screen"] ~= nil and (widgetHandler.orderList["Pause Screen"] > 0), description='Displays an overlay when the game is paused'},
		{id="commandsfx", group="ui", widget="Commands FX", name="Unit command FX", type="bool", value=widgetHandler.orderList["Commands FX"] ~= nil and (widgetHandler.orderList["Commands FX"] > 0), description='Shows unit target lines when you give orders\n\nThe commands from your teammates are shown as well'},

		--{id="givenunits", group="ui", widget="Given Units", name="Given units icons", type="bool", value=widgetHandler.orderList["Given Units"] ~= nil and (widgetHandler.orderList["Given Units"] > 0), description='Tags given units with \'new\' icon'},
		--{id="resurrectionhalos", group="ui", widget="Resurrection Halos", name="Resurrected unit halos", type="bool", value=widgetHandler.orderList["Resurrection Halos"] ~= nil and (widgetHandler.orderList["Resurrection Halos"] > 0), description='Gives units have have been resurrected a little halo above it.'},
		--{id="rankicons", group="ui", widget="Rank Icons", name="Unit rank icons", type="bool", value=widgetHandler.orderList["Rank Icons"] ~= nil and (widgetHandler.orderList["Rank Icons"] > 0), description='Shows a rank icon depending on experience next to units'},

		-- GAME
		{id="autoquit", group="game", widget="Autoquit", name="Auto quit", type="bool", value=widgetHandler.orderList["Autoquit"] ~= nil and (widgetHandler.orderList["Autoquit"] > 0), description='Automatically quits after the game ends.\n...unless the mouse has been moved within a few seconds.'},
		{id="onlyfighterspatrol", group="game", widget="OnlyFightersPatrol", name="Only fighters patrol", type="bool", value=widgetHandler.orderList["Autoquit"] ~= nil and (widgetHandler.orderList["OnlyFightersPatrol"] > 0), description='Only fighters obey a factory\'s patrol route after leaving airlab.'},
		{id="fightersfly", group="game", widget="Set fighters on Fly mode", name="Set fighters on Fly mode", type="bool", value=widgetHandler.orderList["Set fighters on Fly mode"] ~= nil and (widgetHandler.orderList["Set fighters on Fly mode"] > 0), description='Setting fighters on Fly mode when created'},
		{id="passivebuilders", group="game", widget="Passive builders", name="Passive builders", type="bool", value=widgetHandler.orderList["Passive builders"] ~= nil and (widgetHandler.orderList["Passive builders"] > 0), description='Sets builders (nanos, labs and cons) on passive mode\n\nPassive mode means that builders will only spend energy when its availible.\nUsage: You could set your most important builders on active and leave the rest on passive'},
		--{id="factoryguard", group="game", widget="FactoryGuard", name="Factory guard (builders)", type="bool", value=widgetHandler.orderList["FactoryGuard"] ~= nil and (widgetHandler.orderList["FactoryGuard"] > 0), description='Newly created builders will assist their source factory'},
		{id="factoryholdpos", group="game", widget="Factory hold position", name="Factory hold position", type="bool", value=widgetHandler.orderList["Factory hold position"] ~= nil and (widgetHandler.orderList["Factory hold position"] > 0), description='Sets new factories, and all units they build, to hold position automatically (not aircraft)'},
		{id="factoryrepeat", group="game", widget="Factory Auto-Repeat", name="Factory auto-repeat", type="bool", value=widgetHandler.orderList["Factory Auto-Repeat"] ~= nil and (widgetHandler.orderList["Factory Auto-Repeat"] > 0), description='Sets new factories on Repeat mode'},
		--{id="transportai", group="game", widget="Transport AI", name="Transport AI", type="bool", value=widgetHandler.orderList["Transport AI"] ~= nil and (widgetHandler.orderList["Transport AI"] > 0), description='Transport units automatically pick up new units going to factory waypoint.'},
		{id="settargetdefault", group="game", widget="Set target default", name="Set-target as default", type="bool", value=widgetHandler.orderList["Set target default"] ~= nil and (widgetHandler.orderList["Set target default"] > 0), description='Replace default attack command to a set-target command\n(when rightclicked on enemy unit)'},
		{id="blacklily", group="game", widget="unit_blacklily_auto_cloak", name="Blacklily Auto Cloak", type="bool", value=widgetHandler.orderList["unit_blacklily_auto_cloak"] ~= nil and (widgetHandler.orderList["unit_blacklily_auto_cloak"] > 0), description='Enabled cloak on attack or fight command'},

		--Defensive Range Options
		{id="allyair", group="dr", name="Ally Air", type="bool", WG['defrange'].enabled.ally.air or false, description='Show Range For Ally Air'},
		{id="allyground", group="dr", name="Ally Ground", type="bool", WG['defrange'].enabled.ally.ground or false, description='Show Range For Ally Ground'},
		{id="allynuke", group="dr", name="Ally Nuke", type="bool", WG['defrange'].enabled.ally.nuke or false, description='Show Range For Ally Air Nuke'},
		{id="enemyair", group="dr", name="Enemy Air", type="bool", value=WG['defrange'].enabled.enemy.air or false, description='Show Range For Enemy Air'},
		{id="enemyground", group="dr", name="Enemy Ground", type="bool", value=WG['defrange'].enabled.enemy.ground or false, description='Show Range For Enemy Ground'},
		{id="enemynuke", group="dr", name="Enemy Nuke", type="bool", value=WG['defrange'].enabled.enemy.nuke or false, description='Show Range For Enemy Nuke'},
	}


	-- not sure if needed: remove vsync option when its dont by monitor (freesync/gsync) -> config value is set as 'x'
	if Spring.GetConfigInt("Vsync",1) == 'x' then
		options[getOptionByID('vsync')] = nil
	end

	local processedOptions = {}
	local insert = true
	for oid,option in pairs(options) do
		insert = true
		if option.type == 'slider' then
			if option.value < option.min then option.value = option.min end
			if option.value > option.max then option.value = option.max end
		end
		if option.id == "shadows" and (fullWidgetsList["Shadow Quality Manager"] == nil or (widgetHandler.orderList["Shadow Quality Manager"] == 0)) then
			insert = false
		end
		if option.id == "shadowslider" and fullWidgetsList["Shadow Quality Manager"] ~= nil and (widgetHandler.orderList["Shadow Quality Manager"] > 0) then
			insert = false
		end
		if option.widget ~= nil and fullWidgetsList[option.widget] == nil then
			insert = false
		end
		if luaShaders ~= 1 then
			if option.id == "advmapshading" or option.id == "advmodelshading" or option.id == "bloom" or option.id == "guishader" or option.id == "xrayshader" or option.id == "mapedgeextensions" or option.id == "snow" then
				option.description = 'You dont have shaders enabled, we will enable it for you but...\n\nChanges will be applied next game'
			end
		end
		if insert then
			table.insert(processedOptions, option)
		end
	end
	options = processedOptions
end

function widget:Shutdown()
    if windowList then
        glDeleteList(windowList)
    end
end
function widget:GetInfo()
	return {
	version   = "8",
	name      = "Red_Drawing",
	desc      = "Drawing widget for Red UI Framework",
	author    = "Regret",
	date      = "July 29, 2009", --last change August 29,2009
	license   = "GNU GPL, v2 or later",
	layer     = 0,
	enabled   = true,
	}
end

local TN = "Red_Drawing" --WG name for function list
local version = 8

local vsx,vsy = widgetHandler:GetViewSizes()
if (vsx == 1) then --hax for windowed mode
	vsx,vsy = Spring.GetWindowGeometry()
end


local minimapbrightness = nil
local update = 0.5

local sIsGUIHidden = Spring.IsGUIHidden

local F = {} --function table
local Todo = {} --function queue
local StartList

local glText = gl.Text
local glTexture = gl.Texture
local glColor = gl.Color
local glRect = gl.Rect
local glTexRect = gl.TexRect
local glMatrixMode = gl.MatrixMode
local glLoadIdentity = gl.LoadIdentity
local glOrtho = gl.Ortho
local glTranslate = gl.Translate
local glResetState = gl.ResetState
local glResetMatrices = gl.ResetMatrices
local glDepthTest = gl.DepthTest
local glVertex = gl.Vertex
local glBeginEnd = gl.BeginEnd
local glCallList = gl.CallList
local glDeleteList = gl.DeleteList
local glCreateList = gl.CreateList
local glPushMatrix = gl.PushMatrix
local glPopMatrix = gl.PopMatrix
local glScale = gl.Scale


local GL_LINE_LOOP = GL.LINE_LOOP
local GL_COLOR_BUFFER_BIT = GL.COLOR_BUFFER_BIT
local GL_PROJECTION = GL.PROJECTION
local GL_MODELVIEW = GL.MODELVIEW

local function Color(c)
	glColor(c[1],c[2],c[3],c[4])
end

local function Text(px,py,fontsize,text,options,c)
	glPushMatrix()
	if (c) then
		glColor(c[1],c[2],c[3],c[4])
	else
		glColor(1,1,1,1)
	end
	glTranslate(px,py+fontsize,0)
	if (options) then
		options = options.."d" --fuck you jK
	else
		options = "d"
	end
	glScale(1,-1,1) --flip
	glText(text,0,0,fontsize,options)
	glPopMatrix()
end

local function Border(px,py,sx,sy,width,c)
	if (width == nil) then
		width = 1
	elseif (width == 0) then
		return
	end
	if (c) and c[4] == 0 then
		--Spring.Echo("DRAW CALL CULLED")
		return 
	end
	glPushMatrix()
	if (c) then
		glColor(c[1],c[2],c[3],c[4])
	else
		glColor(1,1,1,1)
	end
	glTranslate(px,py,0)
	glRect(0,0,sx,width) --top
	glRect(0,width,width,sy) --left
	glRect(width,sy-width,sx-width,sy) --bottom
	glRect(sx-width,width,sx,sy) --right
	glPopMatrix()
end

local function Rect(px,py,sx,sy,c)
	if (c) then
		if c[4] == 0.54321 then
			glColor(WG["background_opacity_custom"] or {0,0,0,5})
		else
			glColor(c[1],c[2],c[3],c[4])
		end
	else
		glColor(1,1,1,1)
	end
	glRect(px,py,px+sx,py+sy)
end

local function TexRect(px,py,sx,sy,texture,c)
	glPushMatrix()
	if (c) then
		glColor(c[1],c[2],c[3],c[4])
	else
		glColor(1,1,1,1)
	end
	glTranslate(px,py+sy,0)
	glScale(1,-1,1) --flip
	glTexture(texture)
	glTexRect(0,0,sx,sy)
	glTexture(false)
	glPopMatrix()
end

local function CreateStartList()
	if (StartList) then glDeleteList(StartList) end
	StartList = glCreateList(function()
		glMatrixMode(GL_PROJECTION)
		glLoadIdentity()
		glOrtho(0,vsx,vsy,0,0,1) --top left is 0,0
		glDepthTest(false)
		glMatrixMode(GL_MODELVIEW)
		glLoadIdentity()
		glTranslate(0.375,0.375,0) -- for exact pixelization
	end)
end

function widget:ViewResize(viewSizeX, viewSizeY)
	vsx,vsy = widgetHandler:GetViewSizes()
	CreateStartList()
end

function widget:Initialize()
    widgetHandler:RegisterGlobal('DrawManager_redui_drawing', DrawStatus)
	vsx,vsy = widgetHandler:GetViewSizes()
	CreateStartList()
	
	local T = {}
	WG[TN] = T
	T.version = version
	
	T.Color = function(a,b,c,d) --using (...) seems slower
		Todo[#Todo+1] = {1,a,b,c,d}
	end
	T.Rect = function(a,b,c,d,e)
		Todo[#Todo+1] = {2,a,b,c,d,e}
	end
	T.TexRect = function(a,b,c,d,e,f)
		Todo[#Todo+1] = {3,a,b,c,d,e,f}
	end
	T.Border = function(a,b,c,d,e,f)
		Todo[#Todo+1] = {4,a,b,c,d,e,f}
	end
	T.Text = function(a,b,c,d,e,f)
		Todo[#Todo+1] = {5,a,b,c,d,e,f}
	end
	
	F[1] = Color
	F[2] = Rect
	F[3] = TexRect
	F[4] = Border
	F[5] = Text
end

function widget:DrawScreen()
	if triggered == nil then
		minimapbrightness=WG["background_color"]
	triggered = true
	end

	glResetState()
	glResetMatrices()
	
	glCallList(StartList)
	for i=1,#Todo do
		local t = Todo[i]
		F[t[1]](t[2],t[3],t[4],t[5],t[6],t[7])
		Todo[i] = nil
	end
	
	glResetState()
	glResetMatrices()
	
	CleanedTodo = true
end

local timeCounter = math.huge -- force the first update

function widget:Update(deltaTime)
	if (sIsGUIHidden()) then
		for i=1,#Todo do
			Todo[i] = nil
		end
	end
	if (timeCounter < update) then
    	timeCounter = timeCounter + deltaTime
    	return
  	end
  	timeCounter = 0
  	minimapbrightness = WG["background_opacity_custom"][4]
end

function widget:Shutdown()
        widgetHandler:DeregisterGlobal('DrawManager_redui_drawing', DrawStatus)
	glDeleteList(StartList)
	
	if (WG[TN].LastWidget) then
		Spring.Echo(widget:GetInfo().name..">> last processed widget was \""..WG[TN].LastWidget.."\"") --for debugging
	end
	
	
	WG[TN]=nil
end

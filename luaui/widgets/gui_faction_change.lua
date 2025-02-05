function widget:GetInfo()
	return {
		name	= 'Faction Change',
		desc	= 'Adds buttons to switch faction',
		author	= 'Niobium',
		date	= 'May 2011',
		license	= 'GNU GPL v2',
		layer	= -100,
		enabled	= true,
	}
end

--------------------------------------------------------------------------------
-- Var
--------------------------------------------------------------------------------
local wWidth, wHeight = Spring.GetWindowGeometry()

--------------------------------------------------------------------------------
-- Speedups
--------------------------------------------------------------------------------
local teamList = Spring.GetTeamList()
local myTeamID = Spring.GetMyTeamID()

local glTexCoord = gl.TexCoord
local glVertex = gl.Vertex
local glColor = gl.Color
local glRect = gl.Rect
local glTexture = gl.Texture
local glTexRect = gl.TexRect
local glDepthTest = gl.DepthTest
local glBeginEnd = gl.BeginEnd
local GL_QUADS = GL.QUADS
local glPushMatrix = gl.PushMatrix
local glPopMatrix = gl.PopMatrix
local glTranslate = gl.Translate
local glBeginText = gl.BeginText
local glEndText = gl.EndText
local glText = gl.Text
local glCallList = gl.CallList
local glCreateList = gl.CreateList
local glDeleteList = gl.DeleteList

local spGetTeamStartPosition = Spring.GetTeamStartPosition
local spGetTeamRulesParam = Spring.GetTeamRulesParam
local spGetGroundHeight = Spring.GetGroundHeight
local spSendLuaRulesMsg = Spring.SendLuaRulesMsg
local spGetSpectatingState = Spring.GetSpectatingState

local armcomDefID = UnitDefNames.armcom.id
local corcomDefID = UnitDefNames.corcom.id
local tllcomDefID = UnitDefNames.tllcom.id
--local taloncomDefID = UnitDefNames.talon_com.id
local gokcomDefID = UnitDefNames.gok_com.id
local rumadcomDefID = UnitDefNames.rumad_com.id

local commanderDefID = spGetTeamRulesParam(myTeamID, 'startUnit')
local amNewbie = (spGetTeamRulesParam(myTeamID, 'isNewbie') == 1)

local factionChangeList
local px, py = wWidth - 400, 0.63*wHeight

--------------------------------------------------------------------------------
-- Funcs
--------------------------------------------------------------------------------
local function QuadVerts(x, y, z, r)
	glTexCoord(0, 0); glVertex(x - r, y, z - r)
	glTexCoord(1, 0); glVertex(x + r, y, z - r)
	glTexCoord(1, 1); glVertex(x + r, y, z + r)
	glTexCoord(0, 1); glVertex(x - r, y, z + r)
	glTexCoord(0, 1); glVertex(x + r, y, z + r)
end

--------------------------------------------------------------------------------
-- Callins
--------------------------------------------------------------------------------
function widget:Initialize()
    if not WG["background_opacity_custom"] then
        WG["background_opacity_custom"] = {0,0,0,0.5}
    end
	if spGetSpectatingState() or
	   Spring.GetGameFrame() > 0 or
	   amNewbie then
		widgetHandler:RemoveWidget(self)
	end
end

function widget:ViewResize()
  wWidth, wHeight = Spring.GetViewGeometry()
end

function widget:DrawWorld()
	glColor(1, 1, 1, 0.5)
	glDepthTest(false)
	for i = 1, #teamList do
		local teamID = teamList[i]
		local tsx, tsy, tsz = spGetTeamStartPosition(teamID)
		if tsx and tsx > 0 then
		local teamStartUnit = spGetTeamRulesParam(teamID, 'startUnit')
			  if teamStartUnit == armcomDefID then
				  glTexture('LuaUI/Images/arm.png')
				  glBeginEnd(GL_QUADS, QuadVerts, tsx, spGetGroundHeight(tsx, tsz), tsz, 80)
			elseif teamStartUnit ==  corcomDefID then
				  glTexture('LuaUI/Images/core.png')
				  glBeginEnd(GL_QUADS, QuadVerts, tsx, spGetGroundHeight(tsx, tsz), tsz, 64)
			elseif teamStartUnit == tllcomDefID then
				  glTexture('LuaUI/Images/tll.png')
				  glBeginEnd(GL_QUADS, QuadVerts, tsx, spGetGroundHeight(tsx, tsz), tsz, 64)
      		-- elseif teamStartUnit == taloncomDefID then
			-- 	  glTexture('LuaUI/Images/talon.png')
				  glBeginEnd(GL_QUADS, QuadVerts, tsx, spGetGroundHeight(tsx, tsz), tsz, 64)
			elseif teamStartUnit == gokcomDefID then
				  glTexture('LuaUI/Images/gok.png')
				  glBeginEnd(GL_QUADS, QuadVerts, tsx, spGetGroundHeight(tsx, tsz), tsz, 64)
			elseif teamStartUnit == rumadcomDefID then
				  glTexture('LuaUI/Images/rumad.png')
				  glBeginEnd(GL_QUADS, QuadVerts, tsx, spGetGroundHeight(tsx, tsz), tsz, 64)
			end
		end
	end
	glTexture(false)
end

function widget:DrawScreen()

	-- Spectator check
	if spGetSpectatingState() then
		widgetHandler:RemoveWidget(self)
		return
	end

	-- Positioning
	glPushMatrix()
	glTranslate(px, py, 0)
	--call list
	glColor(WG["background_opacity_custom"])

	if factionChangeList then

		glCallList(factionChangeList)
	else
		factionChangeList = glCreateList(FactionChangeList)
	end
	glPopMatrix()
end

function FactionChangeList()
	-- Panel
	glRect(0, 0, 384, 80)
		-- Highlight
	glColor(1, 1, 0, 0.5)
        if commanderDefID == armcomDefID then
            glRect(1, 1, 63, 63)
        elseif commanderDefID == corcomDefID then
            glRect(65, 1, 127, 63)
        elseif commanderDefID == tllcomDefID then
        	glRect(129, 1, 191, 63)
        -- elseif commanderDefID == taloncomDefID then
        -- 	glRect(193, 1, 255, 63)
		elseif commanderDefID == gokcomDefID then
			glRect(257, 1, 319, 63)
		elseif commanderDefID == rumadcomDefID then
			glRect(321, 1, 383, 63)
        end

        -- Icons
        glColor(1, 1, 1, 1)
        glTexture('LuaUI/Images/ARM.png')
        glTexRect(8, 8, 56, 56)
        glTexture('LuaUI/Images/CORE.png')
        glTexRect(72, 8, 120, 56)
        glTexture('LuaUI/Images/TLL.png')
        glTexRect(136, 8, 184, 56)
        -- glTexture('LuaUI/Images/TALON.png')
        -- glTexRect(200, 8, 248, 56)
		glTexture('LuaUI/Images/GOK.png')
        glTexRect(264, 8, 312, 56)
        glTexture('LuaUI/Images/rumad.png')
        glTexRect(328, 8, 376, 56)
        glTexture(false)

        -- Text
        glBeginText()
            glText('Select Desired Faction', 160, 64, 12, 'cd')
            glText('ARM', 32, 0, 12, 'cd')
            glText('CORE', 96, 0, 12, 'cd')
            glText('TLL', 160, 0, 12, 'cd')
            --glText('TALON', 224, 0, 12, 'cd')
			glText('GOK', 288, 0, 12, 'cd')
			glText('RUMAD', 352, 0, 12, 'cd')
        glEndText()
end



function widget:MousePress(mx, my, mButton)

	-- Check 3 of the 4 sides
	if mx >= px and my >= py and my < py + 80 then

		-- Check buttons
		if mButton == 1 then

			-- Spectator check before any action
			if spGetSpectatingState() then
				widgetHandler:RemoveWidget(self)
				return false
			end

			local newCom
			-- Which button?
			if mx < px + 64 then
				newCom = armcomDefID
			elseif mx < px + 128 then
				newCom = corcomDefID
			elseif mx < px + 192 then
				newCom = tllcomDefID
     		 -- elseif mx < px + 256 then
			-- 	newCom = taloncomDefID
			elseif mx < px + 320 then
				newCom = gokcomDefID
			elseif mx < px + 384 then
				newCom = rumadcomDefID
			end
			if newCom then
				commanderDefID = newCom
				-- tell initial_spawn
				spSendLuaRulesMsg('\138' .. tostring(commanderDefID))
				-- tell initial_queue
				if WG["faction_change"] then
					WG["faction_change"](commanderDefID)
				end

				--Remake gui
				if factionChangeList then
					glDeleteList(factionChangeList)
				end
				factionChangeList = glCreateList(FactionChangeList)

				return true
			end

		elseif (mButton == 2 or mButton == 3) and mx < px + 192 then
			-- Dragging
			return true
		end
	end
end

function widget:MouseMove(mx, my, dx, dy, mButton)
	-- Dragging
	if mButton == 2 or mButton == 3 then
		px = px + dx
		py = py + dy
	end
end

function widget:GameStart()
	widgetHandler:RemoveWidget(self)
end

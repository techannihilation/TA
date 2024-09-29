--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    gui_selbuttons.lua
--  brief:   Adds a selected units button control panel
--  author:  Dave Rodgers, trepan, Floris
--
--  Copyright (C) 2007.
--  Licensed under the terms of the GNU GPL, v2 or later.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:GetInfo()
  return {
    name      = "Selected Units Buttons fix",
    desc      = "Buttons for the current selection",
    author    = "trepan, Floris",
    date      = "28 May 2015",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  -- loaded by default?
  }
end

--------------------------------------------------------------------------------
-- Local Definitions and Variables
--------------------------------------------------------------------------------

-- GL Constants
local GL_ONE                 = GL.ONE
local GL_ONE_MINUS_SRC_ALPHA = GL.ONE_MINUS_SRC_ALPHA
local GL_SRC_ALPHA           = GL.SRC_ALPHA

-- OpenGL Functions
local glBlending     = gl.Blending
local glBeginEnd     = gl.BeginEnd
local glClear        = gl.Clear
local glColor        = gl.Color
local glPopMatrix    = gl.PopMatrix
local glPushMatrix   = gl.PushMatrix
local glRect         = gl.Rect
local glRotate       = gl.Rotate
local glScale        = gl.Scale
local glTexRect      = gl.TexRect
local glGetTextWidth = gl.GetTextWidth
local glGetTextHeight = gl.GetTextHeight
local glText         = gl.Text
local glTexture      = gl.Texture
local glTranslate    = gl.Translate
local glUnitDef      = gl.UnitDef
local glVertex       = gl.Vertex

-- Spring Engine Functions
local spGetModKeyState         = Spring.GetModKeyState
local spGetMouseState          = Spring.GetMouseState
local spGetMyTeamID            = Spring.GetMyTeamID
local spGetSelectedUnits       = Spring.GetSelectedUnits
local spGetSelectedUnitsCounts = Spring.GetSelectedUnitsCounts
local spGetSelectedUnitsSorted = Spring.GetSelectedUnitsSorted
local spGetTeamUnitsSorted     = Spring.GetTeamUnitsSorted
local spSelectUnitArray        = Spring.SelectUnitArray
local spSelectUnitMap          = Spring.SelectUnitMap
local spSendCommands           = Spring.SendCommands
local spIsGUIHidden            = Spring.IsGUIHidden
local spGetSelectedUnitsCount  = Spring.GetSelectedUnitsCount

-- Include External Scripts
include("colors.h.lua")

-- Graphics Assets
local bgcorner      = ":n:LuaUI/Images/bgcorner.png"
local highlightImg  = ":n:LuaUI/Images/button-highlight.dds"
local oldUnitpicsDir = LUAUI_DIRNAME .. "Images/oldunitpics/"

-- Icon Existence Table
local OtaIconExist = {}
for i = 1, #UnitDefs do
  local unitName = UnitDefs[i].name
  local iconPath = oldUnitpicsDir .. unitName .. '.png'
  if VFS.FileExists(iconPath) then
    OtaIconExist[i] = iconPath
  end
end

-- Configuration Variables
local iconsPerRow      = 16  -- Not functional yet
local leftmouseColor   = {1, 0.72, 0.25, 0.22}
local middlemouseColor = {1, 1, 1, 0.16}
local rightmouseColor  = {1, 0.4, 0.4, 0.2}
-- local hoverColor       = {1, 1, 1, 0.25}  -- Currently unused

-- State Variables
local unitTypes          = 0
local countsTable        = {}
local activePress        = false
local mouseIcon          = -1
local currentDef         = nil
local prevUnitCount      = spGetSelectedUnitsCounts()
local unitDefIDs         = {}  -- Ordered list of unitDefIDs
local cached             = false

-- Icon Dimensions
local iconSizeX    = 64
local iconSizeY    = 64
local iconImgMult  = 0.99
local usedIconSizeX = iconSizeX
local usedIconSizeY = iconSizeY

-- Rectangle Bounds
local rectMinX = 0
local rectMaxX = 0
local rectMinY = 0
local rectMaxY = 0

-- Background Dimensions
local backgroundDimentions = {}
local iconMargin           = usedIconSizeX / 25    -- Adjusted in ViewResize
local fontSize             = iconSizeY * 0.28     -- Adjusted in ViewResize
local picList               = nil

-- Sound Configuration
local playSounds   = true
local leftclick    = 'LuaUI/Sounds/buildbar_add.wav'
local middleclick  = 'LuaUI/Sounds/buildbar_click.wav'
local rightclick   = 'LuaUI/Sounds/buildbar_rem.wav'
local otaunitpics  = nil

-- GUI Shader
local guishaderDisabled = true
local checkSelectedUnits = false

-- Time Tracking
local sec = 0
local updateDlist = false
local skipGetUnitCounts = false

-- View Sizes
local vsx, vsy = widgetHandler:GetViewSizes()

--------------------------------------------------------------------------------
-- Local Functions
--------------------------------------------------------------------------------

-- Cache Unit Icons to prevent white icon bug
local function cacheUnitIcons()
  if not cached then
    gl.Color(1, 1, 1, 0.001)
    for id = 1, #UnitDefs do
      gl.Texture('#' .. id)
      gl.TexRect(-1, -1, 0, 0)
      gl.Texture(false)
    end
    gl.Color(1, 1, 1, 1)
    cached = true
  end
end

-- Update GUI Shader
local function updateGuishader()
  if WG['guishader_api'] then
    if not picList then
      WG['guishader_api'].RemoveRect('selectionbuttons')
      guishaderDisabled = true
    else
      if backgroundDimentions[1] then
        WG['guishader_api'].InsertRect(
          backgroundDimentions[1],
          backgroundDimentions[2],
          backgroundDimentions[3],
          backgroundDimentions[4],
          'selectionbuttons'
        )
        guishaderDisabled = false
      end
    end
  end
end

-- Update Ordered List of unitDefIDs
local function UpdateUnitDefIDs()
  unitDefIDs = {}
  for udid, _ in pairs(unitCounts) do
    table.insert(unitDefIDs, udid)
  end
  table.sort(unitDefIDs)
end

-- Draw Rounded Rectangle
local function RectRound(px, py, sx, sy, cs)
  px, py, sx, sy, cs = math.floor(px), math.floor(py), math.ceil(sx), math.ceil(sy), math.floor(cs)

  gl.Texture(false)
  glRect(px + cs, py, sx - cs, sy)
  glRect(sx - cs, py + cs, sx, sy - cs)
  glRect(px + cs, py + cs, px, sy - cs)

  -- Top Left Corner
  if py > 0 and px > 0 then
    gl.Texture(bgcorner)
    glTexRect(px, py + cs, px + cs, py)
  else
    gl.Texture(false)
  end

  -- Top Right Corner
  if py > 0 and sx < vsx then
    gl.Texture(bgcorner)
    glTexRect(sx, py + cs, sx - cs, py)
  else
    gl.Texture(false)
  end

  -- Bottom Left Corner
  if sy < vsy and px > 0 then
    gl.Texture(bgcorner)
    glTexRect(px, sy - cs, px + cs, sy)
  else
    gl.Texture(false)
  end

  -- Bottom Right Corner
  if sy < vsy and sx < vsx then
    gl.Texture(bgcorner)
    glTexRect(sx, sy - cs, sx - cs, sy)
  else
    gl.Texture(false)
  end

  gl.Texture(false)
end

-- Draw Unit Definition Texture
local function DrawUnitDefTexture(unitDefID, iconPos, count)
  local usedIconImgMult = iconImgMult
  local ypad2 = -usedIconSizeY / 50
  local color = {1, 1, 1, 0.9}

  if mouseIcon ~= -1 then
    color = {1, 1, 1, 0.75}
  end

  if iconPos == mouseIcon then
    usedIconImgMult = iconImgMult * 1.08
    color = {1, 1, 1, 1}
    ypad2 = 0
  end

  local yPad = (usedIconSizeY * (1 - usedIconImgMult)) / 2
  local xPad = (usedIconSizeX * (1 - usedIconImgMult)) / 2

  local xmin = math.floor(rectMinX + (usedIconSizeX * iconPos)) + xPad
  local xmax = xmin + usedIconSizeX - (2 * xPad)
  if xmax < 0 or xmin > vsx then return end  -- Exit if icon is out of view

  local ymin = rectMinY + yPad
  local ymax = rectMaxY - yPad

  local ud = UnitDefs[unitDefID]
  glColor(color)

  if WG['OtaIcons'] and OtaIconExist[unitDefID] then
    gl.Texture(OtaIconExist[unitDefID])
  else
    gl.Texture('#' .. unitDefID)
  end

  glTexRect(math.floor(xmin + iconMargin), math.floor(ymin + iconMargin + ypad2),
           math.ceil(xmax - iconMargin), math.ceil(ymax - iconMargin + ypad2))
  glTexture(false)

  if count > 1 then
    -- Draw the count text
    local offset = math.ceil((ymax - (ymin + 2 * iconMargin)) / 20)
    glText(count, xmax - iconMargin - offset,
           ymin + 2 * iconMargin + offset + (fontSize / 16) - (yPad / 2),
           fontSize, "or")
  end
end

-- Draw Icon Quad Highlight
local function DrawIconQuad(iconPos, color)
  local usedIconImgMult = iconImgMult * 1.08

  local yPad = (usedIconSizeY * (1 - usedIconImgMult)) / 2
  local xPad = (usedIconSizeX * (1 - usedIconImgMult)) / 2

  local xmin = math.floor(rectMinX + (usedIconSizeX * iconPos)) + xPad
  local xmax = xmin + usedIconSizeX - (2 * xPad)
  if xmax < 0 or xmin > vsx then return end  -- Exit if icon is out of view

  local ymin = rectMinY
  local ymax = rectMaxY - yPad

  gl.Texture(highlightImg)
  gl.Color(color)
  glTexRect(xmin + iconMargin, ymin + 2 * iconMargin, xmax - iconMargin, ymax - iconMargin)
  gl.Texture(false)

  RectRound(xmin + iconMargin, ymin + 2 * iconMargin, xmax - iconMargin, ymax - iconMargin, (xmax - xmin) / 15)
  glBlending(GL_SRC_ALPHA, GL_ONE)
  gl.Color(color[1], color[2], color[3], color[4] / 2)
  RectRound(xmin + iconMargin, ymin + 2 * iconMargin, xmax - iconMargin, ymax - iconMargin, (xmax - xmin) / 15)
  glBlending(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)
end

-- Draw Picture List
local function DrawPicList()
  prevUnitCount = unitCounts
  unitCounts, unitDefsCount = spGetSelectedUnitsCounts()

  unitTypes = unitDefsCount
  if unitTypes <= 0 then
    countsTable = {}
    activePress = false
    currentDef  = nil
    unitDefIDs = {}  -- Reset unitDefIDs when no units are selected
    return
  end

  -- Calculate Background Bar Dimensions
  local width = math.floor(usedIconSizeX * unitTypes)
  rectMinX = math.floor((vsx * 0.5) - (0.5 * width))
  rectMaxX = math.floor((vsx * 0.5) + (0.5 * width))
  rectMinY = 0
  rectMaxY = math.floor(rectMinY + usedIconSizeY)

  local xmin = math.floor(rectMinX)
  local xmax = math.floor(rectMinX + (usedIconSizeX * unitTypes))
  if xmax < 0 or xmin > vsx then return end  -- Exit if background is out of view

  local ymin = rectMinY
  local ymax = rectMaxY

  backgroundDimentions = {xmin - iconMargin - 0.5, ymin, xmax + iconMargin + 0.5, ymax + iconMargin - 1}
  gl.Color(0, 0, 0, 0.66)
  RectRound(backgroundDimentions[1], backgroundDimentions[2], backgroundDimentions[3], backgroundDimentions[4], usedIconSizeX / 7)

  -- Draw Border Padding
  local borderPadding = iconMargin
  glColor(1, 1, 1, 0.025)
  RectRound(backgroundDimentions[1] + borderPadding, backgroundDimentions[2] + borderPadding,
           backgroundDimentions[3] - borderPadding, backgroundDimentions[4] - borderPadding,
           usedIconSizeX / 9)

  -- Draw Unit Icons
  unitCounts.n = nil  -- Remove the 'n' key if present
  for icon, udid in ipairs(unitDefIDs) do
    local count = unitCounts[udid]
    DrawUnitDefTexture(udid, icon - 1, count)  -- icon - 1 because Lua tables are 1-indexed
  end
end

-- Handle Left Mouse Button Click
local function LeftMouseButton(unitDefID, unitTable)
  local alt, ctrl, meta, shift = spGetModKeyState()
  local acted = false

  if not ctrl then
    if alt or meta then
      acted = true
      spSelectUnitArray({ unitTable[1] })  -- Select only 1 unit
    else
      acted = true
      spSelectUnitArray(unitTable)         -- Select all units of this type
    end
  else
    -- Select all units of this type on the map
    local sorted = spGetTeamUnitsSorted(spGetMyTeamID())
    local units = sorted[unitDefID]
    if units then
      acted = true
      spSelectUnitArray(units, shift)
    end
  end

  if acted and playSounds then
    Spring.PlaySoundFile(leftclick, 0.75, 'ui')
  end
end

-- Handle Middle Mouse Button Click
local function MiddleMouseButton(unitDefID, unitTable)
  local alt, ctrl, meta, shift = spGetModKeyState()

  if ctrl then
    -- Center the view on the entire selection
    spSendCommands({"viewselection"})
  else
    -- Center the view on this type of unit
    local selUnits = spGetSelectedUnits()
    spSelectUnitArray(unitTable)
    spSendCommands({"viewselection"})
    spSelectUnitArray(selUnits)
  end

  if playSounds then
    Spring.PlaySoundFile(middleclick, 0.75, 'ui')
  end
end

-- Handle Right Mouse Button Click
local function RightMouseButton(unitDefID, unitTable)
  local alt, ctrl, meta, shift = spGetModKeyState()

  -- Remove selected units of this unit type
  local selUnits = spGetSelectedUnits()
  local unitMap = {}
  for _, uid in ipairs(selUnits) do
    unitMap[uid] = true
  end
  for _, uid in ipairs(unitTable) do
    unitMap[uid] = nil
    if ctrl then break end  -- Remove only 1 unit if CTRL is held
  end
  spSelectUnitMap(unitMap)

  if playSounds then
    Spring.PlaySoundFile(rightclick, 0.75, 'ui')
  end
end

-- Determine which Icon is under the Mouse
local function MouseOverIcon(x, y)
  if unitTypes <= 0 then return -1 end
  if x < rectMinX or x > rectMaxX or y < rectMinY or y > rectMaxY then
    return -1
  end

  local icon = math.floor((x - rectMinX) / usedIconSizeX)
  icon = math.max(0, math.min(icon, unitTypes - 1))  -- Clamp the icon index

  return icon
end

--------------------------------------------------------------------------------
-- Widget Callbacks
--------------------------------------------------------------------------------

function widget:Initialize()
  widget:ViewResize(vsx, vsy)
  otaunitpics = WG['OtaIcons']
end

function widget:Shutdown()
  if picList then
    gl.DeleteList(picList)
  end
  enabled = false
  updateGuishader()
end

function widget:ViewResize(viewSizeX, viewSizeY)
  vsx, vsy = viewSizeX, viewSizeY

  usedIconSizeX = math.floor((iconSizeX / 2) + ((vsx * vsy) / 115000))
  usedIconSizeY = math.floor((iconSizeY / 2) + ((vsx * vsy) / 115000))
  fontSize = usedIconSizeY * 0.28
  iconMargin = usedIconSizeX / 25

  if picList then
    unitCounts = spGetSelectedUnitsCounts()
    gl.DeleteList(picList)
    picList = gl.CreateList(DrawPicList)
  end
end

function widget:Update(dt)
  sec = sec + dt

  if checkSelectedUnits and sec > 0.09 then
    sec = 0
    if not skipGetUnitCounts then
      unitCounts = spGetSelectedUnitsCounts()
      UpdateUnitDefIDs()  -- Update the ordered list of unitDefIDs
      local equal = true

      if unitCounts.n ~= prevUnitCount.n then
        equal = false
      else
        for udid, count in pairs(unitCounts) do
          if not prevUnitCount[udid] or prevUnitCount[udid] ~= count then
            equal = false
            break
          end
        end
      end

      skipGetUnitCounts = false
    else
      local equal = false
    end

    if not equal and spGetSelectedUnitsCount() > 0 then
      updateDlist = true
    end
  end

  if updateDlist then
    sec = 0
    checkSelectedUnits = false
    updateDlist = false
    if picList then
      gl.DeleteList(picList)
    end
    picList = gl.CreateList(DrawPicList)
    updateGuishader()
  end
end

function widget:CommandsChanged()
  if spGetSelectedUnitsCount() > 0 then
    checkSelectedUnits = true
  elseif picList then
    gl.DeleteList(picList)
    picList = nil
    checkSelectedUnits = false
  end

  if not picList and not guishaderDisabled then
    updateGuishader()
  end

  sec = 0
end

function widget:UnitDestroyed(unitID, unitDefID, teamID, attackerID, attackerDefID, attackerTeamID)
  if unitCounts and unitCounts[unitDefID] then
    if unitCounts[unitDefID] > 1 then
      unitCounts[unitDefID] = unitCounts[unitDefID] - 1
    else
      unitCounts[unitDefID] = nil
    end
    checkSelectedUnits = true
    skipGetUnitCounts = true
  end
end

function widget:DrawScreen()
  cacheUnitIcons()  -- Prevent white icon bug

  if picList then
    if spIsGUIHidden() then return end

    if mouseIcon ~= prevMouseIcon then
      unitCounts = spGetSelectedUnitsCounts()
      UpdateUnitDefIDs()  -- Ensure unitDefIDs is up-to-date
      gl.DeleteList(picList)
      picList = gl.CreateList(DrawPicList)
      prevMouseIcon = mouseIcon
    end

    gl.CallList(picList)

    -- Draw Highlights
    local x, y, lb, mb, rb = spGetMouseState()
    mouseIcon = MouseOverIcon(x, y)

    if not widgetHandler:InTweakMode() and mouseIcon >= 0 then
      if lb or mb or rb then
        if lb then
          DrawIconQuad(mouseIcon, leftmouseColor)  -- Left Click Highlight
        elseif mb then
          DrawIconQuad(mouseIcon, middlemouseColor)  -- Middle Click Highlight
        elseif rb then
          DrawIconQuad(mouseIcon, rightmouseColor)  -- Right Click Highlight
        end
      else
        -- Uncomment if hover highlight is desired
        -- DrawIconQuad(mouseIcon, hoverColor)
      end

      if not hoverClock then
        hoverClock = os.clock()
      end

      if WG['tooltip'] and os.clock() - hoverClock > 0.6 then
        WG['tooltip'].ShowTooltip('selectedunitbuttons',
          "\255\215\255\215Selected units\n" ..
          " \255\255\255\255Left click\255\210\210\210: Remove all other unit types\n" ..
          " \255\255\255\255Left click + CTRL\255\210\210\210: Select all units of this type on map\n" ..
          " \255\255\255\255Left click + ALT\255\210\210\210: Remove all by 1 unit of this unit type\n" ..
          " \255\255\255\255Right click\255\210\210\210: Remove that unit type from the selection\n" ..
          " \255\255\255\255Right click + CTRL\255\210\210\210: Only remove 1 unit from that unit type\n" ..
          " \255\255\255\255Middle click\255\210\210\210: Move to the center location of the selected unit(s)\n" ..
          " \255\255\255\255Middle click + CTRL\255\210\210\210: Move to the center of the whole selection")
      end
    else
      hoverClock = nil
    end
  end
end

function widget:MousePress(x, y, button)
  mouseIcon = MouseOverIcon(x, y)
  activePress = (mouseIcon >= 0)
  return activePress
end

function widget:MouseRelease(x, y, button)
  if not activePress then
    return false
  end
  activePress = false

  local icon = MouseOverIcon(x, y)
  if icon < 0 or icon >= #unitDefIDs then
    return false
  end

  local unitDefID = unitDefIDs[icon + 1]  -- Lua tables are 1-indexed
  local unitsSorted = spGetSelectedUnitsSorted()
  local unitTable = unitsSorted[unitDefID]

  if not unitTable then
    return false
  end

  if button == 1 then
    LeftMouseButton(unitDefID, unitTable)
  elseif button == 2 then
    MiddleMouseButton(unitDefID, unitTable)
  elseif button == 3 then
    RightMouseButton(unitDefID, unitTable)
  end

  return false
end

function widget:IsAbove(x, y)
  return MouseOverIcon(x, y) >= 0
end

function widget:GetTooltip(x, y)
  local icon = MouseOverIcon(x, y)
  if icon < 0 or icon >= #unitDefIDs then
    return ''
  end

  local unitDefID = unitDefIDs[icon + 1]
  local ud = UnitDefs[unitDefID]
  if not ud then
    return ''
  end

  return ud.humanName .. ' - ' .. ud.tooltip
end

--------------------------------------------------------------------------------
-- End of Widget
--------------------------------------------------------------------------------

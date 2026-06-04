--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    selector.lua
--  brief:   the widget selector, loads and unloads widgets
--  author:  Dave Rodgers
--
--  Copyright (C) 2007.
--  Licensed under the terms of the GNU GPL, v2 or later.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- changes:
--   jK (April@2009) - updated to new font system
--   Bluestone (Jan 2015) - added to BA as a widget, added various stuff 
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function widget:GetInfo()
  return {
    name = "Widget Selector",
    desc = "Widget selection widget",
    author = "trepan, jK, Bluestone",
    date = "Jan 8, 2007",
    license = "GNU GPL, v2 or later",
    layer = -math.huge,
    handler = true,
    enabled = true
  }
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- relies on a gadget to implement "luarules reloadluaui"
-- relies on custom stuff in widgetHandler to implement blankOutConfig and allowUserWidgets
include("colors.h.lua")
include("keysym.h.lua")
include("fonts.lua")
local sizeMultiplier = 1
local floor = math.floor
local widgetsList = {}
local fullWidgetsList = {}
local scrollRows = {}
local vsx, vsy = widgetHandler:GetViewSizes()
local minMaxEntries = 15
local curMaxEntries = 25
local startEntry = 1
local pageStep = math.floor(curMaxEntries / 2) - 1
local fontSize = 12
local fontSpace = 7
local yStep = fontSize + fontSpace
local entryFont = "LuaUI/Fonts/FreeMonoBold_12"
local headerFont = "LuaUI/Fonts/FreeMonoBold_12"
entryFont = ":n:" .. entryFont
headerFont = ":n:" .. headerFont
local bgPadding = 6
local maxWidth = 0.01
local borderx = yStep * 0.75
local bordery = yStep * 0.75
local midx = vsx * 0.5
local minx = vsx * 0.4
local maxx = vsx * 0.6
local midy = vsy * 0.5
local miny = vsy * 0.4
local maxy = vsy * 0.6
local sbposx = 0.0
local sbposy = 0.0
local sbsizex = 0.0
local sbsizey = 0.0
local sby1 = 0.0
local sby2 = 0.0
local sbsize = 0.0
local sbheight = 0.0
local activescrollbar = false
local scrollbargrabpos = 0.0
local show = false
local pagestepped = false
local showApiWidgets = false
local apiWidgets = "BG color"
local callInsInitialized = false

--see MouseRelease for which functions are called by which buttons
local buttons = {
  [1] = "Reload LuaUI",
  [2] = "Factory Reset LuaUI",
}

local titleFontSize = 16
local buttonFontSize = 20
local buttonHeight = 22
local buttonTop = 40 -- offset between top of buttons and bottom of widget
local sectionFontScale = 1.2
local hoverTextColor = "\255\255\215\064"

local function GetButtonLine(buttonID)
  if buttonID == 2 then
    return buttonID + 1
  end
  return buttonID
end

local function GetButtonBounds(buttonID)
  local label = buttons[buttonID]
  if not label then
    return nil
  end
  local buttonLine = GetButtonLine(buttonID)
  local width = (gl.GetTextWidth(label) * buttonFontSize * sizeMultiplier) + (12 * sizeMultiplier)
  local centerX = (minx + maxx) * 0.5
  local y1 = miny - (buttonTop * sizeMultiplier) - (buttonLine * (buttonHeight * sizeMultiplier))
  local y2 = miny - (buttonTop * sizeMultiplier) - ((buttonLine - 1) * (buttonHeight * sizeMultiplier))
  return centerX - (width * 0.5), y1, centerX + (width * 0.5), y2
end

local function IsOnButton(buttonID, x, y)
  local x1, y1, x2, y2 = GetButtonBounds(buttonID)
  return x1 ~= nil and x1 < x and x < x2 and y1 < y and y < y2
end

local function DisableCallIns()
  widgetHandler:RemoveWidgetCallIn("DrawScreen", widget)
  widgetHandler:RemoveWidgetCallIn("IsAbove", widget)
end

local function UpdateCallIns()
  widgetHandler:UpdateWidgetCallIn("DrawScreen", widget)
  widgetHandler:UpdateWidgetCallIn("IsAbove", widget)
end

local function SyncCallIns()
  if show then
    UpdateCallIns()
  else
    DisableCallIns()
  end
end

-------------------------------------------------------------------------------
function widget:Initialize()
  callInsInitialized = true
  SyncCallIns()
  widgetHandler.knownChanged = true
  Spring.SendCommands("unbindkeyset f11")

end

-------------------------------------------------------------------------------
local function DrawSeparator(x1, y1, x2, y2)
  gl.Color(0, 0, 0, 0.3)  -- Set color to light gray, semi-transparent
  gl.LineWidth(4)  -- Sets the line width to 2.5 pixels
  gl.Shape(GL.LINES, {
    { v = { x1, y1 } },
    { v = { x2, y2 } },

  })
  gl.Color(1, 1, 1, 1)  -- Reset color to white
end

local function DrawRectRound(px, py, sx, sy, cs)
  gl.TexCoord(0.8, 0.8)
  gl.Vertex(px + cs, py, 0)
  gl.Vertex(sx - cs, py, 0)
  gl.Vertex(sx - cs, sy, 0)
  gl.Vertex(px + cs, sy, 0)
  gl.Vertex(px, py + cs, 0)
  gl.Vertex(px + cs, py + cs, 0)
  gl.Vertex(px + cs, sy - cs, 0)
  gl.Vertex(px, sy - cs, 0)
  gl.Vertex(sx, py + cs, 0)
  gl.Vertex(sx - cs, py + cs, 0)
  gl.Vertex(sx - cs, sy - cs, 0)
  gl.Vertex(sx, sy - cs, 0)
  local offset = 0.07 -- texture offset, because else gaps could show
  local o = offset

  -- top left
  if py <= 0 or px <= 0 then
    o = 0.5
  else
    o = offset
  end

  gl.TexCoord(o, o)
  gl.Vertex(px, py, 0)
  gl.TexCoord(o, 1 - o)
  gl.Vertex(px + cs, py, 0)
  gl.TexCoord(1 - o, 1 - o)
  gl.Vertex(px + cs, py + cs, 0)
  gl.TexCoord(1 - o, o)
  gl.Vertex(px, py + cs, 0)

  -- top right
  if py <= 0 or sx >= vsx then
    o = 0.5
  else
    o = offset
  end

  gl.TexCoord(o, o)
  gl.Vertex(sx, py, 0)
  gl.TexCoord(o, 1 - o)
  gl.Vertex(sx - cs, py, 0)
  gl.TexCoord(1 - o, 1 - o)
  gl.Vertex(sx - cs, py + cs, 0)
  gl.TexCoord(1 - o, o)
  gl.Vertex(sx, py + cs, 0)

  -- bottom left
  if sy >= vsy or px <= 0 then
    o = 0.5
  else
    o = offset
  end

  gl.TexCoord(o, o)
  gl.Vertex(px, sy, 0)
  gl.TexCoord(o, 1 - o)
  gl.Vertex(px + cs, sy, 0)
  gl.TexCoord(1 - o, 1 - o)
  gl.Vertex(px + cs, sy - cs, 0)
  gl.TexCoord(1 - o, o)
  gl.Vertex(px, sy - cs, 0)

  -- bottom right
  if sy >= vsy or sx >= vsx then
    o = 0.5
  else
    o = offset
  end

  gl.TexCoord(o, o)
  gl.Vertex(sx, sy, 0)
  gl.TexCoord(o, 1 - o)
  gl.Vertex(sx - cs, sy, 0)
  gl.TexCoord(1 - o, 1 - o)
  gl.Vertex(sx - cs, sy - cs, 0)
  gl.TexCoord(1 - o, o)
  gl.Vertex(sx, sy - cs, 0)
end

function RectRound(px, py, sx, sy, cs)
  local px, py, sx, sy, cs = math.floor(px), math.floor(py), math.ceil(sx), math.ceil(sy), math.floor(cs)
  gl.BeginEnd(GL.QUADS, DrawRectRound, px, py, sx, sy, cs)
end

local function GetSectionName(fromZip)
  return fromZip and "Game Widgets" or "User Widgets"
end

local function UpdateGeometry()
  midx = vsx * 0.5
  midy = vsy * 0.5
  local halfWidth = ((maxWidth + 2) * fontSize) * sizeMultiplier * 0.5
  minx = floor(midx - halfWidth - (borderx * sizeMultiplier))
  maxx = floor(midx + halfWidth + (borderx * sizeMultiplier))
  local rowCount = #widgetsList
  if rowCount < 1 and #scrollRows > 0 then
    rowCount = math.min(curMaxEntries, #scrollRows)
  end
  local ySize = (yStep * sizeMultiplier) * rowCount + 10
  miny = floor(midy - (0.5 * ySize)) - ((fontSize + bgPadding + bgPadding) * sizeMultiplier)
  maxy = floor(midy + (0.5 * ySize))
end

local function GetMaxStart()
  local maxStart = #scrollRows - curMaxEntries + 1
  if maxStart < 1 then
    return 1
  end
  return maxStart
end

local function ClampStartEntry()
  local maxStart = GetMaxStart()
  if startEntry > maxStart then
    startEntry = maxStart
  end
  if startEntry < 1 then
    startEntry = 1
  end
end

local function BuildScrollRows()
  scrollRows = {}
  local lastFromZip = nil

  for _, namedata in ipairs(fullWidgetsList) do
    local fromZip = namedata[2].fromZip
    if lastFromZip == nil then
      table.insert(scrollRows, { rowType = "section", label = GetSectionName(fromZip) })
    elseif fromZip ~= lastFromZip then
      table.insert(scrollRows, { rowType = "separator" })
      table.insert(scrollRows, { rowType = "section", label = GetSectionName(fromZip) })
    end
    table.insert(scrollRows, { rowType = "widget", namedata = namedata })
    lastFromZip = fromZip
  end
end

local function UpdateListScroll()
  local rowCount = #scrollRows
  ClampStartEntry()

  widgetsList = {}
  local se = startEntry
  local ee = math.min(se + curMaxEntries - 1, rowCount)
  local n = 1

  for i = se, ee do
    widgetsList[n], n = scrollRows[i], n + 1
  end
end

local function UpdateScrolledGeometry()
  UpdateListScroll()
  UpdateGeometry()
end

local function ScrollUp(step)
  startEntry = startEntry - step
  UpdateScrolledGeometry()
end

local function ScrollDown(step)
  startEntry = startEntry + step
  UpdateScrolledGeometry()
end

function widget:MouseWheel(up, value)
  if not show then return false end
  local a, c, m, s = Spring.GetModKeyState()
  if a or m then return false end -- alt and meta allow normal control
  local step = (s and 4) or (c and 1) or 2

  if up then
    ScrollUp(step)
  else
    ScrollDown(step)
  end

  return true
end

--does nd1 come before nd2?
local function SortWidgetListFunc(nd1, nd2)
  -- widget profiler on top
  if nd1[1] == "Widget Profiler" then
    return true
  elseif nd2[1] == "Widget Profiler" then
    return false
  end

  -- mod widgets first, then user widgets
  if nd1[2].fromZip ~= nd2[2].fromZip then
    return nd1[2].fromZip
  end

  -- sort by name, case-insensitive
  local name1 = nd1[1]:lower()  -- Convert name to lowercase
  local name2 = nd2[1]:lower()  -- Convert name to lowercase

  return name1 < name2
end

local function UpdateList()
  if not widgetHandler.knownChanged then return end
  widgetHandler.knownChanged = false
  local myName = widget:GetInfo().name
  maxWidth = 0
  local uncount = 1
  widgetsList = {}
  fullWidgetsList = {}
  scrollRows = {}

  for name, data in pairs(widgetHandler.knownWidgets) do
    if name ~= myName then
      if apiWidgets == name and showApiWidgets == true then
        table.insert(fullWidgetsList, {name, data})

        uncount = 0
        -- look for the maxWidth
        local width = fontSize * gl.GetTextWidth(name)

        if width > maxWidth then
          maxWidth = width
        end
      elseif apiWidgets ~= name then
        table.insert(fullWidgetsList, {name, data})

        -- look for the maxWidth
        local width = fontSize * gl.GetTextWidth(name)

        if width > maxWidth then
          maxWidth = width
        end
      end
    end
  end

  maxWidth = math.max(maxWidth / fontSize, gl.GetTextWidth("Game Widgets"), gl.GetTextWidth("User Widgets"))
  local myCount = #fullWidgetsList

  if widgetHandler.knownCount ~= ((myCount + 1) + uncount) then
    error("knownCount mismatch")
  end

  table.sort(fullWidgetsList, SortWidgetListFunc)
  BuildScrollRows()
  UpdateScrolledGeometry()
end

function widget:ViewResize(viewSizeX, viewSizeY)
  vsx = viewSizeX
  vsy = viewSizeY

  if customScale == nil then
    customScale = 1
  end

  sizeMultiplier = 0.6 + (vsx * vsy / 6000000) * customScale
  UpdateGeometry()
end

-------------------------------------------------------------------------------
function widget:KeyPress(key, mods, isRepeat)

  if (show and key == KEYSYMS.ESCAPE) or ((key == KEYSYMS.F11) and not isRepeat and not (mods.alt or mods.ctrl or mods.meta or mods.shift)) then
    show = not show
    SyncCallIns()

    return true
  end

  if show and key == KEYSYMS.PAGEUP then
    ScrollUp(pageStep)

    return true
  end

  if show and key == KEYSYMS.PAGEDOWN then
    ScrollDown(pageStep)

    return true
  end

  return false
end

local activeGuishader = false
local scrollbarOffset = -15

function widget:DrawScreen()
  if not show then
    if activeGuishader and (WG["guishader_api"] ~= nil) then
      activeGuishader = false
      WG["guishader_api"].RemoveRect("widgetselector")
    end

    return
  end

  UpdateList()
  gl.BeginText()

  if WG["guishader_api"] == nil then
    activeGuishader = false
  end

  if (WG["guishader_api"] ~= nil) and not activeGuishader then
    activeGuishader = true
    WG["guishader_api"].InsertRect(minx - (bgPadding * sizeMultiplier), miny - (bgPadding * sizeMultiplier), maxx + (bgPadding * sizeMultiplier), maxy + (bgPadding * sizeMultiplier), "widgetselector")
  end

  borderx = (yStep * sizeMultiplier) * 0.75
  bordery = (yStep * sizeMultiplier) * 0.75
  -- draw the header
  gl.Text(WhiteStr .. "Widget Selector", midx, maxy + ((8 + bgPadding) * sizeMultiplier), titleFontSize * sizeMultiplier, "oc")
  local mx, my, lmb, mmb, rmb = Spring.GetMouseState()
  local tcol = WhiteStr

  -- draw the -/+ buttons
  if maxx - 10 < mx and mx < maxx and maxy < my and my < maxy + ((buttonFontSize + 7) * sizeMultiplier) then
    tcol = hoverTextColor
  end

  gl.Text(tcol .. "+", maxx, maxy + ((7 + bgPadding) * sizeMultiplier), buttonFontSize * sizeMultiplier, "or")
  tcol = WhiteStr

  if minx < mx and mx < minx + 10 and maxy < my and my < maxy + ((buttonFontSize + 7) * sizeMultiplier) then
    tcol = hoverTextColor
  end

  gl.Text(tcol .. "-", minx, maxy + ((7 + bgPadding) * sizeMultiplier), buttonFontSize * sizeMultiplier, "ol")
  tcol = WhiteStr
  -- draw the box
  gl.Color(0, 0, 0, 0.75)
  RectRound(minx - (bgPadding * sizeMultiplier), miny - (bgPadding * sizeMultiplier), maxx + (bgPadding * sizeMultiplier), maxy + (bgPadding * sizeMultiplier), 8 * sizeMultiplier)
  gl.Color(0.6, 0.6, 0.6, 0.1)
  RectRound(minx, miny, maxx, maxy, 8 * sizeMultiplier)

  -- draw the text buttons (at the bottom) & their outlines
  for i, name in ipairs(buttons) do
    tcol = WhiteStr

    if IsOnButton(i, mx, my) then
      tcol = hoverTextColor
    end

    gl.Text(tcol .. buttons[i], (minx + maxx) / 2, miny - (buttonTop * sizeMultiplier) - (GetButtonLine(i) * (buttonHeight * sizeMultiplier)), buttonFontSize * sizeMultiplier, "oc")
  end

  -- draw the widgets
  local nd = not widgetHandler.tweakMode and self:AboveLabel(mx, my)
  local pointedY = nil
  local pointedName = (nd and nd[1]) or nil
  local posy = maxy - ((yStep + bgPadding) * sizeMultiplier)
  sby1 = posy + ((fontSize + fontSpace) * sizeMultiplier) * 0.5
  local sectionColor = "\255\180\220\255"

  for _, row in ipairs(widgetsList) do
    if row.rowType == "section" then
      gl.Text(sectionColor .. row.label, midx, posy + (fontSize * sizeMultiplier) * 0.5, fontSize * sectionFontScale * sizeMultiplier, "vc")
      posy = posy - (yStep * sizeMultiplier)
    elseif row.rowType == "separator" then
      DrawSeparator(minx, posy + ((fontSize + fontSpace) * sizeMultiplier) * 0.5, maxx, posy + ((fontSize + fontSpace) * sizeMultiplier) * 0.5)
      posy = posy - (yStep * sizeMultiplier)
    else
      local namedata = row.namedata
      local name = namedata[1]
      local data = namedata[2]
      local color = ""
      local pointed = pointedName == name
      local order = widgetHandler.orderList[name]
      local enabled = order and (order > 0)
      local active = data.active

      if pointed and not activescrollbar then
        pointedY = posy
        pointedEnabled = data.active

        if not pagestepped and (lmb or mmb or rmb) then
          color = WhiteStr
        else
          color = (active and "\255\128\255\128") or (enabled and "\255\255\255\128") or "\255\255\128\128"
        end
      else
        color = (active and "\255\064\224\064") or (enabled and "\255\200\200\064") or "\255\224\064\064"
      end

      local tmpName

      if data.fromZip then
        -- FIXME: extra chars not counted in text length
        tmpName = WhiteStr .. "*" .. color .. name .. WhiteStr .. "*"
      else
        tmpName = color .. name
      end

      gl.Text(color .. tmpName, midx, posy + (fontSize * sizeMultiplier) * 0.5, fontSize * sizeMultiplier, "vc")
      posy = posy - (yStep * sizeMultiplier)
    end
  end

  -- scrollbar
  if #widgetsList < #scrollRows then
    sby2 = miny + (fontSpace * sizeMultiplier) * 0.5
    sbheight = sby1 - sby2
    sbsize = sbheight * #widgetsList / #scrollRows

    local sizex = maxx - minx
    sbposx = minx + sizex + 1.0 + scrollbarOffset
    local maxStart = GetMaxStart()
    if maxStart > 1 then
      sbposy = sby1 - sbsize - (sbheight - sbsize) * (startEntry - 1) / (maxStart - 1)
    else
      sbposy = sby1 - sbsize
    end
    sbsizex = yStep * sizeMultiplier
    sbsizey = sbsize
    local scrollerPadding = 8 * sizeMultiplier

    -- background
    if (sbposx < mx and mx < sbposx + sbsizex and miny < my and my < maxy) or activescrollbar then
      gl.Color(1, 1, 1, 0.04)
      RectRound(sbposx, miny, sbposx + sbsizex, maxy, 6 * sizeMultiplier)
    end

    -- scroller
    if sbposx < mx and mx < sbposx + sbsizex and sby2 < my and my < sby2 + sbheight then
      gl.Color(1.0, 1.0, 1.0, 0.4)
      gl.Blending(GL.SRC_ALPHA, GL.ONE)
      RectRound(sbposx + scrollerPadding, sbposy, sbposx + sbsizex - scrollerPadding, sbposy + sbsizey, 1.75 * sizeMultiplier)
      gl.Blending(GL.SRC_ALPHA, GL.ONE_MINUS_SRC_ALPHA)
    end

    gl.Color(0.33, 0.33, 0.33, 0.8)
    RectRound(sbposx + scrollerPadding, sbposy, sbposx + sbsizex - scrollerPadding, sbposy + sbsizey, 1.75 * sizeMultiplier)
  else
    sbposx = 0.0
    sbposy = 0.0
    sbsizex = 0.0
    sbsizey = 0.0
  end

  -- highlight label
  if (sbposx < mx and mx < sbposx + sbsizex and miny < my and my < maxy) or activescrollbar then
  else
    if pointedY then
      gl.Color(1.0, 1.0, 1.0, 0.09)
      local xn = minx + 0.5
      local xp = maxx - 0.5
      local yn = pointedY - ((fontSpace * 0.5 + 1) * sizeMultiplier)
      local yp = pointedY + ((fontSize + fontSpace * 0.5 + 1) * sizeMultiplier)

      if scrollbarOffset < 0 then
        xp = xp + scrollbarOffset
        --xn = xn - scrollbarOffset
      end

      yn = yn + 0.5
      yp = yp - 0.5
      gl.Blending(GL.SRC_ALPHA, GL.ONE)
      RectRound(xn, yn, xp, yp, 5 * sizeMultiplier)
      gl.Blending(GL.SRC_ALPHA, GL.ONE_MINUS_SRC_ALPHA)
    end
  end

  gl.EndText()
end

function widget:MousePress(x, y, button)
  if Spring.IsGUIHidden() or not show then return false end
  UpdateList()

  if button == 1 then
    -- above a button
    for i, _ in ipairs(buttons) do
      if IsOnButton(i, x, y) then return true end
    end
    -- above the -/+ 
    if maxx - 10 < x and x < maxx and maxy + bgPadding < y and y < maxy + ((buttonFontSize + 7 + bgPadding) * sizeMultiplier) then return true end
    if minx < x and x < minx + 10 and maxy + bgPadding < y and y < maxy + ((buttonFontSize + 7 + bgPadding) * sizeMultiplier) then return true end

    -- above the scrollbar
    if (x >= minx + scrollbarOffset) and (x <= maxx + scrollbarOffset + (yStep * sizeMultiplier)) then
      if (y >= (maxy - bordery)) and (y <= maxy) then
        if x > maxx + scrollbarOffset then
          ScrollUp(1)
        else
          ScrollUp(pageStep)
        end

        return true
      elseif (y >= miny) and (y <= miny + bordery) then
        if x > maxx + scrollbarOffset then
          ScrollDown(1)
        else
          ScrollDown(pageStep)
        end

        return true
      end
    end

    -- above the list    
    if sbposx < x and x < sbposx + sbsizex and sbposy < y and y < sbposy + sbsizey then
      activescrollbar = true
      scrollbargrabpos = y - sbposy

      return true
    elseif sbposx < x and x < sbposx + sbsizex and sby2 < y and y < sby2 + sbheight then
      if y > sbposy + sbsizey then
        startEntry = math.max(1, math.min(startEntry - curMaxEntries, GetMaxStart()))
      elseif y < sbposy then
        startEntry = math.max(1, math.min(startEntry + curMaxEntries, GetMaxStart()))
      end

      UpdateScrolledGeometry()
      pagestepped = true

      return true
    end
  end

  local namedata = self:AboveLabel(x, y)

  if not namedata then
    show = false
    SyncCallIns()
    return false
  end

  return true
end

function widget:MouseMove(x, y, dx, dy, button)
  if show and activescrollbar then
    local maxStart = GetMaxStart()
    if maxStart > 1 and sbheight > sbsize then
      local thumbY = y - math.min(scrollbargrabpos, sbsize)
      local progress = ((sby1 - sbsize) - thumbY) / (sbheight - sbsize)
      if progress < 0 then
        progress = 0
      elseif progress > 1 then
        progress = 1
      end
      startEntry = math.floor(progress * (maxStart - 1) + 0.5) + 1
    else
      startEntry = 1
    end
    UpdateScrolledGeometry()

    return true
  end

  return false
end

function widget:MouseRelease(x, y, mb)
  if Spring.IsGUIHidden() or not show then return -1 end
  UpdateList()

  if pagestepped then
    pagestepped = false

    return true
  end

  if mb == 1 and activescrollbar then
    activescrollbar = false
    scrollbargrabpos = 0.0

    return -1
  end

  if mb == 1 then
    local yOffset = (7 + bgPadding) * sizeMultiplier

    if maxx - 10 < x and x < maxx and maxy + bgPadding < y and y < maxy + buttonFontSize + 7 + bgPadding then
      -- + button
      curMaxEntries = curMaxEntries + 1
      UpdateScrolledGeometry()
      Spring.WarpMouse(x, maxy + yOffset)

      return -1
    end

    if minx < x and x < minx + 10 and maxy + bgPadding < y and y < maxy + buttonFontSize + 7 + bgPadding then
      -- - button
      if curMaxEntries > minMaxEntries then
        curMaxEntries = curMaxEntries - 1
        UpdateScrolledGeometry()
        Spring.WarpMouse(x, maxy + yOffset)
      end

      return -1
    end
  end

  if mb == 1 then
    local buttonID = nil

    for i, _ in ipairs(buttons) do
      if IsOnButton(i, x, y) then
        buttonID = i
        break
      end
    end

    if buttonID == 1 then
      Spring.SendCommands("luarules reloadluaui")

      return -1
    end

    if buttonID == 2 then
      Spring.SendCommands("luaui factoryreset")

      return -1
    end
  end

  local namedata = self:AboveLabel(x, y)
  if not namedata then return false end
  local name = namedata[1]
  local data = namedata[2]

  if mb == 1 then
    widgetHandler:ToggleWidget(name)
  elseif (button == 2) or (button == 3) then
    local w = widgetHandler:FindWidget(name)
    if not w then return -1 end

    if button == 2 then
      widgetHandler:LowerWidget(w)
    else
      widgetHandler:RaiseWidget(w)
    end

    widgetHandler:SaveConfigData()
  end

  return -1
end

function widget:AboveLabel(x, y)
  if (x < minx) or (y < (miny + bordery)) or (x > maxx) or (y > (maxy - bordery)) then return nil end
  local count = #widgetsList
  if count < 1 then return nil end

  local posy = maxy - ((yStep + bgPadding) * sizeMultiplier)
  for _, row in ipairs(widgetsList) do
    if row.rowType == "widget" then
      local yn = posy - ((fontSpace * 0.5 + 1) * sizeMultiplier)
      local yp = posy + ((fontSize + fontSpace * 0.5 + 1) * sizeMultiplier)
      if y >= yn and y <= yp then
        return row.namedata
      end
    end
    posy = posy - (yStep * sizeMultiplier)
  end

  return nil
end

function widget:IsAbove(x, y)
  if not show then return false end
  UpdateList()
  if (x < minx) or (x > maxx + (yStep * sizeMultiplier)) or (y < miny - #buttons * buttonHeight) or (y > maxy + bgPadding) then return false end

  return true
end

function widget:GetTooltip(x, y)
  if not show then return nil end
  UpdateList()
  local namedata = self:AboveLabel(x, y)
  ----here
  if (not namedata) then
  return "\255\200\255\200" .. "Widget Selector\n"    ..
         "\255\255\255\200" .. "LMB: toggle widget\n" ..
         "\255\255\200\200" .. "MMB: lower  widget\n" ..
         "\255\200\200\255" .. "RMB: raise  widget"
  end
  local n = namedata[1]
  local d = namedata[2]
  local order = widgetHandler.orderList[n]
  local enabled = order and (order > 0)
  local tt = (d.active and GreenStr) or (enabled and YellowStr) or RedStr
  tt = tt .. n .. "\n"
  tt = d.desc and tt .. WhiteStr .. d.desc .. "\n" or tt
  tt = d.author and tt .. BlueStr .. "Author:  " .. CyanStr .. d.author .. "\n" or tt
  tt = tt .. MagentaStr .. d.basename

  if d.fromZip then
    tt = tt .. RedStr .. " (mod widget)"
  end

  return tt
end

function widget:GetConfigData()
  local data = {
    startEntry = startEntry,
    curMaxEntries = curMaxEntries,
    show = show
  }

  return data
end

function widget:SetConfigData(data)
  startEntry = data.startEntry or startEntry
  curMaxEntries = data.curMaxEntries or curMaxEntries
  if data.show ~= nil then
    show = data.show
  end

  if callInsInitialized then
    SyncCallIns()
  end
end

function widget:TextCommand(s)
  -- process request to tell the widgetHandler to blank out the widget config when it shuts down
  local token = {}
  local n = 0

  for w in string.gmatch(s, "%S+") do
    n = n + 1
    token[n] = w
  end

  if n == 1 and token[1] == "reset" then
    -- tell the widget handler to reload with a blank config
    widgetHandler.blankOutConfig = true
    Spring.SendCommands("luarules reloadluaui")
  end

  if n == 1 and token[1] == "factoryreset" then
    -- tell the widget handler to reload with a blank config
    widgetHandler.blankOutConfig = true
    Spring.SendCommands("luarules reloadluaui")
  end

  if string.find(s, "showapiwidgets") == 1 and string.len(s) == 14 then
    showApiWidgets = not showApiWidgets
    widgetHandler.knownChanged = not widgetHandler.knownChanged
    fullWidgetsList = {}
    scrollRows = {}
    UpdateList()

    if showApiWidgets then
      Spring.Echo("Api widgets will be shown in widget list")
    else
      Spring.Echo("Api widgets will not be shown in widget list")
    end
  end
end

function widget:Shutdown()
  Spring.SendCommands("bind f11 luaui selector") -- if this one is removed or crashes, then have the backup one take over.

  if WG["guishader_api"] ~= nil then
    WG["guishader_api"].RemoveRect("widgetselector")
  end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

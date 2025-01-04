--------------------------------------------------------------------------------
--  Red Tooltip (Refactored + Armor Info)
--  Requires: Red UI Framework
--  Author:   Regret, modded by [ur]uncle
--  License:  GNU GPL, v2 or later
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--  Widget Info
--------------------------------------------------------------------------------
function widget:GetInfo()
  return {
    name    = "Red Tooltip", -- version 5 (with armor info)
    desc    = "Requires, [ur]uncle",
    date    = "January 4, 2025",
    license = "GNU GPL, v2 or later",
    layer   = -100,
    enabled = true,
    handler = true,
  }
end

--------------------------------------------------------------------------------
--  Constants & Config
--------------------------------------------------------------------------------
local NEEDED_FRAMEWORK_VERSION = 8

local CANVAS_X, CANVAS_Y = 0, 800
local ICON_SIZE_MASTER = 96
local iconSize = ICON_SIZE_MASTER

local OLD_UNIT_PICS_DIR = LUAUI_DIRNAME .. "Images/oldunitpics/"
local CMD_MORPH = 31410

local otaIconCache = {}

for i = 1, #UnitDefs do
  if VFS.FileExists(OLD_UNIT_PICS_DIR .. UnitDefs[i].name .. ".png") then
    otaIconCache[i] = OLD_UNIT_PICS_DIR .. UnitDefs[i].name .. ".png"
  end
end

local backgroundColor, borderColor = include("Configs/ui_config.lua")
local SY_OFFSET = 94
local CLAMP_Y   = CANVAS_Y - SY_OFFSET

local Config = {
  tooltip = {
    px          = 0,
    py          = CLAMP_Y,
    sx          = 320,
    sy          = SY_OFFSET,
    fontsize    = 13,
    margin      = 5,
    cbackground = backgroundColor,
    cborder     = borderColor,
    dragbutton  = {2}, -- middle mouse button
    tooltip = {
      background = "Hold \255\255\255\1middle mouse button\255\255\255\255 to drag the tooltip display around.",
    },
  },
}

--------------------------------------------------------------------------------
--  Locals for Spring Functions
--------------------------------------------------------------------------------
local spGetCurrentTooltip      = Spring.GetCurrentTooltip
local spGetSelectedUnitsCount  = Spring.GetSelectedUnitsCount
local spGetSelectedUnits       = Spring.GetSelectedUnits
local spGetUnitDefID           = Spring.GetUnitDefID
local spGetMouseState          = Spring.GetMouseState
local spTraceScreenRay         = Spring.TraceScreenRay
local spSetDrawSelectionInfo   = Spring.SetDrawSelectionInfo
local spSendCommands           = Spring.SendCommands
local spGetUnitHealth          = Spring.GetUnitHealth
local spGetUnitArmored         = Spring.GetUnitArmored
local spValidUnitID            = Spring.ValidUnitID

--------------------------------------------------------------------------------
--  Framework Helper References
--------------------------------------------------------------------------------
local New, Copy, SetTooltip, GetSetTooltip, Screen, GetWidgetObjs

local function initRedUIFrameworkFunctions()
  New           = WG.Red.New(widget)
  Copy          = WG.Red.Copytable
  SetTooltip    = WG.Red.SetTooltip
  GetSetTooltip = WG.Red.GetSetTooltip
  Screen        = WG.Red.Screen
  GetWidgetObjs = WG.Red.GetWidgetObjects
end

--------------------------------------------------------------------------------
--  Red UI Framework Checks
--------------------------------------------------------------------------------
local function checkRedUIFramework()
  local color  = "\255\255\255\1"
  local passed = true

  if type(WG.Red) ~= "table" then
    Spring.Echo(color .. widget:GetInfo().name .. " requires Red UI Framework.")
    passed = false
  elseif type(WG.Red.Screen) ~= "table" then
    Spring.Echo(color .. widget:GetInfo().name .. " >> strange error.")
    passed = false
  elseif WG.Red.Version < NEEDED_FRAMEWORK_VERSION then
    Spring.Echo(color .. widget:GetInfo().name .. " >> update your Red UI Framework.")
    passed = false
  end

  if not passed then
    widgetHandler:ToggleWidget(widget:GetInfo().name)
    return false
  end

  initRedUIFrameworkFunctions()
  return true
end

--------------------------------------------------------------------------------
--  Auto-Resize Objects
--------------------------------------------------------------------------------
local lastAutoResizeX, lastAutoResizeY

local function autoResizeObjects()
  if not lastAutoResizeX then
    lastAutoResizeX = CANVAS_X
    lastAutoResizeY = CANVAS_Y
  end

  local lx, ly = lastAutoResizeX, lastAutoResizeY
  local vsx, vsy = Screen.vsx, Screen.vsy

  if (lx ~= vsx) or (ly ~= vsy) then
    local objects = GetWidgetObjs(widget)
    local scale   = vsy / ly

    for i = 1, #objects do
      local o = objects[i]
      local adjust = 0

      if o.movableslaves and (#o.movableslaves > 0) then
        adjust = (o.px * scale + o.sx * scale) - vsx
        if ((o.px + o.sx) - lx) == 0 then
          o._moveduetoresize = true
        end
      end

      if o.px       then o.px       = o.px       * scale end
      if o.py       then o.py       = o.py       * scale end
      if o.sx       then o.sx       = o.sx       * scale end
      if o.sy       then o.sy       = o.sy       * scale end
      if o.fontsize then o.fontsize = o.fontsize * scale end

      if adjust > 0 then
        o._moveduetoresize = true
        o.px = o.px - adjust
        for j = 1, #o.movableslaves do
          local s = o.movableslaves[j]
          s.px = s.px - (adjust / scale)
        end
      elseif (adjust < 0) and o._moveduetoresize then
        o._moveduetoresize = nil
        o.px = o.px - adjust
        for j = 1, #o.movableslaves do
          local s = o.movableslaves[j]
          s.px = s.px - (adjust / scale)
        end
      end
    end

    lastAutoResizeX, lastAutoResizeY = vsx, vsy
  end
end

--------------------------------------------------------------------------------
--  Armor Info Helper
--------------------------------------------------------------------------------
local function getArmorInfo(uID)
  if (not uID) or (not spValidUnitID(uID)) then
    return ""
  end
  local uDefID = spGetUnitDefID(uID)
  if not uDefID then
    return ""
  end

  local uDef      = UnitDefs[uDefID]
  local armorType = (Game.armorTypes[uDef.armorType or 0]) or "???"
  local _, spMaxHP = spGetUnitHealth(uID)
  local maxHP     = spMaxHP or uDef.health

  -- Some units have an 'armoredMultiple' which changes their effective HP when "closed"
  local _, armoredMultiple = spGetUnitArmored(uID)
  local aMult = armoredMultiple or uDef.armoredMultiple or 1

  -- Build the lines
  local lines = {}
  lines[#lines+1] = "\255\245\245\245" .. "Armor:  \255\255\255\255" .. "class " .. armorType
  lines[#lines+1] = "\255\245\245\245" .. "Open:   \255\255\255\255" .. string.format("maxHP: %d", maxHP)

  if aMult ~= 1 then
    local closedBonus   = (1 / aMult - 1) * 100
    local closedMaxHP   = maxHP / aMult
    lines[#lines+1] = "\255\245\245\245" 
       .. "Closed: \255\255\255\255" 
       .. string.format("+%d%%, maxHP: %d", closedBonus, closedMaxHP)
  end

  return table.concat(lines, "\n")
end

--------------------------------------------------------------------------------
--  Tooltip Processing
--------------------------------------------------------------------------------
local currentUnitDefID

-- Original function that customizes the "basic" tooltip text
local function getCustomizedCurrentTooltip()
  local text = spGetCurrentTooltip()

  -- Example: remove or rename advanced T1/2/3/4 unit research centre text
  local lvl1tech = text:match("advanced t1 unit research centre") or nil
  local lvl2tech = text:match("advanced t2 unit research centre") or nil
  local lvl3tech = text:match("advanced t3 unit research centre") or nil
  local lvl4tech = text:match("advanced t4 unit research centre") or nil
  local provides = text:match("Provides") or nil

  if provides then
    if lvl4tech then
      text = text:gsub(lvl3tech or "", "")
      text = text:gsub(lvl2tech or "", "")
      text = text:gsub(lvl1tech or "", "")
      text = text:gsub(",", "", 3)
      text = text:gsub(lvl4tech, "Advanced T4 Unit Research Centre")
    elseif lvl3tech then
      text = text:gsub(lvl2tech or "", "")
      text = text:gsub(lvl1tech or "", "")
      text = text:gsub(",", "", 2)
      text = text:gsub(lvl3tech, "Advanced T3 Unit Research Centre")
    elseif lvl2tech then
      text = text:gsub(lvl1tech or "", "")
      text = text:gsub(",", "", 1)
      text = text:gsub(lvl2tech, "Advanced T2 Unit Research Centre")
    elseif lvl1tech then
      text = text:gsub(lvl1tech, "Advanced T1 Unit Research Centre")
    end
  end

  -- Remove hidden UnitDefID from morph text
  local expMorphPat = "UnitDefID (%d+)\n"
  local morphDefID  = tonumber(text:match(expMorphPat)) or nil
  if morphDefID then
    text = text:gsub(expMorphPat, "")
  end

  -- Restrict experience decimals
  local expPattern = "Experience (%d+%.%d%d)"
  local currentExp = tonumber(text:match(expPattern))
  if currentExp then
    text = text:gsub(expPattern, string.format("Experience %.2f", currentExp))
  end

  -- Add current playing track (if Music widget is present)
  if WG.Music and WG.Music.curTrack then
    text = text .. "\nPlaying : " .. WG.Music.curTrack
  end

  -- Figure out which UnitDef is under the mouse or selected
  if morphDefID then
    currentUnitDefID = morphDefID
    iconSize = Config.tooltip.sy
  else
    local mx, my = spGetMouseState()
    local hoveredUnitDefID

    if mx and my then
      local _, pos = spTraceScreenRay(mx, my, true, true)  -- ground pass
      if pos then
        -- If you need the ground coords, they're in pos[1..3]
      end

      local kind, var1 = spTraceScreenRay(mx, my, false, true)
      if kind == "unit" then
        hoveredUnitDefID = spGetUnitDefID(var1)
      end
    end

    if hoveredUnitDefID then
      currentUnitDefID = hoveredUnitDefID
      iconSize = Config.tooltip.sy
    elseif WG["hoverID"] and WG["hoverID"] < 0 then
      currentUnitDefID = math.abs(WG["hoverID"])
      iconSize = Config.tooltip.sy
    elseif spGetSelectedUnitsCount() == 1 then
      local selUnits = spGetSelectedUnits()
      if selUnits and selUnits[1] and spValidUnitID(selUnits[1]) then
        currentUnitDefID = spGetUnitDefID(selUnits[1])
        iconSize = Config.tooltip.sy
      end
    else
      currentUnitDefID = nil
      iconSize = 0
    end
  end

  return text
end

--------------------------------------------------------------------------------
--  Tooltip UI Creation
--------------------------------------------------------------------------------
local tooltipUI = {}

local function createTooltipUI(r)
  local textElement = {
    "text",
    px       = r.px + r.margin,
    py       = r.py + r.margin,
    fontsize = r.fontsize,
    caption  = "",
    options  = "o",
    onupdate = function(self)
      local count = spGetSelectedUnitsCount()
      -- Example: show how many units are selected
      if count ~= 0 then
        self.caption = "Selected units: " .. count .. "\n"
      else
        self.caption = "\n"
      end

      -- If we hover the tooltip itself, show "drag instructions" or else show normal text
      if self._mouseoverself then
        self.caption = self.caption .. r.tooltip.background
      else
        local baseTooltip = getCustomizedCurrentTooltip() or spGetCurrentTooltip()
        self.caption = self.caption .. (baseTooltip or "")
      end

      -- If exactly one unit is hovered or selected, add armor info
      local hoveredUnitID
      do
        local mx, my = spGetMouseState()
        local kind, var1 = spTraceScreenRay(mx, my, false, true)
        if kind == "unit" then
          hoveredUnitID = var1
        end
      end
      local selUnits = spGetSelectedUnits()
      local singleUnitID
      if hoveredUnitID then
        singleUnitID = hoveredUnitID
      elseif (#selUnits == 1) and spValidUnitID(selUnits[1]) then
        singleUnitID = selUnits[1]
      end
      if singleUnitID then
        self.caption = self.caption .. "\n\n" .. getArmorInfo(singleUnitID)
      end
    end,
  }

  local background = {
    "rectangle",
    px             = r.px,
    py             = r.py,
    sx             = r.sx,
    sy             = r.sy,
    color          = r.cbackground,
    border         = r.cborder,
    movable        = r.dragbutton,
    movableslaves  = { textElement },
    obeyscreenedge = true,
    overrideclick  = {2},
    onupdate       = function(self)
      -- Dynamically resize width (existing logic)
      if self.px < (Screen.vsx / 2) then
        -- Left side of screen
        if (self.sx - r.margin * 2) <= textElement.getwidth() then
          self.sx = ((textElement.getwidth() + r.margin * 2) - 1) + (iconSize * 1.95)
        else
          self.sx = (r.sx * Screen.vsy / CANVAS_Y) + (iconSize * 1.95)
        end
        textElement.px = self.px + r.margin + iconSize
      else
        -- Right side of screen
        if (self.sx - r.margin * 2 - 1) <= textElement.getwidth() then
          self.px = self.px - ((textElement.getwidth() + r.margin * 2) - self.sx)
          self.sx = (textElement.getwidth() + r.margin * 2) + (iconSize * 1.95)
        else
          self.px = self.px - ((r.sx * Screen.vsy / CANVAS_Y) - self.sx)
          self.sx = (r.sx * Screen.vsy / CANVAS_Y) + (iconSize * 1.95)
        end
        textElement.px = self.px + r.margin + iconSize
      end

      -- NEW: Dynamically resize height if text is taller than current box
      local neededHeight = textElement.getheight() + (r.margin * 2)
      if neededHeight > self.sy then
        self.sy = neededHeight
      else
        -- Or revert to default scaled height if text is smaller
        local scaledDefault = r.sy * (Screen.vsy / CANVAS_Y)
        if self.sy > scaledDefault then
          self.sy = scaledDefault
        end
      end
    end,
    mouseover    = function(mx, my, self)
      textElement._mouseoverself = true
    end,
    mousenotover = function(mx, my, self)
      textElement._mouseoverself = nil
    end,
  }

  New(background)
  New(textElement)

  return {
    background = background,
    text       = textElement,
    margin     = r.margin,
  }
end

--------------------------------------------------------------------------------
--  Widget Callins
--------------------------------------------------------------------------------
function widget:Initialize()
  if not checkRedUIFramework() then return end

  tooltipUI = createTooltipUI(Config.tooltip)
  spSetDrawSelectionInfo(false)  -- disables default engine's selection info
  spSendCommands("tooltip 0")    -- disable default engine tooltip
  autoResizeObjects()
end

function widget:Shutdown()
  spSendCommands("tooltip 1")    -- re-enable default engine tooltip
end

function widget:DrawScreen()
  if currentUnitDefID then
    gl.Color(1, 1, 1, 1)
    if WG["OtaIcons"] and otaIconCache[currentUnitDefID] then
      gl.Texture(otaIconCache[currentUnitDefID])
    else
      gl.Texture("#" .. currentUnitDefID)
    end
    -- Draw unit icon next to the tooltip background
    gl.TexRect(
      tooltipUI.background.px,
      Screen.vsy - tooltipUI.background.py - iconSize,
      tooltipUI.background.px + iconSize,
      Screen.vsy - tooltipUI.background.py
    )
    gl.Texture(false)
  end
end

function widget:Update()
  autoResizeObjects()
end

--------------------------------------------------------------------------------
--  Save/Load Widget State
--------------------------------------------------------------------------------
local PassedStartupCheck = true

function widget:GetConfigData()
  if not PassedStartupCheck then
    return
  end

  local vsx, vsy = Screen.vsx, Screen.vsy
  local unscale  = CANVAS_Y / vsy

  local bg = tooltipUI.background
  if (bg.px * unscale > -50) and (bg.py * unscale > -50)
     and (bg.py * unscale) < vsy and (bg.px * unscale) < vsx
  then
    Config.tooltip.px = bg.px * unscale
    Config.tooltip.py = bg.py * unscale
  else
    Config.tooltip.px = 0
    Config.tooltip.py = 0
  end

  return { Config = Config }
end

function widget:SetConfigData(data)
  if data.Config then
    Config.tooltip.px = data.Config.tooltip.px
    Config.tooltip.py = data.Config.tooltip.py

    -- Clamp Y coordinate
    if Config.tooltip.py < 1        then Config.tooltip.py = CLAMP_Y end
    if Config.tooltip.py > CLAMP_Y  then Config.tooltip.py = CLAMP_Y end
  end
end

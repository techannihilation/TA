function widget:GetInfo()
  return {
    name    = 'Energy Conversion Info',
    desc    = 'Displays energy conversion info',
    author  = 'Niobium (mod by Finkky)',
    date    = 'May 2011',
    license = 'GNU GPL v2.1',
    layer   = 0,
    enabled = true,
  }
end

--------------------------------------------------------------------------------
-- Config
--------------------------------------------------------------------------------

local efficiencyClassBoxEnabled = true

local EfficiencyThresholds = {
  { title = 'S',  color = { r = 0.30, g = 0.60, b = 1.00, a = 0.50 }, e = 0.014000 }, -- AC6
  { title = 'A++', color = { r = 0.10, g = 1.00, b = 0.30, a = 0.50 }, e = 0.013500 },
  { title = 'A+', color = { r = 0.10, g = 1.00, b = 0.00, a = 0.50 }, e = 0.013000 }, -- AC5

  { title = 'A',  color = { r = 0.40, g = 1.00, b = 0.00, a = 0.50 }, e = 0.012000 }, -- AC4
  { title = 'B',  color = { r = 0.70, g = 1.00, b = 0.00, a = 0.50 }, e = 0.011500 },
  { title = 'C',  color = { r = 1.00, g = 1.00, b = 0.00, a = 0.50 }, e = 0.011000 }, -- AC3 

  { title = 'D',  color = { r = 1.00, g = 0.50, b = 0.00, a = 0.50 }, e = 0.010000 }, -- AC2

  { title = 'E',  color = { r = 1.00, g = 0.25, b = 0.00, a = 0.50 }, e = 0.009000 }, -- AC1
  { title = 'F',  color = { r = 1.00, g = 0.00, b = 0.00, a = 0.50 }, e = 0.008000 }, -- AC0
  { title = '/',  color = { r = 0.60, g = 0.60, b = 0.60, a = 0.50 }, e = 0.000000 },
}



--------------------------------------------------------------------------------
-- Vars
--------------------------------------------------------------------------------

local alterLevelFormat = string.char(137) .. '%i'

local px, py = 500, 100
local sx, sy = 250, 80
local bx, by = 21, 20
local lrBorder = 7

local hoverLeft = 53
local hoverRight = sx - 7

local barTop = 50
local barThickness = 5
local barBottom = barTop - barThickness

local hoverTop = barTop + 3
local hoverBottom = barBottom - 3
local hoverHWidth = 3

local resourceRefreshRate = 16

--------------------------------------------------------------------------------
-- Speedups
--------------------------------------------------------------------------------

local format = string.format
local min, max, floor = math.min, math.max, math.floor

local glColor, glRect = gl.Color, gl.Rect
local glPushMatrix, glPopMatrix, glTranslate = gl.PushMatrix, gl.PopMatrix, gl.Translate
local glBeginText, glEndText, glText = gl.BeginText, gl.EndText, gl.Text

local spGetMyTeamID        = Spring.GetMyTeamID
local spGetTeamRulesParam  = Spring.GetTeamRulesParam
local spSendLuaRulesMsg    = Spring.SendLuaRulesMsg
local spGetSpectatingState = Spring.GetSpectatingState
local spGetTeamResources   = Spring.GetTeamResources
local spGetViewGeometry    = Spring.GetViewGeometry

-- UI colors with safe loading
local cbackground, cborder, cbuttonbackground = { 0, 0, 0, 0.55 }, { 1, 1, 1, 0.15 }, { 1, 1, 1, 0.08 }
do
  local ok, b1, b2, b3 = pcall(include, 'Configs/ui_config.lua')
  if ok then
    if type(b1) == 'table' then cbackground = b1 end
    if type(b2) == 'table' then cborder = b2 end
    if type(b3) == 'table' then cbuttonbackground = b3 end
  end
end

local convertCapacities = VFS.Include('LuaRules/Configs/maker_defs.lua')
WG.energyConversion = WG.energyConversion or { convertCapacities = convertCapacities }

local triggered = false
local HighPing = false

local WhiteStr  = '\255\255\255\255'
local RedStr    = '\255\255\001\001'
local GreenStr  = '\255\001\255\001'
local YellowStr = '\255\255\255\001'

local r, g, b, a = 1, 1, 1, 1
local myTeamID
local curLevel, curUsage, curCapacity, curAvgEffi = 0, 0, 0, 0
local eCur, eStor = 0, 1
local capacityColor = WhiteStr
local mProducedColor = YellowStr
local eDrainedColor = YellowStr
local hasData = false

--------------------------------------------------------------------------------
-- Helpers
--------------------------------------------------------------------------------

local function getLetter(effi)
  for _, v in ipairs(EfficiencyThresholds) do
    if effi >= v.e then return v end
  end
  return EfficiencyThresholds[#EfficiencyThresholds - 1]
end

function EfficiencyThresholds:getTextColor(effi)
  local higher, lower
  for _, v in ipairs(self) do
    if effi >= v.e then lower = v; break end
    higher = v
  end
  if not lower then lower = self[#self] end
  if not higher then higher = lower end
  local denom = (higher.e - lower.e)
  local rel = (denom ~= 0) and ((effi - lower.e) / denom) or 0
  return
    (lower.color.r + rel * (higher.color.r - lower.color.r)),
    (lower.color.g + rel * (higher.color.g - lower.color.g)),
    (lower.color.b + rel * (higher.color.b - lower.color.b)),
    (lower.color.a + rel * (higher.color.a - lower.color.a))
end

local function drawBorder(x0, y0, x1, y1, t)
  glRect(x0, y0, x1, y0 + t)
  glRect(x0, y1 - t, x1, y1)
  glRect(x0, y0 + t, x0 + t, y1 - t)
  glRect(x1 - t, y0 + t, x1, y1 - t)
end

local function KeepOnScreen()
  local vsx, vsy = spGetViewGeometry()

  local minX = 0
  local minY = 0
  local maxX = vsx - sx
  local maxY = vsy - sy

  if maxX < minX then
    px = math.floor((vsx - sx) * 0.5)
  else
    px = math.min(math.max(px, minX), maxX)
  end

  if maxY < minY then
    py = math.floor((vsy - sy) * 0.5)
  else
    py = math.min(math.max(py, minY), maxY)
  end
end


local function IsOffscreen()
  local vsx, vsy = spGetViewGeometry()
  return (px + sx < 0) or (py + sy < 0) or (px > vsx) or (py > vsy)
end

local function refreshData()
  myTeamID    = spGetMyTeamID()
  curLevel    = tonumber(spGetTeamRulesParam(myTeamID, 'mmLevel'))    or curLevel or 0
  curUsage    = tonumber(spGetTeamRulesParam(myTeamID, 'mmUse'))      or 0
  curCapacity = tonumber(spGetTeamRulesParam(myTeamID, 'mmCapacity')) or 0
  curAvgEffi  = tonumber(spGetTeamRulesParam(myTeamID, 'mmAvgEffi'))  or 0

  local eC, eS = spGetTeamResources(myTeamID, 'energy')
  eCur  = tonumber(eC) or 0
  eStor = tonumber(eS) or 1
  if eStor <= 0 then eStor = 1 end

  mProducedColor = (curUsage > 0 and curAvgEffi > 0) and (GreenStr .. '+') or YellowStr
  eDrainedColor  = (curUsage > 0 and curAvgEffi > 0) and (RedStr   .. '-') or YellowStr

  local rc = (curCapacity > 0) and (curUsage / curCapacity) or 0
  if rc < 0.8 then
    capacityColor = GreenStr
  elseif rc < 1 then
    capacityColor = WhiteStr
  else
    capacityColor = YellowStr
  end

  r, g, b, a = EfficiencyThresholds:getTextColor(curAvgEffi)
  hasData = true
end

function DrawStatus(_, _, ping)
  HighPing = ping
end

--------------------------------------------------------------------------------
-- Callins
--------------------------------------------------------------------------------

function widget:Initialize()
  widgetHandler:RegisterGlobal('DrawManager_energygui', DrawStatus)
  KeepOnScreen()
  if IsOffscreen() then px, py = 50, 120 end
  refreshData()
end

function widget:Shutdown()
  widgetHandler:DeregisterGlobal('DrawManager_energygui', DrawStatus)
end

function widget:ViewResize()
  KeepOnScreen()
end

function widget:GameFrame(frame)
  if frame % 10 == 0 and WG['background_color_over'] and type(cbackground) == 'table' then
    cbackground[4] = WG['background_color_over']
  end
  if frame % resourceRefreshRate == 1 then
    refreshData()
  end
end

function widget:DrawScreen()
  if not triggered then
    if WG['background_color'] and type(cbackground) == 'table' then
      cbackground[4] = WG['background_color']
    end
    triggered = true
  end

  if not hasData then refreshData() end
  if HighPing then return end

  glPushMatrix()
  glTranslate(px, py, 0)

  -- Panel
  glColor(cbackground[1] or 0, cbackground[2] or 0, cbackground[3] or 0, cbackground[4] or 0.55)
  glRect(0, 0, sx, sy)
  glColor(cborder[1] or 1, cborder[2] or 1, cborder[3] or 1, cborder[4] or 0.15)
  drawBorder(0, 0, sx, sy, 1)

  -- Class box
  if efficiencyClassBoxEnabled then
    local currentRating = getLetter(curAvgEffi)
    local t = 1
    glColor(r, g, b, 0.5)
    drawBorder(sx - bx, 0, sx, by, t)
    glColor(r, g, b, 0.3)
    glRect(sx - bx + t, t, sx - t, by - t)
    glColor(r, g, b, 1)
    glText(currentRating.title, sx - bx / 2, by / 2 + 1, 12, 'cv')
  end

  -- Text
  glBeginText()
    glText('Energy Conversion', lrBorder, 58, 12, 'do')
    glText(
      format('%s%.1f m%s / %s%.0f e', mProducedColor, curAvgEffi * curUsage, WhiteStr, eDrainedColor, curUsage),
      sx - lrBorder, 58, 12, 'dr'
    )

    glText('Hover:', lrBorder, 40, 12, 'do')

    glText('Usage:', lrBorder, 22, 12, 'do')
    if curCapacity > 0 then
      glText(
        format('%i / %i (%s%i%%%s)', curUsage, curCapacity, capacityColor, (curUsage / curCapacity) * 100, WhiteStr),
        sx - lrBorder, 22, 12, 'dr'
      )
    else
      glText(RedStr .. 'no capacity', sx - lrBorder, 22, 12, 'dr')
    end

    glText('Efficiency (Class)', lrBorder, 4, 12, 'do')
    glText(
      format('%s  %.2f m%s / 1000 e',
        format('%c%c%c%c', 255, r * 254 + 1, g * 254 + 1, b * 254 + 1),
        curAvgEffi * 1000, WhiteStr),
      sx - lrBorder - bx, 4, 12, 'dr'
    )
  glEndText()

  -- Energy bar
  glColor(0, 0, 0, 0.5)
  glRect(hoverLeft, barBottom, hoverRight, barTop)
  local energyRelative = min(1, max(0, eCur / eStor))
  glColor(1, 1, 0, 1)
  glRect(
    hoverLeft + 1, barBottom + 1,
    hoverLeft + 1 + energyRelative * (hoverRight - hoverLeft - 2), barTop - 1
  )

  -- Slider
  local sliderX = hoverLeft + (hoverRight - hoverLeft) * min(1, max(0, curLevel))
  glColor(1, 0, 0, 0.75)
  glRect(sliderX - hoverHWidth, hoverBottom, sliderX + hoverHWidth, hoverTop)
  glColor(0, 0, 0, 1)
  drawBorder(sliderX - hoverHWidth, hoverBottom, sliderX + hoverHWidth, hoverTop, 1)

  glPopMatrix()
end

function widget:MousePress(mx, my, mButton)
  if mButton == 2 or mButton == 3 then
    if mx >= px and my >= py and mx < px + sx and my < py + sy then
      return true
    end
  elseif mButton == 1 and not spGetSpectatingState() then
    local dx, dy = mx - px, my - py
    if dx >= hoverLeft and dy >= hoverBottom and dx < hoverRight and dy < hoverTop then
      local newShare = 100 * (dx - hoverLeft) / (hoverRight - hoverLeft)
      spSendLuaRulesMsg(format(alterLevelFormat, newShare))
      return true
    end
  end
  return false
end

function widget:MouseMove(mx, my, dx, dy, mButton)
  if mButton == 2 or mButton == 3 then
    px = px + dx
    py = py + dy
    KeepOnScreen()
    return true
  end
  return false
end

function widget:GetConfigData()
  local vsx, vsy = spGetViewGeometry()
  return { px / vsx, py / vsy }
end

function widget:SetConfigData(data)
  local vsx, vsy = spGetViewGeometry()
  local nx = tonumber(data and data[1]) or (px / vsx)
  local ny = tonumber(data and data[2]) or (py / vsy)
  px = floor(max(0, vsx * min(nx, 0.95)))
  py = floor(max(0, vsy * min(ny, 0.95)))
  KeepOnScreen()
end

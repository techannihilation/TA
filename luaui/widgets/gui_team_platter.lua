--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    gui_team_platter.lua
--  brief:   team colored platter for all visible units
--  author:  Dave Rodgers
--
--  Copyright (C) 2007.
--  Licensed under the terms of the GNU GPL, v2 or later.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:GetInfo()
  return {
    name      = "TeamPlatter",
    desc      = "Shows a team color platter above all visible units",
    author    = "trepan",
    date      = "Apr 16, 2007",
    license   = "GNU GPL, v2 or later",
    layer     = 5,
    enabled   = false  --  loaded by default?
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- Automatically generated local definitions

local GL_LINE_LOOP           = GL.LINE_LOOP
local GL_TRIANGLE_FAN        = GL.TRIANGLE_FAN
local glBeginEnd             = gl.BeginEnd
local glColor                = gl.Color
local glCreateList           = gl.CreateList
local glDeleteList           = gl.DeleteList
local glDepthTest            = gl.DepthTest
local glDrawListAtUnit       = gl.DrawListAtUnit
local glLineWidth            = gl.LineWidth
local glPolygonOffset        = gl.PolygonOffset
local glVertex               = gl.Vertex
local spDiffTimers           = Spring.DiffTimers
local spGetVisibleUnits      = Spring.GetVisibleUnits
local spGetGroundNormal      = Spring.GetGroundNormal
local spGetSelectedUnits     = Spring.GetSelectedUnits
local spGetTeamColor         = Spring.GetTeamColor
local spGetTimer             = Spring.GetTimer
local spGetUnitBasePosition  = Spring.GetUnitBasePosition
local spGetUnitDefDimensions = Spring.GetUnitDefDimensions
local spGetUnitDefID         = Spring.GetUnitDefID
local spGetUnitRadius        = Spring.GetUnitRadius
local spGetUnitTeam          = Spring.GetUnitTeam
local spGetUnitViewPosition  = Spring.GetUnitViewPosition
local spIsUnitSelected       = Spring.IsUnitSelected
local spIsUnitVisible        = Spring.IsUnitVisible
local spSendCommands         = Spring.SendCommands

local sin                    = math.sin
local cos                    = math.cos
local pi                     = math.pi
local acos                   = math.acos

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local GetGaiaTeamID = Spring.GetGaiaTeamID () --+++
function widget:PlayerChanged() --+++
	GetGaiaTeamID = Spring.GetGaiaTeamID () --+++
end --+++

local function SetupCommandColors(state)
  local alpha = state and 1 or 0
  local f = io.open('cmdcolors.tmp', 'w+')
  if (f) then
    f:write('unitBox  0 1 0 ' .. alpha)
    f:close()
    spSendCommands({'cmdcolors cmdcolors.tmp'})
  end
  os.remove('cmdcolors.tmp')
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local teamColors = {}

local trackSlope = true

local circleLines  = 0
local circlePolys  = 0
local circleDivs   = 32
local circleOffset = 0

local startTimer = spGetTimer()

local CantDraw = true
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:Initialize()
  widgetHandler:RegisterGlobal('GetHeight_teamplatter', IsTooHigh)

  circleLines = glCreateList(function()
    glBeginEnd(GL_LINE_LOOP, function()
      local radstep = (2.0 * pi) / circleDivs
      for i = 1, circleDivs do
        local a = (i * radstep)
        glVertex(sin(a), circleOffset, cos(a))
      end
    end)
  end)

  circlePolys = glCreateList(function()
    glBeginEnd(GL_TRIANGLE_FAN, function()
      local radstep = (2.0 * pi) / circleDivs
      for i = 1, circleDivs do
        local a = (i * radstep)
        glVertex(sin(a), circleOffset, cos(a))
      end
    end)
  end)

  SetupCommandColors(false)
end


function widget:Shutdown()
  widgetHandler:DeregisterGlobal('GetHeight_teamplatter', IsTooHigh)

  glDeleteList(circleLines)
  glDeleteList(circlePolys)

  SetupCommandColors(true)
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function IsTooHigh(toohigh)
    CantDraw = toohigh
end

local realRadii = {}


local function GetUnitDefRealRadius(udid)
  local radius = realRadii[udid]
  if (radius) then
    return radius
  end

  local ud = UnitDefs[udid]
  if (ud == nil) then return nil end

  local dims = spGetUnitDefDimensions(udid)
  if (dims == nil) then return nil end

  local scale = ud.hitSphereScale -- missing in 0.76b1+
  scale = ((scale == nil) or (scale == 0.0)) and 1.0 or scale
  radius = dims.radius / scale
  realRadii[udid] = radius
  return radius
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local teamColors = {}


local function GetTeamColorSet(teamID)
  local colors = teamColors[teamID]
  if (colors) then
    return colors
  end
  local r,g,b = spGetTeamColor(teamID)
  
  colors = { r, g, b, 0.14 }
  teamColors[teamID] = colors
  return colors
end

-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:DrawWorldPreUnit()
    if Spring.IsGUIHidden() == true or CantDraw then 
      return  -- avoid unnecessary GL calls
    end
    
  glLineWidth(3.0)

  glDepthTest(true)
  
  glPolygonOffset(-50, -2)

  local lastColorSet = nil
   local visibleUnits = spGetVisibleUnits()
   if #visibleUnits then
    for i=1, #visibleUnits do
    unitID = visibleUnits[i]      
      local teamID = spGetUnitTeam(unitID)
      if (teamID and teamID~=GetGaiaTeamID) then	--+++
        local udid = spGetUnitDefID(unitID)
        local radius = GetUnitDefRealRadius(udid)
        if (radius) then
          local colorSet  = GetTeamColorSet(teamID)
          if (trackSlope and (not UnitDefs[udid].canFly)) then
            local x, y, z = spGetUnitBasePosition(unitID)
            local gx, gy, gz = spGetGroundNormal(x, z)
            local degrot = acos(gy) * 180 / pi
            glColor(colorSet)
            glDrawListAtUnit(unitID, circlePolys, false,
                             radius, 1.0, radius,
                             degrot, gz, 0, -gx)
          else
            glColor(colorSet)
            glDrawListAtUnit(unitID, circlePolys, false,
                             radius, 1.0, radius)
         end
        end
   end
 end
end
	   

	

  glPolygonOffset(false)

  --
  -- Blink the selected units
  --

  glDepthTest(false)

  local diffTime = spDiffTimers(spGetTimer(), startTimer)
  local alpha = 1.0 * math.abs(0.5 - (diffTime * 3.0 % 1.0))

  for _,unitID in ipairs(spGetSelectedUnits()) do
  local teamID = spGetUnitTeam(unitID)
  local colors  = GetTeamColorSet(teamID)
  glColor(colors[1],colors[2],colors[3], alpha)
  local udid = spGetUnitDefID(unitID)
  local radius = GetUnitDefRealRadius(udid)
    if (radius) then
      if (trackSlope and (not UnitDefs[udid].canFly)) then
      local x, y, z = spGetUnitBasePosition(unitID)
      local gx, gy, gz = spGetGroundNormal(x, z)
      local degrot = acos(gy) * 180 / pi
      glDrawListAtUnit(unitID, circleLines, false,
                       radius, 1.0, radius,
                       degrot, gz, 0, -gx)
     else
     glDrawListAtUnit(unitID, circleLines, false,
                      radius, 1.0, radius)
     end
    end
  end
  glLineWidth(1.0)
end
              

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

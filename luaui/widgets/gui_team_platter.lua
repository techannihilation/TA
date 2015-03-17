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
local SpGetAllUnits        = Spring.GetAllUnits

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

local TooHigh = true
local HighPing = false
local FPSCount = Spring.GetFPS()
local FPSLimit = 8

local update = 1.0
local timeCounter = math.huge -- force the first update
local visibleUnits = {}
local selectedUnits = {} 
local Unitlist = {}
local diffTime
local alpha
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local teamColors = {}


local function GetTeamColorSet(teamID)
  local colors = teamColors[teamID]
  if (colors) then
    return colors
  end
  local r,g,b = spGetTeamColor(teamID)
  
  colors = { r, g, b, 0.23 }
  teamColors[teamID] = colors
  return colors
end


local function SetUnitRadius(unitID)
  --Unitlist[unitID] = nil
  local ud = UnitDefs[spGetUnitDefID(unitID)]
  local teamID = spGetUnitTeam(unitID)
  if (ud == nil) then
    Unitlist[unitID] = nil
    return
  end
  Unitlist[unitID] = { radius = ud.radius , team = teamID , canfly = ud.canFly , teamcolor = GetTeamColorSet(teamID)}
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function widget:Initialize()
  widgetHandler:RegisterGlobal('DrawManager_teamplatter', DrawStatus)
  if (UnitDefs[1].radius == nil) then
    for udid, ud in ipairs(UnitDefs) do
      -- this cause a lag on loading, but it is a huge performance improvment!
      ud.radius = GetUnitDefRealRadius(udid)
    end
  end
  
  for _, unitID in ipairs(SpGetAllUnits()) do
      SetUnitRadius(unitID)
  end
  
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
  widgetHandler:DeregisterGlobal('DrawManager_teamplatter', DrawStatus)

  glDeleteList(circleLines)
  glDeleteList(circlePolys)
  

  SetupCommandColors(true)
end

function widget:Update(deltaTime)
  diffTime = spDiffTimers(spGetTimer(), startTimer)
  alpha = 2.0 * math.abs(0.5 - (diffTime * 3.0 % 1.0))
  if (timeCounter < update) then
    timeCounter = timeCounter + deltaTime
    return
  end
  visibleUnits = spGetVisibleUnits()
  selectedUnits = spGetSelectedUnits()
  timeCounter = 0
end


function widget:UnitCreated(unitID, unitDefID, unitTeam)
  if (Spring.IsUnitAllied(unitID)) then
    SetUnitRadius(unitID)
  end
end

function widget:UnitDestroyed(unitID, unitDefID, unitTeam)
  Unitlist[unitID] = nil
end


function widget:UnitGiven(unitID, unitDefID, oldTeam, newTeam)
    SetUnitRadius(unitID)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


function DrawStatus(toohigh,fps,ping)
    TooHigh = toohigh
    FPSCount = fps
    HighPing = ping
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




-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:DrawWorldPreUnit()
    --Spring.Echo(TooHigh,FPSCount,HighPing)
  
    if Spring.IsGUIHidden() == true or ( TooHigh == true ) or ( FPSCount < FPSLimit ) or ( HighPing == true ) then 
      return  -- avoid unnecessary GL calls
    end
    
  glLineWidth(10.0)

  glDepthTest(true)
  
  glPolygonOffset(-50, -2)

  local lastColorSet = nil
   if #visibleUnits then
    for i=1, #visibleUnits do
    unitID = visibleUnits[i] 
    if Unitlist[unitID] then
      local teamID = Unitlist[unitID].team
      if (teamID and teamID~=GetGaiaTeamID) then
	local radius = Unitlist[unitID].radius 
        if (radius) then
          local colorSet  = Unitlist[unitID].teamcolor
	  local canfly = Unitlist[unitID].canfly
          if (trackSlope and (not canfly)) and Spring.ValidUnitID(unitID) then
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
end
	   

	

  glPolygonOffset(false)

  --
  -- Blink the selected units
  --

  glDepthTest(false)


if #selectedUnits then
    for i=1, #selectedUnits do
    unitID = selectedUnits[i] 
    if Unitlist[unitID] then

    local colors  = Unitlist[unitID].teamcolor
    glColor(colors[1],colors[2],colors[3], alpha)
    
    local radius = Unitlist[unitID].radius
    if (radius) then
      local canfly = Unitlist[unitID].canfly
      if (trackSlope and (not canfly)) then
        local x, y, z = spGetUnitBasePosition(unitID)
	if x or y ~= nil then 
          local gx, gy, gz = spGetGroundNormal(x, z)
          local degrot = acos(gy) * 180 / pi
          glDrawListAtUnit(unitID, circleLines, false,
                       radius, 1.0, radius,
                       degrot, gz, 0, -gx)
	end
     else
          glDrawListAtUnit(unitID, circleLines, false,
                      radius, 1.0, radius)
     end
     
    end
      end
    end
  end
  glLineWidth(1.0)
end
              

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

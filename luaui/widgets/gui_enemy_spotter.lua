--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    gui_enemy_spotter.lua
--  brief:   Draws transparant smoothed donuts under enemy units
--  author:  Dave Rodgers (orig. TeamPlatter edited by TradeMark)
--
--  Copyright (C) 2007.
--  Licensed under the terms of the GNU GPL, v2 or later.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:GetInfo()
   return {
      name      = "EnemySpotter2",
      desc      = "Draws transparant smoothed donuts under enemy units (with teamcolors or predefined colors, depending on situation)",
      author    = "TradeMark  (Floris: added multiple ally color support + performance)",
      date      = "22,Jan,2014",
      license   = "GNU GPL, v2 or later",
      layer     = 5,
      enabled   = false  --  loaded by default?
   }
end



--------------------------------------------------------------------------------
-- Config
--------------------------------------------------------------------------------

local drawWithHiddenGUI                 = true    -- keep widget enabled when graphical user interface is hidden (when pressing F5)
local skipOwnAllyTeam                   = true    -- keep this 'true' if you dont want circles rendered under your own units

local circleSize                        = 1
local circleDivs                        = 12      -- how precise circle? octagon by default
local circleOpacity                     = 0.15
local innerSize                         = 1.35    -- circle scale compared to unit radius
local outerSize                         = 1.30    -- outer fade size compared to circle scale (1 = no outer fade)
                                        
local defaultColorsForAllyTeams         = 0       -- (number of teams)   if number <= of total numebr of allyTeams then dont use teamcoloring but default colors
local keepTeamColorsForSmallAllyTeam    = 3       -- (number of teams)   use teamcolors if number or teams (inside allyTeam)  <=  this value
local spotterColor = {                            -- default color values
   {0,0,1} , {1,0,1} , {0,1,1} , {0,1,0} , {1,0.5,0} , {0,1,1} , {1,1,0} , {1,1,1} , {0.5,0.5,0.5} , {0,0,0} , {0.5,0,0} , {0,0.5,0} , {0,0,0.5} , {0.5,0.5,0} , {0.5,0,0.5} , {0,0.5,0.5} , {1,0.5,0.5} , {0.5,0.5,0.1} , {0.5,0.1,0.5},
}

local EsMaxDist = 2500000 -- max dist at which to draw ETA

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- Automatically generated local definitions

local glDrawListAtUnit        = gl.DrawListAtUnit

local gaiaTeamID              = Spring.GetGaiaTeamID()
local myTeamID                = Spring.GetLocalTeamID()
local myAllyID                = Spring.GetMyAllyTeamID()

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local realRadii               = {}
local circlePolys             = {}
local allyToSpotterColor      = {}
local allyToSpotterColorCount = 0
local pickTeamColor           = false

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


local function drawSpottersBaseInner()
   radstep = (2.0 * math.pi) / circleDivs
   for i = 1, circleDivs do
       a1 = (i * radstep)
       a2 = ((i+1) * radstep)
       gl.Color(usedSpotterColor[1], usedSpotterColor[2], usedSpotterColor[3], 0)
       gl.Vertex(0, 0, 0)
       gl.Color(usedSpotterColor[1], usedSpotterColor[2], usedSpotterColor[3], circleOpacity)
       gl.Vertex(math.sin(a1), 0, math.cos(a1))
       gl.Vertex(math.sin(a2), 0, math.cos(a2))
   end
end

local function drawSpottersBaseOuter()
   radstep = (2.0 * math.pi) / circleDivs
   for i = 1, circleDivs do
       a1 = (i * radstep)
       a2 = ((i+1) * radstep)
       gl.Color(usedSpotterColor[1], usedSpotterColor[2], usedSpotterColor[3], circleOpacity)
       gl.Vertex(math.sin(a1), 0, math.cos(a1))
       gl.Vertex(math.sin(a2), 0, math.cos(a2))
       gl.Color(usedSpotterColor[1], usedSpotterColor[2], usedSpotterColor[3], 0)
       gl.Vertex(math.sin(a2)*outerSize, 0, math.cos(a2)*outerSize)
       gl.Vertex(math.sin(a1)*outerSize, 0, math.cos(a1)*outerSize)
   end
end

local function drawSpotters()
   gl.BeginEnd(GL.TRIANGLES, drawSpottersBaseInner)
   if outerSize ~= 1 then
       gl.BeginEnd(GL.QUADS, drawSpottersBaseOuter)
   end
end



-- Creating polygons:
function widget:Initialize()
   allyTeamList = Spring.GetAllyTeamList()
   numberOfAllyTeams = #allyTeamList
   for allyTeamListIndex=1, numberOfAllyTeams do
      allyID = allyTeamList[allyTeamListIndex]
      if not skipOwnAllyTeam  or  (skipOwnAllyTeam  and  not (allyID == myAllyID))  then
         allyToSpotterColorCount     = allyToSpotterColorCount+1
         allyToSpotterColor[allyID]  = allyToSpotterColorCount
         usedSpotterColor      = spotterColor[allyToSpotterColorCount]
         if defaultColorsForAllyTeams < numberOfAllyTeams-1 then
            teamList = Spring.GetTeamList(allyID)
            numberOfTeamList = #teamList
            for teamListIndex=1, numberOfTeamList do
               teamID = teamList[teamListIndex]
               if teamID ~= gaiaTeamID then
                  if (teamListIndex == 1  and  #teamList <= keepTeamColorsForSmallAllyTeam) then     -- only check for the first allyTeam  (to be consistent with picking a teamcolor or default color, inconsistency could happen with different teamsizes)
                     pickTeamColor = true
                  end
                  if pickTeamColor then
                     -- pick the first team in the allyTeam and take the color from that one
                     if (teamListIndex == 1) then
                        r,g,b,a       = Spring.GetTeamColor(teamID)
                        usedSpotterColor[1] = r
                        usedSpotterColor[2] = g
                        usedSpotterColor[3] = b
                     end
                  end
               end
            end
         end
         circlePolys[allyID] = gl.CreateList(drawSpotters)
      end
   end
end


function widget:Shutdown()
    for _,circlePoly in pairs(circlePolys) do
        gl.DeleteList(circlePoly)
    end
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


-- Retrieving radius:
local function GetUnitDefRealRadius(udid)
   radius = realRadii[udid]
   if (radius) then return radius end
   ud = UnitDefs[udid]
   if (ud == nil) then return nil end
   dims = Spring.GetUnitDefDimensions(udid)
   if (dims == nil) then return nil end
   scale = ud.hitSphereScale -- missing in 0.76b1+
   scale = ((scale == nil) or (scale == 0.0)) and 1.0 or scale
   radius = dims.radius / scale
   realRadii[udid] = radius
   return radius
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


function widget:DrawWorldPreUnit()
   if not drawWithHiddenGUI then
      if Spring.IsGUIHidden() then return end
   end
   visibleUnits = Spring.GetVisibleUnits()
   numberOfVisibleUnits = #visibleUnits
   if numberOfVisibleUnits then
      gl.DepthTest(true)
      gl.PolygonOffset(-100, -2)         -- else the spotters flicker
      gl.Blending(GL.SRC_ALPHA, GL.ONE_MINUS_SRC_ALPHA)      -- disable layer blending
      for i=1, numberOfVisibleUnits do
        unitID = visibleUnits[i]
	local cx, cy, cz = Spring.GetCameraPosition()
        local ux,uy,uz = Spring.GetUnitViewPosition(unitID)
          if ux~=nil then
          local dx, dy, dz = ux-cx, uy-cy, uz-cz
          local dist = dx*dx + dy*dy + dz*dz
	    if dist < EsMaxDist then 
            allyID = Spring.GetUnitAllyTeam(unitID)
              if circlePolys[allyID] ~= nil then
                if not skipOwnAllyTeam  or  (skipOwnAllyTeam  and  not (allyID == myAllyID))  then
                unitDefIDValue = Spring.GetUnitDefID(unitID)
                  if (unitDefIDValue) then
                  radius = GetUnitDefRealRadius(unitDefIDValue) * circleSize
                    if (radius) then
                    glDrawListAtUnit(unitID, circlePolys[allyID], false, radius, 1.0, radius)
                    end
                  end
                end
              end
            end
          end
      gl.DepthTest(false)
   end
end
end

             

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
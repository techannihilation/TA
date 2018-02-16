local versionNumber = "1.2"

function widget:GetInfo()
	return {
		name      = "Ghost Site",
		desc      = "[v" .. string.format("%s", versionNumber ) .. "] Displays ghosted buildings in progress and features",
		author    = "very_bad_soldier",
		date      = "April 7, 2009",
		license   = "GNU GPL v2",
		layer     = 0,
		enabled   = true
	}
end

--[[changelog:
1.1: removes itself when old defense range found (thx to TFC)
1.2: fixed buildframes not showing up, now uses correct rotation, tracks enemy wrecks when necessary.
--]]

-- CONFIGURATION
local debug = false		--generates debug message
local updateInt = 1 	--seconds for the ::update loop
-- END OF CONFIG

local lastTime
local ghostSites = {}
local ghostFeatures = {}
local ignoreFeature = {}

local floor                 = math.floor
local udefTab				= UnitDefs
local glColor               = gl.Color
local glDepthTest           = gl.DepthTest
local glTexture             = gl.Texture
local glTexEnv				= gl.TexEnv
local glLineWidth           = gl.LineWidth
local glPopMatrix           = gl.PopMatrix
local glPushMatrix          = gl.PushMatrix
local glTranslate           = gl.Translate
local glFeatureShape		= gl.FeatureShape
local glRotate              = gl.Rotate
local spGetGameSeconds      = Spring.GetGameSeconds
local spGetMyPlayerID       = Spring.GetMyPlayerID
local spGetPlayerInfo       = Spring.GetPlayerInfo
local spGetAllFeatures		= Spring.GetAllFeatures
local spGetFeaturePosition  = Spring.GetFeaturePosition
local spGetFeatureDefID		= Spring.GetFeatureDefID
local spGetMyAllyTeamID		= Spring.GetMyAllyTeamID
local spGetFeatureAllyTeam	= Spring.GetFeatureAllyTeam
local spGetFeatureTeam		= Spring.GetFeatureTeam
local spGetUnitHealth 		= Spring.GetUnitHealth
local spGetFeatureHealth 	= Spring.GetFeatureHealth
local spGetFeatureResurrect = Spring.GetFeatureResurrect
local spGetPositionLosState = Spring.GetPositionLosState
local spIsUnitAllied		= Spring.IsUnitAllied
local spGetUnitDirection     = Spring.GetUnitDirection
local spGetFeatureDirection  = Spring.GetFeatureDirection
local spGetUnitBasePosition = Spring.GetUnitBasePosition
local spGetUnitHealth 	    = Spring.GetUnitHealth
local spValidFeatureID     = Spring.ValidFeatureID
local spEcho                = Spring.Echo
local spGetUnitDefID        = Spring.GetUnitDefID
local spGetUnitRulesParam   = Spring.GetUnitRulesParam

local mdeg = math.deg
local matan2 = math.atan2

local DrawGhostFeatures
local DrawGhostSites
local ScanFeatures
local DeleteGhostFeatures
local DeleteGhostSites
local ResetGl
local CheckSpecState
local firstScan = true

local TooHigh = true
local HighPing = false
local FPSCount = Spring.GetFPS()
local FPSLimit = 8

local dontTrackEnemyWrecks = tonumber(Spring.GetModOptions().mo_enemywrecks) or 0

function widget:Initialize()
	if Spring.IsReplay() or Spring.GetGameFrame() > 0 then
	    widget:PlayerChanged()
  	end
	widgetHandler:RegisterGlobal('DrawManager_ghostsite', DrawStatus)
end

function widget:ShutDown()
	widgetHandler:DeregisterGlobal('DrawManager_ghostsite', DrawStatus)
end

function widget:Update()
	local timef = spGetGameSeconds()
	local time = floor(timef)

	-- update timers once every <updateInt> seconds
	if (time % updateInt == 0 and time ~= lastTime) then	
		lastTime = time
		--do update stuff:
				
		ScanFeatures()
		
		DeleteGhostSites()
		DeleteGhostFeatures()
	end
end

function widget:DrawWorld()
  
	if ( TooHigh == true ) or ( FPSCount < FPSLimit ) or ( HighPing == true ) then 
		return
	end
	
	DrawGhostSites()
	
	DrawGhostFeatures()
	
	ResetGl()
end


function widget:UnitEnteredLos(unitID, allyTeam)

	if ( spIsUnitAllied( unitID ) ) then
		return
	end
	
	local udef = udefTab[spGetUnitDefID(unitID)]
		
	if ( udef ~= nil and (udef.isBuilding == true or udef.isFactory == true) and (spGetUnitRulesParam(unitID, "under_construction") == 1))  then
		local x, y, z = spGetUnitBasePosition(unitID)
		
		local dx,_,dz = spGetUnitDirection(unitID)
		local angle = mdeg(matan2(dx,dz))	
		
		ghostSites[unitID] = { unitDefId = spGetUnitDefID(unitID), x=x, y=y, z=z, teamId = allyTeam, angle = angle }
	end
end

function DrawStatus(toohigh,fps,ping)
	    TooHigh = toohigh
	    FPSCount = fps
	    HighPing = ping
end

function DrawGhostFeatures()
  glColor(1.0, 1.0, 1.0, 0.35 )
	glTexture(0,"$units1")
	--glTexture(1,"$units1")

	glTexEnv( GL.TEXTURE_ENV, GL.TEXTURE_ENV_MODE, 34160 )				--GL_COMBINE_RGB_ARB
	--use the alpha given by glColor for the outgoing alpha.
	glTexEnv( GL.TEXTURE_ENV, 34162, GL.REPLACE )			--GL_COMBINE_ALPHA
	glTexEnv( GL.TEXTURE_ENV, 34184, 34167 )			--GL_SOURCE0_ALPHA_ARB			GL_PRIMARY_COLOR_ARB
	
	--------------------------Draw-------------------------------------------------------------
	for unitID, ghost in pairs( ghostFeatures ) do

		local x, y, z = ghost.x, ghost.y, ghost.z
		local _, b, _ = spGetPositionLosState(x, y, z)
		local losState = b
	
		if ( losState == false ) then
			--glow effect?
			--gl.Blending(GL.SRC_ALPHA, GL.ONE)
			    
			glPushMatrix()
			glTranslate(x, y, z)
			glRotate(ghost.angle,0,y,0)

			glFeatureShape(ghost["featDefId"], ghost["teamId"] )
			  
			glPopMatrix()
		end
	end

	--------------------------Clean up-------------------------------------------------------------
	glTexEnv( GL.TEXTURE_ENV, GL.TEXTURE_ENV_MODE, 8448 )				--GL_MODULATE
	--use the alpha given by glColor for the outgoing alpha.
	glTexEnv( GL.TEXTURE_ENV, 34162, 8448 )											--GL_MODULATE
	----gl.TexEnv( GL.TEXTURE_ENV, 34184, 5890 )			--GL_SOURCE0_ALPHA_ARB			GL_TEXTURE
end

function DrawGhostSites()
	glColor(0.3, 1.0, 0.3, 0.25)
	glDepthTest(true)

	for unitID, ghost in pairs( ghostSites ) do

		local x, y, z = ghost.x, ghost.y, ghost.z
		local a, b, c = spGetPositionLosState(x, y, z)
		local losState = b
	
		if ( losState == false ) then
			--glow effect?
			--gl.Blending(GL.SRC_ALPHA, GL.ONE)
			    
			glPushMatrix()
			glTranslate( x, y, z)
			glRotate(ghost.angle,0,y,0)
			
			gl.UnitShape(ghost["unitDefId"], ghost["teamId"], false, true, false)
			      
			glPopMatrix()
		end
	end
end

function ScanFeatures()	

	local features = spGetAllFeatures()
	
	if firstScan then
	  if (Spring.GetGameFrame() == 0) then
	      -- Ignore all the map features we can see before game start
		  for _, fID in ipairs(features) do
			local fDefId = spGetFeatureDefID(fID)
			if not ignoreFeature[fDefId] then
				local x, y, z = spGetFeaturePosition(fID)
				local LosOrRadar, inLos, inRadar = spGetPositionLosState(x, y, z)
				if not inLos then
					ignoreFeature[fDefId] = true
				end
			end
		  end
	  else 
	    -- Widget loaded mid game, just use original 'ignore trees and rocks' logic
        local sfind = string.find
	    for _, fID in ipairs(features) do
	      if not ignoreFeature[fDefId] then
	        local fDefId = spGetFeatureDefID(fID)
	        local fText = string.lower(FeatureDefs[fDefId].name .. " " .. (FeatureDefs[fDefId].tooltip or ""))
	        if sfind(fText, 'tree') or sfind(fText, 'rock') then
	          ignoreFeature[fDefId] = true
	        end
	      end
	    end
	  end
	  firstScan = false
	  return
	end
		
	local myAllyID = spGetMyAllyTeamID()
	
	for _, fID in ipairs(features) do
		local fDefId = spGetFeatureDefID(fID)
		
		if not ignoreFeature[fDefId] then
		
			local fAllyID = spGetFeatureAllyTeam(fID)
			local fTeamID = spGetFeatureTeam( fID )

			local resName, _ = spGetFeatureResurrect(fID)
											
			if ( (resName == "" or dontTrackEnemyWrecks == 0) and fAllyID ~= nil and fAllyID >= 0 and myAllyID ~= fAllyID and ghostFeatures[fID] == nil ) then
							
				local x, y, z = spGetFeaturePosition(fID)
				local dx,_,dz = spGetFeatureDirection(fID)
				local angle = mdeg(matan2(dx,dz))			
				ghostFeatures[fID] = { featDefId = fDefId, x=x, y=y, z=z, teamId = fTeamID, angle=angle }
				
			end
		end
	end
end

function DeleteGhostFeatures()
	for featureID, ghost in pairs(ghostFeatures) do
		local a, b, c = spGetPositionLosState(ghost.x, ghost.y, ghost.z)
		local losState = b
		local featDefID = spGetFeatureDefID(featureID)
				
		if ( featDefID == nil and losState) then	
			ghostFeatures[featureID] = nil
		end
	end
end

function DeleteGhostSites()
	for unitID, ghost in pairs(ghostSites) do
		local a, b, c = spGetPositionLosState(ghost.x, ghost.y, ghost.z)
		local losState = b
		local udefID = spGetUnitDefID(unitID)
				
		if ( ( udefID == nil or (spGetUnitRulesParam(unitID, "under_construction") ~= 1) ) and losState) then	
			ghostSites[unitID] = nil
		end
	end
end

function widget:GameStart()
  if widgetHandler.widgets then
	  for i, widget in ipairs(widgetHandler.widgets) do
		if (widget:GetInfo().name == 'Defense Range') then
		  local version = tonumber(string.match(widget:GetInfo().desc,'%d+%.%d+'))
		  if version and (version < tonumber("6")) then
			spEcho("<Ghost Site> Old DefenseRange found! Widget removed.")
			widgetHandler:RemoveWidget(self)
		  end
		end
	  end
  end
end

--Commons
function ResetGl() 
	glColor( { 1.0, 1.0, 1.0, 1.0 } )
	glLineWidth( 1.0 )
	glDepthTest(false)
	glTexture(false)
end

function widget:PlayerChanged(playerID)
	if Spring.GetSpectatingState() and Spring.GetGameFrame() > 0 then
		widgetHandler:RemoveWidget(self)
	end
end

function widget:GameStart()
	widget:PlayerChanged()
end

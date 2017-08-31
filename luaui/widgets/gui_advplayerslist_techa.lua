--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  Copyright (C) 2008.
--  Licensed under the terms of the GNU GPL, v2 or later.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------



function widget:GetInfo()
	return {
		name      = "AdvPlayersList (TechA)",
		desc      = "Players list with useful information / shortcuts. Use tweakmode (ctrl+F11) to customize. '/cputext' displays cpu %",
		author    = "Marmoth. (spiced up by Floris)",
		date      = "25 april 2015",
		version   = "16.0",
		license   = "GNU GPL, v2 or later",
		layer     = -4,
		enabled   = true,  --  loaded by default?
	}
end

--Changelog
-- before v8.0 developed outside of BA by Marmoth
-- v9.0 (Bluestone): modifications to deal with twice as many players/specs; specs are rendered in a small font and cpu/ping does not show for them. 
-- v9.1 ([teh]decay): added notification about shared resources
-- v10  (Bluestone): Better use of opengl for a big speed increase & less spaghetti
-- v11  (Bluestone): Get take info from cmd_idle_players
-- v11.1 (Bluestone): Added TrueSkill column
-- v11.2 (Bluestone): Remove lots of hardcoded crap about module names/pictures
-- v11.3 (Bluestone): More cleaning up
-- v11.4 (Bluestone): Mute people with ctrl+click on their name
-- v12   (Floris): Restyled looks + added imageDirectory var + HD-ified rank and some other icons
-- v13   (Floris): Added scale buttons. Added grey cpu/ping icons for spectators. Resized elements. Textured bg. Spec label click to unfold/fold. Added guishader. Lockcamera on doubleclick. Ping in ms/sec/min. Shows dot icon in front of tracked player. HD-ified lots of other icons. Speccing/dead player keep their color. Improved e/m share gui responsiveness. + removed the m_spec option
-- v14   (Floris): Added country flags + Added camera icons for locked camera + specs show bright when they are broadcasting new lockcamera positions + bugfixed lockcamera for specs. Added small gaps between in tweakui icons. Auto scales with resolution changes.
-- v15   (Floris): Integrated LockCamers widget code
-- v16   (Nixtux): Cleanup getgameframe calls everywhere (performance improvement)

--------------------------------------------------------------------------------
-- Widget Scale
--------------------------------------------------------------------------------

local customScale			= 1
local customScaleStep		= 0.025
local pointDuration    		= 40
local showTeamsizeVersus	= true		-- not implemented yet
local cpuText				= false

--------------------------------------------------------------------------------
-- SPEED UPS
--------------------------------------------------------------------------------

local Spring_GetGameSeconds      = Spring.GetGameSeconds
local Spring_GetGameFrame		 = Spring.GetGameFrame
local Spring_GetAllyTeamList     = Spring.GetAllyTeamList
local Spring_GetTeamInfo         = Spring.GetTeamInfo
local Spring_GetTeamList         = Spring.GetTeamList
local Spring_GetPlayerInfo       = Spring.GetPlayerInfo
local Spring_GetPlayerList       = Spring.GetPlayerList
local Spring_GetTeamColor        = Spring.GetTeamColor
local Spring_GetLocalAllyTeamID  = Spring.GetLocalAllyTeamID
local Spring_GetLocalTeamID      = Spring.GetLocalTeamID
local Spring_GetLocalPlayerID    = Spring.GetLocalPlayerID
local Spring_ShareResources      = Spring.ShareResources
local Spring_GetTeamUnitCount    = Spring.GetTeamUnitCount
local Spring_GetTeamResources    = Spring.GetTeamResources
local Spring_SendCommands        = Spring.SendCommands
local Spring_GetConfigInt        = Spring.GetConfigInt
local Spring_GetMouseState       = Spring.GetMouseState
local Spring_GetAIInfo           = Spring.GetAIInfo
local Spring_GetTeamRulesParam   = Spring.GetTeamRulesParam
local Spring_IsGUIHidden		 = Spring.IsGUIHidden
local Spring_GetDrawFrame		 = Spring.GetDrawFrame
local Spring_GetTeamColor		 = Spring.GetTeamColor
local Spring_GetMyTeamID		 = Spring.GetMyTeamID

local GetCameraState = Spring.GetCameraState
local SetCameraState = Spring.SetCameraState
local GetCameraNames = Spring.GetCameraNames

local gl_Texture          = gl.Texture
local gl_Rect             = gl.Rect
local gl_TexRect          = gl.TexRect
local gl_Color            = gl.Color
local gl_CreateList	      = gl.CreateList
local gl_BeginEnd         = gl.BeginEnd
local gl_DeleteList	      = gl.DeleteList
local gl_CallList         = gl.CallList
local gl_Text			  = gl.Text
local gl_GetTextWidth	  = gl.GetTextWidth

--------------------------------------------------------------------------------
-- IMAGES
--------------------------------------------------------------------------------

local imageDirectory  = ":n:"..LUAUI_DIRNAME.."Images/advplayerslist/"

local flagsDirectory  = imageDirectory.."flags/"

local currentPic      = imageDirectory.."indicator.dds"
local unitsPic        = imageDirectory.."units.dds"
local energyPic       = imageDirectory.."energy.dds"
local metalPic        = imageDirectory.."metal.dds"
local notFirstPic     = imageDirectory.."notfirst.dds"
local notFirstPicWO   = imageDirectory.."notfirstwo.png"
local pingPic         = imageDirectory.."ping.dds"
local cpuPic          = imageDirectory.."cpu.dds"
local selectPic       = imageDirectory.."select.png"
local barPic          = imageDirectory.."bar.png"
local amountPic       = imageDirectory.."amount.png"
local pointPic        = imageDirectory.."point.dds"
local lowPic          = imageDirectory.."low.dds"
local arrowPic        = imageDirectory.."arrow.dds"
local arrowdPic       = imageDirectory.."arrowd.png"
local takePic         = imageDirectory.."take.dds"
local crossPic        = imageDirectory.."cross.dds"
local pointbPic       = imageDirectory.."pointb.png"
local takebPic        = imageDirectory.."takeb.png"
local seespecPic      = imageDirectory.."seespec.png"
local indentPic	      = imageDirectory.."indent.png"
local cameraPic	      = imageDirectory.."camera.dds"
local countryPic      = imageDirectory.."country.dds"
local readyTexture    = imageDirectory.."indicator.dds"
local drawPic         = imageDirectory.."draw.dds"

--module pics
local specPic         = imageDirectory.."spec.png" 
local chatPic         = imageDirectory.."chat.dds"
local sidePic         = imageDirectory.."side.dds"
local cpuPingPic      = imageDirectory.."cpuping.dds"
local sharePic        = imageDirectory.."share.dds"
local namePic         = imageDirectory.."name.dds"
local idPic           = imageDirectory.."id.dds"
local tsPic           = imageDirectory.."ts.dds"
local sizednPic       = imageDirectory.."sizedn.dds"
local sizeupPic       = imageDirectory.."sizeup.dds"

--rank pics
local rank0      = imageDirectory.."ranks/rank0.dds"
local rank1      = imageDirectory.."ranks/rank1.dds"
local rank2      = imageDirectory.."ranks/rank2.dds"
local rank3      = imageDirectory.."ranks/rank3.dds"
local rank4      = imageDirectory.."ranks/rank4.dds"
local rank5      = imageDirectory.."ranks/rank5.dds"
local rank6      = imageDirectory.."ranks/rank6.dds"
local rank7      = imageDirectory.."ranks/rank7.dds"
local rank8      = imageDirectory.."ranks/rank_unknown.dds"

local sidePics        = {}  -- loaded in SetSidePics function
local sidePicsWO      = {}  -- loaded in SetSidePics function
local originalColourNames = {} -- loaded in SetOriginalColourNames, format is originalColourNames['name'] = colourString

--------------------------------------------------------------------------------
-- Colors
--------------------------------------------------------------------------------

local pingCpuColors   = {
	[1] = {r = 0.11, g = 0.82, b = 0.11},
	[2] = {r = 0.4, g = 0.75, b = 0.2},
	[3] = {r = 0.72, g = 0.72, b = 0.2},
	[4] = {r = 0.82, g = 0.27, b = 0.18},
	[5] = {r = 1, g = 0.15, b = 0.3}
}

local cbackground, _, _ = include("Configs/ui_config.lua")
triggered = nil
local currentGameFrame = Spring_GetGameFrame()
--------------------------------------------------------------------------------
-- Time Variables
--------------------------------------------------------------------------------

local blink           = true
local lastTime        = 0
local blinkTime       = 0
local now             = 0

--------------------------------------------------------------------------------
-- REsync 
--------------------------------------------------------------------------------

local maxframelag     = 1800 -- High value so it Re-enables ui before players
local PlayerIsBehind  = false

--------------------------------------------------------------------------------
-- LockCamera variables
--------------------------------------------------------------------------------

local transitionTime	= 2 --how long it takes the camera to move
local listTime			= 15 --how long back to look for recent broadcasters

local myPlayerID = Spring.GetMyPlayerID()
local lockPlayerID

local lastBroadcasts = {}
local recentBroadcasters = {}
local newBroadcaster = false
local totalTime = 0

local myLastCameraState

--------------------------------------------------------------------------------
-- Tooltip
--------------------------------------------------------------------------------

local tipText

--------------------------------------------------------------------------------
-- Players counts and info
--------------------------------------------------------------------------------

-- local player info
local myAllyTeamID
local myTeamID
local myPlayerID
local mySpecStatus,_,_ = Spring.GetSpectatingState()

--General players/spectator count and tables
local player = {}
local playerSpecs = {}
local playerReadyState = {}
local numberOfSpecs = 0

--To determine faction at start
local armcomDefID = UnitDefNames.armcom.id
local corcomDefID = UnitDefNames.corcom.id

--Name for absent/resigned players
local absentName = " --- "

--Did the game start yet?
local gameStarted = false
--------------------------------------------------------------------------------
-- Button check variable
--------------------------------------------------------------------------------

local clickToMove                  = nil    -- click detection for moving the widget
local moveStart                    = nil    -- position of the cursor before dragging the widget

local energyPlayer                 = nil    -- player to share energy with (nil when no energy sharing)
local metalPlayer                  = nil    -- player to share metal with(nil when no metal sharing)
local amountEM                     = 0      -- amount of metal/energy to share/ask
local amountEMMax                  = nil    -- max amount of metal/energy to share/ask
local sliderPosition               = 0      -- slider position in metal and energy sharing
local sliderOrigin                  = nil   -- position of the cursor before dragging the widget

local firstclick                   = 0		--

local dblclickPeriod = 0.4
local backgroundMargin = 7
local widgetRelRight		= 0

--------------------------------------------------------------------------------
-- GEOMETRY VARIABLES
--------------------------------------------------------------------------------

local vsx,vsy                                    = gl.GetViewSizes()

local openClose     	= 0
local widgetTop     	= 0
local widgetRight   	= 1
local widgetHeight  	= 0
local widgetWidth   	= 0
local widgetPosX    	= vsx-200
local widgetPosY    	= 0
local widgetScale		= 1

local expandDown    	= false
local expandLeft    	= true
local right

local activePlayers  	= {}
local labelOffset    	= 18
local separatorOffset	= 4
local playerOffset   	= 17
local specOffset 	 	= 12
local drawList       	= {}
local teamN	
local prevClickTime  	= os.clock()
local allycursorTimes	= {}
specListShow = true

--------------------------------------------------
-- Modules
--------------------------------------------------


local modules = {}
local modulesCount = 0
local m_indent;   modulesCount = modulesCount + 1
local m_rank;     modulesCount = modulesCount + 1
local m_side;     modulesCount = modulesCount + 1
local m_ID;       modulesCount = modulesCount + 1
local m_name;     modulesCount = modulesCount + 1
local m_share;    modulesCount = modulesCount + 1
local m_chat;     modulesCount = modulesCount + 1
local m_cpuping;  modulesCount = modulesCount + 1
local m_diplo;    modulesCount = modulesCount + 1
local m_sizedn;   modulesCount = modulesCount + 1
local m_sizeup;   modulesCount = modulesCount + 1

-- these are not considered as normal module since they dont take any place and wont affect other's position
-- (they have no module.width and are not part of modules)
local m_point;    modulesCount = modulesCount + 1  
local m_take;     modulesCount = modulesCount + 1
local m_seespec;  modulesCount = modulesCount + 1

local position = 1
m_indent = {
	name	  = "indent",
	spec      = true, --display for specs?
	play      = true, --display for players?
	active    = true, --display? (overrides above)
	default   = true, --display by default?
	width     = 9,
	position  = position,
	posX      = 0,
	pic       = indentPic,
	noPic     = true,
}
position = position + 1

m_rank = {
	name	  = "rank",
	spec      = true, --display for specs?
	play      = true, --display for players?
	active    = true, --display? (overrides above)
	default   = false, --display by default?
	width     = 18,
	position  = position,
	posX      = 0,
	pic       = rank6,
}
position = position + 1

m_country = {
	name	  = "country",
	spec      = true,
	play      = true,
	active    = true,
	default   = true,
	width     = 20,
	position  = position,
	posX      = 0,
	pic       = countryPic,
}
position = position + 1

m_side = {
	name	  = "side",
	spec      = true,
	play      = true,
	active    = false,
	width     = 18,
	position  = position,
	posX      = 0,
	pic       = sidePic,
}
position = position + 1

m_ID = {
	name	  = "id",
	spec      = true,
	play      = true,
	active    = false,
	width     = 22,
	position  = position,
	posX      = 0,
	pic       = idPic,
}
position = position + 1

m_name = {
	name      = "name",
	spec      = true,
	play      = true,
	active    = true,
	alwaysActive = true,
	width     = 10,
	position  = position,
	posX      = 0,
	pic       = namePic,
	noPic     = true,
	picGap    = 7,
}
position = position + 1

m_skill = {
	name	  = "skill",
	spec      = true,
	play      = true,
	active    = true,
	width     = 20,
	position  = position,
	posX      = 0,
	pic       = tsPic,		
}
position = position + 1

m_cpuping = {
	name 	  = "cpuping",
	spec      = true,
	play      = true,
	active    = true,
	width     = 24,
	position  = position,
	posX      = 0,
	pic       = cpuPingPic,
	picGap    = 7,
}
position = position + 1

m_share = {
	name 	  = "share",
	spec      = false,
	play      = true,
	active    = true,
	width     = 50,
	position  = position,
	posX      = 0,
	pic       = sharePic,
}
position = position + 1

m_chat = {
	name	  = "chat",
	spec      = false,
	play      = true,
    active    = false,
	width     = 18,
	position  = position,
	posX      = 0,
	pic       = chatPic,
}
position = position + 1

m_sizedn = {
	name	  = "sizedn", 
	spec      = true,
	play      = true,
	active    = true,
	alwaysActive = true,
	width     = 0,
	position  = position,
	posX      = 0,
	pic       = sizednPic,
}
position = position + 1

m_sizeup = {
	name	  = "sizeup", 
	spec      = true,
	play      = true,
	active    = true,
	alwaysActive = true,
	width     = 0,
	position  = position,
	posX      = 0,
	pic       = sizeupPic,
}
position = position + 1

modules = {
	m_indent,
	m_rank,
	m_country,
	m_ID,
	m_side,
	m_name,
	m_skill,
	m_cpuping,
	m_share,
	m_chat,
	m_sizedn,
	m_sizeup,
}

m_point = {
	active = true,
	defaut = true,
	pic = pointbPic,
}

m_take = {
	active = true,
	default = true,
	pic = takePic,
}

m_seespec = {
	active = true,
	default = true,
	pic = seespecPic,
}



local specsLabelOffset = 0
local teamsizeVersusText = ""

---------------------------------------------------------------------------------------------------
--  Geometry
---------------------------------------------------------------------------------------------------

function SetModulesPositionX()
	m_name.width = SetMaxPlayerNameWidth()
	table.sort(modules, function(v1,v2)
		return v1.position < v2.position
	end)
	pos = 1
	for _,module in ipairs(modules) do
		module.posX = pos
		if module.active == true then
			if mySpecStatus == true then
				if module.spec == true then
					pos = pos + module.width
				end
			else
				if module.play == true then
					pos = pos + module.width	
				end
			end
		end
	
		widgetWidth = pos + 1
		if widgetWidth < 20 then
			widgetWidth = 20
		end
		
		if widgetWidth + widgetPosX > vsx then
		    widgetPosX = vsx - (widgetWidth * widgetScale) - widgetRelRight
		end
		if widgetRight - widgetWidth < 0 then
			widgetRight = widgetWidth
		end
		if expandLeft == true then
		    widgetPosX = vsx - (widgetWidth * widgetScale) - widgetRelRight
		else
			widgetRight = widgetPosX + widgetWidth  
		end
	end
end

function SetMaxPlayerNameWidth()
	-- determines the maximal player name width (in order to set the width of the widget)
	local t = Spring_GetPlayerList()
	local maxWidth = 14*gl_GetTextWidth(absentName) + 8 -- 8 is minimal width
	local name = ""
	local nextWidth = 0
	for _,wplayer in ipairs(t) do
		name,_,spec = Spring_GetPlayerInfo(wplayer)
		local charSize
		if spec then charSize = 11 else charSize = 14 end
		nextWidth = charSize*gl_GetTextWidth(name)+8
		if nextWidth > maxWidth then
			maxWidth = nextWidth
		end
	end
  return maxWidth
end

function GetNumberOfSpecs()
	local pList = Spring_GetPlayerList()
	local count = 0
	local name = ""
	for _,playerID in ipairs(pList) do
		_,active,spec = Spring_GetPlayerInfo(playerID)
		if spec and active then count = count + 1 end
	end
	return count
end

function GeometryChange()
	--check if disappeared off the edge of screen
	widgetRight = widgetWidth + widgetPosX
	if widgetRight > vsx-(backgroundMargin * widgetScale) then
		widgetRight = vsx - (backgroundMargin * widgetScale)
		widgetPosX = vsx - ((widgetWidth + backgroundMargin) * widgetScale) - widgetRelRight
	end
	if widgetPosX + widgetWidth/2 > vsx/2 then
		right = true
	else
		right = false
	end
end

---------------------------------------------------------------------------------------------------
--  LockCamera stuff
---------------------------------------------------------------------------------------------------

local function UpdateRecentBroadcasters()
	recentBroadcasters = {}
	local i = 1
	for playerID, info in pairs(lastBroadcasts) do
		lastTime = info[1]
		if (totalTime - lastTime <= listTime or playerID == lockPlayerID) then
			if (totalTime - lastTime <= listTime) then
				recentBroadcasters[playerID] = totalTime - lastTime
			end
			i = i + 1
		end
	end
end

local function LockCamera(playerID)
	if playerID and playerID ~= myPlayerID and playerID ~= lockPlayerID then
		lockPlayerID = playerID
		myLastCameraState = myLastCameraState or GetCameraState()
		local info = lastBroadcasts[lockPlayerID]
		if info then
			SetCameraState(info[2], transitionTime)
		end
	else
		if myLastCameraState then
			SetCameraState(myLastCameraState, transitionTime)
			myLastCameraState = nil
		end
		lockPlayerID = nil
	end
	UpdateRecentBroadcasters()
end


function CameraBroadcastEvent(playerID,cameraState)

	--if cameraState is empty then transmission has stopped
	if not cameraState then
		if lastBroadcasts[playerID] then
			lastBroadcasts[playerID] = nil
			newBroadcaster = true
		end
		if lockPlayerID == playerID then
			LockCamera()
		end
		return
	end
	
	if not lastBroadcasts[playerID] and not newBroadcaster then
		newBroadcaster = true
	end
	
	lastBroadcasts[playerID] = {totalTime, cameraState}
	
	if playerID == lockPlayerID then
		SetCameraState(cameraState, transitionTime)
	end
end

---------------------------------------------------------------------------------------------------
--  Init/GameStart (creating players)
---------------------------------------------------------------------------------------------------

function widget:Initialize()
	widgetHandler:RegisterGlobal('CameraBroadcastEvent', CameraBroadcastEvent)
	UpdateRecentBroadcasters()
	
	if (Spring.GetConfigInt("ShowPlayerInfo")==1) then
		Spring.SendCommands("info 0")
	end
    
    if Spring.GetGameFrame()>0 then 
        gameStarted = true 
 	end 

	GeometryChange()	
	SetModulesPositionX() 
	SetSidePics() 
	InitializePlayers()
	SortList()
	
	WG['advplayerlist_api'] = {}
	WG['advplayerlist_api'].GetPosition = function()
	
		local margin = backgroundMargin
	
		local BLcornerX = widgetPosX - margin
		local BLcornerY = widgetPosY - margin
		local TRcornerX = widgetPosX + widgetWidth + margin
		local TRcornerY = widgetPosY + widgetHeight - 1 + margin
		
		local left		= BLcornerX - ((widgetPosX - BLcornerX) * (widgetScale-1))
		local bottom	= BLcornerY - ((widgetPosY - BLcornerY) * (widgetScale-1))
		local right		= TRcornerX - ((widgetPosX - TRcornerX) * (widgetScale-1))
		local top		= TRcornerY - ((widgetPosY - TRcornerY) * (widgetScale-1))
		
		return {top,left,bottom,right,widgetScale}
	end
	WG['advplayerlist_api'].GetLockPlayerID = function()
		return lockPlayerID
	end
end

function widget:GameStart()
	gameStarted = true
	SetSidePics()
	InitializePlayers()
	SetOriginalColourNames()
	SortList()
end


function widget:Shutdown()
	Spring.SendCommands("info 1")

	if (WG['guishader_api'] ~= nil) then
		WG['guishader_api'].RemoveRect('advplayerlist')
	end
	widgetHandler:DeregisterGlobal('CameraBroadcastEvent')
end


function SetSidePics() 
	--record readyStates
	playerList = Spring.GetPlayerList()
	for _,playerID in pairs (playerList) do
		playerReadyState[playerID] = Spring.GetGameRulesParam("player_" .. tostring(playerID) .. "_readyState")
	end

	--set factions, from TeamRulesParam when possible and from initial info if not
	teamList = Spring_GetTeamList()
	for _, team in ipairs(teamList) do
		local teamside
		if Spring_GetTeamRulesParam(team, 'startUnit') then
			local startunit = Spring_GetTeamRulesParam(team, 'startUnit')
			if startunit == armcomDefID then 
				teamside = "arm"
			else
				teamside = "core"
			end
		else
			_,_,_,_,teamside = Spring_GetTeamInfo(team)
		end
	
		if teamside then
			sidePics[team] = imageDirectory..teamside.."_default.png"
			sidePicsWO[team] = imageDirectory..teamside.."wo_default.png"
		else
			sidePics[team] = imageDirectory.."default.png"
			sidePicsWO[team] = imageDirectory.."defaultwo.png"
		end
	end
end


function InitializePlayers()
	myPlayerID = Spring_GetLocalPlayerID()
	myTeamID = Spring_GetLocalTeamID()
	myAllyTeamID = Spring_GetLocalAllyTeamID()
	for i = 0, 128 do
		player[i] = {} 
	end
	GetAllPlayers()
end

function GetAllPlayers()
	local noplayer
	local allteams   = Spring_GetTeamList()
	teamN = table.maxn(allteams) - 1               --remove gaia
	for i = 0,teamN-1 do
		local teamPlayers = Spring_GetPlayerList(i, true)
		player[i + 64] = CreatePlayerFromTeam(i)
		for _,playerID in ipairs(teamPlayers) do
			player[playerID] = CreatePlayer(playerID)
		end
		playerSpecs[i] = true
	end
	specPlayers = Spring_GetTeamList()
	for _,playerID in ipairs(specPlayers) do
		local active,_,spec = Spring_GetPlayerInfo(playerID)
		if spec == true then
			if active == true then
				player[playerID] = CreatePlayer(playerID)
			end
		end
	end
end


function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

function GetSkill(playerID)
	local customtable = select(10,Spring_GetPlayerInfo(playerID)) -- player custom table
	local tsMu = customtable.skill
	local tsSigma = customtable.skilluncertainty
	local tskill = ""
	if tsMu then
		tskill = tsMu and tonumber(tsMu:match("%d+%.?%d*")) or 0
		tskill = round(tskill,0)
		if string.find(tsMu, ")") then
			tskill = "\255"..string.char(190)..string.char(140)..string.char(140) .. tskill -- ')' means inferred from lobby rank
		else
		
			-- show privacy mode
			local priv = ""
			if string.find(tsMu, "~") then -- '~' means privacy mode is on
				priv = "\255"..string.char(200)..string.char(200)..string.char(200) .. "*" 		
			end
			
			--show sigma
			if tsSigma then -- 0 is low sigma, 3 is high sigma
				tsSigma=tonumber(tsSigma)
				local tsRed, tsGreen, tsBlue 
				if tsSigma > 2 then
					tsRed, tsGreen, tsBlue = 190, 130, 130
				elseif tsSigma == 2 then
					tsRed, tsGreen, tsBlue = 140, 140, 140
				elseif tsSigma == 1 then
					tsRed, tsGreen, tsBlue = 195, 195, 195
				elseif tsSigma < 1 then
						tsRed, tsGreen, tsBlue = 250, 250, 250
				end
				tskill = priv .. "\255"..string.char(tsRed)..string.char(tsGreen)..string.char(tsBlue) .. tskill
			else
				tskill = priv .. "\255"..string.char(195)..string.char(195)..string.char(195) .. tskill --should never happen
			end
		end
	else
		tskill = "\255"..string.char(160)..string.char(160)..string.char(160) .. "?"
	end
	return tskill
end


function CreatePlayer(playerID)
	
	--generic player data
	local tname,_, tspec, tteam, tallyteam, tping, tcpu, tcountry, trank = Spring_GetPlayerInfo(playerID)
	local _,_,_,_, tside, tallyteam                                      = Spring_GetTeamInfo(tteam)
	local tred, tgreen, tblue  										     = Spring_GetTeamColor(tteam)
	
	--skill
	local tskill 
	tskill = GetSkill(playerID)
	
	--cpu/ping
	tpingLvl = GetPingLvl(tping)
	tcpuLvl  = GetCpuLvl(tcpu)
	tping    = tping * 1000 - ((tping * 1000) % 1)
	tcpu     = tcpu  * 100  - ((tcpu  *  100) % 1)
	
	return {
		rank             = trank,
		skill			 = tskill,
		name             = tname,
		team             = tteam,
		allyteam         = tallyteam,
		red              = tred,
		green            = tgreen,
		blue             = tblue,
		dark             = GetDark(tred,tgreen,tblue),
		side             = tside,
		pingLvl          = tpingLvl,
		cpuLvl           = tcpuLvl,
		ping             = tping,
		cpu              = tcpu,
		country          = tcountry,
		tdead            = false,
		spec             = tspec,
		ai				 = false,
	}
	
end



function CreatePlayerFromTeam(teamID) -- for when we don't have a human player occupying the slot, also when a player changes team (dies)
	
	local _,_, isDead, isAI, tside, tallyteam = Spring_GetTeamInfo(teamID)
	local tred, tgreen, tblue                 = Spring_GetTeamColor(teamID)
	local tname, ttotake, tdead, tskill
	
	if isAI then
	
		local version
		
		_,_,_,_, tname, version = Spring_GetAIInfo(teamID)
		
		if type(version) == "string" then
			tname = "AI:" .. tname .. "-" .. version
		else
			tname = "AI:" .. tname
		end
		
		ttotake = false
		tdead = false
		tai = true
		
	else
	
		if Spring_GetGameSeconds() < 0.1 then
			tname = absentName
			ttotake = false
			tdead = false
		else
			ttotake = IsTakeable(teamID)
		end
		
		tai = false
	end
	
	if tname == nil then
		tname = absentName
	end
	
	tskill = ""
	
	return{
		rank             = 8, -- "don't know which" value
		skill			 = tskill,
		name             = tname,
		team             = teamID,
		allyteam         = tallyteam,
		red              = tred,
		green            = tgreen,
		blue             = tblue,
		dark             = GetDark(tred, tgreen, tblue),
		side             = tside,
		totake           = ttotake,
		dead             = tdead,
		spec             = false,
		ai 				 = tai,
	}
	
end


function GetDark(red,green,blue)                  	
	-- Determines if the player color is dark (i.e. if a white outline for the sidePic is needed)
	if red*1.2 + green*1.1 + blue*0.8 < 0.9 then return true end
	return false
end


function SetOriginalColourNames()
	-- Saves the original team colours associated to team teamID
	for playerID,_ in pairs(player) do
		if player[playerID].name then
			if player[playerID].spec then
				originalColourNames[playerID] = "\255\255\255\255"
			else
				originalColourNames[playerID] = colourNames(player[playerID].team)
			end
		end
	end
end



		
---------------------------------------------------------------------------------------------------
--  Sorting player data
-- note: SPADS ensures that order of playerIDs/teams/allyteams as appropriate reflects TS (mu) order
---------------------------------------------------------------------------------------------------


function SortList()
	local teamList
	local myOldSpecStatus = mySpecStatus
	
	_,_, mySpecStatus,_,_,_,_,_,_ = Spring_GetPlayerInfo(myPlayerID)
	
	-- checks if a team has died
	if mySpecStatus ~= myOldSpecStatus then
		if mySpecStatus == true then
			teamList = Spring_GetTeamList()
			for _, team in ipairs(teamList) do               --
				_,_, isDead = Spring_GetTeamInfo(team)
				if isDead == false then
					Spec(team)
					break
				end
			end
		end
	end
	
	myAllyTeamID = Spring_GetLocalAllyTeamID()
	myTeamID = Spring_GetLocalTeamID()
	
	drawList = {}
	drawListOffset = {}
	vOffset = 0
	
	-- calls the (cascade) sorting for players
	vOffset = SortAllyTeams(vOffset) 
	
	-- calls the sortings for specs if see spec is on
	--if m_chat.active == true then
		vOffset = SortSpecs(vOffset) 
	--end
	
	-- set the widget height according to space needed to show team
	widgetHeight = vOffset + 3
	
	
	-- move the widget if list is too long
	if widgetHeight + widgetPosY > vsy then
		widgetPosY = vsy - widgetHeight
	end
	
	if widgetTop - widgetHeight < 0 then
		--widgetTop = widgetHeight
	end
	
	-- set the widget Y position or the top of the widget according to expand direction
	if expandDown == true then
		widgetPosY = widgetTop - widgetHeight
	else
		widgetTop = widgetPosY + widgetHeight
	end
	
end


function SortAllyTeams(vOffset)
	-- adds ally teams to the draw list (own ally team first)
	-- (labels and separators are drawn)
	local allyTeamID
	local allyTeamList = Spring_GetAllyTeamList()
	local firstenemy = true
	local isFirstDrawnTeam = true
	allyTeamsCount = table.maxn(allyTeamList)-1
    
	--find own ally team
	vOffset = 12/2.66
	for allyTeamID = 0, allyTeamsCount - 1 do
		if allyTeamID == myAllyTeamID  then
			vOffset = vOffset + labelOffset - 3
			table.insert(drawListOffset, vOffset)
			table.insert(drawList, -2)  -- "Allies" label
			vOffset = SortTeams(allyTeamID, vOffset)+2	-- Add the teams from the allyTeam		
			break
		end
	end
	
	
	-- add the others
	for allyTeamID = 0, allyTeamsCount-1 do
		if allyTeamID ~= myAllyTeamID then
			if firstenemy == true then
                vOffset = vOffset + 13
				
				vOffset = vOffset + labelOffset - 3
				table.insert(drawListOffset, vOffset)
				table.insert(drawList, -3) -- "Enemies" label
				firstenemy = false
			else
				vOffset = vOffset + separatorOffset
				table.insert(drawListOffset, vOffset)
				table.insert(drawList, -4) -- Enemy teams separator
			end
			vOffset = SortTeams(allyTeamID, vOffset)+2 -- Add the teams from the allyTeam 
		end
	end
	
	
	return vOffset
end

function SortTeams(allyTeamID, vOffset)
	-- Adds teams to the draw list (own team first)
	--(teams are not visible as such unless they are empty or AI)
	local teamID
	local teamsList = Spring_GetTeamList(allyTeamID)
	
	--add teams 
	for _,teamID in ipairs(teamsList) do
			table.insert(drawListOffset, vOffset)
			table.insert(drawList, -1)
			vOffset = SortPlayers(teamID,allyTeamID,vOffset) -- adds players form the team 
	end
	
	return vOffset
end

function SortPlayers(teamID,allyTeamID,vOffset)
	-- Adds players to the draw list (self first)
	
	local playersList       = Spring_GetPlayerList(teamID,true)
	local noPlayer          = true
	local _,_,_, isAi = Spring_GetTeamInfo(teamID)
	
	-- add own player (if not spec)
	if myTeamID == teamID then
		if player[myPlayerID].name ~= nil then
			if mySpecStatus == false then
				vOffset = vOffset + playerOffset
				table.insert(drawListOffset, vOffset)
				table.insert(drawList, myPlayerID) -- new player (with ID)
				player[myPlayerID].posY = vOffset
				noPlayer = false
			end
		end
	end
	
	-- add other players (if not spec)
	for _,playerID in ipairs(playersList) do
		if playerID ~= myPlayerID then
			if player[playerID].name ~= nil then
				if player[playerID].spec ~= true then
					vOffset = vOffset + playerOffset
					table.insert(drawListOffset, vOffset)
					table.insert(drawList, playerID) -- new player (with ID)
					player[playerID].posY = vOffset
					noPlayer = false
				end
			end
		end
	end
	
	-- add AI teams
	if isAi == true then
		vOffset = vOffset + playerOffset
		table.insert(drawListOffset, vOffset)
		table.insert(drawList, 64 + teamID) -- new AI team (instead of players)
		player[64 + teamID].posY = vOffset
		noPlayer = false
	end
	
	-- add no player token if no player found in this team at this point
	if noPlayer == true then
		vOffset = vOffset + playerOffset
		table.insert(drawListOffset, vOffset)
		table.insert(drawList, 64 + teamID)  -- no players team
		player[64 + teamID].posY = vOffset
		if gameStarted then
		--if Spring_GetGameFrame() > 0 then
			player[64+teamID].totake = IsTakeable(teamID)
		end
	end
	
	return vOffset
end

function SortSpecs(vOffset)
	-- Adds specs to the draw list
	local playersList = Spring_GetPlayerList(_,true)
	local noSpec = true
	if specListShow == true then
		for _,playerID in ipairs(playersList) do
			_,active,spec = Spring_GetPlayerInfo(playerID)
			if spec and active then
				if player[playerID].name ~= nil then
					
					-- add "Specs" label if first spec
					if noSpec == true then
						vOffset = vOffset + 13
						vOffset = vOffset + labelOffset - 2
						table.insert(drawListOffset, vOffset)
						table.insert(drawList, -5)
						noSpec = false
						vOffset = vOffset + 4					
					end
					
					-- add spectator
					vOffset = vOffset + specOffset
					table.insert(drawListOffset, vOffset)
					table.insert(drawList, playerID)
					player[playerID].posY = vOffset
					noPlayer = false
				end
			end
		end
	else
		vOffset = vOffset + 12
		vOffset = vOffset + labelOffset - 2
		table.insert(drawListOffset, vOffset)
		table.insert(drawList, -5)	
		vOffset = vOffset + 2				
	end
	return vOffset
end


---------------------------------------------------------------------------------------------------
--  Draw control
---------------------------------------------------------------------------------------------------

local PrevGameFrame = 0
local MainList
local Background
local ShareSlider

function widget:GameFrame(frame)
	currentGameFrame = frame
end

function widget:GameProgress(serverframenum)
	local frame = currentGameFrame
	if frame > (serverframenum-maxframelag) then
		PlayerIsBehind = false
	else
		PlayerIsBehind = true
	end
end

function widget:DrawScreen()

	if triggered == nil then
		if cbackground[4] == 0.54321 then
			cbackground[4]=WG["background_color"]
		end
	triggered = true
	end

	if Spring_IsGUIHidden() or PlayerIsBehind then
		return
	end
	
	local scaleDiffX = -((widgetPosX*widgetScale)-widgetPosX)/widgetScale
	local scaleDiffY = -((widgetPosY*widgetScale)-widgetPosY)/widgetScale
	gl.Scale(widgetScale,widgetScale,0)
	gl.Translate(scaleDiffX,scaleDiffY,0)
	
	-- update lists frequently if there is mouse interaction
	local NeedUpdate = false 
	local mouseX,mouseY = Spring_GetMouseState()
	if (mouseX > widgetPosX + m_name.posX + m_name.width - 5) and (mouseX < widgetPosX + widgetWidth) and (mouseY > widgetPosY - 16) and (mouseY < widgetPosY + widgetHeight) then
		local DrawFrame = Spring_GetDrawFrame()
		if PrevGameFrame == nil then PrevGameFrame = currentGameFrame end
		if (DrawFrame%5==0) or (currentGameFrame>PrevGameFrame+1) then
			--Spring.Echo(DrawFrame)
			NeedUpdate = true
		end
	end
	
	if NeedUpdate then
		--Spring.Echo("DS APL update")
		CreateLists()
		PrevGameFrame = currentGameFrame
	end
	
	-- draws the background
	if Background then
		gl_CallList(Background)
	else
		CreateBackground()
	end
	
	-- draws the main list
	if MainList then
		gl_CallList(MainList)
	else
		CreateMainList()
	end
	
	-- draws share energy/metal sliders
	if ShareSlider then
		gl_CallList(ShareSlider)
	else
		CreateShareSlider()
	end
	
	local scaleReset = widgetScale / widgetScale / widgetScale
	gl.Translate(-scaleDiffX,-scaleDiffY,0)
	gl.Scale(scaleReset,scaleReset,0)
end

function CreateLists()

	CheckTime() --this also calls CheckPlayers
	
	UpdateRecentBroadcasters()
	
	if WG['allycursor_api'] ~= nil then
		allycursorTimes = WG['allycursor_api'].GetCursorTimes()
	end
	
	UpdateResources()
	
	--Create lists
	CreateBackground()
	CreateMainList()
	CreateShareSlider()
end

---------------------------------------------------------------------------------------------------
--  Background gllist
---------------------------------------------------------------------------------------------------

local function DrawRectRound(px,py,sx,sy,cs)
	gl.TexCoord(0.8,0.8)
	gl.Vertex(px+cs, py, 0)
	gl.Vertex(sx-cs, py, 0)
	gl.Vertex(sx-cs, sy, 0)
	gl.Vertex(px+cs, sy, 0)
	
	gl.Vertex(px, py+cs, 0)
	gl.Vertex(px+cs, py+cs, 0)
	gl.Vertex(px+cs, sy-cs, 0)
	gl.Vertex(px, sy-cs, 0)
	
	gl.Vertex(sx, py+cs, 0)
	gl.Vertex(sx-cs, py+cs, 0)
	gl.Vertex(sx-cs, sy-cs, 0)
	gl.Vertex(sx, sy-cs, 0)
	
	local offset = 0.07		-- texture offset, because else gaps could show
	
	-- top left
	if py+((sy-py)*widgetScale) >= vsy-backgroundMargin or px <= backgroundMargin then o = 0.5 else o = offset end
	gl.TexCoord(o,o)
	gl.Vertex(px, sy, 0)
	gl.TexCoord(o,1-o)
	gl.Vertex(px+cs, sy, 0)
	gl.TexCoord(1-o,1-o)
	gl.Vertex(px+cs, sy-cs, 0)
	gl.TexCoord(1-o,o)
	gl.Vertex(px, sy-cs, 0)
	-- top right
	if py+((sy-py)*widgetScale) >= vsy-backgroundMargin or (px+((sx-px)*widgetScale)) >= vsx-backgroundMargin then o = 0.5 else o = offset end
	gl.TexCoord(o,o)
	gl.Vertex(px, py, 0)
	gl.TexCoord(o,1-o)
	gl.Vertex(px+cs, py, 0)
	gl.TexCoord(1-o,1-o)
	gl.Vertex(px+cs, py+cs, 0)
	gl.TexCoord(1-o,o)
	gl.Vertex(px, py+cs, 0)
	-- bottom left
	if py <= backgroundMargin or px <= backgroundMargin then o = 0.5 else o = offset end
	gl.TexCoord(o,o)
	gl.Vertex(sx, py, 0)
	gl.TexCoord(o,1-o)
	gl.Vertex(sx-cs, py, 0)
	gl.TexCoord(1-o,1-o)
	gl.Vertex(sx-cs, py+cs, 0)
	gl.TexCoord(1-o,o)
	gl.Vertex(sx, py+cs, 0)
	-- bottom right
	if py <= backgroundMargin or (px+((sx-px)*widgetScale)) >= vsx-backgroundMargin then o = 0.5 else o = offset end
	gl.TexCoord(o,o)
	gl.Vertex(sx, sy, 0)
	gl.TexCoord(o,1-o)
	gl.Vertex(sx-cs, sy, 0)
	gl.TexCoord(1-o,1-o)
	gl.Vertex(sx-cs, sy-cs, 0)
	gl.TexCoord(1-o,o)
	gl.Vertex(sx, sy-cs, 0)
end
function RectRound(px,py,sx,sy,cs)		-- (coordinates work differently than the RectRound func in other widgets)
	gl.BeginEnd(GL.QUADS, DrawRectRound, px,py,sx,sy,cs)
	gl.Texture(false)
end

function CreateBackground()
	
	if Background then
		gl_DeleteList(Background)
	end
	local margin = backgroundMargin
	
	
	local BLcornerX = widgetPosX - margin
	local BLcornerY = widgetPosY - margin
	local TRcornerX = widgetPosX + widgetWidth + margin
	local TRcornerY = widgetPosY + widgetHeight - 1 + margin
	
	if (WG['guishader_api'] ~= nil) then
		local left		= BLcornerX - ((widgetPosX - BLcornerX) * (widgetScale-1))
		local bottom	= BLcornerY - ((widgetPosY - BLcornerY) * (widgetScale-1))
		local right		= TRcornerX - ((widgetPosX - TRcornerX) * (widgetScale-1))
		local top		= TRcornerY - ((widgetPosY - TRcornerY) * (widgetScale-1))
		WG['guishader_api'].InsertRect(left,bottom,right,top,'advplayerlist')
	end
	
	Background = gl_CreateList(function()
		gl_Color(cbackground)
		
		RectRound(BLcornerX,BLcornerY,TRcornerX,TRcornerY,6)
		--DrawRect(BLcornerX,BLcornerY,TRcornerX,TRcornerY)
		
		-- draws highlight (top and left sides)
		--gl_Color(0.44,0.44,0.44,0.38)	
		--gl_Rect(widgetPosX-margin-1,					widgetPosY + widgetHeight +margin, 	widgetPosX + widgetWidth+margin, 			widgetPosY + widgetHeight-1+margin)
		--gl_Rect(widgetPosX-margin-1 , 					widgetPosY-margin, 					widgetPosX-margin, 							widgetPosY-margin + widgetHeight + 1  - 1+margin+margin)
		
		gl_Color(1,1,1,1)
	end)	
end

---------------------------------------------------------------------------------------------------
--  Main (player) gllist
---------------------------------------------------------------------------------------------------


function UpdateResources()
	if energyPlayer ~= nil then
		if energyPlayer.team == myTeamID then
			local current,storage = Spring_GetTeamResources(myTeamID,"energy")
			amountEMMax = storage - current
			amountEM = amountEMMax*sliderPosition/39
			amountEM = amountEM-(amountEM%1)			
		else
			amountEMMax = Spring_GetTeamResources(myTeamID,"energy")
			amountEM = amountEMMax*sliderPosition/39
			amountEM = amountEM-(amountEM%1)
		end
	end
	if metalPlayer ~= nil then
		if metalPlayer.team == myTeamID then
			local current, storage = Spring_GetTeamResources(myTeamID,"metal")
			amountEMMax = storage - current
			amountEM = amountEMMax*sliderPosition/39
			amountEM = amountEM-(amountEM%1)			
		else
			amountEMMax = Spring_GetTeamResources(myTeamID,"metal")
			amountEM = amountEMMax*sliderPosition/39
			amountEM = amountEM-(amountEM%1)
		end
	end
end

function CheckTime()
	local period = 0.5
	now = os.clock()
	if  now > (lastTime + period) then
		lastTime = now
		CheckPlayersChange()
		if blink == true then 
			blink = false
		else
			blink = true
		end
		for playerID =0, 63 do
			if player[playerID] ~= nil then
				if player[playerID].pointTime ~= nil then
					if player[playerID].pointTime <= now then
						player[playerID].pointX = nil
						player[playerID].pointY = nil
						player[playerID].pointZ = nil
						player[playerID].pointTime = nil
					end
				end
			end
		end
	end 
end


function CreateMainList(tip)
	
	--Spring.Echo("List Updated")
	
	numberOfSpecs = GetNumberOfSpecs()
		
	local mouseX,mouseY = Spring_GetMouseState()
	local leader
	
	if MainList then
		gl_DeleteList(MainList)
	end
	
	MainList = gl_CreateList(function()
	
	for i, drawObject in ipairs(drawList) do
		if drawObject == -5 then
			specsLabelOffset = drawListOffset[i]
			local specAmount = numberOfSpecs
			if numberOfSpecs == 0 or (specListShow and numberOfSpecs < 10) then 
				specAmount = ""
			end
			DrawLabel(" Spectators  "..specAmount, drawListOffset[i], specListShow)
			if gameStarted == nil then
			--if Spring.GetGameFrame() <= 0 then
				if specListShow then
					DrawLabelTip("(click to hide specs)", drawListOffset[i], 95)
				else
					DrawLabelTip("(click to show specs)", drawListOffset[i], 95)
				end
			end
		elseif drawObject == -4 then
			DrawSeparator(drawListOffset[i])
		elseif drawObject == -3 then
			DrawLabel(" Enemies", drawListOffset[i], true)
		elseif drawObject == -2 then
			DrawLabel(" Allies", drawListOffset[i], true)
			if gameStarted == 0 then
			--if Spring.GetGameFrame() <= 0 then
				DrawLabelTip("(dbl-click playername to track)", drawListOffset[i], 46)
			end
			if showTeamsizeVersus then
				DrawLabelRightside(teamsizeVersusText, drawListOffset[i])
			end
		elseif drawObject == -1 then
			leader = true
		else
			DrawPlayer(drawObject, leader, drawListOffset[i], mouseX, mouseY)
		end
		
		DrawTip(mouseX, mouseY)
		
	end
	
	end)
	
end

function DrawLabel(text, vOffset, drawSeparator)
	if widgetWidth < 67 then
		text = string.sub(text, 0, 1)
	end
	gl_Color(0,0,0,0.2)
	gl_Text(text, widgetPosX - 1, widgetPosY + widgetHeight -vOffset+6.6, 12, "")
	gl_Text(text, widgetPosX + 1, widgetPosY + widgetHeight -vOffset+6.6, 12, "")
	gl_Color(0.9,0.9,0.9,0.75)
	gl_Text(text, widgetPosX, widgetPosY + widgetHeight -vOffset+7.5, 12, "n")
	
	if drawSeparator then
		--DrawSeparator(vOffset)
	end
end

function DrawLabelTip(text, vOffset, xOffset)
	if widgetWidth < 67 then
		text = string.sub(text, 0, 1)
	end
	gl_Color(0,0,0,0.08)
	gl_Text(text, widgetPosX + xOffset - 1, widgetPosY + widgetHeight -vOffset+6.8, 10, "")
	gl_Text(text, widgetPosX + xOffset + 1, widgetPosY + widgetHeight -vOffset+6.8, 10, "")
	gl_Color(0.9,0.9,0.9,0.35)
	gl_Text(text, widgetPosX + xOffset, widgetPosY + widgetHeight -vOffset+7.5, 10, "n")
end

function DrawSeparator(vOffset)
	vOffset = vOffset - 2
	gl_Color(0.55,0.55,0.55,0.5)
	gl_Rect(widgetPosX+2, widgetPosY + widgetHeight -vOffset+(1/widgetScale), widgetPosX + widgetWidth-2, widgetPosY + widgetHeight -vOffset)
	gl_Color(0,0,0,0.24)
	gl_Rect(widgetPosX+2, widgetPosY + widgetHeight -vOffset, widgetPosX + widgetWidth-2, widgetPosY + widgetHeight -vOffset-(1/widgetScale))
	gl_Color(1,1,1)
end

function DrawLabelRightside(text, vOffset)
	local textLength = (gl_GetTextWidth(text)*12)*widgetScale
	gl_Color(1,1,1,0.13)
	gl_Text(text, widgetRight - textLength, widgetPosY + widgetHeight -vOffset+7.5, 12, "n")
end



function DrawPlayer(playerID, leader, vOffset, mouseX, mouseY)
	tipY           = nil
	local rank     = player[playerID].rank
	local skill	   = player[playerID].skill
	local name     = player[playerID].name
	local team     = player[playerID].team
	local allyteam = player[playerID].allyteam
	local side     = player[playerID].side
	local red      = player[playerID].red
	local green    = player[playerID].green
	local blue     = player[playerID].blue
	local dark     = player[playerID].dark
	local pingLvl  = player[playerID].pingLvl
	local cpuLvl   = player[playerID].cpuLvl
	local ping     = player[playerID].ping
	local cpu      = player[playerID].cpu    
	local country  = player[playerID].country    
	local spec     = player[playerID].spec
	local totake   = player[playerID].totake
	local needm    = player[playerID].needm
	local neede    = player[playerID].neede
	local dead     = player[playerID].dead
	local ai	   = player[playerID].ai
	local posY     = widgetPosY + widgetHeight - vOffset
	local tipPosY  = widgetPosY + ((widgetHeight - vOffset)*widgetScale)
	
	
	local alpha = 1		-- alpha used to show inactivity for specs
	
	if mySpecStatus then
		local alphaCursor = 1
		if WG['allycursor_api'] ~= nil then
			if allycursorTimes[playerID] ~= nil and type(recentBroadcasters[playerID]) == "number" then
				alphaCursor = (10 - math.floor(now-allycursorTimes[playerID])) / 7
				if alphaCursor > 1 then alphaCursor = 1 end
				if alphaCursor <= 0.5 then alphaCursor = 0.5 end
			end
		end
		if recentBroadcasters[playerID] ~= nil and type(recentBroadcasters[playerID]) == "number" then
			local alphaCam = (15 - math.floor(recentBroadcasters[playerID])) / 10
			if alphaCam > 1 then alphaCam = 1 end
			alpha = 0.7 * alphaCam
			if alpha < 0.5 then alpha = 0.5 end
		else
			alpha = 0.5*alphaCursor
		end
	else
		alpha = 0.5
	end
	
	
	if mouseY >= tipPosY and mouseY <= tipPosY + (16*widgetScale) then tipY = true end
	
	
	if (lockPlayerID ~= nil and lockPlayerID == playerID) then -- active
		DrawCamera(posY, true)
	end

	if spec == false then --player
		if leader == true then                              -- take / share buttons
			if mySpecStatus == false then
				if allyteam == myAllyTeamID then
					if m_take.active == true then
						if totake == true then
							DrawTakeSignal(posY)
							if tipY == true then TakeTip(mouseX) end
						end
					end
					if m_share.active == true and dead ~= true then
						DrawShareButtons(posY, needm, neede)
						if tipY == true then ShareTip(mouseX, playerID) end
					end
				end
			else
				if m_indent.active == true and Spring_GetMyTeamID() == team then
					DrawDot(posY)
				end
			end
			gl_Color(red,green,blue,1)
			if m_ID.active == true then
				DrawID(team, posY, dark)
			end
			if m_skill.active == true then
				DrawSkill(skill, posY, dark, name)
			end
		end
		gl_Color(red,green,blue,1)
		if m_rank.active == true then
			DrawRank(rank, posY, leader, dark)
		end
		if m_country.active == true and country ~= "" then
			DrawCountry(country, posY)
		end
		--gl_Color(red,green,blue,1)
		gl_Color(1,1,1,0.45)
		if name ~= absentName and m_side.active == true then
			DrawSidePic(team, playerID, posY, leader, dark, ai)
		end
		gl_Color(red,green,blue,1)	
		if m_name.active == true then
			DrawName(name, team, posY, dark, playerID)
		end
	else -- spectator
		gl_Color(1,1,1,1)
		if specListShow == true and m_name.active == true then
		
			if playerSpecs[playerID] ~= nil and (lockPlayerID ~= nil and lockPlayerID ~= playerID or lockPlayerID == nil) then 
				if recentBroadcasters[playerID] ~= nil and type(recentBroadcasters[playerID]) == "number" then
					DrawCamera(posY, false)
				end
			end
			DrawSmallName(name, team, posY, false, playerID, alpha)
		end		
	end
	
	if m_cpuping.active == true then
		if cpuLvl ~= nil then                              -- draws CPU usage and ping icons (except AI and ghost teams)
			DrawPingCpu(pingLvl,cpuLvl,posY,spec,1,cpu)
			if tipY == true then PingCpuTip(mouseX, ping, cpu, spec) end
		end
	end
	
	gl_Color(1,1,1,1)
	if playerID < 64 then
	
		if m_chat.active == true and mySpecStatus == false and spec == false then
			if playerID ~= myPlayerID then
				DrawChatButton(posY)
			end
		end
		
		if m_point.active == true then
			if player[playerID].pointTime ~= nil then
				if player[playerID].allyteam == myAllyTeamID or mySpecStatus == true then
					--if blink == true then
						DrawPoint(posY, player[playerID].pointTime-now)
					--end
					if tipY == true then PointTip(mouseX) end
				end
			end
		end
		
	end
	leader = false
	gl_Texture(false)
end

function DrawTakeSignal(posY)

	if blink == true then -- Draws a blinking rectangle if the player of the same team left (/take option)
		if right == true then
			gl_Color(0.7,0.7,0.7)
			gl_Texture(arrowPic)
			DrawRect(widgetPosX - 14, posY, widgetPosX, posY + 16)
			gl_Color(1,1,1)
			gl_Texture(takePic)
			DrawRect(widgetPosX - 57, posY - 15, widgetPosX - 12, posY + 32)
		else
			local leftPosX = widgetPosX + widgetWidth
			gl_Color(0.7,0.7,0.7)
			gl_Texture(arrowPic)
			DrawRect(leftPosX + 14, posY, leftPosX, posY + 16)
			gl_Color(1,1,1)
			gl_Texture(takePic)
			DrawRect(leftPosX + 12, posY - 15, leftPosX + 57, posY + 32)
		end
	end	
end

function DrawShareButtons(posY, needm, neede)
	gl_Color(1,1,1,1)
	gl_Texture(unitsPic)                       -- Share UNIT BUTTON
	DrawRect(m_share.posX + widgetPosX  + 1, posY, m_share.posX + widgetPosX  + 17, posY + 16)
	gl_Texture(energyPic)                      -- share ENERGY BUTTON
	DrawRect(m_share.posX + widgetPosX  + 17, posY, m_share.posX + widgetPosX  + 33, posY + 16)
	gl_Texture(metalPic)                       -- share METAL BUTTON
	DrawRect(m_share.posX + widgetPosX  + 33, posY, m_share.posX + widgetPosX  + 49, posY + 16)
	gl_Texture(lowPic)
	if needm == true then
		DrawRect(m_share.posX + widgetPosX  + 33, posY, m_share.posX + widgetPosX  + 49, posY + 16)
	end
	if neede == true then
		DrawRect(m_share.posX + widgetPosX  + 17, posY, m_share.posX + widgetPosX  + 33, posY + 16)	
	end
	gl_Texture(false)
end


function DrawChatButton(posY)
	gl_Texture(chatPic)
	DrawRect(m_chat.posX + widgetPosX  + 1, posY, m_chat.posX + widgetPosX  + 17, posY + 16)	
end

function DrawSidePic(team, playerID, posY, leader, dark, ai)
	if gameStarted then
		if leader == true then
			gl_Texture(sidePics[team])                       -- sets side image (for leaders)
		else
			gl_Texture(notFirstPic)                          -- sets image for not leader of team players
		end
		DrawRect(m_side.posX + widgetPosX  + 2, posY+1, m_side.posX + widgetPosX  + 16, posY + 15) -- draws side image
		--[[if dark == true then	-- draws outline if player color is dark
			gl_Color(1,1,1)
			if leader == true then
				gl_Texture(sidePicsWO[team])
			else
				gl_Texture(notFirstPicWO)
			end
			DrawRect(m_side.posX + widgetPosX + 2, posY+1,m_side.posX + widgetPosX + 16, posY + 15)
			gl_Texture(false)
		end
		]]--
		gl_Texture(false)
	else
		DrawState(playerID, m_side.posX + widgetPosX, posY)
	end
end

function DrawRank(rank, posY, dark)
	if rank == 0 then
		DrawRankImage(rank0, posY)
	elseif rank == 1 then
		DrawRankImage(rank1, posY)
	elseif rank == 2 then
		DrawRankImage(rank2, posY)
	elseif rank == 3 then
		DrawRankImage(rank3, posY)
	elseif rank == 4 then
		DrawRankImage(rank4, posY)
	elseif rank == 5 then
		DrawRankImage(rank5, posY)
	elseif rank == 6 then
		DrawRankImage(rank6, posY)
	elseif rank == 7 then
		DrawRankImage(rank7, posY)
	else
		--DrawRankImage(rank8, posY)
	end
	gl_Color(1,1,1,1)
end

function DrawRankImage(rankImage, posY)
	gl_Color(1,1,1)
	gl_Texture(rankImage)
	DrawRect(m_rank.posX + widgetPosX + 3, posY+1, m_rank.posX + widgetPosX + 17, posY + 15)
end


local function RectQuad(px,py,sx,sy)
	local o = 0.008		-- texture offset, because else grey line might show at the edges
	gl.TexCoord(o,1-o)
	gl.Vertex(px, py, 0)
	gl.TexCoord(1-o,1-o)
	gl.Vertex(sx, py, 0)
	gl.TexCoord(1-o,o)
	gl.Vertex(sx, sy, 0)
	gl.TexCoord(o,o)
	gl.Vertex(px, sy, 0)
end
function DrawRect(px,py,sx,sy)
	--local px,py,sx,sy,cs = math.floor(px),math.floor(py),math.ceil(sx),math.ceil(sy),math.floor(cs)
	gl.BeginEnd(GL.QUADS, RectQuad, px,py,sx,sy)
end

function DrawCountry(country, posY)
	if country ~= nil then
		gl_Texture(flagsDirectory..string.upper(country)..".dds")
		gl_Color(1,1,1)
		DrawRect(m_country.posX + widgetPosX + 3, posY+1, m_country.posX + widgetPosX + 17, posY + 15)
	end
end

function DrawDot(posY)
	gl_Color(1,1,1,0.70)
	gl_Texture(currentPic)
	DrawRect(m_indent.posX + widgetPosX-1 , posY+3, m_indent.posX + widgetPosX + 7, posY + 11)
end

function DrawCamera(posY,active)
	if active ~= nil and active then
		gl_Color(1,1,1,0.7)
	else
		gl_Color(1,1,1,0.13)
	end
	gl_Texture(cameraPic)
	DrawRect(m_indent.posX + widgetPosX-1.5 , posY+2, m_indent.posX + widgetPosX + 9, posY + 12.4)
end

function colourNames(teamID)
    	nameColourR,nameColourG,nameColourB,nameColourA = Spring_GetTeamColor(teamID)
		R255 = math.floor(nameColourR*255)  --the first \255 is just a tag (not colour setting) no part can end with a zero due to engine limitation (C)
        G255 = math.floor(nameColourG*255)
        B255 = math.floor(nameColourB*255)
        if ( R255%10 == 0) then
                R255 = R255+1
        end
        if( G255%10 == 0) then
                G255 = G255+1
        end
        if ( B255%10 == 0) then
                B255 = B255+1
        end
	return "\255"..string.char(R255)..string.char(G255)..string.char(B255) --works thanks to zwzsg
end 

function DrawState(playerID, posX, posY)
-- note that adv pl list uses a phantom pID for absent players, so this will always show unready for players not ingame
	local ready = (playerReadyState[playerID]==1) or (playerReadyState[playerID]==2) or (playerReadyState[playerID]==-1)
	local hasStartPoint = (playerReadyState[playerID]==4)
	if ai then
		gl_Color(0.1,0.1,0.97,1)
	else 
		if ready then
			gl_Color(0.1,0.95,0.2,1)
		else
			if hasStartPoint then
				gl_Color(1,0.65,0.1,1)
			else
				gl_Color(0.8,0.1,0.1,1)	
			end
		end
	end
	gl_Texture(readyTexture)
	DrawRect(posX, posY - 1 , posX + 16, posY + 16)			
	gl_Color(1,1,1,1)
end

function DrawName(name, team, posY, dark, playerID)
    local willSub = ""
    if not gameStarted then 
        if playerID>=64 then
            willSub = (Spring.GetGameRulesParam("Player" .. (playerID-64) .. "willSub")==1) and " (sub)" or "" --pID-64 because apl uses dummy playerIDs for absent players
        else
            willSub = (Spring.GetGameRulesParam("Player" .. (playerID) .. "willSub")==1) and " (sub)" or "" 
        end
    end
    local nameText = name .. willSub    
    
    local nameColourR,nameColourG,nameColourB,nameColourA = Spring_GetTeamColor(team)
    local xPadding = 0
    
    -- includes readystate icon if factions arent shown
	if not gameStarted and not m_side.active then
		xPadding = 16
		DrawState(playerID, m_name.posX + widgetPosX, posY)
	end
	if (nameColourR + nameColourG*1.35 + nameColourB*0.5) < 0.8 then
		gl_Text(colourNames(team) .. nameText, m_name.posX + widgetPosX + 3 + xPadding, posY + 4, 14, "o") -- draws name
	else
		gl_Color(0,0,0,0.45)
		gl_Text(nameText, m_name.posX + widgetPosX + 2 + xPadding, posY + 3, 14, "n") -- draws name
		gl_Text(nameText, m_name.posX + widgetPosX + 4 + xPadding, posY + 3, 14, "n") -- draws name
		gl_Color(nameColourR,nameColourG,nameColourB,1)
		gl_Text(nameText, m_name.posX + widgetPosX + 3 + xPadding, posY + 4, 14, "n") -- draws name
	end
	gl_Color(1,1,1)
end


function DrawSmallName(name, team, posY, dark, playerID, alpha)
	if team ~= nil then
		if originalColourNames[playerID] then
			name = originalColourNames[playerID] .. name
		end
		local textindent = 4
		local explayerindent = -3
		if m_indent.active or m_rank.active or m_side.active or m_ID.active then
			textindent = 0
		end
		local nameColourR,nameColourG,nameColourB,nameColourA = 1,1,1,1
		
		if playerSpecs[playerID] ~= nil then 
			nameColourR,nameColourG,nameColourB,nameColourA = Spring_GetTeamColor(team)
			if (nameColourR + nameColourG*1.35 + nameColourB*0.5) < 0.75 then
				gl_Text(colourNames(team) .. name, m_name.posX + textindent + explayerindent + widgetPosX + 3, posY + 4, 11, "o")
			else
				gl_Color(0,0,0,0.3)
				gl_Text(name, m_name.posX + textindent + explayerindent + widgetPosX + 2, posY + 3.2, 11, "n") -- draws name
				gl_Text(name, m_name.posX + textindent + explayerindent + widgetPosX + 4, posY + 3.2, 11, "n") -- draws name
				gl_Color(nameColourR,nameColourG,nameColourB,0.78)
				gl_Text(name, m_name.posX + textindent + explayerindent + widgetPosX + 3, posY + 4, 11, "n")
			end
		else
			gl_Color(0,0,0,0.3)
			gl_Text(name, m_name.posX + textindent + widgetPosX + 2.2, posY + 3.3, 10, "n")
			gl_Text(name, m_name.posX + textindent + widgetPosX + 3.8, posY + 3.3, 10, "n")
			gl_Color(1,1,1,alpha)
			gl_Text(name, m_name.posX + textindent + widgetPosX + 3, posY + 4, 10, "n")
		end
		gl_Color(1,1,1)
	end
end

function DrawID(playerID, posY, dark)
	local spacer = ""
	if playerID < 10 then
		spacer = " "
	end
	--gl_Text(colourNames(playerID) .. " ".. playerID .. "", m_ID.posX + widgetPosX+4.5, posY + 5, 11, "o") 
	gl_Color(0,0,0,0.6)
	gl_Text(spacer .. playerID .. "", m_ID.posX + widgetPosX+4.5, posY + 4.1, 11, "n") 
	gl_Color(1,1,1,0.5)
	gl_Text(spacer .. playerID .. "", m_ID.posX + widgetPosX+4.5, posY + 5, 11, "n") 

	gl_Color(1,1,1)
end

function DrawSkill(skill, posY, dark)
	gl_Text(skill, m_skill.posX + widgetPosX + m_skill.width - 2, posY + 5.3, 9.5, "or")
	gl_Color(1,1,1)
end

function DrawPingCpu(pingLvl, cpuLvl, posY, spec, alpha, cpu)
	gl_Texture(pingPic)
	if spec then
		local grayvalue = 0.25 + ((5 - pingLvl) / 7)
		gl_Color(grayvalue,grayvalue,grayvalue,0.75*alpha)
		DrawRect(m_cpuping.posX + widgetPosX  + 12, posY+1, m_cpuping.posX + widgetPosX  + 21, posY + 14)
	else
		gl_Color(pingCpuColors[pingLvl].r,pingCpuColors[pingLvl].g,pingCpuColors[pingLvl].b)
		DrawRect(m_cpuping.posX + widgetPosX  + 12, posY+1, m_cpuping.posX + widgetPosX  + 24, posY + 15)
	end
	
	grayvalue = 0.7 + (cpu/135)
	if cpuText ~= nil and cpuText then
		if type(cpu) == "number" then
			if cpu > 99 then
				cpu = 99
			end
			if spec then
				gl_Color(0,0,0,0.1+(grayvalue*0.4))
				gl_Text(cpu, m_cpuping.posX + widgetPosX+11, posY + 4.3, 9, "r")
				gl_Color(grayvalue,grayvalue,grayvalue,0.66*alpha*grayvalue)
				gl_Text(cpu, m_cpuping.posX + widgetPosX+11, posY + 5.3, 9, "r")
			else
				gl_Color(0,0,0,0.12+(grayvalue*0.44))
				gl_Text(cpu, m_cpuping.posX + widgetPosX+11, posY + 4.3, 9.5, "r")
				gl_Color(grayvalue,grayvalue,grayvalue,0.8*alpha*grayvalue)
				gl_Text(cpu, m_cpuping.posX + widgetPosX+11, posY + 5.3, 9.5, "r")
			end
			gl_Color(1,1,1)
		end
	else
		gl_Texture(cpuPic)
		if spec then
			gl_Color(grayvalue,grayvalue,grayvalue,0.75*alpha)
			DrawRect(m_cpuping.posX + widgetPosX + 2 , posY+1, m_cpuping.posX + widgetPosX  + 13, posY + 14)
		else
			gl_Color(pingCpuColors[cpuLvl].r,pingCpuColors[cpuLvl].g,pingCpuColors[cpuLvl].b)
			DrawRect(m_cpuping.posX + widgetPosX  + 1, posY+1, m_cpuping.posX + widgetPosX  + 14, posY + 15)
		end
	end
end

function DrawPoint(posY,pointtime)
	if right == true then
		gl_Color(1,0,0,pointtime/pointDuration)
		gl_Texture(arrowPic)
		DrawRect(widgetPosX - 18, posY, widgetPosX - 2, posY+ 14)
		gl_Color(1,1,1,pointtime/pointDuration)
		gl_Texture(pointPic)
		DrawRect(widgetPosX - 33, posY-1, widgetPosX - 17, posY + 15)
	else
		leftPosX = widgetPosX + widgetWidth
		gl_Color(1,0,0,pointtime/pointDuration)
		gl_Texture(arrowPic)
		DrawRect(leftPosX + 158, posY, leftPosX + 2, posY + 14)
		gl_Color(1,1,1,pointtime/pointDuration)
		gl_Texture(pointPic)
		DrawRect(leftPosX + 33, posY-1, leftPosX + 17, posY + 15)	
	end
	gl_Color(1,1,1,1)
end

function TakeTip(mouseX)
	if right == true then
		if mouseX >= widgetPosX - 57 * widgetScale  and  mouseX <= widgetPosX - 1 * widgetScale then
			tipText = "Click to take abandoned units"
		end
	else
		local leftPosX = widgetPosX + widgetWidth
		if mouseX >= leftPosX + 1 * widgetScale  and  mouseX <= leftPosX + 57 * widgetScale then
			tipText = "Click to take abandoned units"
		end		
	end
end

function ShareTip(mouseX, playerID)
	if playerID == myPlayerID then
		if mouseX >= widgetPosX + (m_share.posX  + 1) * widgetScale  and  mouseX <= widgetPosX + (m_share.posX + 17) * widgetScale then
			tipText = "Double click to ask for Unit support"
		elseif mouseX >= widgetPosX + (m_share.posX + 19) * widgetScale  and  mouseX <= widgetPosX + (m_share.posX + 35) * widgetScale then
			tipText = "Click and drag to ask for Energy"
		elseif mouseX >= widgetPosX + (m_share.posX + 37) * widgetScale  and  mouseX <= widgetPosX + (m_share.posX + 53) * widgetScale then
			tipText = "Click and drag to ask for Metal"
		end
	else
		if mouseX >= widgetPosX + (m_share.posX + 1) * widgetScale  and  mouseX <= widgetPosX + (m_share.posX + 17) * widgetScale then
			tipText = "Double click to share Units"
		elseif mouseX >= widgetPosX + (m_share.posX + 19) * widgetScale  and  mouseX <= widgetPosX + (m_share.posX + 35) * widgetScale then
			tipText = "Click and drag to share Energy"
		elseif mouseX >= widgetPosX + (m_share.posX + 37) * widgetScale  and  mouseX <= widgetPosX + (m_share.posX + 53) * widgetScale then
			tipText = "Click and drag to share Metal"
		end
	end
end


function PingCpuTip(mouseX, pingLvl, cpuLvl)
	if mouseX >= widgetPosX + (m_cpuping.posX + 13) * widgetScale and mouseX <=  widgetPosX + (m_cpuping.posX + 23) * widgetScale  then
		if pingLvl < 2000 then
			pingLvl = pingLvl.." ms"
		elseif pingLvl >= 2000 and pingLvl < 60000 then
			pingLvl = round(pingLvl/1000,0).." sec"
		elseif pingLvl >= 60000 then
			pingLvl = round(pingLvl/60000,0).." min"
		end
		tipText = "Ping: "..pingLvl
	elseif mouseX >= widgetPosX + (m_cpuping.posX  + 1) * widgetScale and mouseX <=  widgetPosX + (m_cpuping.posX + 11) * widgetScale then		
		tipText = "Cpu Usage: "..cpuLvl.."%"
	end
end

function PointTip(mouseX)
	if right == true then
		if mouseX >= widgetPosX - 28 * widgetScale  and  mouseX <= widgetPosX - 1 * widgetScale then
			tipText = "Click to reach the last point set by the player"
		end
	else
		local leftPosX = widgetPosX + widgetWidth
		if mouseX >= leftPosX + 1 * widgetScale  and  mouseX <= leftPosX + 28 * widgetScale then
			tipText = "Click to reach the last point set by the player"
		end		
	end
end

function DrawTip(mouseX, mouseY)
	
	local scaleDiffX = -((widgetPosX*widgetScale)-widgetPosX)/widgetScale
	local scaleDiffY = -((widgetPosY*widgetScale)-widgetPosY)/widgetScale
	local scaleReset = widgetScale / widgetScale / widgetScale
	gl.Translate(-scaleDiffX,-scaleDiffY,0)
	gl.Scale(scaleReset,scaleReset,0)
	
	text = tipText --this is needed because we're inside a gllist
	if text ~= nil then
		local tw = (14*gl_GetTextWidth(text) + 16)*widgetScale
		if right ~= true then tw = -tw end
		gl_Color(0.5,0.5,0.5,0.66)
		local oldWidgetScale = widgetScale
		widgetScale = 1
		RectRound(mouseX-tw,mouseY,mouseX,mouseY+(26*oldWidgetScale),4.5*oldWidgetScale)
		widgetScale = oldWidgetScale
		--gl_Rect(mouseX-tw,mouseY,mouseX,mouseY+(30*widgetScale)) 
		gl_Color(1,1,1,1)
		if right == true then
			gl_Text(text,mouseX+(8*widgetScale)-tw,mouseY+(8*widgetScale), (14*widgetScale), "o")
		else
			gl_Text(text,mouseX+(8*widgetScale),mouseY+(8*widgetScale), (14*widgetScale), "o")
		end
	end
	tipText = nil
	
	gl.Scale(widgetScale,widgetScale,0)
	gl.Translate(scaleDiffX,scaleDiffY,0)
end

---------------------------------------------------------------------------------------------------
--  Share slider gllist
---------------------------------------------------------------------------------------------------

function CreateShareSlider()

	if ShareSlider then
		gl_DeleteList(ShareSlider)
	end
	
	ShareSlider = gl_CreateList(function()

	local posY
	if energyPlayer ~= nil then
		posY = widgetPosY + widgetHeight - energyPlayer.posY
		gl_Texture(barPic)
		DrawRect(m_share.posX + widgetPosX  + 16,posY-3,m_share.posX + widgetPosX  + 34,posY+58)
		gl_Texture(energyPic)
		DrawRect(m_share.posX + widgetPosX  + 17,posY+sliderPosition,m_share.posX + widgetPosX  + 33,posY+16+sliderPosition)
		gl_Texture(amountPic)
		if right == true then
			DrawRect(m_share.posX + widgetPosX  - 28,posY-1+sliderPosition, m_share.posX + widgetPosX  + 19,posY+17+sliderPosition)
			gl_Texture(false)
			gl_Text(amountEM.."", m_share.posX + widgetPosX  - 5,posY+3+sliderPosition)
		else
			DrawRect(m_share.posX + widgetPosX  + 76,posY-1+sliderPosition, m_share.posX + widgetPosX  + 31,posY+17+sliderPosition)
			gl_Texture(false)
			gl_Text(amountEM.."", m_share.posX + widgetPosX  + 55,posY+3+sliderPosition)				
		end
	elseif metalPlayer ~= nil then
		posY = widgetPosY + widgetHeight - metalPlayer.posY
		gl_Texture(barPic)
		DrawRect(m_share.posX + widgetPosX  + 32,posY-3,m_share.posX + widgetPosX  + 50,posY+58)
		gl_Texture(metalPic)
		DrawRect(m_share.posX + widgetPosX  + 33, posY+sliderPosition,m_share.posX + widgetPosX  + 49,posY+16+sliderPosition)
		gl_Texture(amountPic)
		if right == true then
			DrawRect(m_share.posX + widgetPosX  - 12,posY-1+sliderPosition, m_share.posX + widgetPosX  + 35,posY+17+sliderPosition)
			gl_Texture(false)
			gl_Text(amountEM.."", m_share.posX + widgetPosX  + 11,posY+3+sliderPosition)
		else
			DrawRect(m_share.posX + widgetPosX  + 88,posY-1+sliderPosition, m_share.posX + widgetPosX  + 47,posY+17+sliderPosition)
			gl_Texture(false)
			gl_Text(amountEM.."", m_share.posX + widgetPosX  + 71,posY+3+sliderPosition)
		end
	end
	
	end)
end

function GetCpuLvl(cpuUsage)

	-- set the 5 cpu usage levels (green to red)

	if cpuUsage < 0.15 then return 1
	elseif cpuUsage < 0.3 then return 2
	elseif cpuUsage < 0.45 then return 3
	elseif cpuUsage < 0.65 then return 4
	else return 5
	end

end

function GetPingLvl(ping)

	-- set the 5 ping levels (green to red)

	if ping < 0.15 then return 1
	elseif ping < 0.3 then return 2
	elseif ping < 0.7 then return 3
	elseif ping < 1.5 then return 4
	else return 5
	end
end


---------------------------------------------------------------------------------------------------
--  Mouse 
---------------------------------------------------------------------------------------------------

local prevClickedName
local clickedName

function widget:MousePress(x,y,button) --super ugly code here
	local t = false       -- true if the object is a team leader
	local clickedPlayer
	local posY
	local clickTime = os.clock()
	if button == 1 then
		local alt,ctrl,meta,shift = Spring.GetModKeyState() 
		sliderPosition = 0
		amountEM = 0
		
		-- spectators label onclick
		posY = widgetPosY + widgetHeight - specsLabelOffset
		if IsOnRect(x, y, widgetPosX + 2, posY+2, widgetPosX + widgetWidth - 2, posY + 20) then
			specListShow = not specListShow
			SetModulesPositionX() --why?
			SortList()
			CreateLists()
			return true 
		end 
		
		for _,i in ipairs(drawList) do  -- i = object #
			if i > -1 then
				clickedPlayer = player[i]
				clickedName = clickedPlayer.name
				posY = widgetPosY + widgetHeight - clickedPlayer.posY
			end
			
			if mySpecStatus == true then
				
				if i == -1 then
					t = true
				else
					t = false
					if m_point.active == true then
						if i > -1 and i < 64 then
							if clickedPlayer.pointTime ~= nil then
								if right == true then
									if IsOnRect(x,y, widgetPosX - 33, posY - 2,widgetPosX - 17, posY + 16) then                           --point button
										Spring.SetCameraTarget(clickedPlayer.pointX,clickedPlayer.pointY,clickedPlayer.pointZ,1)          --                                       --
										return true                                                                                       --
									end                                                                                                   --
								else                                                                                                      --
									if IsOnRect(x,y, widgetPosX + widgetWidth + 17, posY-2,widgetPosX + widgetWidth + 33, posY + 16) then --
										Spring.SetCameraTarget(clickedPlayer.pointX,clickedPlayer.pointY,clickedPlayer.pointZ,1)                                                  --
										return true
									end
								end
							end
						end
					end
				end
				if i>-1 and i<64 then
					if m_name.active and clickedPlayer.name ~= absentName and IsOnRect(x, y, m_name.posX + widgetPosX +1, posY, m_name.posX + widgetPosX + m_name.width, posY+16) then
						if ctrl then 
							Spring_SendCommands{"toggleignore "..clickedPlayer.name} 
							return true 
						end
						if clickTime - prevClickTime < dblclickPeriod and clickedName == prevClickedName then 
							LockCamera(i)
							prevClickedName = ''
							if not clickedPlayer.spec then 
								Spring_SendCommands{"specteam "..i}
							end
							SortList()
							CreateLists()
							return true
						end 
						prevClickedName = clickedName
					end
				end 
				
			else
				if t == true then
					if clickedPlayer.allyteam == myAllyTeamID then
						if m_take.active == true then
							if clickedPlayer.totake == true then
								if right == true then
									if IsOnRect(x,y, widgetPosX - 57, posY ,widgetPosX - 12, posY + 17) then                            --take button
										Take(clickedPlayer.team, clickedPlayer.name, i)                                                                                             --
										return true                                                                                        --
									end                                                                                                    --
								else                                                                                                       --
									if IsOnRect(x,y, widgetPosX + widgetWidth + 12, posY ,widgetPosX + widgetWidth + 57, posY + 17) then  --
										Take(clickedPlayer.team, clickedPlayer.name, i)                                                                                             --
										return true
									end
								end
							end
						end
						if m_share.active == true and clickedPlayer.dead ~= true then
							if IsOnRect(x, y, m_share.posX + widgetPosX +1, posY, m_share.posX + widgetPosX +17,posY+16) then       -- share units button
								if release ~= nil then                                                                                --
									if release >= now then                                                                            --
										if clickedPlayer.team == myTeamID then                                                        --
											Spring_SendCommands("say a: I need unit support!")                                        -- (ask)
										else                                                                                          --
											local suc = Spring.GetSelectedUnitsCount()
											Spring_SendCommands("say a: I gave "..suc.." units to "..clickedPlayer.name..".")
											local su = Spring.GetSelectedUnits()
											for _,uid in ipairs(su) do
												local ux,uy,uz = Spring.GetUnitPosition(uid)
												Spring.MarkerAddPoint(ux,uy,uz)
											end
											Spring_ShareResources(clickedPlayer.team, "units")                                                            --
										end
									end
									release = nil
								else	
									firstclick = now+1
								end
								return true
							end
							if IsOnRect(x, y, m_share.posX + widgetPosX +17, posY, m_share.posX + widgetPosX +33,posY+16) then      -- share energy button (initiates the slider)
								energyPlayer = clickedPlayer
								return true
							end
							if IsOnRect(x, y, m_share.posX + widgetPosX +33, posY, m_share.posX + widgetPosX +49,posY+16) then      -- share metal button (initiates the slider)
								metalPlayer = clickedPlayer
								return true
							end
						end
					end
				end
				if i == -1 then
					t = true
				else
					t = false
					if i > -1 and i < 64 then
						if m_chat.active == true then
							if IsOnRect(x, y, m_chat.posX + widgetPosX +1, posY, m_chat.posX + widgetPosX +17,posY+16) then                            --chat button
								Spring_SendCommands("chatall","pastetext /w "..clickedPlayer.name..' \1')
								return true                                                                                                                --
							end
						end
						if m_point.active == true then
							if clickedPlayer.pointTime ~= nil then
								if clickedPlayer.allyteam == myAllyTeamID then
									if right == true then
										if IsOnRect(x,y, widgetPosX - 28, posY - 1,widgetPosX - 12, posY + 17) then
											Spring.SetCameraTarget(clickedPlayer.pointX,clickedPlayer.pointY,clickedPlayer.pointZ,1)
											return true
										end
									else
										if IsOnRect(x,y, widgetPosX + widgetWidth + 12, posY-1,widgetPosX + widgetWidth + 28, posY + 17) then
											Spring.SetCameraTarget(clickedPlayer.pointX,clickedPlayer.pointY,clickedPlayer.pointZ,1)
											return true
										end
									end
								end
							end
						end
						if m_name.active and clickedPlayer.name ~= absentName and IsOnRect(x, y, m_name.posX + widgetPosX +1, posY, m_name.posX + widgetPosX + m_name.width, posY+12)  then
							if ctrl then 
								Spring_SendCommands{"toggleignore "..clickedPlayer.name} 
								return true 
							end
							if clickTime - prevClickTime < dblclickPeriod and clickedName == prevClickedName then 
								LockCamera(clickedPlayer.team)
								prevClickedName = ''
								if not clickedPlayer.spec then
									Spring_SendCommands{"specteam "..clickedPlayer.team}
								end
								SortList()
								CreateLists()
								return true
							end 
							prevClickedName = clickedName
						end
					end
				end
			end
		end
	end
	prevClickTime = clickTime
end

function widget:MouseMove(x,y,dx,dy,button)
  local moveStartX, moveStartY
	if energyPlayer ~= nil or metalPlayer ~= nil then                            -- move energy/metal share slider
		if sliderOrigin == nil then
			sliderOrigin = y
		end
		sliderPosition = y-sliderOrigin
		if sliderPosition < 0 then sliderPosition = 0 end
		if sliderPosition > 39 then sliderPosition = 39 end
		
		UpdateResources()
	end
end

function widget:MouseRelease(x,y,button)
	if button == 1 then
		if firstclick ~= nil then                                                  -- double click system for share units
			release = firstclick
			firstclick = nil
		else
			release = nil
		end
		if energyPlayer ~= nil then                                                -- share energy/metal mouse release
			if energyPlayer.team == myTeamID then
				if amountEM == 0 then
					Spring_SendCommands("say a: I need Energy!")
				else
					Spring_SendCommands("say a: I need "..amountEM.." Energy!")
				end
			elseif amountEM > 0 then
				Spring_ShareResources(energyPlayer.team, "energy", amountEM)
				Spring_SendCommands("say a: I sent "..amountEM.." energy to "..energyPlayer.name)
			end
			sliderOrigin = nil
			amountEMMax = nil
			sliderPosition = nil
			amountEM = nil
			energyPlayer = nil
		end
		
		if metalPlayer ~= nil then
			if metalPlayer.team == myTeamID then
				if amountEM == 0 then
					Spring_SendCommands("say a: I need Metal!")
				else
					Spring_SendCommands("say a: I need "..amountEM.." Metal!")
				end
			elseif amountEM > 0 then
				Spring_ShareResources(metalPlayer.team, "metal", amountEM)
				Spring_SendCommands("say a: I sent "..amountEM.." metal to "..metalPlayer.name)
			end
			sliderOrigin = nil
			amountEMMax = nil
			sliderPosition = nil
			amountEM = nil
			metalPlayer = nil
		end
	end
end

function Spec(teamID)
	Spring_SendCommands{"specteam "..teamID}
	specTarget = teamID
	SortList()
end


---------------------------------------------------------------------------------------------------
--  Tweak mode
---------------------------------------------------------------------------------------------------


function IsOnRect(x, y, BLcornerX, BLcornerY,TRcornerX,TRcornerY)
	
	-- calc scale offset
	BLcornerX = BLcornerX - ((widgetPosX - BLcornerX) * (widgetScale-1))
	BLcornerY = BLcornerY - ((widgetPosY - BLcornerY) * (widgetScale-1))
	TRcornerX = TRcornerX - ((widgetPosX - TRcornerX) * (widgetScale-1))
	TRcornerY = TRcornerY - ((widgetPosY - TRcornerY) * (widgetScale-1))
	
	-- check if the mouse is in a rectangle
	return x >= BLcornerX and x <= TRcornerX
	                      and y >= BLcornerY
	                      and y <= TRcornerY
end

local function DrawGreyRect()
	gl_Color(0.2,0.2,0.2,0.7)
	gl_Rect(widgetPosX, widgetPosY, widgetPosX + widgetWidth, widgetPosY + widgetHeight)
	gl_Color(1,1,1,1)
end

local function DrawTweakButton(module,  localLeft, localOffset, localBottom)
	gl_Texture(module.pic)
	DrawRect(localLeft + localOffset, localBottom + 11, localLeft + localOffset + 16, localBottom + 27)
	if module.active ~= true and module.alwaysActive == nil then
		gl_Texture(crossPic)
		DrawRect(localLeft + localOffset, localBottom + 11, localLeft + localOffset + 16, localBottom + 27)
	end
end

local function DrawTweakButtons()
	
	local minSize = (modulesCount-1) * 16 + 2
	local localLeft     = widgetPosX
	local localBottom   = widgetPosY + widgetHeight - 28
	local localOffset   = 1 --see func above, these track how far right we've got TODO: pass values
	
	--if localLeft + minSize > vsx then localLeft = vsx - minSize end 
	if localBottom < 0 then localBottom = 0 end
	
	for n,module in pairs(modules) do
		if module.noPic == nil or module.noPic == false then
			if mySpecStatus == false or mySpecStatus == true and module.spec then
				DrawTweakButton(module, localLeft, localOffset, localBottom)
				localOffset = localOffset + 16
			end
		end
		if module.picGap ~= nil then
			if mySpecStatus == false or mySpecStatus == true and module.spec then
				localOffset = localOffset + module.picGap
			end
		end
	end
	
end

local function DrawArrows()
	gl_Color(1,1,1,0.4)
	gl_Texture(arrowdPic)
	if expandDown == true then
		DrawRect(widgetPosX, widgetPosY - 15, widgetRight, widgetPosY - 1)
	else
		DrawRect(widgetPosX, widgetTop + 15, widgetRight, widgetTop + 1)
	end
		gl_Texture(arrowPic)
	if expandLeft == true then
		DrawRect(widgetPosX - 1, widgetPosY, widgetPosX - 15, widgetTop)
	else
		DrawRect(widgetRight + 1, widgetPosY, widgetRight + 15, widgetTop)
	end
	gl_Color(1,1,1,1)
	gl_Texture(false)
end

function widget:TweakDrawScreen()
	
	local scaleDiffX = -((widgetPosX*widgetScale)-widgetPosX)/widgetScale
	local scaleDiffY = -((widgetPosY*widgetScale)-widgetPosY)/widgetScale
	gl.Scale(widgetScale,widgetScale,0)
	gl.Translate(scaleDiffX,scaleDiffY,0)
	
	DrawGreyRect()
	DrawTweakButtons()
	DrawArrows()

	CreateMainList()
	CreateBackground()
	
	local scaleReset = widgetScale / widgetScale / widgetScale
	gl.Translate(-scaleDiffX,-scaleDiffY,0)
	gl.Scale(scaleReset,scaleReset,0)
end


function checkButton(module, x, y, localLeft, localOffset, localBottom)
	if IsOnRect(x, y, localLeft + localOffset, localBottom + 11, localLeft + localOffset + 16, localBottom + 27) then
		if module.alwaysActive == nil then
			module.active = not module.active
			SetModulesPositionX() --why?
			SortList()
			-- adjust because of widget scaling
			local widthDiff =  (module.width * widgetScale) - module.width
			if module.active then
				widgetRight = widgetRight - widthDiff
			else
				widgetRight = widgetRight + widthDiff
			end
		else
			if module.name == "sizedn" then
				customScaleDown()
			elseif module.name == "sizeup" then
				customScaleUp()
			end
		end
		CreateLists()
		return true
	else
		return false
	end
end

function widget:TweakMousePress(x,y,button)
	if button == 1 then
		local localLeft = widgetPosX
		local localBottom = widgetPosY + widgetHeight - 28
		local localOffset = 1 
		if localBottom < 0 then localBottom = 0 end
		--if localLeft + 181 > vsx then localLeft = vsx - 181 end
		
		for _,module in pairs(modules) do
			if module.noPic == nil or module.noPic == false then
				if mySpecStatus == false or mySpecStatus == true and module.spec then
					if checkButton(module,x,y,localLeft,localOffset,localBottom) then return true end
					localOffset = localOffset + 16
				end
			end
			if module.picGap ~= nil then
				if mySpecStatus == false or mySpecStatus == true and module.spec then
					localOffset = localOffset + module.picGap
				end
			end
		end

		if IsOnRect(x, y, widgetPosX, widgetPosY, widgetPosX + widgetWidth, widgetPosY + widgetHeight) then
			clickToMove = true
			return true
		end
		
	end
end


function widget:TweakMouseMove(x,y,dx,dy,button)
	if clickToMove ~= nil then
		if moveStartX == nil then                                                      -- move widget on y axis
			moveStartX = x - widgetPosX
		end
		if moveStartY == nil then                                                      -- move widget on y axis
			moveStartY = y - widgetPosY
		end
		widgetPosX = widgetPosX + dx
		widgetPosY = widgetPosY + dy
				
		if widgetPosY <= (backgroundMargin*widgetScale) then
			widgetPosY = (backgroundMargin*widgetScale)
			expandDown = false --expandDown=false only if we are right on the bottom of the screen
		end
		if widgetPosY + (widgetHeight * widgetScale) >= vsy -(backgroundMargin*widgetScale) then
			widgetPosY = vsy - (widgetHeight * widgetScale) -(backgroundMargin*widgetScale)
			expandDown = true
		end
		if widgetPosX <= (backgroundMargin*widgetScale) then --expandLeft=false only when we are precisely on the left edge of the screen
			widgetPosX = (backgroundMargin*widgetScale)
			expandLeft = false
		end
		if widgetPosX + (widgetWidth * widgetScale) >= vsx-(backgroundMargin*widgetScale) then
			widgetPosX = vsx - (widgetWidth * widgetScale) - (backgroundMargin*widgetScale)
			expandLeft = true
		end
		widgetTop   = widgetPosY + widgetHeight
		widgetRight = widgetPosX + widgetWidth
		widgetRelRight = vsx - (widgetPosX + (widgetWidth*widgetScale))
		if widgetPosX + widgetWidth/2 > vsx/2 then
			right = true
		else
			right = false
		end
	end
end

function widget:TweakMouseRelease(x,y,button)
	clickToMove = nil                                              -- ends the share slider process
end

---------------------------------------------------------------------------------------------------
--  Save/load
---------------------------------------------------------------------------------------------------

function widget:GetConfigData(data)      -- save
	if m_side ~= nil then
	
		--put module.active into a table
		local m_active_Table = {}
		for n,module in pairs(modules) do
			m_active_Table[module.name] = module.active
		end
	
		local settings = {
			--view
			customScale        = customScale,
			vsx                = vsx,
			vsy                = vsy,
			widgetRelRight	   = widgetRelRight, 
			widgetPosX         = widgetPosX,
			widgetPosY         = widgetPosY,
			widgetRight        = widgetRight,
			widgetTop          = widgetTop,
			expandDown         = expandDown,
			expandLeft         = expandLeft,
			specListShow       = specListShow,
			--not technically modules
			m_pointActive      = m_point.active,
			m_takeActive       = m_take.active,
			m_seespecActive    = m_seespec.active,
			--modules
			m_active_Table	   = m_active_Table,
			cpuText            = cpuText,
			lockPlayerID       = lockPlayerID 
		}
		
		return settings
	end
end

function widget:SetConfigData(data)      -- load
	
	if data.customScale ~= nil then
		customScale = data.customScale
	end
	--view
	if data.expandDown ~= nil and data.widgetRight ~= nil then
		expandDown   = data.expandDown
		expandLeft   = data.expandLeft
		specListShow = data.specListShow
		local oldvsx = data.vsx
		local oldvsy = data.vsy
		if oldvsx == nil then
			oldvsx = vsx
			oldvsy = vsy		
		end
		local dx     = vsx - oldvsx
		local dy     = vsy - oldvsy
		if expandDown == true then
			widgetTop  = data.widgetTop + dy
			if widgetTop > vsy then
				widgetTop = vsy
			end
		else
			widgetPosY = data.widgetPosY
		end
		if expandLeft == true then
			widgetRelRight = data.widgetRelRight or 0
			widgetRight = vsx - (widgetWidth * (widgetScale-1)) - widgetRelRight --align right of widget to right of screen
			widgetPosX = widgetRight - (widgetWidth*widgetScale)
			if widgetRight > vsx then
				widgetRight = vsx
			end
		else
			widgetPosX  = data.widgetPosX --align left of widget to left of screen
		end
	end

	if data.lockPlayerID ~= nil and gameStarted then 
	--if data.lockPlayerID ~= nil and Spring.GetGameFrame()>0 then 
 	    lockPlayerID = data.lockPlayerID 
 	end

	if data.cpuText ~= nil then
		cpuText = data.cpuText
	end
	
	--not technically modules
	m_point.active         = SetDefault(data.m_pointActive, m_point.default)
	m_take.active          = SetDefault(data.m_takeActive, m_take.default)
	m_seespec.active       = SetDefault(data.m_pointActive, m_seespec.default)
	
	--load module.active from table
	local m_active_Table = data.m_active_Table or {}
	for name,active in pairs(m_active_Table) do
		--find module with matching name 
		for _,module in pairs(modules) do
			if module.name == name then
				module.active = SetDefault(active, module.default)
			end
		end
	end
		
	SetModulesPositionX()
end

function widget:TextCommand(command)
	if (string.find(command, "cputext") == 1  and  string.len(command) == 7) then 
		cpuText = not cpuText
	end
end

function SetDefault(value, default)
	if value == nil then
		return default
	else
		return value
	end
end

---------------------------------------------------------------------------------------------------
--  Player related changes
---------------------------------------------------------------------------------------------------

function CheckPlayersChange()
	local sorting = false
	for i = 0,63 do
		local name,active,spec,teamID,allyTeamID,pingTime,cpuUsage, country, rank = Spring_GetPlayerInfo(i)
		if active == false then
			if player[i].name ~= nil then                                             -- NON SPEC PLAYER LEAVING
				if player[i].spec==false then
					if table.maxn(Spring_GetPlayerList(player[i].team,true)) == 0 then
						player[player[i].team + 64] = CreatePlayerFromTeam(player[i].team)
						sorting = true
					end
				end
				player[i].name = nil
				player[i] = {}
				sorting = true
			end
		elseif active == true and name ~= nil then
			if spec ~= player[i].spec then                                           -- PLAYER SWITCHING TO SPEC STATUS
				if spec == true then
					if table.maxn(Spring_GetPlayerList(player[i].team,true)) == 0 then   -- (update the no players team)
						player[player[i].team + 64] = CreatePlayerFromTeam(player[i].team)
					end
					player[i].team = nil                                                 -- remove team
				end
				player[i].spec = spec                                                  -- consider player as spec
				sorting = true
			end
			if teamID ~= player[i].team then                                               -- PLAYER CHANGING TEAM
				if table.maxn(Spring_GetPlayerList(player[i].team,true)) == 0 then           -- check if there is no more player in the team + update
					player[player[i].team + 64] = CreatePlayerFromTeam(player[i].team)         
				end
				player[i].team = teamID
				player[i].red, player[i].green, player[i].blue = Spring_GetTeamColor(teamID)
				player[i].dark = GetDark(player[i].red, player[i].green, player[i].blue)
				player[i].skill = GetSkill(i)
				sorting = true
			end
			if player[i].name == nil then
				player[i] = CreatePlayer(i)
			end
			if allyTeamID ~= player[i].allyteam then
				player[i].allyteam = allyTeamID
				updateTake(allyTeamID)
				sorting = true
			end
			
			-- Update stall / cpu / ping info for each player
			if player[i].spec == false then
				player[i].needm   = GetNeed("metal",player[i].team)
				player[i].neede   = GetNeed("energy",player[i].team)
				player[i].rank = rank
			else
				player[i].needm   = false
				player[i].neede   = false
			end
			player[i].pingLvl = GetPingLvl(pingTime)
			player[i].cpuLvl  = GetCpuLvl(cpuUsage)
			player[i].ping    = pingTime*1000-((pingTime*1000)%1)
			player[i].cpu     = cpuUsage*100-((cpuUsage*100)%1)
		end
		
		if teamID and gameStarted then
		--if teamID and Spring_GetGameFrame() > 0 then
			local totake = IsTakeable(teamID)
			player[i].totake = totake
			if totake then
				sorting = true	
			else
				player[i].name = name
			end
		end
	end

	if sorting == true then    -- sorts the list again if change needs it
		SortList()
		SetModulesPositionX()    -- change the X size if needed (change of widest name)
	end

end



function GetNeed(resType,teamID)
	local current, _, pull, income = Spring_GetTeamResources(teamID, resType)
		if current == nil then return false end
	local loss =  pull - income
	if loss > 0 then
		if loss*5 > current then
			return true
		end
	end
	return false
end

local reportTake = false
local tookTeamID
local tookTeamName
local tookFrame = -120

function updateTake(allyTeamID)
	for i = 0,teamN-1 do
		if player[i + 64].allyTeam == allyTeamID then
			player[i + 64] = CreatePlayerFromTeam(i)
		end
	end
end

function Take(teamID,name, i)

	-- sends the /take command to spring
	reportTake = true
	tookTeamID = teamID
	tookTeamName = name
	tookFrame = currentGameFrame
	
	Spring_SendCommands("luarules take2 " .. teamID)
	return
end

function widget:TeamDied(teamID)
	player[teamID+64]        = CreatePlayerFromTeam(teamID)
	SortList()
end

---------------------------------------------------------------------------------------------------
--  Take related stuff
---------------------------------------------------------------------------------------------------

function IsTakeable(teamID)
	if Spring_GetTeamRulesParam(teamID, "numActivePlayers") == 0 then
		local units = Spring_GetTeamUnitCount(teamID)
		local energy = Spring_GetTeamResources(teamID,"energy")
		local metal = Spring_GetTeamResources(teamID,"metal")
		if units and energy and metal then
			if (units > 0) or (energy > 1000) or (metal > 100) then			
				return true
			end
		end
	else
		return false					
	end
end



--timers
local timeCounter = 0
local updateRate = 0.75
local updateRatePreStart = 0.25
local lastTakeMsg = -120

function widget:Update(delta) --handles takes & related messages

	if Spring_IsGUIHidden() or PlayerIsBehind then
		return
	end

	totalTime = totalTime + delta 
	timeCounter = timeCounter + delta
	curFrame = currentGameFrame
	
	
	if energyPlayer ~= nil or metalPlayer ~= nil then
		CreateShareSlider()
	end
	
	if curFrame >= 30 + tookFrame then
		if lastTakeMsg + 120 < tookFrame and reportTake then 
			local teamID = tookTeamID
			local afterE = Spring_GetTeamResources(teamID,"energy")
			local afterM = Spring_GetTeamResources(teamID, "metal")
			local afterU = Spring_GetTeamUnitCount(teamID)
	
			local toSay = "say a: I took " .. tookTeamName .. ". "
		
			if afterE and afterM and afterU then
				if afterE > 1.0 or afterM > 1.0 or  afterU > 0 then
					toSay = toSay .. "Left  " .. math.floor(afterU) .. " units, " .. math.floor(afterE) .. " energy and " .. math.floor(afterM) .. " metal."
				end
			end
			
			Spring_SendCommands(toSay)
		
			for j = 0,127 do
				if player[j].allyteam == myAllyTeamID then
					if player[j].totake == true then
						player[j] = CreatePlayerFromTeam(player[j].team)
						SortList()
					end
				end
			end	

			lastTakeMsg = tookFrame
			reportTake = false
		else
			reportTake = false
		end
	end
	
	-- update lists to take account of allyteam faction changes before gamestart
	if not curFrame or curFrame <=0 then 
		if timeCounter < updateRatePreStart then
			return
		else
			timeCounter = 0
			SetSidePics() --if the game hasn't started, update factions
			CreateLists()
		end
	end
	
	-- update lists every now and then, just to make sure
	if timeCounter < updateRate then
		return
	else
		timeCounter = 0
		CreateLists()
	end
end


---------------------------------------------------------------------------------------------------
--  Other callins
---------------------------------------------------------------------------------------------------

function updateWidgetScale()
	if customScale < 0.6 then
		customScale = 0.6
	end
	widgetScale = (0.7 + (vsx*vsy / 5000000)) * customScale
end

function customScaleUp()
	widgetPosX		= widgetPosX - (widgetWidth*customScaleStep)
	widgetRight		= widgetPosX + widgetWidth  
	customScale		= customScale + customScaleStep
	updateWidgetScale()
end

function customScaleDown()
	widgetPosX		= widgetPosX + (widgetWidth*customScaleStep)
	widgetRight		= widgetPosX + widgetWidth  
	customScale		= customScale - customScaleStep
	updateWidgetScale()
end

function widget:ViewResize(viewSizeX, viewSizeY)
	local dx, dy = vsx - viewSizeX, vsy - viewSizeY
	vsx, vsy = viewSizeX, viewSizeY
	
	updateWidgetScale()
	
	if expandDown == true then
		widgetTop  = widgetTop - dy
		widgetPosY = widgetTop - widgetHeight
	end
	if expandLeft == true then
		widgetRight = widgetRight - dx
	    widgetPosX = vsx - (widgetWidth * widgetScale) - widgetRelRight
	end
end

function widget:MapDrawCmd(playerID, cmdType, px, py, pz)           -- get the points drawn (to display point indicator)
	if m_point.active == true then
		if cmdType == "point" then
			player[playerID].pointX = px
			player[playerID].pointY = py
			player[playerID].pointZ = pz
			player[playerID].pointTime = now + pointDuration
		end
	end
	
	local osClock = os.clock()
	if cmdType == 'line' then
		--mapDrawNicknameTime[playerID] = osClock
		--AddCommandSpotter('map_draw', x, y, z, osClock, false, playerID)
	end
end

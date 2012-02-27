local versionNumber = "1.31"
---------------------------------------------------------------------------------------------------
--  Bugs
---------------------------------------------------------------------------------------------------
-- * With option "remove dead team" some things are not rendered graphically.
---------------------------------------------------------------------------------------------------
--  Todo
---------------------------------------------------------------------------------------------------
-- * Write manual :)
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
-------------------------
-- Newest version is 1.31
-------------------------
-- * Compatible with spring 85.0
-- * fixed bug with incorrect expand button location

-------------
-- New in 1.3
-------------
--  * Added possibility to move the statistics table. To move it, click on the move button at top left and drag the window where you want it.
--  * Added option tomove to next and previous team from within the statistics table. Use the arrows beside team number to do that.
--  * Fixed some bugs that appear when widget is on the left side of the screen.
--  * The statistics window is now closed by right-clicking on it (or pressing the close/collapse button on the widget).

-------------
-- New in 1.2
-------------
--  * Ctrl+click on arm/core image to zoom in on player's commander (if alive)
--  * Fixed sorting of kill distribution graph
--  * Fixed some bugs relating to more start positions than players in game
--  * Fixed speeded up blink rate when increasing game speed.

-- New in 1.1.1
---------------
-- Fixed load/save bug
-- Player kill distribution graph added.

-- New in 1.1
------------------------
-- * Added many options to tweak screen, press ctrl+F11 to customise widget
-- * Saves settings now
-- * Click on arm/core image to go to player start position
-- * Changed kills/losses bar to display killed hp/lost hp instead of kills/losses
-- * Added active player mode, can be disabled/customised in options
-- * Made calls more efficient by moving stuff out of drawscreen function
---------------------------------------------------------------------------------------------------

function widget:GetInfo()
	return {
		name = "Ecostats",
		desc = "Display team eco",
		author = "Jools",
		date = "8 jan 2012",
		license = "GNU GPL, v2 or later",
		layer = 99,
		enabled = true
	}
end

---------------------------------------------------------------------------------------------------
--  Declarations
---------------------------------------------------------------------------------------------------

local bestTeam = nil
local bestKills = nil
local worstLosses = nil
local killCounters 					= {}
local lossCounters 					= {}
local killedHP						= {}
local lostHP						= {}
local kMat 							= {}     -- player to player kill matrix
local PmaxDmg						= 0
local comTable 						= {}
local playerData 					= {}
local teamData 						= {}
local pressedToMove                	= nil    -- click detection for moving the widget
local pressedHPlus 					= nil
local pressedHMinus 				= nil
local pressedWPlus 					= nil
local pressedWMinus 				= nil
local pressedExpandMove 			= false
local moveStart                    	= nil    -- position of the cursor before dragging the widget
local gamestarted 					= false
local startanimation
local gameover						= false
local inSpecMode					= false
local expandDown                    = false
local expandLeft                    = false

local motto							= {}
local expandButtonPos			 	= {}
local collapseButtonPos			 	= {}
local expandButtonState 		 	= {}
local collapseButtonState		 	= {}
local playerButton					= {}
local options						= {}
local expandMove					= {}
local Teambutton					= {}


local lastPlayerChange				= 0
local updateList					= {}

local vsx,vsy                    	= gl.GetViewSizes()
local right							= true
local widgetHeight					
local widgetWidth                	= 110
local widgetPosX                 	= vsx-widgetWidth-5
local widgetPosY                 	= 600
local widgetRight			 	    = widgetPosX + widgetWidth
local tH						 	= 75 -- team row height
local WBadge					 	= 14 -- width of player badge (side icon)
local iPosX, iPosY
local InfotablePosX, InfotablePosY	-- Expand bar bottom left coordinates
local cW 							= 100 -- column width
local infoTableHeight 				= 480
local nilCount						= 0
local ctrlDown 						= false

---------------------------------------------------------------------------------------------------
local announcingOn = true
local soundsOn = true -- set true if you want sounds
local snd = "LuaUI/Sounds/ding.ogg" --path to sound file
if snd == nil then soundsOn = false end

local armImage      	= "LuaUI/Images/ecostats/arm_default.png"
local coreImage      	= "LuaUI/Images/ecostats/core_default.png"
local font            	= "LuaUI/Fonts/FreeMonoBold_12"
local font2         	= "LuaUI/Fonts/FreeSansBold_14"
local optContrast		= "LuaUI/Images/ecostats/contrast.png"
local optBorders		= "LuaUI/Images/ecostats/borders.png"
local optBordersOff		= "LuaUI/Images/ecostats/bordersOff.png"
local optChkBoxOn		= "LuaUI/Images/ecostats/chkBoxOn.png"
local optChkBoxOff		= "LuaUI/Images/ecostats/chkBoxOff.png"
local optButtMore		= "LuaUI/Images/ecostats/ButtonMore.png"
local optButtLess		= "LuaUI/Images/ecostats/ButtonLess.png"
local defImage	 		= "LuaUI/Images/ecostats/default.png"
local imgMove	 		= "LuaUI/Images/ecostats/move.png"
local imgPrev	 		= "LuaUI/Images/ecostats/arrowL.png"
local imgNext	 		= "LuaUI/Images/ecostats/arrowR.png"
---------------------------------------------------------------------------------------------------
--  Speed ups
---------------------------------------------------------------------------------------------------
local Echo 						 = Spring.Echo
local Spring_GetGameSeconds      = Spring.GetGameSeconds
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

local GetTextWidth        		 = fontHandler.GetTextWidth
local UseFont             		 = fontHandler.UseFont
local TextDraw            		 = fontHandler.Draw
local TextDrawCentered    		 = fontHandler.DrawCentered
local TextDrawRight       		 = fontHandler.DrawRight

---------------------------------------------------------------------------------------------------
--  Start
---------------------------------------------------------------------------------------------------

function widget:Initialize()
	if not (Spring.GetSpectatingState() or Spring.IsReplay()) then
		inSpecMode = false
		Echo("Ecostats: widget loaded in active player mode")
	else
		inSpecMode = true
		Echo("Ecostats: widget loaded in spectator mode")
	end
	if Spring_GetGameSeconds() > 0 then gamestarted = true end
	Init()
	return true
end

function widget:Shutdown()
	--debugInfo()
end

function Init()
	local nbTeams = getNbTeams()
	local maxPlayers = getMaxPlayers()
	if not gamestarted then startanimation = false end
	bestKills = 0
	worstLosses = 0
	killCounters = {}
	lossCounters = {}
	killedHP = {}
	lostHP = {}
	kMat = {}
	playerData = {}
	teamData = {}
	comTable = {}
	motto = {}
	expandButtonState = {}
	collapseButtonState = {}
	expandButtonPos	 = {}
	expandMove    = {}
	collapseButtonPos  = {}
	playerButton = {}
	iPosX = {}
	iPosY = {}
	Teambutton = {}
	Teambutton["Next"] = {}
	Teambutton["Prev"] = {}
	right = widgetPosX/vsx > 0.5
	widgetHeight						= nbTeams*tH+2
	
	if right then
		InfotablePosX = widgetPosX - (180 + cW*maxPlayers)
	else
		InfotablePosX = widgetPosX + widgetWidth - 1
	end
	InfotablePosY = widgetPosY + widgetHeight - 2
	
	--Echo("Init 1 completed")
	if maxPlayers == 1 then
		WBadge = 18
	elseif maxPlayers == 2 or maxPlayers == 3 then
	    WBadge = 16
	else
		WBadge = 14
	end
	if maxPlayers * WBadge + 30 > widgetWidth then 
		widgetWidth = 30 + maxPlayers * WBadge
		
	end 
	if widgetPosX + widgetWidth + 5 > vsx then
		widgetPosX = vsx-widgetWidth-5
	end
	
	if widgetPosX < 5 then
		widgetPosX = 5
	end
	
	for _,player in ipairs(Spring_GetTeamList()) do
		killCounters[player] = 0
		lossCounters[player] = 0
		killedHP[player] = 0
		lostHP[player] = 0
		kMat[player] = {}
		playerData[player] = {}
		playerButton[player] = {}
		for sortindex,enemy in ipairs(Spring_GetTeamList()) do
			kMat[player][sortindex] = {enemy,0} -- maintain association: 1 = pID, 2 = kills
		end
	end
	--Echo("Init 2 completed")
	
	for id,unitDef in ipairs(UnitDefs) do
		 if unitDef.customParams.iscommander then
			 for name,param in unitDef:pairs() do
				if name == "id" then table.insert(comTable,param) end
			end
		 end
	end
	
	--Echo("Init 3 completed")
	local mottoTable ={
	"but","firstling","of","a","cow","firstling","of","a","sheep","firstling","of","a","goat","","thou","shalt","redeem","they","are","holy:","thou","shalt","sprinkle","their","blood","upon","altar","ando","shalt","burn","their","fat","an","offering","made","by","fire","a","sweet","savour","unto","LORD","Pharaoh","shall","hearken","unto","you","that","I","may","lay","my","hand","upon","Egypt","bring","forth","mine","armies","my","people","children","of","Israel","out","of","land","of","Egypt","by","great","judgments","on","east","side","toward","rising","of","sun","shall","they","of","standard","of","camp","of","Judah","pitch","throughout","their","armies","Nahshon","son","of","Amminadab","shall","be","captain","of","children","of","Judah", "Spam", "Wattle", "Annihilation", "Total","Babbles","Commander","the","army","Tribulex ","have","the","perfect","strat","for","one","map!","FrozenLegacy","Sorry,","Frozen","has","self","destructed,","come","again","later","Jools","Do","you","want","some","mines","with","that?","Ansiktsburk","Allies","losing,","need","to","tech","faster","Malric","My","GF","let","me","play",":)","Scifi","modding,","go","away","Jimjoe","Stop","talking","about","my","mum,","Shift","V1ntage","really","bad!","shift","ukraine","joke","to","you?","Punarbhava","too","out","it","to","care","Snel","the","only","good","Swedish","player","really","CoW","Core","War:","Manolo","Less","playing,","more","speccing!","Seba","1v1?","TheMightyOne","It","failed","me","the","first","9000","times,","so","it","now!","FlorisXIV","have","more","smurfs","than","ingame","minutes","Error232","rusty,","swear!","Kloot","HLT","here,","HLT","there","HermuldXV","cow","says","mooh","Jim","Hatama","No-one","knows","who","am","Ray","hate","people","who","are","better","than","me;","love","CoW","RoX","Rogues","XTA","Janid","love","my","crashers","like","my","children","Tobi","got","bored","doing","everything","John","My","AK","beats","your","AK","Pintle","Hey,","didn't","my","clan","used","to","be","good?","1v0ry_k1ng","actually","played,","but","know","the","balance","better","than","you","PhreakY","riding","on","knowing","Pintle","SIN","Basic","Everything","OP","unless","say","otherwise","el_barto","Barto","timed","out","before","he","could","be","quoted","Creed","not","Admin!","DearLordAnimal","am","but","one","many","DojeH","Every","low","ranking","German","player","me"
	}

	local teamlist = Spring_GetAllyTeamList()
	for _,team in ipairs (teamlist) do
	
		local nbPlayers = getNbPlayers(team)
		--Echo("Initing team:",team)
		local motto1 = mottoTable[math.random(table.getn(mottoTable))]
		motto1 = firstToUpper(motto1)
		local motto2 = mottoTable[math.random(table.getn(mottoTable))]
		local motto3 = mottoTable[math.random(table.getn(mottoTable))]
		motto[team] = "'"..motto1.." "..motto2.." and "..motto3.."'"
		expandButtonPos[team]		= {}
		collapseButtonPos[team]		= {}
		expandButtonState[team]		= {}
		collapseButtonState[team]	= {}
		expandMove[team] 			= {}
		Teambutton["Next"][team] 	= {}
		Teambutton["Prev"][team] 	= {}
		
		teamData[team] 				= {}
		
		expandButtonPos[team]["x1"] = 0
		collapseButtonPos[team]["x1"] = 0
		expandButtonPos[team]["y1"] = 0
		collapseButtonPos[team]["y1"] = 0
		expandButtonPos[team]["x2"] = 0
		collapseButtonPos[team]["x2"] = 0
		expandButtonPos[team]["y2"] = 0
		collapseButtonPos[team]["y2"] = 0
		expandButtonState[team]["mouse"] 	= false
		expandButtonState[team]["click"] 	= false
		collapseButtonState[team]["mouse"] 	= false
		collapseButtonState[team]["click"] 	= false
		expandMove[team]["x1"]		= 0
		expandMove[team]["x2"]		= 0
		expandMove[team]["y1"]		= 0
		expandMove[team]["y2"]		= 0
		expandMove[team]["mouseover"]		= false
		Teambutton["Next"][team]["x1"]	= 0	
		Teambutton["Next"][team]["x2"]	= 0
		Teambutton["Next"][team]["y1"]	= 0
		Teambutton["Next"][team]["y2"]	= 0
		Teambutton["Next"][team]["mouse"] = false
		Teambutton["Next"][team]["click"] = false
		Teambutton["Prev"][team]["x1"]	= 0	
		Teambutton["Prev"][team]["x2"]	= 0
		Teambutton["Prev"][team]["y1"]	= 0
		Teambutton["Prev"][team]["y2"]	= 0
		Teambutton["Prev"][team]["mouse"] = false
		Teambutton["Prev"][team]["click"] = false
		
		defineButtonCoords(team)
	end
	--Echo("Init 4 completed")
	UpdateTeams()
	if not options.disable then
		Echo("Ecostats:Options not loaded, using default settings. (This is normal during first run.)")
		setDefaults()
	end
	
	local frame = Spring.GetGameFrame()
	lastPlayerChange = frame
	updateList["frame"] 			= {}
	updateList["team"] 				= {}
	--Echo("Init completed")
end

function Reinit()
	--Echo("Reiniting...")
	local nbTeams = getNbTeams()
	local maxPlayers = getMaxPlayers()
	if not gamestarted then startanimation = false end
	
	if (not inSpecMode) and gamestarted and (not startanimation) then 
		if widgetWidth < 60 then widgetWidth = 60 end
		if tH < 50 then tH = 50 end
	else
		if widgetWidth <  110 then widgetWidth = 110 end
		if tH < 75 then tH = 75 end
	end
	widgetHeight = nbTeams*tH+2
	if maxPlayers == 1 then
		WBadge = 18
	elseif maxPlayers == 2 or maxPlayers == 3 then
	    WBadge = 16
	else
		WBadge = 14
	end
	if maxPlayers * WBadge + 30 > widgetWidth then 
		widgetWidth = 30 + maxPlayers * WBadge
	end	
	if widgetPosX + widgetWidth + 5 > vsx then widgetPosX = vsx-widgetWidth -5 end
	if widgetPosX < 5 then widgetPosX = 5 end
	
	local teamlist = Spring_GetAllyTeamList()
	delayedUpdateTeams()
	
	for _,team in ipairs (teamlist) do
		delayedUpdateButtons()
	end
	--Echo("Reinit complete")
end

---------------------------------------------------------------------------------------------------
--  Save / Load
---------------------------------------------------------------------------------------------------

function setDefaults()
	options = {}
	options["contrastMore"] = {}
	options["contrastLess"] = {}
	options["contrast"] = 0.3
	options["borders"] = {}
	options["borders"]["On"] = true
	options["disable"] = {}
	options["disable"]["On"] = false
	options["FPBar1"] = {}
	options["FPBar1"]["On"] = true
	options["FPBar2"] = {}
	options["FPBar2"]["On"] = true
	options["BPBar1"] = {}
	options["BPBar1"]["On"] = true
	options["BPBar2"] = {}
	options["BPBar2"]["On"] = true
	options["kills1"] = {}
	options["kills1"]["On"] = false
	options["kills2"] = {}
	options["kills2"]["On"] = true
	options["widthInc"] = {}
	options["widthDec"] = {}
	options["heightInc"] = {}
	options["heightDec"] = {}
	options["Announce"] = {}
	options["Announce"]["On"] = true
	options["resText"] = {}
	options["removeDead"] = {}
	options["resText"]["On"] = true
	options["removeDead"]["On"] = false
	vsx,vsy 			= gl.GetViewSizes()
	widgetWidth 		= 110
	widgetPosX         	= vsx-widgetWidth-5
	widgetPosY         	= 600
	expandDown         	= true
	expandLeft         	= true
	right 				= true
	tH					= 60
	soundsOn 			= true
end

function widget:GetConfigData(data)      -- save
	if options.Announce then
		--Echo("Saving config data")
		return {
			vsx                = vsx,
			vsy                = vsy,
			widgetPosX         = widgetPosX,
			widgetPosY         = widgetPosY,
			widgetWidth		   = widgetWidth,
			expandDown         = expandDown,
			expandLeft         = expandLeft,
			tH				   = tH,
			announcingOn 	   = options.Announce.On,
			removeDeadOn 	   = options.removeDead.On,
			resTextOn 	   	   = options.resText.On,
			soundsOn		   = soundsOn,
			bordersOn 		   = options.borders.On,
			contrast 		   = options.contrast,
			disableOn		   = options.disable.On,
			FPBar1On		   = options.FPBar1.On,
			FPBar2On		   = options.FPBar2.On,
			BPBar1On		   = options.BPBar1.On,
			BPBar2On		   = options.BPBar2.On,
			kills1On 		   = options.kills1.On,
			kills2On 		   = options.kills2.On,
			vsx                = vsx,
			vsy                = vsy,
			widgetPosX         = widgetPosX,
			widgetPosY         = widgetPosY,
			widgetWidth		   = widgetWidth,
			expandDown         = expandDown,
			expandLeft         = expandLeft,
			right			   = right,
			tH				   = tH,
		}
	end
end

function widget:SetConfigData(data)      -- load
	--Echo("Loading config data...")
	options = {}
	options["contrastMore"] = {}
	options["contrastLess"] = {}
	options["contrast"] = data.contrast or 0.3
	options["borders"] = {}
	options["borders"]["On"] = data.bordersOn or false
	options["disable"] = {}
	options["disable"]["On"] = data.disableOn or false
	options["FPBar1"] = {}
	options["FPBar1"]["On"] = data.FPBar1On or false
	options["FPBar2"] = {}
	options["FPBar2"]["On"] = data.FPBar2On or false
	options["BPBar1"] = {}
	options["BPBar1"]["On"] = data.BPBar1On or false
	options["BPBar2"] = {}
	options["BPBar2"]["On"] = data.BPBar2On or false
	options["kills1"] = {}
	options["kills1"]["On"] = data.kills1On or false
	options["kills2"] = {}
	options["kills2"]["On"] = data.kills2On or false
	options["widthInc"] = {}
	options["widthDec"] = {}
	options["heightInc"] = {}
	options["heightDec"] = {}
	options["Announce"] = {}
	options["Announce"]["On"] = data.announcingOn or false
	options["resText"] = {}
	options["removeDead"] = {}
	options["resText"]["On"] = data.resTextOn or false
	options["removeDead"]["On"] = data.removeDeadOn or false
	vsx					= data.vsx or vsx
	vsy 				= data.vsy or vsy
	widgetPosX         	= data.widgetPosX or widgetPosX
	widgetPosY         	= data.widgetPosY or widgetPosY
	widgetWidth 		= data.widgetWidth or widgetWidth
	expandDown         	= data.expandDown or expandDown
	expandLeft         	= data.expandLeft or expandLeft
	tH					= data.tH or tH
	soundsOn 			= data.soundsOn or soundsOn
	--Echo("Loaded all config data")
	--printOptions()
end

---------------------------------------------------------------------------------------------------
--  General
---------------------------------------------------------------------------------------------------

function firstToUpper(str)
	return (str:sub(1,1):upper()..str:sub(2))
end

function digitsep(amount)
  local formatted = amount
  while true do
    formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1 %2')
    if (k==0) then
      break
    end
  end
  return formatted
end

function UpdateAllPlayers()
	for _,player in ipairs(Spring_GetTeamList()) do
		if player ~= Spring.GetGaiaTeamID then
			if inSpecMode then
				setPlayerTable(player)
			else
				local team = playerData[player].teamID
				if team == Spring.GetMyAllyTeamID() then setPlayerTable(player) end
			end
		end
	end
end

function UpdatePlayer(pID)
	if pID ~= Spring.GetGaiaTeamID then
		if inSpecMode then
			setPlayerTable(pID)
		else
			local team = playerData[pID].teamID
			if team == Spring.GetMyAllyTeamID() then setPlayerTable(pID) end
		end
	end
end

function UpdateTeams()
	local teamlist = Spring_GetAllyTeamList()	
	for _,team in ipairs (teamlist) do
		--Echo("Updating team",team,inSpecMode,Spring.GetMyAllyTeamID())
		if inSpecMode then
			--Echo("Updating team:",team, "inSpecMode")
			setTeamTable(team)
		else
			if team == Spring.GetMyAllyTeamID() then 
				--Echo("Updating team: ",team,"not inSpecMode")
				setTeamTable(team) 
			end
		end
	end
	--Echo("Finished updating teams")
end

function UpdateTeam(teamID)
	if inSpecMode then
		--Echo("Updating team:",team, "inSpecMode")
		setTeamTable(teamID)
	else
		if teamID == Spring.GetMyAllyTeamID() then 
			--Echo("Updating team: ",team,"not inSpecMode")
			setTeamTable(teamID) 
		end
	end
end

function delayedUpdateTeam(teamID)
	local frame = Spring.GetGameFrame()
	table.insert(updateList["frame"],frame)
	table.insert(updateList["team"],teamID)
end

function delayedUpdateTeams()
	local frame = Spring.GetGameFrame()
	table.insert(updateList["frame"],frame)
	table.insert(updateList["team"],1000)
end

function delayedUpdateButtons()
	local frame = Spring.GetGameFrame()
	table.insert(updateList["frame"],frame)
	table.insert(updateList["team"],2000)
end

function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

function friendlyName(teamID)
	if teamID == nil then return "NONE" end
	local _,_,_,isAIteam,side,_,_,_ = Spring_GetTeamInfo(teamID)
	if isAIteam then
		if side == "arm" then return "Arm"
		elseif side == "core" then return "Core"
		elseif not (side == nil or #side < 1) then return side
		else return ("Team " .. teamID)
		end
	else
		names=nil
		for _,pid in ipairs(Spring_GetPlayerList(teamID,true)) do
			local name,active,spectator,_,_,_,_,_,_ = Spring_GetPlayerInfo(pid)
			if not spectator then
				names=(names and names.."," or "").."<PLAYER"..pid..">"
			end
		end
		if names == nil or #names < 1 then return ("Team " .. teamID) end
		return (names and names or "")
	end
end

function setPlayerTable(pID)
	--Echo("Setting table for player:",pID)
	if pID == nil then return end
	local side, tID, isDead, commanderAlive, minc, einc, kills, losses, x, y, kills2, losses2, leaderName, leaderID, active, unitCount, spectator, country, rank
	_,leaderID,isDead,_,side,tID,_,_ 	= Spring_GetTeamInfo(pID)
	if not leaderID then return end
	--Echo("Returning player table for player:", pID, leaderID, tID)
	leaderName,active,spectator,_,_,_,_,country,rank	= Spring_GetPlayerInfo(leaderID)
	--Echo("Player ID:", pID, "Team ID:", tID, leaderName, Spring.GetTeamStartPosition(pID))
	-- filter for active players
	local tmp1,_,tmp3 = Spring.GetTeamStartPosition(pID)
	local tred, tgreen, tblue = Spring_GetTeamColor(pID)
	local luminance  = (tred * 0.299) + (tgreen * 0.587) + (tblue * 0.114)
	if (luminance < 0.2) then
		tred = tred + 0.25
		tgreen = tgreen + 0.25
		tblue = tblue + 0.25
	end
	--Echo("Phase 2: Setting table for player:",pID, tmp1, tred, leaderID,leaderName)
	if tmp1 == nil then
		--Echo("setPlayerTable: startposX is nil for player:", pID,"Setting to zero.")
		tmp1 = 0
		tmp3 = 0
	end
	
	x = math.floor(tmp1)
	y = math.floor(tmp3)
	kills2,losses2,_,_,_,_ 		= Spring.GetTeamUnitStats(pID)
	_,_,_,minc,_,_,_,_ 			= Spring_GetTeamResources(pID,"metal")
	_,_,_,einc,_,_,_,_ 			= Spring_GetTeamResources(pID,"energy")
	
	if minc == nil or einc == nil then
		--Echo("setPlayerTable: energy/metal resources are nil for player:", pID,"Setting to zero.")
		minc = 0
		einc = 0
	end
	
	commanderAlive 				= checkCommander(pID)
	kills 						= killCounters[pID]
	losses 						= lossCounters[pID]
	killedhp 					= killedHP[pID]
	losthp 						= lostHP[pID]
	unitCount 					= Spring_GetTeamUnitCount(pID)
	--Echo("Phase 3: Setting table for player:",pID, commanderAlive,checkCommander(0))
	playerData[pID] 				= {}
	playerData[pID]["playerID"] 	= pID
	playerData[pID]["teamID"] 		= tID
	playerData[pID]["red"]			= tred
	playerData[pID]["green"]		= tgreen
	playerData[pID]["blue"]			= tblue
	playerData[pID]["startx"]		= x
	playerData[pID]["starty"]		= y
	playerData[pID]["side"]			= side
	playerData[pID]["isDead"] 		= isDead
	playerData[pID]["hasCom"]		= commanderAlive
	playerData[pID]["minc"]			= minc
	playerData[pID]["einc"] 		= einc
	playerData[pID]["kills"]		= kills
	playerData[pID]["losses"]		= losses
	playerData[pID]["kills2"]		= kills2
	playerData[pID]["losses2"]		= losses2
	playerData[pID]["killedhp"]		= killedhp
	playerData[pID]["losthp"]		= losthp
	playerData[pID]["leaderID"]		= leaderID
	playerData[pID]["leaderName"]	= leaderName
	playerData[pID]["active"]		= active
	playerData[pID]["spectator"]	= spectator
	playerData[pID]["unitCount"]	= unitCount
	playerData[pID]["country"]		= country
	playerData[pID]["rank"]			= rank
	setPlayerFP(pID)
	setPlayerBP(pID)
	--Echo("Finished setting table for player:",pID)
end

function setTeamTable(team)
	local playerList = Spring_GetTeamList(team)
	for _,p in ipairs (playerList) do
		setPlayerTable(p)
		--Echo("Finished setting player table for player", p, playerData[p].hasCom)
	end
	--Echo("Finished setting player tables for team", team)
	local player1 = playerList[1] --leader id
	
	if player1 == nil then return end
	
	if teamData[team] == nil then 
		teamData[team]				= {}
	end
	teamData[team]["tE"] 			= getTeamSum(team,"einc")
	teamData[team]["tM"] 			= getTeamSum(team,"minc")
	teamData[team]["tFP"]			= getTeamSum(team,"firepower")
	teamData[team]["tBP"]			= getTeamSum(team,"buildpower")
	teamData[team]["tFPM"]			= getTeamSum(team,"firepowerMob")
	teamData[team]["tBPA"]			= getTeamSum(team,"buildpowerAir")
	teamData[team]["x"]				= getTeamSum(team,"startx")
	teamData[team]["y"]				= getTeamSum(team,"starty")
	teamData[team]["validPlayers"]	= getNbPlacedPositions(team)
	teamData[team]["label"]			= getCardinal (teamData[team]["x"]/teamData[team]["validPlayers"],teamData[team]["y"]/teamData[team]["validPlayers"])
	teamData[team]["kills"]			= getTeamSum(team,"kills")
	teamData[team]["losses"]		= getTeamSum(team,"losses")
	teamData[team]["killedhp"]		= getTeamSum(team,"killedhp")
	teamData[team]["losthp"]		= getTeamSum(team,"losthp")
	teamData[team]["isAlive"]		= isTeamAlive(team)
	teamData[team]["leader"]		= playerData[player1]["leaderName"]
	--Echo("Finished setting team table for team", team)
end

function getPlayerTable(pID)
	--setPlayerTable(pID)
	return playerData[pID]
end

function getTeamSum(team,param)
	local tValue = 0
	for _,pID in ipairs (Spring_GetTeamList(team)) do
		if playerData[pID] == nil then
			--Echo("Ecostats:getTeamSum returned nil for (T/P):",team,pID,param, playerData)
			--printTeams()
			return nil
		elseif playerData[pID][param] == nil then 
			--Echo("Ecostats:getTeamSum returned nil for (T/P):",team,pID,param,playerData[pID].leaderName)
			--printTeams()
			return nil
		end
		tValue = tValue + playerData[pID][param]
	end
	return tValue
end

function getTeamAvg(team,param)
	local tValue = 0
	local nbPlayers = 0
	--local leaderID,leaderName,active,spectator,isDead

	for _,pID in ipairs (Spring_GetTeamList(team)) do
		-- leadername = playerData[pID].leaderName
		-- leaderID = playerData[pID].leaderID
		-- active = playerData[pID].active
		-- spectator = playerData[pID].spectator
		-- isDead = playerData[pID].isDead

		if param == nil then
			debugInfo()
			Echo("loop:",team,pID,param,leadername,active,spectator,isDead)
		end
		if gamestarted and playerData[pID].unitCount > 0 then
			nbPlayers = nbPlayers + 1
			tValue = tValue + playerData[pID][param]
		end
	end
	if nbPlayers == 0 then
		--Echo("Inf:",team,param,name,tValue)
		return getTeamSum(team, param)
	end
	return tValue/nbPlayers
end

function getTeamStarts(team)
	
	local x, y, active, leaderID, leaderName, isDead
	local validPlayers = 0
	
	for _,pID in ipairs (Spring_GetTeamList(team)) do
		leaderID = playerData[pID].leaderID
		x = playerData[pID].startx
		y = playerData[pID].starty
		active = playerData[pID].active
		--_,leaderID,isDead			= Spring_GetTeamInfo(pID)
		leaderName,active,spectator	= Spring_GetPlayerInfo(leaderID)				
		isDead = playerData[pID].isDead
		if leaderName and startx then
			if active and startx >= 0 and starty >= 0 or isDead then
				validPlayers = validPlayers +1
				x = x + x
				y = y + y
			end
		end
	end
	if not validPlayers == 0 then
		return math.floor(x/validPlayers), math.floor(y/validPlayers)
	else
		return nil
	end
end

function isTeamReal(teamID)
	if teamID == nil then return false end
	local leaderID, spectator, isDead, unitCount
	for _,pID in ipairs (Spring_GetTeamList(teamID)) do
		_,leaderID,isDead			= Spring_GetTeamInfo(pID)
		unitCount					= Spring_GetTeamUnitCount(pID)
		leaderName,active,spectator	= Spring_GetPlayerInfo(leaderID)
		if leaderName ~= nil or isDead or unitCount > 0 then return true end
	end
	return false
end

function isTeamAlive(teamID)
	if teamID == nil then return false end
	for _,pID in ipairs (Spring_GetTeamList(teamID)) do
		if 	not playerData[pID]["isDead"] then return true end
	end
	return false
end

function getNbTeams()
	local nbTeams = 0
	local teamlist = Spring_GetAllyTeamList()
	for _,team in ipairs (teamlist) do
		if isTeamReal(team) then nbTeams = nbTeams + 1 end
	end
	return nbTeams
end

function getNbPlayers(teamID)
	local nbPlayers = #(Spring_GetTeamList(teamID))
	return nbPlayers
end
	
function getMaxPlayers()
	local maxPlayers = 0
	local myNum
	for _,team in ipairs(Spring_GetAllyTeamList()) do
		myNum = getNbPlayers(team)
		if myNum > maxPlayers then maxPlayers = myNum end
	end
	return maxPlayers
end

function getMinPlayers()
	local minPlayers = nil
	local myNum
	for _,team in ipairs(Spring_GetAllyTeamList()) do
		myNum = getNbPlayers(team)
		if myNum > 0 then
			if not minPlayers then 
				minPlayers = myNum
			else
				if myNum < minPlayers then minPlayers = myNum end
			end
		end
	end
	return minPlayers
end

function getNbActivePlayers(teamID)
	local nbPlayers = 0
	local leaderID,active,spectator,isDead, leaderName

	for _,pID in ipairs (Spring_GetTeamList(teamID)) do
		leaderID = playerData[pID].leaderID
		leaderName = playerData[pID].leaderName
		active = playerData[pID].active
		spectator = playerData[pID].spectator
		isDead = playerData[pID].isDead
		if not (spectator or isDead or leaderID == -1) and active then
			nbPlayers = nbPlayers +1
			--Echo("getNbPlayers",teamID,pID,spectator, isDead, leaderID,nbPlayers, leaderName)
		end
	end
	return nbPlayers
end

function getNbPlacedPositions(teamID)
	local nbPlayers = 0
	local startx, starty, active, leaderID, unitCount, leaderName, isDead
	
	for _,pID in ipairs (Spring_GetTeamList(teamID)) do
		if playerData[pID] == nil then
			Echo("getNbPlacedPositions returned nil:",teamID)
			return nil
		end
		leaderID = playerData[pID].leaderID
		if leaderID == nil then
			Echo("getNbPlacedPositions returned nil:",teamID)
			return nil
		end
		startx = playerData[pID].startx
		starty = playerData[pID].starty
		active = playerData[pID].active
		--_,leaderID,isDead			= Spring_GetTeamInfo(pID)
		--unitCount					= Spring_GetTeamUnitCount(pID)
		leaderName,active,spectator	= Spring_GetPlayerInfo(leaderID)				
		
		isDead = playerData[pID].isDead
		if (active and startx >= 0 and starty >= 0 and leaderName ~= nil)  or isDead then
			nbPlayers = nbPlayers +1
		end
	end
	return nbPlayers
end

function checkCommander(pID)
	local hasCom = false
	for _, commanderID in ipairs (comTable) do
		if Spring.GetTeamUnitDefCount(pID,commanderID) > 0 then hasCom = true end
	end
	return hasCom
end

function setPlayerFP(pID)
	local pFP = 0
	local pFPMob = 0
	local unitList = Spring.GetTeamUnits(pID)
	if unitList == nil then
		Echo("setPlayerFP: unitlist is nil for player:", pID)
		return nil
	end
	local team = playerData[pID].teamID
	for _, unitID in ipairs(unitList) do
		if unitID == nil or UnitDefs[Spring.GetUnitDefID(unitID)] == nil then
			Echo("setPlayerFP: unitID is nil for player:", pID, unitID, Spring.GetUnitDefID(unitID))
			return nil
		end
		if #(UnitDefs[Spring.GetUnitDefID(unitID)].weapons) > 0 and isUnitComplete(unitID) then
			pFP = pFP + Spring.GetUnitHealth(unitID)
			if UnitDefs[Spring.GetUnitDefID(unitID)].canMove then
				pFPMob = pFPMob + Spring.GetUnitHealth(unitID)
			end
		end
	end
	playerData[pID]["firepower"]			= pFP
	playerData[pID]["firepowerMob"]			= pFPMob
	teamData[team]["tFP"]					= getTeamSum(team,"firepower")
	teamData[team]["tFPM"]					= getTeamSum(team,"firepowerMob")
end

function setPlayerBP(pID)
	local pBP = 0
	local pBPair = 0
	local unitList = Spring.GetTeamUnits(pID)
	if unitList == nil then
		Echo("setPlayerBP: returned nil for player:", pID)
		return nil
	end
	local team = playerData[pID].teamID
	for _, unitID in ipairs(unitList) do			
		if unitID == nil or UnitDefs[Spring.GetUnitDefID(unitID)] == nil then
			Echo("setPlayerBP: unitID is nil for player:", pID, unitID, Spring.GetUnitDefID(unitID))
			return nil
		end
		if (UnitDefs[Spring.GetUnitDefID(unitID)].isBuilder) and isUnitComplete(unitID) then
			pBP = pBP + UnitDefs[Spring.GetUnitDefID(unitID)].buildSpeed
			if UnitDefs[Spring.GetUnitDefID(unitID)].canFly then
				pBPair = pBPair + UnitDefs[Spring.GetUnitDefID(unitID)].buildSpeed
			end
		end
	end
	playerData[pID]["buildpower"]			= pBP
	playerData[pID]["buildpowerAir"]		= pBPair
	teamData[team]["tBP"]					= getTeamSum(team,"buildpower")
	teamData[team]["tBPA"]					= getTeamSum(team,"buildpowerAir")
end

function setPlayerResources()
	local minc, einc
	for _,pID in ipairs(Spring_GetTeamList()) do
		_,_,_,minc,_,_,_,_ 				= Spring_GetTeamResources(pID,"metal")
		_,_,_,einc,_,_,_,_ 				= Spring_GetTeamResources(pID,"energy")
		playerData[pID]["minc"]			= minc
		playerData[pID]["einc"] 		= einc
	end
	
	for _,team in ipairs(Spring_GetAllyTeamList()) do
		if inSpecMode then
			teamData[team]["tE"] 	= getTeamSum(team,"einc")
			teamData[team]["tM"] 	= getTeamSum(team,"minc")
		else
			if team == Spring.GetMyAllyTeamID() then 
				teamData[team]["tE"] 	= getTeamSum(team,"einc")
				teamData[team]["tM"] 	= getTeamSum(team,"minc")
			end
		end
	end
end

function setPlayerActivestate()
	local active
	local leaderID
	for _,pID in ipairs(Spring_GetTeamList()) do
		_,leaderID 	= Spring_GetTeamInfo(pID)
		_,active	= Spring_GetPlayerInfo(leaderID)
		playerData[pID]["active"] 		= active
	end
end

function getCardinal(x,y)
	if not x or not y then return nil end
	local xMax = Game.mapSizeX
	local yMax = Game.mapSizeZ
	local cardinal
	local d = 0.3
	if x < 0 and y < 0 then
		cardinal = ".."
	elseif x/xMax < d and y/yMax < d then
		cardinal = "NW"
	elseif x/xMax < 1-d and y/yMax < d then
		cardinal = "N"
	elseif x/xMax >= 1-d and y/yMax < d then
		cardinal = "NE"
	elseif x/xMax < d and y/yMax < 1-d then
		cardinal = "W"
	elseif x/xMax < d and y/yMax >= 1-d then
		cardinal = "SW"
	elseif x/xMax < 1-d and y/yMax >= 1-d then
		cardinal = "S"
	elseif x/xMax >= 1-d and y/yMax >= 1-d then
		cardinal = "SE"
	elseif x/xMax >= 1-d and y/yMax < 1-d then
		cardinal = "E"
	else
		cardinal = "C"
	end
	--Echo(math.floor(100*x/xMax),math.floor(100*y/yMax),cardinal)
	return cardinal
end

function isUnitComplete(UnitID)
	local health,maxHealth,paralyzeDamage,captureProgress,buildProgress=Spring.GetUnitHealth(UnitID)
	if buildProgress and buildProgress>=1 then
		return true
	else
		return false
	end
end

---------------------------------------------------------------------------------------------------
--  User interface
---------------------------------------------------------------------------------------------------
function IsOnButton(x, y, BLcornerX, BLcornerY,TRcornerX,TRcornerY)
	if BLcornerX == nil then return false end
	-- check if the mouse is in a rectangle

	return x >= BLcornerX and x <= TRcornerX
	                      and y >= BLcornerY
	                      and y <= TRcornerY

end

function defineButtonCoords(teamID)
	
	local w1 = 14
	local x1, y1, x2, y2
	local nbPlayers = getNbPlayers(teamID)
	local maxPlayers = getMaxPlayers()
	local lm = 20
	local w = 180 + cW*nbPlayers
	
	--Echo("defineButtonCoords "..teamID..":",nbPlayers,maxPlayers, w,InfotablePosX,InfotablePosY)
	
	if right then
		x1 	= widgetPosX - w1
	else
		x1	= widgetPosX + widgetWidth - 1
	end
	
	iPosX[teamID] = InfotablePosX
	iPosY[teamID] = InfotablePosY
	
	if iPosX[teamID] < 0 then iPosX[teamID] = 0 end
	if iPosX[teamID] + w > vsx then iPosX[teamID] = vsx - w end
	if iPosY[teamID] - infoTableHeight < 0 then iPosY[teamID] = infoTableHeight end
	if iPosY[teamID]  > vsy then iPosY[teamID] = vsy  end
	
	x2 = x1 + w1
	y1 = widgetPosY + widgetHeight - teamID*tH - w1 - 2
	y2 = y1 + w1
	
	expandButtonPos[teamID]["x1"] 		= x1
	expandButtonPos[teamID]["y1"] 		= y1
	expandButtonPos[teamID]["x2"] 		= x2
	expandButtonPos[teamID]["y2"] 		= y2

	local x3, y3, x4, y4
	local w2 = 25

	if right then
		x3 = widgetPosX - w2
	else
		x3 = widgetPosX + widgetWidth
	end
	y3 = widgetPosY + widgetHeight - teamID*tH - w2 - 2
	x4 = x3 + w2
	y4 = y3 + w2

	collapseButtonPos[teamID]["x1"] 	= x3
	collapseButtonPos[teamID]["y1"] 	= y3
	collapseButtonPos[teamID]["x2"] 	= x4
	collapseButtonPos[teamID]["y2"] 	= y4
	
	local x5, y5, x6, y6
	
	x5 	= iPosX[teamID] + lm
	x6 	= iPosX[teamID] + lm + 20
	y6 	= iPosY[teamID] - 25
	y5 	= y6 - 20
	
	expandMove[teamID]["x1"] 		= x5
	expandMove[teamID]["y1"] 		= y5
	expandMove[teamID]["x2"] 		= x6
	expandMove[teamID]["y2"] 		= y6
	
	local x7,x8,x9,x10,y7,y8,y9,y10
	
	x7 = iPosX[teamID] + w/2 - 60
	x8 = x7 + 12 
	y8 = iPosY[teamID] - 25
	y7 = y8 - 18
	
	x9 = iPosX[teamID] + w/2 + 38
	x10 = x9 + 12
	y10 = iPosY[teamID] - 25
	y9 = y10 - 18
	
	Teambutton["Prev"][teamID]["x1"] = x7
	Teambutton["Prev"][teamID]["x2"] = x8
	Teambutton["Next"][teamID]["x1"] = x9
	Teambutton["Next"][teamID]["x2"] = x10
	Teambutton["Prev"][teamID]["y1"] = y7
	Teambutton["Prev"][teamID]["y2"] = y8
	Teambutton["Next"][teamID]["y1"] = y9
	Teambutton["Next"][teamID]["y2"] = y10	
end

---------------------------------------------------------------------------------------------------
--  Debuggging related
---------------------------------------------------------------------------------------------------
function debugInfo()
	Echo("Debugging info:______________________________________________________")
	Echo("Printing player tables")
	printPlayers()
	--Echo("Printing button tables")

	--printButtonTables()
	Echo("Printing team tables")
	printTeams()
	Echo("Printing defined variable list")
	for _,pID in ipairs (Spring_GetTeamList()) do
		printPlayerVar(pID,"startx")
		printPlayerVar(pID,"leaderName")
		printPlayerVar(pID,"teamID")
	end
	Echo("End of debugging info:_______________________________________________________")
end

function printTeamTable()
	Echo("------------------")
	--local teamList = Spring_GetAllyTeamList()
	--local teams =Spring_GetTeamList()
	--for i,team in ipairs (teamList) do
		--Echo("Team",team)
		UpdateAllPlayers()
		for _,ply in ipairs (Spring_GetTeamList()) do
			local playerstats = getPlayerTable(ply)
			Echo("Team ",playerstats.teamID," is: Player ",ply," = ",playerstats.playerID," = ",playerstats.leaderName)
		end
		for i,pID in pairs (playerData) do
				Echo("Table 1: index, PID=playerID:",i,pID,pID.playerID)
				Echo("--------- Loop 2...")
				for name, param in pairs(pID) do
				Echo("Table 2: Team ", pID.teamID," Player ", pID.playerID,": ",name,param)
				end
		end
	--end
end

function printTeams()
	local teamList = Spring_GetAllyTeamList()
	--UpdateTeams()
	for _,team in ipairs (teamList) do
		for name, param in pairs (teamData[team]) do
			Echo("Teamdata:",team, name, param)
		end
	end
	
end

function printPlayers()
	for _,p in ipairs (Spring_GetTeamList()) do
		--UpdatePlayer(p)
		for name, param in pairs (playerData[p]) do
			Echo("Playerdata:",p, name, param)
		end
	end
end

function CompareTables()
	--UpdateAllPlayers()
	--UpdateTeams()
	for _,team in ipairs (Spring_GetAllyTeamList()) do
		Echo("Team tables:________________________________")
		for name, param in pairs (teamData[team]) do
			Echo("Table 4: Team ", team,name,param)
		end
		Echo("________________________________end of team table")
		--
		for _,player in ipairs (Spring_GetTeamList(team)) do
		Echo("--------------------------------------------")
		Echo("Table 3: Team ", team, "= ",playerData[player].teamID,", Player ",player," = ", playerData[player].playerID)
		Echo("--------------------------------------------")
		for name, param in pairs (playerData[player]) do
			Echo("Table 3: Team ", team, ", Player ",playerData[player].leaderName,name,param)
		end
		--Echo("Boxdata...")
		--Echo("Expand table:")
		--Echo(expandButtonPos[team]["x1"])
		--Echo(expandButtonPos[team]["y1"])
		--Echo(expandButtonPos[team]["x2"])
		--Echo(expandButtonPos[team]["y2"])
		--Echo("Collapse table:")
		--Echo(collapseButtonPos[team]["x1"])
		--Echo(collapseButtonPos[team]["y1"])
		--Echo(collapseButtonPos[team]["x2"])
		--Echo(collapseButtonPos[team]["y2"])
		-- Echo("--------------------------------------------")
		-- Echo("---------New Player-------------------------")
		-- Echo("--------------------------------------------")
		end
	end
end

function printButtonTables()
	local plist = Spring_GetTeamList()
	for _,p in ipairs (plist) do
		Echo("Player buttons:")
		if not playerButton[p] == nil then
			Echo(playerButton[p]["x1"])
			Echo(playerButton[p]["y1"])
			Echo(playerButton[p]["x2"])
			Echo(playerButton[p]["y2"])
			Echo(playerButton[p]["pID"])
		else
			Echo("nil for player: ",p, playerButton)
		end
		Echo("________________")
	end
	
	-- local teamlist = Spring_GetAllyTeamList()
	-- for i,team in ipairs (teamlist) do
		-- Echo("Expand table:")
		-- Echo(expandButtonPos[team]["x1"])
		-- Echo(expandButtonPos[team]["y1"])
		-- Echo(expandButtonPos[team]["x2"])
		-- Echo(expandButtonPos[team]["y2"])
		-- Echo("Collapse table:")
		-- Echo(collapseButtonPos[team]["x1"])
		-- Echo(collapseButtonPos[team]["y1"])
		-- Echo(collapseButtonPos[team]["x2"])
		-- Echo(collapseButtonPos[team]["y2"])
	-- end
end

function printOptions()
	Echo ("Printing options")
	for _,name in pairs (options) do
		for u,v in pairs (name) do
			Echo("Option loaded:",u,v)
		end
	end
end

function printKMat()
	for playerid, playertable in pairs(kMat) do
		Echo("__________________")		
		Echo("Player " ..  playerid .. ": " .. (playerData[playerid]["leaderName"] or "N/A"))
		for sortindex, enemytable in pairs (playertable) do
			local enemy = enemytable[1]
			local kills = enemytable[2]
			Echo("Kills (p/e/hp):", playerid, sortindex, enemy, kills)
		end
	end
end

function printPlayerVar(pID,param)
	Echo("Print player, var:",pID,param,playerData[pID][param])
end

function widget:KeyPress(key, mods, isRepeat) -- used for getting debugging info quickly
	if (key == 0x07A) and (not isRepeat) then 				-- Z
		--printKMat()
		--printTeams()
		--printPlayers()
		--Echo("My team = " .. Spring.GetMyTeamID())
	elseif (key == 0x078) and (not isRepeat) then
		--printPlayers()		-- X
	elseif (key == 0x01B) and (not isRepeat) and (not mods.ctrl) and (not mods.shift) then --esc
		local teamlist = Spring_GetAllyTeamList()
		for _,team in ipairs (teamlist) do
			expandButtonState[team]["click"] = false
		end
	elseif (key == 0x132) and (not isRepeat) and (not mods.shift) then --ctrl
		--Echo("Ctrl down")
		ctrlDown = true
	end
	return false
end

function widget:KeyRelease(key)
	if (key == 0x132) then --ctrl
		--Echo("Ctrl up")
		ctrlDown = false
	end
	return false
end

---------------------------------------------------------------------------------------------------
--  Call-ins
---------------------------------------------------------------------------------------------------

function widget:PlayerChanged(playerID)
	local frame = Spring.GetGameFrame()
	lastPlayerChange = frame
	if not (Spring.GetSpectatingState() or Spring.IsReplay()) then
		if inSpecMode then Echo("Ecostats: widget now in active player mode.") end
		inSpecMode = false
		delayedUpdateTeams()
	else
		if not inSpecMode then Echo("Ecostats: widget now in spectator mode.") end
		inSpecMode = true
		Reinit()
	end	
end

function widget:UnitCreated(unitID, unitDefID, teamID, builderID)
	--if teamID ~= nil and isUnitComplete(unitID) then
		--Echo("Unit is created. Parameters:",unitID, unitDefID, teamID, builderID)
		--UpdatePlayer(teamID)
	--end
end

function widget:UnitFinished(unitID, unitDefID, teamID)
	team = playerData[teamID]["teamID"]
	if teamID ~= nil and isUnitComplete(unitID) then
		--Echo("Unit is finished. Parameters:",unitID, unitDefID, teamID)
		delayedUpdateTeam(team)
	end
end

function widget:UnitTaken(unitID, unitDefID, unitTeam, newTeam)
	local newteam = playerData[newTeam]["teamID"]
	local oldteam = playerData[unitTeam]["teamID"]
	if newTeam ~= nil then delayedUpdateTeam(newteam) end
	if oldTeam ~= nil then delayedUpdateTeam(oldteam) end
end

function widget:UnitGiven(unitID, unitDefID, unitTeam, oldTeam)
	local newteam = playerData[unitTeam]["teamID"]
	local oldteam = playerData[oldTeam]["teamID"]
	if newTeam ~= nil then delayedUpdateTeam(newteam) end
	if oldTeam ~= nil then delayedUpdateTeam(oldteam) end
end

function widget:UnitDestroyed(u,ud,ut,a,ad,at) --unitID, unitDefID, teamID, attackerID
	local uteam, ateam
	a = Spring.GetUnitLastAttacker(u)
	--Echo("Unit attacker",a)
	if a then at = Spring.GetUnitTeam(a) end
	if ut then
		uteam = playerData[ut]["teamID"]
		--Echo("Unit is destroyed!. Parameters:",ut,at)
		delayedUpdateTeam(uteam)
	end

	if at then
		ateam = playerData[at]["teamID"]
		--Echo("Unit is destroyed!. Parameters:",ut,at)
		delayedUpdateTeam(ateam)
	end

	local function sortByLargest(v1,v2)
		return v1[2] > v2[2]
	end
	
	local function sortByTeam(v1,v2)
		return v1[1] < v2[1]
	end
	
	if ut and at and (not Spring.AreTeamsAllied(ut,at)) and isUnitComplete(u) and u and a and u~=a then
		local _,uhp =  Spring.GetUnitHealth(u)
		--local playerlist = Spring_GetTeamList()
		killCounters[at]=killCounters[at]+1
		lossCounters[ut]=lossCounters[ut]+1
		killedHP[at] =  killedHP[at] + uhp
		lostHP[ut] = lostHP[ut] + uhp
		
		table.sort(kMat[at],sortByTeam)
		
		local sortindex = ut + 1
		
		kMat[at][sortindex][2] = kMat[at][sortindex][2] + uhp
		if kMat[at][sortindex][2] > PmaxDmg then PmaxDmg = kMat[at][sortindex][2] end
		
		table.sort(kMat[at],sortByLargest)
				
		if lossCounters[ut]>worstLosses then
			worstLosses = lossCounters[ut]
		end
		if killCounters[at]>bestKills then
			bestKills=killCounters[at]
			if at~=bestTeam then
				bestTeam=at
				if options["Announce"]["On"] then
					if soundsOn then Spring.PlaySoundFile(snd) end
					Spring.SendMessage(friendlyName(bestTeam) .. " has taken the lead with " .. bestKills .. " kills.")
				end
			end
		end
	end
end

function widget:GameStart()
	gamestarted = true
	UpdateAllPlayers()
end

function widget:GameOver()
	gameover = true
	UpdateAllPlayers()
end

function widget:TeamDied(TeamID)
	local frame = Spring.GetGameFrame()
	lastPlayerChange = frame
	if not (Spring.GetSpectatingState() or Spring.IsReplay()) then
		if inSpecMode then Echo("Ecostats: widget now in active player mode.") end
		inSpecMode = false
		delayedUpdateTeams()
	else
		if not inSpecMode then Echo("Ecostats: widget now in spectator mode.") end
		inSpecMode = true
		Reinit()
	end	
end

function widget:MapDrawCmd(playerID, cmdType, px, py, pz, labeltext)
	if not gamestarted then UpdateTeams() end
end

function widget:GameFrame(frameNum)
	local delay = 3
	
	if frameNum%30 == 0 then 
		setPlayerResources() 
	end
	
	if frameNum - lastPlayerChange == 30 
		then UpdateTeams() 
		local teamlist = Spring_GetAllyTeamList()
			for _,team in ipairs (teamlist) do
			defineButtonCoords(team)
		end
	end
	
	if updateList["frame"] and #updateList["frame"] > 0 and frameNum > 0 then
		if frameNum > updateList["frame"][1] + delay then
			if updateList["team"][1] == 1000 then
				UpdateTeams()
				table.remove(updateList["frame"],1)
				table.remove(updateList["team"],1)
			elseif updateList["team"][1] == 2000 then
				local teamlist = Spring_GetAllyTeamList()
				for _,team in ipairs (teamlist) do
					defineButtonCoords(team)
				end
				table.remove(updateList["frame"],1)
				table.remove(updateList["team"],1)
			else
				UpdateTeam(updateList["team"][1])
				table.remove(updateList["frame"],1)
				table.remove(updateList["team"],1)
			end
		end
	end

	if not gamestarted and frameNum > 0 then gamestarted = true end
end

function widget:TweakMouseMove(x,y,dx,dy,button)
	if pressedToMove ~= nil then
		if moveStartX == nil then                                                      -- move widget on y axis
			moveStartX = x - widgetPosX
		end
		if moveStartY == nil then                                                      -- move widget on y axis
			moveStartY = y - widgetPosY
		end
		widgetPosX = widgetPosX + dx
		widgetPosY = widgetPosY + dy

		if widgetPosY <= 0 then
			widgetPosY = 0
			expandDown = false
		end
		if widgetPosY + widgetHeight >= vsy then
			widgetPosY = vsy - widgetHeight
			expandDown = true
		end
		if widgetPosX < 5 then
			widgetPosX = 5
			expandLeft = false
		end
		if widgetPosX + widgetWidth + 5 > vsx then
			widgetPosX = vsx - widgetWidth - 5
			expandLeft = true
		end
		widgetTop   = widgetPosY + widgetHeight
		widgetRight = widgetPosX + widgetWidth
		if widgetPosX + widgetWidth/2 > vsx/2 then
			right = true
		else
			right = false
		end
		
		for _,team in ipairs (Spring_GetAllyTeamList()) do
			defineButtonCoords(team)
		end
		--Echo("Tweak mm: right, eD, eL, x,y = ", right, expandDown, expandLeft,x,vsx,y,vsy)
	end
end

function widget:TweakMousePress(x, y, button)
	if button == 1 then
		local x0, x1
		
		if right then
			x0 = widgetPosX-200
		else
			x0 = widgetPosX
		end
		x1 = x0 + 200 + widgetWidth

		if IsOnButton(x, y, options["contrastLess"]["x1"],options["contrastLess"]["y1"],options["contrastLess"]["x2"],options["contrastLess"]["y2"]) then
			options["contrast"] = options["contrast"] - 0.1
			if options["contrast"] < 0 then options["contrast"] = 0 end
			Echo("Contrast = " .. formatRes1000(options["contrast"]))
			return true
		
		elseif IsOnButton(x, y, options["contrastMore"]["x1"],options["contrastMore"]["y1"],options["contrastMore"]["x2"],options["contrastMore"]["y2"]) then
			options["contrast"] = options["contrast"] + 0.1
			if options["contrast"] > 1.0 then options["contrast"] = 1.0 end
			Echo("Contrast = " .. formatRes1000(options["contrast"]))
			return true
		
		elseif IsOnButton(x, y, options["borders"]["x1"],options["borders"]["y1"],options["borders"]["x2"],options["borders"]["y2"]) then
			options["borders"]["On"] = not options["borders"]["On"]
			return true
		
		elseif IsOnButton(x, y, options["widthInc"]["x1"],options["widthInc"]["y1"],options["widthInc"]["x2"],options["widthInc"]["y2"]) then
			pressedWPlus = true
			widgetWidth = widgetWidth + 5
			if widgetWidth > 500 then widgetWidth = 500 end
			if widgetPosX + widgetWidth > vsx then widgetPosX = vsx - widgetWidth - 5 end
			return true
		
		elseif IsOnButton(x, y, options["widthDec"]["x1"],options["widthDec"]["y1"],options["widthDec"]["x2"],options["widthDec"]["y2"]) then
			pressedWMinus = true
			widgetWidth = widgetWidth - 5
			if widgetWidth < 25 then widgetWidth = 25 end
			return true		
		elseif IsOnButton(x, y, options["heightInc"]["x1"],options["heightInc"]["y1"],options["heightInc"]["x2"],options["heightInc"]["y2"]) then
			pressedHPlus = true
			tH = tH + 2
			if tH > 100 then tH = 100 end
			return true
		
		elseif IsOnButton(x, y, options["heightDec"]["x1"],options["heightDec"]["y1"],options["heightDec"]["x2"],options["heightDec"]["y2"]) then
			pressedHMinus = true
			tH = tH - 2
			if tH < 4 then tH = 4 end
			return true
		elseif IsOnButton(x, y, options["disable"]["x1"],options["disable"]["y1"],options["disable"]["x2"],options["disable"]["y2"]) then
			options["disable"]["On"] = not options["disable"]["On"]	
			return true
		elseif IsOnButton(x, y, options["Announce"]["x1"],options["Announce"]["y1"],options["Announce"]["x2"],options["Announce"]["y2"]) then
			options["Announce"]["On"] = not options["Announce"]["On"]	
			return true
		elseif IsOnButton(x, y, options["FPBar1"]["x1"],options["FPBar1"]["y1"],options["FPBar1"]["x2"],options["FPBar1"]["y2"]) then
			options["FPBar1"]["On"] = not options["FPBar1"]["On"]	
			return true	
		elseif IsOnButton(x, y, options["FPBar2"]["x1"],options["FPBar2"]["y1"],options["FPBar2"]["x2"],options["FPBar2"]["y2"]) then
			options["FPBar2"]["On"] = not options["FPBar2"]["On"]	
			return true
		elseif IsOnButton(x, y, options["BPBar1"]["x1"],options["BPBar1"]["y1"],options["BPBar1"]["x2"],options["BPBar1"]["y2"]) then
			options["BPBar1"]["On"] = not options["BPBar1"]["On"]	
			return true	
		elseif IsOnButton(x, y, options["BPBar2"]["x1"],options["BPBar2"]["y1"],options["BPBar2"]["x2"],options["BPBar2"]["y2"]) then
			options["BPBar2"]["On"] = not options["BPBar2"]["On"]	
			return true	
		elseif IsOnButton(x, y, options["kills1"]["x1"],options["kills1"]["y1"],options["kills1"]["x2"],options["kills1"]["y2"]) then
			options["kills1"]["On"] = not options["kills1"]["On"]	
			return true		
		elseif IsOnButton(x, y, options["kills2"]["x1"],options["kills2"]["y1"],options["kills2"]["x2"],options["kills2"]["y2"]) then
			options["kills2"]["On"] = not options["kills2"]["On"]	
			return true	
		elseif IsOnButton(x, y, options["removeDead"]["x1"],options["removeDead"]["y1"],options["removeDead"]["x2"],options["removeDead"]["y2"]) then
			options["removeDead"]["On"] = not options["removeDead"]["On"]	
			return true
		elseif IsOnButton(x, y, options["resText"]["x1"],options["resText"]["y1"],options["resText"]["x2"],options["resText"]["y2"]) then
			options["resText"]["On"] = not options["resText"]["On"]	
			return true
		elseif IsOnButton(x, y, widgetPosX, widgetPosY, widgetPosX + widgetWidth, widgetPosY + widgetHeight) or 
		IsOnButton(x, y, x0, widgetPosY - 300, x1, widgetPosY) 
		then		
			pressedToMove = true
			return true
		end -- end Button == 1
	else
		return false
	end
end

function widget:TweakMouseRelease(x,y,button)
	pressedToMove = nil                                              -- ends the share slider process
	pressedHPlus = false
	pressedHMinus = false
	pressedWPlus = false
	pressedWMinus = false
	
end

function widget:MouseMove(x, y, dx, dy, button)
	if pressedExpandMove then
		local nbPlayers = getMaxPlayers()
		for _,team in ipairs (Spring_GetAllyTeamList()) do
			if expandButtonState[team]["click"] then nbPlayers = getNbPlayers(team) end
		end
		
		local w = 180 + cW*nbPlayers
				
		-- if moveStartX == nil then                                                      -- move table on y axis
			-- moveStartX = x - InfotablePosX
		-- end
		-- if moveStartY == nil then                                                      -- move table on y axis
			-- moveStartY = y - InfotablePosY
		-- end
		
		InfotablePosX = InfotablePosX + dx
		InfotablePosY = InfotablePosY + dy
		
		if InfotablePosX < 0 then
			InfotablePosX = 0
		end
		
		if InfotablePosX + w  > vsx then
			InfotablePosX = vsx - w
		end
		for _,team in ipairs (Spring_GetAllyTeamList()) do
			defineButtonCoords(team)
		end
		--Echo("Moving:", InfotablePosX, InfotablePosY)
	end
	
	if pressedToMove then
		if moveStartX == nil then                                                      -- move widget on y axis
			moveStartX = x - widgetPosX
		end
		if moveStartY == nil then                                                      -- move widget on y axis
			moveStartY = y - widgetPosY
		end
		widgetPosX = widgetPosX + dx
		widgetPosY = widgetPosY + dy

		if widgetPosY <= 0 then
			widgetPosY = 0
			expandDown = false
		end
		if widgetPosY + widgetHeight >= vsy then
			widgetPosY = vsy - widgetHeight
			expandDown = true
		end
		if widgetPosX < 5 then
			widgetPosX = 5
			expandLeft = false
		end
		if widgetPosX + widgetWidth + 5 > vsx then
			widgetPosX = vsx - widgetWidth - 5
			expandLeft = true
		end
		widgetTop   = widgetPosY + widgetHeight
		widgetRight = widgetPosX + widgetWidth
		if widgetPosX + widgetWidth/2 > vsx/2 then
			right = true
		else
			right = false
		end
		
		for _,team in ipairs (Spring_GetAllyTeamList()) do
			defineButtonCoords(team)
		end
	end
	return false
end

function widget:MousePress(x, y, button)
	----------------
	-- LEFT BUTTON
	----------------
	if button == 1 then	
		local teamlist = Spring_GetAllyTeamList()
		local playerlist = Spring_GetTeamList()
		local x1, x2, y1, y2
		local x3, x4, y3, y4		
		local pressedExpand = false
		local nbPlayers
		local x7, y7, x8, y8, pID
		local x9, y9, x10, y10 
		local x11,x12,x13,x14,y11,y12,y13,y14
		
		for _,team in ipairs (teamlist) do
			x3 = collapseButtonPos[team]["x1"]
			y3 = collapseButtonPos[team]["y1"]
			x4 = collapseButtonPos[team]["x2"]
			y4 = collapseButtonPos[team]["y2"]
			x1 = expandButtonPos[team]["x1"]
			x2 = expandButtonPos[team]["x2"]
			y1 = expandButtonPos[team]["y1"]
			y2 = expandButtonPos[team]["y2"]
			nbPlayers = getNbPlayers(team)
								
			if expandButtonState[team]["click"] then
				if IsOnButton(x, y, x3, y3, x4, y4) then -- or IsOnButton(x, y, x5, y5, x6, y6) then
					collapseButtonState[team]["click"] = true
					expandButtonState[team]["click"] = false
					return false
				end
			end
			if IsOnButton(x, y, x1, y1, x2, y2) and (not options["removeDead"]["On"] or teamData[team]["isAlive"]) then pressedExpand = true end
		
			x9 = expandMove[team]["x1"]
			x10 = expandMove[team]["x2"]
			y9 = expandMove[team]["y1"]
			y10 = expandMove[team]["y2"]
			if IsOnButton(x, y, x9, y9, x10, y10) then 	
				pressedExpandMove = true 	
				return true
			end
			
			x11 = Teambutton["Prev"][team]["x1"]
			x12 = Teambutton["Prev"][team]["x2"]
			y11 = Teambutton["Prev"][team]["y1"]
			y12 = Teambutton["Prev"][team]["y2"]
			if IsOnButton(x, y, x11, y11, x12, y12) and inSpecMode then
				if expandButtonState[team]["click"] and team > 0 then
					expandButtonState[team]["click"] = false
					collapseButtonState[team]["click"] = true
					expandButtonState[team-1]["click"] = true
					collapseButtonState[team-1]["click"] = false
					return true
				end
			end
		
			x13 = Teambutton["Next"][team]["x1"]
			x14 = Teambutton["Next"][team]["x2"]
			y13 = Teambutton["Next"][team]["y1"]
			y14 = Teambutton["Next"][team]["y2"]
			if IsOnButton(x, y, x13, y13, x14, y14) and inSpecMode  then
				if expandButtonState[team]["click"] and team <  getNbTeams() - 1  then
					expandButtonState[team]["click"] = false
					collapseButtonState[team]["click"] = true
					expandButtonState[team+1]["click"] = true
					collapseButtonState[team+1]["click"] = false
					return true
				end
			end
			
		end
		
		for _,player in ipairs (playerlist) do
			if not playerData[player].isDead then
				local team = playerData[player].teamID
				--Echo("Buttonpress:",team,player,isTeamReal(team))
				if isTeamReal(team) and (team == Spring.GetMyAllyTeamID() or inSpecMode)then			
					x7 = playerButton[player]["x1"]
					x8 = playerButton[player]["x2"]
					y7 = playerButton[player]["y1"]
					y8 = playerButton[player]["y2"]
					pID = playerButton[player]["pID"]
					if IsOnButton(x, y, x7, y7, x8, y8) then
						if ctrlDown and playerData[player].hasCom then
							local com
							for _, commanderID in ipairs (comTable) do
								com  = Spring.GetTeamUnitsByDefs(pID,commanderID)[1] or com
							end
							--Echo(com)
							if com then
								--Echo("Still com")
								local cx, cy, cz
								local camState = Spring.GetCameraState()
								cx, cy, cz = Spring.GetUnitPosition(com)
								--Echo(camState.height)
								--if cx then Spring.SetCameraTarget(cx,cy,cz) end
								if camState and cx then
									camState["px"] = cx
									camState["py"] = cy
									camState["pz"] = cz
									camState["height"] = 800
									Spring.SetCameraState(camState,2)
									if inSpecMode then Spring.SelectUnitArray({com}) end
								end
							end
						elseif not ctrlDown then
							local sx = playerData[pID].startx
							local sz = playerData[pID].starty
							local sy = Spring.GetGroundHeight(sx,sz)
							local camState = Spring.GetCameraState()
							if camState and sx then
								camState["px"] = sx
								camState["py"] = sy
								camState["pz"] = sz
								camState["height"] = 5000
								Spring.SetCameraState(camState,2)
							end
							--Echo("On button #2: ",x,y)
						end
					end
				end
			end
		end
		
		if pressedExpand then
			for _,team in ipairs (teamlist) do
				x1 = expandButtonPos[team]["x1"]
				x2 = expandButtonPos[team]["x2"]
				y1 = expandButtonPos[team]["y1"]
				y2 = expandButtonPos[team]["y2"]
				expandButtonState[team]["click"] = IsOnButton(x, y, x1, y1, x2, y2)
			end
		end
		return false
	----------------
	-- RIGHT BUTTON
	----------------
	elseif button == 2 then
		if IsOnButton(x,y,widgetPosX,widgetPosY,widgetPosX+widgetWidth,widgetPosY+widgetHeight) then
			pressedToMove = true
			return true
		end
	elseif button == 3 then
		
		local x5, y5, x6, y6
		local teamlist = Spring_GetAllyTeamList()
		local w
		
		for _,team in ipairs (teamlist) do
		
			nbPlayers = getNbPlayers(team)
			w = 180 + cW*nbPlayers
			
			x5 = iPosX[team]
			x6 = x5 + w
			y6 = iPosY[team]
			y5 = y6 - infoTableHeight
			
			if expandButtonState[team]["click"] then
				if IsOnButton(x, y, x5, y5, x6, y6) then
					collapseButtonState[team]["click"] = true
					expandButtonState[team]["click"] = false
				end
			end
		end
		
		return false
	else
		return false
	end
end

function widget:MouseRelease(x,y,button)
	if button == 1 then 
		pressedExpandMove = false 
	elseif button == 2 then
		pressedToMove = nil                                              -- ends move action
	end
end

function widget:IsAbove(x, y)
	local teamlist = Spring_GetAllyTeamList()
	local playerlist = Spring_GetTeamList()
	local x1, x2, y1, y2
	local x3, x4, y3, y4
	local x5, x6, y5, y6
	local x7, x8, y7, y8
	local x9, x10, y9, y10
	local x11, x12, y11, y12
	
	for _,team in ipairs (teamlist) do
		x1 = expandButtonPos[team]["x1"]
		x2 = expandButtonPos[team]["x2"]
		y1 = expandButtonPos[team]["y1"]
		y2 = expandButtonPos[team]["y2"]
		expandButtonState[team]["mouse"] = IsOnButton(x, y, x1, y1, x2, y2)

		x7 = expandMove[team]["x1"]
		x8 = expandMove[team]["x2"]	
		y7 = expandMove[team]["y1"]	
		y8 = expandMove[team]["y2"]	
		expandMove[team]["mouseover"] = IsOnButton(x, y, x7, y7, x8, y8)
		
		x9 = Teambutton["Prev"][team]["x1"]
		x10 = Teambutton["Prev"][team]["x2"]
		y9 = Teambutton["Prev"][team]["y1"]
		y10 = Teambutton["Prev"][team]["y2"]
		
		Teambutton["Prev"][team]["mouse"] = IsOnButton(x, y, x9, y9, x10, y10)
		
		x11 = Teambutton["Next"][team]["x1"]
		x12 = Teambutton["Next"][team]["x2"]
		y11 = Teambutton["Next"][team]["y1"]
		y12 = Teambutton["Next"][team]["y2"]
		Teambutton["Next"][team]["mouse"] = IsOnButton(x, y, x11, y11, x12, y12)
		
		x3 = collapseButtonPos[team]["x1"]
		y3 = collapseButtonPos[team]["y1"]
		x4 = collapseButtonPos[team]["x2"]
		y4 = collapseButtonPos[team]["y2"]
		
		collapseButtonState[team]["mouse"] = IsOnButton(x, y, x3, y3, x4, y4)
	end
		
	for _,player in ipairs (playerlist) do
		x5 = playerButton[player]["x1"]
		x6 = playerButton[player]["x2"]
		y5 = playerButton[player]["y1"]
		y6 = playerButton[player]["y2"]
		
		playerButton[player]["mouse"] = IsOnButton(x, y, x5, y5, x6, y6)
	end
	
	return false
end

---------------------------------------------------------------------------------------------------
--  Draw
---------------------------------------------------------------------------------------------------

function widget:TweakDrawScreen()
	fontHandler.UseFont(font)
	DrawOptionRibbon()
end

function widget:DrawScreen()

	if Spring.IsGUIHidden() then return	end
	if not inSpecMode and options["disable"]["On"] then return end
	
	local vOffset                 = 0         -- position of the next object to draw
	local mouseX,mouseY           = Spring.GetMouseState()
	local teamlist = Spring_GetAllyTeamList()
	
	local nbTeams = getNbTeams()
	local t = Spring_GetGameSeconds()
	if t > 0 then startanimation = true end
	if t > 5 then 
		startanimation = false 
		if t < 6 then 
			Reinit()
			if not inSpecMode then
				widgetWidth = 60+50*(6-t)
				if right then 
					widgetPosX  = widgetRight - widgetWidth
				end
			end
		end
	end
	
	if inSpecMode then
		widgetHeight = nbTeams*tH+2
	else
		widgetHeight = tH+2
	end
	fontHandler.UseFont(font)

	local maxMetal = 0
	local maxEnergy = 0
	local maxFP = 0
	local maxBP = 0
	local maxHP = 0
	local splits
		
	for i,team in ipairs (teamlist) do
		if isTeamReal(team) and (team == Spring.GetMyAllyTeamID() or inSpecMode) then
			local label
			local isAlive
			local hasCom
			--Echo("Beginning drawing for team:",team)
			if (not options["removeDead"]["On"]) or teamData[team]["isAlive"] then
				--Echo("Leakcheck:",i,team,options["removeDead"]["On"],teamData[team]["isAlive"], teamData[team]["leader"])
				DrawLabel(teamData[team]["label"],i*tH)
				DrawBackground(i*tH)
			end
			if not gamestarted then defineButtonCoords(team) end
			if not expandButtonState[team]["click"] then
				DrawExpandButton(team, expandButtonState[team]["mouse"],right)
			else
				DrawExpandTable(team)
				if expandButtonState[team]["click"] then DrawCollapseButton(team, right) end
			end

			for j,ply in ipairs (Spring_GetTeamList(team)) do
				local r = getPlayerTable(ply).red
				local g = getPlayerTable(ply).green
				local b = getPlayerTable(ply).blue
				if r == nil then
					nilCount = nilCount + 1
					--if nilCount < 5 then Echo("Ecostats: r,g,b = nil for:",team,ply,playerData[ply].leaderName,inSpecMode) end
					if nilCount > 100 then
						Echo("Ecostats/DrawScreen: detected 100 errors, reinitialising...")
						Init()
					end
					return
				end
				local alpha
				local side = getPlayerTable(ply).side
				local sideImg
				if side == "arm" then
					sideImg = armImage
				elseif side == "core" then
					sideImg = coreImage
				else
					sideImg = defImage
				end
				isAlive = not getPlayerTable(ply).isDead
				if isAlive then teamData[team]["isAlive"] = true end
				hasCom = getPlayerTable(ply).hasCom
				
				if Spring_GetGameSeconds() > 0 then
					if isAlive then
						if getPlayerTable(ply).active then
							alpha = 1
						else
							alpha = 0.3
						end						
						playerButton[ply]["x1"] = widgetPosX + WBadge*(j-1) + 25 + (WBadge-14)*4 
						playerButton[ply]["x2"] = widgetPosX + WBadge*(j-1) + 25 + (WBadge-14)*4 + WBadge
						playerButton[ply]["y1"] = widgetPosY + widgetHeight - tH*i + tH - 16 - (WBadge-14)
						playerButton[ply]["y2"] = widgetPosY + widgetHeight - tH*i + tH - 16 - (WBadge-14) + WBadge
						playerButton[ply]["pID"] = ply
						if not inSpecMode then 
							playerButton[ply]["x1"] = playerButton[ply]["x1"] - 10
							playerButton[ply]["x2"] = playerButton[ply]["x2"] - 10
						end
						if hasCom then
							DrawSideImage(sideImg,WBadge*(j-1),tH*i, r, g, b,alpha,false,playerButton[ply]["mouse"],t)--big icon	
						else
							DrawSideImage(sideImg,WBadge*(j-1),tH*i, r, g, b,alpha,true,playerButton[ply]["mouse"],t) --small icon
						end
					end
				else
					--DrawSideImage(defImage,WBadge*(j-1),tH*i, r, g, b,0.8,false,playerButton[ply]["mouse"],0)--big icon	
					DrawBox( WBadge*(j-1), tH*i, r, g, b)
				end
			end
			if teamData[team]["tM"] > maxMetal then
				maxMetal = teamData[team]["tM"]
			end
			if teamData[team]["tE"] > maxEnergy then
				maxEnergy = teamData[team]["tE"]
			end
			if teamData[team]["tFP"] > maxFP then
				maxFP = teamData[team]["tFP"]
			end
			if teamData[team]["tBP"] > maxBP then
				maxBP = teamData[team]["tBP"]
			end
			if teamData[team]["killedhp"] > maxHP then
				maxHP = teamData[team]["killedhp"]
			end
			if teamData[team]["losthp"] > maxHP then
				maxHP = teamData[team]["losthp"]
			end
		end
	end

	splits = math.floor(0.001*maxHP/widgetWidth)
	
	for i, team in ipairs (teamlist) do
		if isTeamReal(team) and (team == Spring.GetMyAllyTeamID() or inSpecMode)then
			if teamData[team]["isAlive"] and t > 5 and gamestarted and not gameover then
				if inSpecMode then DrawEBar(teamData[team]["tE"]/maxEnergy,i*tH) end
				if inSpecMode and team ~= 0 and teamData[0]["isAlive"] and t > 5 and gamestarted and not gameover then DrawEBar(teamData[0]["tE"]/maxEnergy,tH) end 	--ugly fix to weird problem
				--if i == 4 then DrawEBar(teamData[0]["tE"]/maxEnergy,3*tH) end
				--Echo(teamData[0]["tE"],maxEnergy,teamData[0]["tE"]/maxEnergy)
				DrawEText(teamData[team]["tE"],i*tH)
				DrawKillDeathText(teamData[team]["kills"],teamData[team]["losses"],i*tH)
				DrawKillBar(teamData[team]["killedhp"],i*tH,splits)
				DrawLossesBar(teamData[team]["losthp"],i*tH,splits)
			elseif gamestarted and t > 5 then -- team died or gameover
				--if not options["removeDead"]["On"] then
					--DrawLabelCM("Kills: "..teamData[team]["kills"],i*tH)
					--DrawLabelCM2("Losses: "..teamData[team]["losses"],i*tH)
				--end
			else
				if gamestarted and t < 5 then
					DrawLabelCT("(Go!)", i*tH,t)
				elseif not gamestarted then
					setPlayerActivestate()
					local nbPlayers = getNbPlayers(team)
					local nbActive = getNbActivePlayers(team)
					local nbPlaced = getNbPlacedPositions(team)
					if nbActive > 0 then
						if nbPlayers > 1 and nbPlaced > 0 then
							DrawLabelCM("(On their marks)", i*tH)
							DrawLabelCM2("   "..nbPlaced.."/"..nbPlayers, i*tH)
						elseif nbPlayers > 1 then
							DrawLabelC("(Warming up)", i*tH)
						elseif nbPlayers == 1 then
							if nbPlaced == 1 then
								DrawLabelCM("(On his marks)", i*tH)
							else
								DrawLabelC("(Warming up)", i*tH)
							end
						end
					else
						DrawLabelC("(No one here)", i*tH)
					end
				end
			end
			if teamData[team]["isAlive"] and t > 5 and not gameover then
				if inSpecMode then DrawMBar(teamData[team]["tM"]/maxMetal,i*tH) end
				DrawMText(teamData[team]["tM"],i*tH)
			end
			if teamData[team]["tFP"] > 0 and not gameover then
				DrawFPBar(teamData[team]["tFP"]/maxFP,i*tH,teamData[team]["tFPM"]/teamData[team]["tFP"])
			end
			if teamData[team]["tBP"] > 0 and not gameover then
				DrawBPBar(teamData[team]["tBP"]/maxBP,i*tH,teamData[team]["tBPA"]/teamData[team]["tBP"])
			end
		end
	end
	
end

function formatRes(number)
	local label
	if number > 10000 then
		label = math.floor(round(number/1000)).."k"
	elseif number > 1000 then
		label = string.sub(round(number/1000,1),1,2+string.find(round(number/1000,1),".")).."k"
	elseif number > 10 then
		label = string.sub(round(number,0),1,3+string.find(round(number,0),"."))
	else
		label = string.sub(round(number,1),1,2+string.find(round(number,1),"."))
	end
	return label
end

function formatRes1000(number)
	local label
	if number == nil then
		Echo("formatRes1000 returned nil")
		return nil
	end
	if number > 10000 then
		label = digitsep(round(number))
	elseif number > 1000 then
		label = digitsep(round(number))
	elseif number > 10 then
		label = string.sub(round(number,0),1,3+string.find(round(number,0),"."))
	else
		label = string.sub(round(number,1),1,2+string.find(round(number,1),"."))
	end
	return label
end

function DrawEText(numberE, vOffset)	
	if options["resText"]["On"] then
		local label = "+"..formatRes(numberE)
		gl.Color(1,1,0,1)
		TextDraw(label, widgetPosX -7*#label + widgetWidth -4, widgetPosY + widgetHeight -vOffset+tH-42)
		gl.Color(1,1,1,1)
	end
end

function DrawMText(numberM, vOffset)
	if options["resText"]["On"] then
		local label = "+"..formatRes(numberM)
		gl.Color(0.8,0.8,0.8,1)
		TextDraw(label, widgetPosX - 7*#label + widgetWidth - 4, widgetPosY + widgetHeight -vOffset+tH-30)
		gl.Color(1,1,1,1)
	end
end

function DrawEBar(tE,vOffset)-- where tE = team Energy = [0,1]
	--Echo("Drawing E Bar:",tE)
	local dx = 15
	local dy = tH-35
	gl.Color(0.3,0.3,0.3)
	gl.Rect(
			widgetPosX + dx,
			widgetPosY + widgetHeight -vOffset+dy,
			widgetPosX + dx-5 + widgetWidth/2,
			widgetPosY + widgetHeight -vOffset+dy-1
			)
	gl.Color(1,1,0) --yellow 1
	gl.Rect(
			widgetPosX + dx,
			widgetPosY + widgetHeight -vOffset+dy-1,
			widgetPosX + dx + tE * (widgetWidth/2-5),
			widgetPosY + widgetHeight -vOffset+dy-3
			)
	gl.Color(1,0.5,0) --yellow 2
	gl.Rect(
			widgetPosX + dx,
			widgetPosY + widgetHeight -vOffset+dy-3,
			widgetPosX + dx + tE * (widgetWidth/2-5),
			widgetPosY + widgetHeight -vOffset+dy-4
			)
	gl.Color(0.3,0.3,0.3)
	gl.Rect(
			widgetPosX + dx,
			widgetPosY + widgetHeight -vOffset+dy-4,
			widgetPosX + dx-5 + widgetWidth/2,
			widgetPosY + widgetHeight -vOffset+dy-5
			)
	gl.Rect(
			widgetPosX + dx-5 + widgetWidth/2,
			widgetPosY + widgetHeight -vOffset+dy,
			widgetPosX + dx-4 + widgetWidth/2,
			widgetPosY + widgetHeight -vOffset+dy-5
			)
	gl.Rect(
			widgetPosX + dx-1,
			widgetPosY + widgetHeight -vOffset+dy,
			widgetPosX + dx,
			widgetPosY + widgetHeight -vOffset+dy-5
			)
	gl.Color(1,1,1)
end

function DrawMBar(tM,vOffset) -- where tM = team Metal = [0,1]
	local dx = 15
	local dy = tH-25
	gl.Color(0.3,0.3,0.3)
	gl.Rect(
			widgetPosX + dx,
			widgetPosY + widgetHeight -vOffset+dy,
			widgetPosX + dx-5 + widgetWidth/2,
			widgetPosY + widgetHeight -vOffset+dy-1
			)
	gl.Color(0.8,0.8,0.8)
	gl.Rect(
			widgetPosX + dx,
			widgetPosY + widgetHeight -vOffset+dy-1,
			widgetPosX + dx + tM * (widgetWidth/2-5),
			widgetPosY + widgetHeight -vOffset+dy-3
			)
	gl.Color(0.6,0.6,0.8)
	gl.Rect(
			widgetPosX + dx,
			widgetPosY + widgetHeight -vOffset+dy-3,
			widgetPosX + dx + tM * (widgetWidth/2-5),
			widgetPosY + widgetHeight -vOffset+dy-4
			)
	gl.Color(0.3,0.3,0.3)
	gl.Rect(
			widgetPosX + dx,
			widgetPosY + widgetHeight -vOffset+dy-4,
			widgetPosX + dx-5 + widgetWidth/2,
			widgetPosY + widgetHeight -vOffset+dy-5
			)
	gl.Rect(
			widgetPosX + dx-5 + widgetWidth/2,
			widgetPosY + widgetHeight -vOffset+dy,
			widgetPosX + dx-4 + widgetWidth/2,
			widgetPosY + widgetHeight -vOffset+dy-5
			)
	gl.Rect(
			widgetPosX + dx-1,
			widgetPosY + widgetHeight -vOffset+dy,
			widgetPosX + dx,
			widgetPosY + widgetHeight -vOffset+dy-5
			)
	gl.Color(1,1,1)
end

function DrawFPBar(tFP,vOffset,sM)-- where tFP = team Firepower = [0,1]
	if inSpecMode then
		if not options["FPBar2"]["On"] then return end
	else
		if not options["FPBar1"]["On"] then return end
	end
	
	local dx = 3
	local dy = tH-45
	local h = 22
	gl.Color(0.3,0.3,0.3)
	gl.Rect(widgetPosX+dx-1, widgetPosY + widgetHeight -vOffset + dy + h + 1,widgetPosX+dx+7,widgetPosY + widgetHeight -vOffset + dy + h)
	gl.Rect(widgetPosX+dx-1, widgetPosY + widgetHeight -vOffset + dy-1,widgetPosX+dx+7,widgetPosY + widgetHeight -vOffset + dy)
	gl.Color(0,0,0) --blue 1
	gl.Rect(
			widgetPosX+dx+1,
			widgetPosY + widgetHeight -vOffset + dy,
			widgetPosX + dx + 2,
			widgetPosY + widgetHeight -vOffset + dy+ (1-sM)*tFP * h
			)
	gl.Color(0,0.2,0.4) --blue 2
	gl.Rect(
			widgetPosX+dx+2,
			widgetPosY + widgetHeight -vOffset + dy,
			widgetPosX + dx + 3,
			widgetPosY + widgetHeight -vOffset + dy + (1-sM)*tFP * h
			)
	gl.Color(0,0.4,0.8) -- violet 1
	gl.Rect(
			widgetPosX+dx+1,
			widgetPosY + widgetHeight -vOffset + dy + (1-sM)*tFP * h,
			widgetPosX + dx + 2,
			widgetPosY + widgetHeight -vOffset + dy+ tFP * h
			)
	gl.Color(0,0.4,1) -- violet 2
	gl.Rect(
			widgetPosX+dx+2,
			widgetPosY + widgetHeight -vOffset + dy + (1-sM)*tFP * h,
			widgetPosX + dx + 3,
			widgetPosY + widgetHeight -vOffset + dy + tFP * h
			)
	gl.Color(1,1,1)
end

function DrawBPBar(tBP,vOffset,sA)-- where tE = team Buildpower = [0,1]
	if inSpecMode then
		if not options["BPBar2"]["On"] then return end
	else
		if not options["BPBar1"]["On"] then return end
	end
	
	local dx = 7
	local dy = tH-45
	local h = 22
	gl.Color(0.3,0.3,0.3)
	gl.Rect(
			widgetPosX+dx-1,
			widgetPosY + widgetHeight -vOffset + dy + h + 1,
			widgetPosX+dx+7,
			widgetPosY + widgetHeight -vOffset + dy + h
			)
	gl.Rect(
			widgetPosX+dx-1,
			widgetPosY + widgetHeight -vOffset + dy-1,
			widgetPosX+dx+7,
			widgetPosY + widgetHeight -vOffset + dy
			)
	gl.Color(0,0.8,0) -- green 1
	gl.Rect(
			widgetPosX+dx+1,
			widgetPosY + widgetHeight -vOffset + dy,
			widgetPosX + dx + 2,
			widgetPosY + widgetHeight -vOffset + dy + (1-sA) * tBP * h
			)
	gl.Color(0,0.8,0.3) --green 2
	gl.Rect(
			widgetPosX+dx+2,
			widgetPosY + widgetHeight -vOffset + dy,
			widgetPosX + dx + 3,
			widgetPosY + widgetHeight -vOffset + dy + (1-sA) * tBP * h
			)
	gl.Color(1,1,0) -- yellow 1
	gl.Rect(
			widgetPosX+dx+1,
			widgetPosY + widgetHeight -vOffset + dy + (1-sA) * tBP * h,
			widgetPosX + dx + 2,
			widgetPosY + widgetHeight -vOffset + dy+ tBP * h
			)
	gl.Color(0.3,1,0) --yellow 2
	gl.Rect(
			widgetPosX+dx+2,
			widgetPosY + widgetHeight -vOffset + dy + (1-sA) * tBP * h,
			widgetPosX + dx + 3,
			widgetPosY + widgetHeight -vOffset + dy + tBP * h
			)
	gl.Color(0.3,0.3,0.3)
	gl.Color(1,1,1)
end

function DrawKillBar(killedhp,vOffset,splits) -- where killedHP = abs. number
	local dx = 1
	local dy = 1
	local len = 0.001*killedhp/(splits+1)
	
	gl.Color(0,0.3,0.9,0.8)
	gl.Rect(
			widgetPosX + dx,
			widgetPosY + widgetHeight -vOffset+dy+1,
			widgetPosX + dx + len,
			widgetPosY + widgetHeight -vOffset+dy
			)
	gl.Color(0,0.2,0.5,0.8)
	gl.Rect(
			widgetPosX + dx,
			widgetPosY + widgetHeight -vOffset+dy,
			widgetPosX + dx + len,
			widgetPosY + widgetHeight -vOffset+dy-1
			)
	gl.Color(1,1,1,1)
end

function DrawLossesBar(losthp,vOffset,splits) 
	local dx = 1
	local dy = -1
	local len = 0.001*losthp/(splits+1)
	
	gl.Color(0.6,0.2,0.2,0.8) -- (1,0,0.3,0.8)
	gl.Rect(
			widgetPosX + dx,
			widgetPosY + widgetHeight -vOffset+dy+1,
			widgetPosX + dx + len,
			widgetPosY + widgetHeight -vOffset+dy
			)
	gl.Color(0.3,0.1,0.1,0.8) -- (0.6,0,0.4,0.8)
	gl.Rect(
			widgetPosX + dx,
			widgetPosY + widgetHeight -vOffset+dy,
			widgetPosX + dx + len,
			widgetPosY + widgetHeight -vOffset+dy-1
			)
	gl.Color(1,1,1,1)
end

function DrawKillDeathText(kills, losses, vOffset)
	if inSpecMode then
		if not options["kills2"]["On"] then return end
	else
		if not options["kills1"]["On"] then return end
	end
	--Echo("K/L:",kills, losses, vOffset)
	local dx = 6
	local dy = 68
	--local len = 1+math.floor(1+math.log(kills+1)+math.log(losses+1))
	local len  = 7 * #(tostring(losses))
	local len2 = 7 * #(tostring(kills))+len
	gl.Color(0.8,1,0.8,1)
	if kills > 0 then TextDraw(kills, widgetPosX + widgetWidth - 15 - dx - len2, widgetPosY + widgetHeight -vOffset+tH-dy+2) end
	gl.Color(0.85,0.85,0.85,0.85)
	if kills > 0 and losses > 0 then TextDraw("/", widgetPosX  + widgetWidth - 10 - dx - len, widgetPosY + widgetHeight -vOffset+tH-dy+2) end
	gl.Color(1,0.8,0.8,1)
	if losses > 0 then TextDraw(losses, widgetPosX + widgetWidth - dx - len, widgetPosY + widgetHeight -vOffset+tH-dy+2) end
	gl.Color(1,1,1,1)
end

function DrawDeathText(text, vOffset)
	gl.Color(1,0.9,0.9,1)
	--text = string.sub(text, 0, 1)
	TextDraw(text, widgetPosX + widgetWidth - 33, widgetPosY + widgetHeight -vOffset+tH-62)
	gl.Color(1,1,1,1)
end

function DrawKillText(text, vOffset)
	gl.Color(0.9,1,0.9,1)
	--text = string.sub(text, 0, 1)
	TextDraw(text, widgetPosX + 18, widgetPosY + widgetHeight -vOffset+tH-62)
	gl.Color(1,1,1,1)
end

function DrawDeathText(text, vOffset)
	gl.Color(1,0.9,0.9,1)
	--text = string.sub(text, 0, 1)
	TextDraw(text, widgetPosX + widgetWidth - 33, widgetPosY + widgetHeight -vOffset+tH-62)
	gl.Color(1,1,1,1)
end

function DrawKillText2(text, vOffset)
	gl.Color(0.7,0.7,0.7,0.8)
	text = "("..text..")"
	TextDraw(text, widgetPosX + 10, widgetPosY + widgetHeight -vOffset+tH-73)
	gl.Color(1,1,1,1)
end

function DrawDeathText2(text, vOffset)
	gl.Color(0.7,0.7,0.7,0.8)
	text = "("..text..")"
	TextDraw(text, widgetPosX + widgetWidth - 40, widgetPosY + widgetHeight -vOffset+tH-73)
	gl.Color(1,1,1,1)
end

function DrawBackground(posY)
	local y1 = widgetPosY - posY + widgetHeight - 1
	local y2 = widgetPosY - posY + tH + widgetHeight - 1

	gl.Color(0,0,0,options["contrast"])                              -- draws background rectangle
	gl.Rect(widgetPosX,y1, widgetPosX + widgetWidth, y2)
	if options["borders"]["On"] then
		gl.Color(0,0,0,1)
		gl.Rect(widgetPosX,y1 -1 , widgetPosX + widgetWidth, y1) --bottom
		gl.Rect(widgetPosX,y2 - 1, widgetPosX + widgetWidth, y2) --top
		gl.Rect(widgetPosX , y1-1, widgetPosX + 1, y2  - 1) --left
		gl.Rect(widgetPosX + widgetWidth - 1, y1-1, widgetPosX + widgetWidth, y2  - 1)--right
	end
	gl.Color(1,1,1,1)
end

function DrawExpandTable(teamID)
	local nbTeams = getNbTeams()
	local nbPlayers = getNbPlayers(teamID)
	if nbPlayers > 5 then cW = 90 end
	if nbPlayers > 8 then cW = 80 end
	
	local lm  						= 20 -- left margin
	local rm  						= 35 --right margin
	local dy 						= 35 -- top margin
	local w 						= 180 + cW*nbPlayers -- infotable width
	local j
	local rs  						= 18 --row spacing
	local hBar 						= 40 -- bottom bar height
	local x1, y1, x2, y2
	local clr = {0.8, 0.8, 0.9 ,1}
	
	local posX = iPosX[teamID]
	local posY = iPosY[teamID]

	local splits = math.floor(0.004*PmaxDmg/hBar)
	local scale = splits*250
	
	x1 = posX
	y2 = posY
	x2 = x1 + w
	y1 = y2 - infoTableHeight
	--------------
	-- Background --
	--------------
	gl.Color(0.1,0.1,0.1,0.85)
	gl.Rect(x1, y1, x2, y2)
	--gl.Rect(x1, y2 - 25, x2 - 25, y2)
	gl.Color(0,0,0,1)
	gl.Rect(x1, y1, x2, y1 + 1) 					-- lower
	gl.Rect(x1, y2, x2, y2+1) 						--upper
	gl.Rect(x1, y1, x1+1, y2) 						--left
	gl.Rect(x2, y1, x2+1, y2-1)						--right
	gl.Color(clr)
	fontHandler.UseFont(font2)
	TextDraw("Team "..teamID, posX + w/2 -30, posY - 38)
	fontHandler.UseFont(font)
	gl.Color(0.8,0.8,1,0.4)
	if (#motto[teamID]+14)*7 > w then
		TextDraw(motto[teamID], posX + w/2 - (#motto[teamID])*2 - 30, posY - 15)
	else
		TextDraw("Team motto: "..motto[teamID], posX + 30, posY - 15)
	end

	local hasCom
	local active
	local mycomlbl
	local myactlbl
	local r,b,g,s1, s2, s3, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17,s18, rank, sStatus
	if expandMove[teamID]["mouseover"] then
		gl.Color(1,1,1,1)
	else
		gl.Color(0.5,0.5,0.8,0.7)
	end
	gl.Texture(imgMove)
	gl.TexRect(expandMove[teamID]["x1"], expandMove[teamID]["y1"] , expandMove[teamID]["x2"], expandMove[teamID]["y2"])
	
	if Teambutton["Prev"][teamID]["mouse"] then
		if teamID > 0 and inSpecMode then
			gl.Color(0.7,0.9,1,1)
		else
			gl.Color(1,0.7,0.7,1)
		end
	else
		gl.Color(0.5,0.5,0.8,0.7)
	end
	
	gl.Texture(imgPrev)
	gl.TexRect(Teambutton["Prev"][teamID]["x1"], Teambutton["Prev"][teamID]["y1"] , Teambutton["Prev"][teamID]["x2"], Teambutton["Prev"][teamID]["y2"])
	
	if Teambutton["Next"][teamID]["mouse"] then
		if teamID < getNbTeams() - 1 and inSpecMode then
			gl.Color(0.7,0.9,1,1)
		else
			gl.Color(1,0.7,0.7,1)
		end
	else
		gl.Color(0.5,0.5,0.8,0.7)
	end
	
	gl.Texture(imgNext)
	gl.TexRect(Teambutton["Next"][teamID]["x1"], Teambutton["Next"][teamID]["y1"] , Teambutton["Next"][teamID]["x2"], Teambutton["Next"][teamID]["y2"])
	
	
	gl.Color(0.5,0.5,0.8,1)
	--------------
	-- Headings --
	-------------
	TextDraw("Player:", posX + lm, posY - dy - 10 - 1*rs)
	TextDraw("Commander:", posX + lm, posY - dy - 10- 2*rs)
	TextDraw("Units:", posX + lm, posY - dy - 10 - 3*rs)
	TextDraw("Metal:", posX + lm, posY - dy - 10 - 4*rs)
	TextDraw("Energy:", posX + lm, posY - dy - 10 - 5*rs)
	TextDraw("Firepower:", posX + lm, posY - dy - 10 - 6*rs)
	TextDraw(".....mobile:", posX + lm, posY - dy - 5 - 7*rs)
	TextDraw("Buildpower:", posX + lm, posY - dy - 10 - 8*rs)
	TextDraw(".......air:", posX + lm, posY - dy - 5 - 9*rs)
	TextDraw("Kills:", posX + lm, posY - dy - 10 - 10*rs)
	TextDraw("Losses:", posX + lm, posY - dy - 10 - 11*rs)
	TextDraw("Killed HP:", posX + lm, posY - dy - 10 - 12*rs)
	TextDraw("Lost HP:", posX + lm, posY - dy - 10 - 13*rs)
	TextDraw("Active:", posX + lm, posY - dy - 10 - 14*rs)
	TextDraw("Faction:", posX + lm, posY - dy - 10 - 15*rs)
	TextDraw("Country:", posX + lm, posY - dy - 10 - 16*rs)
	TextDraw("Rank:", posX + lm, posY - dy - 10 - 17*rs)
	gl.Color(0.4,0.4,0.2,1)
	TextDraw("Kills:", posX + lm, posY - dy - 10 - 22*rs)	
	TextDraw("0 HP", posX + 100, posY - dy - 10 - 22*rs - 2)
	local s0 = formatRes1000((1+splits)*hBar/4) .." kHP"
	TextDraw(s0, posX + 135 - #s0*7, posY - dy - 10 - 22*rs + hBar-2)
	gl.Color(0.5,0.5,0.8,0.3)
	TextDraw("(Right-click to close)", posX + lm, posY - dy - 24*rs)
	gl.Color(0.5,0.5,0.8,1)

	for i, pID in ipairs (Spring_GetTeamList(teamID)) do
		j = nbPlayers - i
		------------
		-- Values --
		------------
		r  		= playerData[pID].red
		g  		= playerData[pID].green
		b  		= playerData[pID].blue

		if r ~= nil then
			local luminance  = (r * 0.299) + (g * 0.587) + (b * 0.114)
			if (luminance < 0.3) then
				r = r + 0.2
				g = g + 0.2
				b = b + 0.2
			end
		end
		s1 		= playerData[pID]["leaderName"] or "(Retired)"
		if 	#s1 > cW/7 and nbPlayers > 1 then s1 = string.sub(s1,1,math.floor(cW/7)) end
		s3 		= tostring(playerData[pID]["unitCount"]) or ""
		hasCom 	= playerData[pID]["hasCom"]
		s5 		= "+"..formatRes1000(playerData[pID]["minc"])
		s6		= "+"..formatRes1000(playerData[pID]["einc"])
		s7		= formatRes1000(playerData[pID]["firepower"])
		if playerData[pID]["firepower"] > 0 then
			s8		= formatRes1000(100*(playerData[pID]["firepowerMob"]/playerData[pID]["firepower"])).."%"
		else
			s8 = ""
		end
		s9		= formatRes1000(playerData[pID]["buildpower"])
		if playerData[pID]["firepower"] > 0 then
			s10		= formatRes1000(100*(playerData[pID]["buildpowerAir"]/playerData[pID]["buildpower"])).."%"
		else
			s10 = ""
		end
		s11		= tostring(playerData[pID]["kills"])
		s12		= tostring(playerData[pID]["losses"])
		s13		= formatRes1000(playerData[pID]["killedhp"])
		s14		= formatRes1000(playerData[pID]["losthp"])
		active 	= playerData[pID]["active"]
		s16		= firstToUpper(playerData[pID]["side"] or "") 
		s17		= string.upper(playerData[pID]["country"] or "") 
		rank 	= playerData[pID]["rank"]
		if rank == 0 then
			s18 = "Enlisted"
		elseif rank == 1 then
			s18 = "2nd Lieut."
		elseif rank == 2 then
			s18 = "Lieutenant"
		elseif rank == 3 then
			s18 = "Captain"
		elseif rank == 4 then
			s18 = "Major"
		elseif rank == 5 then
			s18 = "Lt.Colonel"
		elseif rank == 6 then
			s18 = "Colonel"
		elseif rank == 7 then
			s18 = "Brigadier"
		elseif rank == 8 then
			s18 = "Maj.General"
		else
			s18 = ""
		end
		gl.Color(r,g,b,1)
		------------------
		-- Print values --
		------------------
		TextDraw(s1, posX + w - #s1*7 - rm - j*cW, posY - dy - 10 - 1*rs)
		gl.Color(clr)
		if hasCom then
			s2 = "Yes"
			gl.Color(0.7,1,0.7,1)
		else
			s2 = "No"
			gl.Color(1,0.7,0.7,1)
		end
						
		TextDraw(s2, posX + w - #s2*7 - rm - j*cW, posY - dy - 10 - 2*rs)
		gl.Color(clr)
		if (playerData[pID]["isDead"]) then gl.Color(0.5,0.5,0.5,0.8) end
		TextDraw(s3, posX + w - #s3*7 - rm - j*cW, posY - dy - 10 - 3*rs)
		gl.Color(0.8,0.8,1,1)
		TextDraw(s5, posX + w - #s5*7 - rm - j*cW, posY - dy - 10 - 4*rs)
		gl.Color(1,1,0,1)
		TextDraw(s6, posX + w - #s6*7 - rm - j*cW, posY - dy - 10 - 5*rs)
		gl.Color(clr)
		TextDraw(s7, posX + w - #s7*7 - rm - j*cW, posY - dy - 10 - 6*rs)
		TextDraw(s8, posX + w - #s8*7 - rm + 7 - j*cW, posY - dy - 5 - 7*rs)
		gl.Color(clr)
		TextDraw(s9, posX + w - #s9*7 - rm - j*cW, posY - dy - 10 - 8*rs)
		TextDraw(s10, posX + w - #s10*7 - rm + 7 - j*cW, posY - dy - 5 - 9*rs)
		gl.Color(clr)
		TextDraw(s11, posX + w - #s11*7 -rm - j*cW, posY - dy - 10 - 10*rs)
		TextDraw(s12, posX + w -#s12*7 - rm - j*cW, posY - dy - 10 - 11*rs)
		TextDraw(s13, posX + w - #s13*7 - rm - j*cW, posY - dy - 10 - 12*rs)
		TextDraw(s14, posX + w - #s14*7 - rm - j*cW, posY - dy - 10 - 13*rs)
		if active then
			s15 = "Yes"
			gl.Color(0.7,1,0.7,1)
		else
			s15 = "No"
			gl.Color(1,0.7,0.7,1)
		end
		TextDraw(s15, posX + w - #s15*7 - rm - j*cW, posY - dy - 10 - 14*rs)
		gl.Color(clr)
		TextDraw(s16, posX + w - #s16*7 - rm - j*cW, posY - dy - 10 - 15*rs)
		TextDraw(s17, posX + w - #s17*7 - rm - j*cW, posY - dy - 10 - 16*rs)
		TextDraw(s18, posX + w - #s18*7 - rm - j*cW, posY - dy - 10 - 17*rs)
		--fontHandler.UseFont(font2)
		if gamestarted then
			if not playerData[pID]["active"] and playerData[pID]["unitCount"] > 0 then
			gl.Color(0.5,0.5,0.8,1)
			sStatus = "[MIA]"
			elseif playerData[pID]["isDead"] then
			gl.Color(0.5,0.1,0.1,1)
			sStatus = "[KIA]"
			else
			gl.Color(0.7,1,0.7,1)
			sStatus = ""
			end
		else
			if not playerData[pID]["active"] then
				gl.Color(0.3,0.3,0.6,1)
				sStatus = "(Not here)"
			elseif playerData[pID]["startx"] > 0 and playerData[pID]["starty"] > 0 then
				gl.Color(0.5,0.5,0.8,1)
				sStatus = "(Marked)"
			elseif playerData[pID]["startx"] == -100 and playerData[pID]["starty"] == -100 then
				gl.Color(0.4,0.4,0.7,1)
				sStatus = "(Warming up)"
			else
				sStatus = ""
			end
		end
		TextDraw(sStatus, posX + w - #sStatus*7 - rm - j*cW, posY - dy - 20 - 18*rs)
		
		for rank,_ in ipairs(Spring_GetTeamList()) do -- fist player id in matrix is ranking, since table is sorted by most kills
			if rank < 16 then
				local r2,g2,n2,r3,g3,b3,r4,g4,b4
				local xi, yi, hi
				local enemy = kMat[pID][rank][1] -- the associated player with rank is the actual player id that we wanna plot
												
				r2 = playerData[enemy].red or 0
				g2 = playerData[enemy].green or 0
				b2 = playerData[enemy].blue or 0
				
				local luminance  = (r2 * 0.299) + (g2 * 0.587) + (b2 * 0.114)
				
				if luminance > 0.3 then
					r3 = r2 - 0.25 * luminance
					r4 = r3 - 0.25 * luminance
					g3 = g2 - 0.25 * luminance
					g4 = g3 - 0.25 * luminance
					b3 = b2 - 0.25 * luminance
					b4 = b3 - 0.25 * luminance
				else
					r3 = r2 + 0.5 * luminance
					r4 = r3 + 0.5 * luminance
					g3 = g2 + 0.5 * luminance
					g4 = g3 + 0.5 * luminance
					b3 = b2 + 0.5 * luminance
					b4 = b3 + 0.5 * luminance
				end
							
				hi = (kMat[pID][rank][2]/250)/(splits+1) or 0
				xi = posX + w - rm - (j+0.55)*cW - 10 + 9*rank
				yi = posY - dy - 10 - 22*rs
				
				gl.Color(0.1,0.1,0.05,0.7)
				--gl.Color(0.4,0.4,0.2,1)
				gl.Rect(posX + w - rm - (j+0.66)*cW, yi-1, posX + w - rm - j*cW, yi)
				gl.Rect(posX + w - rm - (j+0.66)*cW, yi+hBar, posX + w - rm - j*cW, yi+hBar+1)
				--gl.Color(0.1,0.1,0.05,0.1)
				--gl.Color(0.4,0.4,0.2,0.1)
				--gl.Rect(posX + w - rm - (j+0.66)*cW, yi+hBar/4, posX + w - rm - j*cW-10, yi+hBar/4+1)
				--gl.Rect(posX + w - rm - (j+0.66)*cW, yi+hBar/2, posX + w - rm - j*cW, yi+hBar/2+1)
				--gl.Rect(posX + w - rm - (j+0.66)*cW, yi+3*hBar/4, posX + w - rm - j*cW-10, yi+3*hBar/4+1)
				
				gl.Color(r2,g2,b2,1)
				gl.Rect(
				xi+1,
				yi,
				xi+2,
				yi+hi
				)
				gl.Color(r3,g3,b3,1)
				gl.Rect(
				xi+2,
				yi,
				xi+3,
				yi+hi
				)
				gl.Color(r4,g4,b4,1)
				gl.Rect(
				xi+3,
				yi,
				xi+4,
				yi+hi
				)
			end
		end
		
		gl.Color(clr)
		fontHandler.UseFont(font)
	end
end

function DrawOptionRibbon()
	local h = 300
	local dx = 200
	local x0
	local t = 12
	
	if right then
		x0 = widgetPosX-dx
		x1 = x0 + dx + widgetWidth
	else
		x0 = widgetPosX
		x1 = x0 + dx + widgetWidth
	end
	
	options["contrastLess"]["x1"] = x0 + 80
	options["contrastLess"]["x2"] = x0 + 87
	options["contrastLess"]["y2"] = widgetPosY - 20
	options["contrastLess"]["y1"] = widgetPosY - 35
	
	options["contrastMore"]["x1"] = x0 + 88
	options["contrastMore"]["x2"] = x0 + 95
	options["contrastMore"]["y2"] = widgetPosY - 20
	options["contrastMore"]["y1"] = widgetPosY - 35
	
	options["borders"]["x1"] = x0 + 80
	options["borders"]["x2"] = x0 + 95
	options["borders"]["y2"] = widgetPosY - 40
	options["borders"]["y1"] = widgetPosY - 55
	
	options["widthInc"]["x1"] = x0 + 200
	options["widthInc"]["x2"] = x0 + 215
	options["widthInc"]["y2"] = widgetPosY - 20
	options["widthInc"]["y1"] = widgetPosY - 35
	
	options["widthDec"]["x1"] = x0 + 180
	options["widthDec"]["x2"] = x0 + 195
	options["widthDec"]["y2"] = widgetPosY - 20
	options["widthDec"]["y1"] = widgetPosY - 35
	
	options["heightInc"]["x1"] = x0 + 200
	options["heightInc"]["x2"] = x0 + 215
	options["heightInc"]["y2"] = widgetPosY - 40
	options["heightInc"]["y1"] = widgetPosY - 55
	
	options["heightDec"]["x1"] = x0 + 180
	options["heightDec"]["x2"] = x0 + 195
	options["heightDec"]["y2"] = widgetPosY - 40
	options["heightDec"]["y1"] = widgetPosY - 55
	
	options["disable"]["x1"] = x0 + 220
	options["disable"]["x2"] = x0 + 220 + t
	options["disable"]["y2"] = widgetPosY - 100
	options["disable"]["y1"] = widgetPosY - 100 - t

	options["FPBar1"]["x1"] = x0 + 180
	options["FPBar1"]["x2"] = x0 + 180 + t
	options["FPBar1"]["y2"] = widgetPosY - 200
	options["FPBar1"]["y1"] = widgetPosY - 200 - t
	
	options["BPBar1"]["x1"] = x0 + 180
	options["BPBar1"]["x2"] = x0 + 180 + t
	options["BPBar1"]["y2"] = widgetPosY - 220
	options["BPBar1"]["y1"] = widgetPosY - 220 - t
	
	options["FPBar2"]["x1"] = x0 + 220
	options["FPBar2"]["x2"] = x0 + 220 + t
	options["FPBar2"]["y2"] = widgetPosY - 200
	options["FPBar2"]["y1"] = widgetPosY - 200 - t
	
	options["BPBar2"]["x1"] = x0 + 220
	options["BPBar2"]["x2"] = x0 + 220 + t
	options["BPBar2"]["y2"] = widgetPosY - 220
	options["BPBar2"]["y1"] = widgetPosY - 220 - t
	
	options["kills1"]["x1"] = x0 + 180
	options["kills1"]["x2"] = x0 + 180 + t
	options["kills1"]["y2"] = widgetPosY - 240
	options["kills1"]["y1"] = widgetPosY - 240 - t
	
	options["kills2"]["x1"] = x0 + 220
	options["kills2"]["x2"] = x0 + 220 + t
	options["kills2"]["y2"] = widgetPosY - 240
	options["kills2"]["y1"] = widgetPosY - 240 - t
	
	options["Announce"]["x1"] = x0 + 220
	options["Announce"]["x2"] = x0 + 220 + t
	options["Announce"]["y2"] = widgetPosY - 120
	options["Announce"]["y1"] = widgetPosY - 120 - t
	
	options["removeDead"]["x1"] = x0 + 220
	options["removeDead"]["x2"] = x0 + 220 + t
	options["removeDead"]["y2"] = widgetPosY - 140
	options["removeDead"]["y1"] = widgetPosY - 140 - t
	
	options["resText"]["x1"] = x0 + 220
	options["resText"]["x2"] = x0 + 220 + t
	options["resText"]["y2"] = widgetPosY - 160
	options["resText"]["y1"] = widgetPosY - 160 - t
	
	
	gl.Color(0,0,0,0.4)                              -- draws background rectangle
	gl.Rect(x0,widgetPosY, x1, widgetPosY -h)
	gl.Color(0,0,0,1)
	gl.Rect(x0,widgetPosY, x0+1, widgetPosY-h)
	gl.Rect(x1 - 1,widgetPosY, x1, widgetPosY-h)
	gl.Color(1,1,1,1)
	TextDraw("Adjust", x0+95, widgetPosY - 10)
	TextDraw("Options", x0+95, widgetPosY - 90)
	gl.Rect(x0+95,widgetPosY - 12, x0 + 137, widgetPosY-13)
	gl.Rect(x0+95,widgetPosY - 92, x0 + 145, widgetPosY-93)
	gl.Color(0.8,0.8,1,0.8)
	TextDraw("Contrast:", x0+5, widgetPosY - 30)
	TextDraw("Borders:", x0+5, widgetPosY - 50)
	TextDraw("Width:", x0+125, widgetPosY - 30)
	TextDraw("Height:", x0+125, widgetPosY - 50)
	gl.Color(1,1,1,1)
	gl.Texture(optContrast)
	gl.TexRect(
		options["contrastLess"]["x1"],
		options["contrastLess"]["y1"],
		options["contrastMore"]["x2"],
		options["contrastMore"]["y2"]
		)
	if options["borders"]["On"] then
		gl.Texture(optBorders)
	else
		gl.Texture(optBordersOff)
	end
	gl.TexRect(
		options["borders"]["x1"],
		options["borders"]["y1"],
		options["borders"]["x2"],
		options["borders"]["y2"]
		)
	gl.Color(0.8,0.8,1,0.8)
	TextDraw("Disable for non-spectators:", x0+5, widgetPosY - 110)
	TextDraw("Show firepower bar:", x0+5, widgetPosY - 210)
	TextDraw("Show buildpower bar:", x0+5, widgetPosY - 230)
	TextDraw("Show kills and losses:", x0+5, widgetPosY - 250)
	TextDraw("Show resource text:", x0+5, widgetPosY - 170)
	TextDraw("Announce kills:", x0+5, widgetPosY - 130)
	TextDraw("Remove dead teams:", x0+5, widgetPosY - 150)
	TextDraw("(Drag window to reposition)", x0+35, widgetPosY - 280)
	gl.Color(1,1,1,1)
	TextDraw("Player", x0+160, widgetPosY - 192)
	TextDraw("Spec", x0+215, widgetPosY - 192)
	if options["disable"]["On"] then
		gl.Texture(optChkBoxOn)
	else
		gl.Texture(optChkBoxOff)
	end
	gl.TexRect(
		options["disable"]["x1"],
		options["disable"]["y1"],
		options["disable"]["x2"],
		options["disable"]["y2"]
		)
		
	if options["FPBar2"]["On"] then
		gl.Texture(optChkBoxOn)
	else
		gl.Texture(optChkBoxOff)
	end
	gl.TexRect(
		options["FPBar2"]["x1"],
		options["FPBar2"]["y1"],
		options["FPBar2"]["x2"],
		options["FPBar2"]["y2"]
		)
		
	if options["BPBar2"]["On"] then
		gl.Texture(optChkBoxOn)
	else
		gl.Texture(optChkBoxOff)
	end
	gl.TexRect(
		options["BPBar2"]["x1"],
		options["BPBar2"]["y1"],
		options["BPBar2"]["x2"],
		options["BPBar2"]["y2"]
		)
	
	if options["FPBar1"]["On"] then
		gl.Texture(optChkBoxOn)
	else
		gl.Texture(optChkBoxOff)
	end
	gl.TexRect(
		options["FPBar1"]["x1"],
		options["FPBar1"]["y1"],
		options["FPBar1"]["x2"],
		options["FPBar1"]["y2"]
		)
		
	if options["BPBar1"]["On"] then
		gl.Texture(optChkBoxOn)
	else
		gl.Texture(optChkBoxOff)
	end
	gl.TexRect(
		options["BPBar1"]["x1"],
		options["BPBar1"]["y1"],
		options["BPBar1"]["x2"],
		options["BPBar1"]["y2"]
		)
	options["kills1"]["On"] = false
	gl.Color(0.8,0.4,0.4,0.5)
	TextDraw("(N/A)", x0+170, widgetPosY - 250)
	gl.Color(1,1,1,1)
	
	if options["kills2"]["On"] then
		gl.Texture(optChkBoxOn)
	else
		gl.Texture(optChkBoxOff)
	end
	gl.TexRect(
		options["kills2"]["x1"],
		options["kills2"]["y1"],
		options["kills2"]["x2"],
		options["kills2"]["y2"]
		)
	
	if options["Announce"]["On"] then
		gl.Texture(optChkBoxOn)
	else
		gl.Texture(optChkBoxOff)
	end
	gl.TexRect(
		options["Announce"]["x1"],
		options["Announce"]["y1"],
		options["Announce"]["x2"],
		options["Announce"]["y2"]
		)
	
	if options["resText"]["On"] then
		gl.Texture(optChkBoxOn)
	else
		gl.Texture(optChkBoxOff)
	end
	gl.TexRect(
		options["resText"]["x1"],
		options["resText"]["y1"],
		options["resText"]["x2"],
		options["resText"]["y2"]
		)
		
	if options["removeDead"]["On"] then
		gl.Texture(optChkBoxOn)
	else
		gl.Texture(optChkBoxOff)
	end
	gl.TexRect(
		options["removeDead"]["x1"],
		options["removeDead"]["y1"],
		options["removeDead"]["x2"],
		options["removeDead"]["y2"]
		)
	
	gl.Texture(optButtMore)
	gl.TexRect(
		options["widthInc"]["x1"],
		options["widthInc"]["y1"],
		options["widthInc"]["x2"],
		options["widthInc"]["y2"]
		)
	gl.Texture(optButtLess)
	gl.TexRect(
		options["widthDec"]["x1"],
		options["widthDec"]["y1"],
		options["widthDec"]["x2"],
		options["widthDec"]["y2"]
		)
		gl.Texture(optButtMore)
	gl.TexRect(
		options["heightInc"]["x1"],
		options["heightInc"]["y1"],
		options["heightInc"]["x2"],
		options["heightInc"]["y2"]
		)
	gl.Texture(optButtLess)
	gl.TexRect(
		options["heightDec"]["x1"],
		options["heightDec"]["y1"],
		options["heightDec"]["x2"],
		options["heightDec"]["y2"]
		)
end

function DrawCollapseButton(teamID, right)
	local x1, y1, x2, y2
	local label
	local nbPlayers = getNbPlayers(teamID)

	if right then
		label 	= ">"
	else
		label 	= "<"
	end
	x1 	= collapseButtonPos[teamID]["x1"]
	y1 	= collapseButtonPos[teamID]["y1"]
	x2 	= collapseButtonPos[teamID]["x2"]
	y2 	= collapseButtonPos[teamID]["y2"]

	active = collapseButtonState[teamID]["mouse"]

	gl.Color(0.4,0.4,0.8,1)
	gl.Rect(x1, y1, x2, y2)
	if active then
		gl.Color(0.8,0.8,1,1)
	else
		gl.Color(0.2,0.2,0.5,1)
	end
	gl.Rect(
			x1,
			y1,
			x2+1,
			y1+1
			)
	gl.Rect(
			x1,
			y2,
			x2+1,
			y2+1
			)
	gl.Rect(
			x1,
			y1,
			x1+1,
			y2+1
			)
	gl.Rect(
			x2,
			y1,
			x2+1,
			y2+1
			)
	fontHandler.UseFont(font)
	if active then
		gl.Color(0.9,0.9,1,1)
	else
		gl.Color(0.3,0.3,0.8,0.8)
	end
	fontHandler.UseFont(font2)
	TextDraw(label, x1 + 7, y1 + 10)
	fontHandler.UseFont(font)
	gl.Color(1,1,1,1)
end

function DrawExpandButton (teamID, active, right)
	
	if options["removeDead"]["On"] then
		if not teamData[teamID]["isAlive"] then return end
	end
	
	local x1 = expandButtonPos[teamID]["x1"]
	local y1 = expandButtonPos[teamID]["y1"]
	local x2 = expandButtonPos[teamID]["x2"]
	local y2 = expandButtonPos[teamID]["y2"]


	local label
	if right then
		label 	= "<"
	else
		label 	= ">"
	end
	gl.Color(0,0,0,0.3)
	gl.Rect(x1, y1, x2, y2)
	if active then
		gl.Color(0.8,0.8,1,1)
	else
		gl.Color(0,0,0,1)
	end
	gl.Rect(
			x1,
			y1,
			x2+1,
			y1+1
			)
	gl.Rect(
			x1,
			y2,
			x2+1,
			y2+1
			)
	gl.Rect(
			x1,
			y1,
			x1+1,
			y2+1
			)
	gl.Rect(
			x2,
			y1,
			x2+1,
			y2+1
			)
	fontHandler.UseFont(font)
	if active then
		gl.Color(0.8,0.8,1,1)
	else
		gl.Color(0.3,0.3,0.8,0.8)
	end
	TextDraw(label, x1 + 2, y1 + 5)
	gl.Color(1,1,1,1)
end

function DrawLabel(text, vOffset)
	fontHandler.UseFont(font2)
	if widgetWidth < 59 then
		--fontHandler.UseFont(font)
		text = string.sub(text, 0, 1)
	end
	TextDraw(text or "", widgetPosX + 1, widgetPosY + 2 + widgetHeight -vOffset+tH-15)
	--gl.Rect(widgetPosX+1, widgetPosY + widgetHeight -vOffset-1, widgetPosX + widgetWidth-1, widgetPosY + widgetHeight -vOffset-2)
	if options["borders"]["On"] then
		gl.Color(0,0,0)
		gl.Rect(widgetPosX+1, widgetPosY + widgetHeight -vOffset-1, widgetPosX + widgetWidth-1, widgetPosY + widgetHeight -vOffset-2)
	end
	gl.Color(1,1,1)
	fontHandler.UseFont(font)
end

function DrawLabelC(text, vOffset)
	if widgetWidth < 67 then
		text = string.sub(text, 0, 1)
	end
	gl.Color(0.55,0.55,0.8,0.7)
	TextDraw(text or "", widgetPosX + 15, widgetPosY + widgetHeight -vOffset+tH-42)
end

function DrawLabelCM(text, vOffset)
	local len = #text
	if widgetWidth < 67 then
		text = string.sub(text, 0, 1)
	end
	gl.Color(0.8,0.8,1,0.8)
	TextDraw(text or "", widgetPosX + 30-len*1.875, widgetPosY + widgetHeight -vOffset+tH-42)
end

function DrawLabelCM2(text, vOffset)
	local len = #text
	if widgetWidth < 67 then
		text = string.sub(text, 0, 1)
	end
	gl.Color(0.8,0.8,1,0.8)
	TextDraw(text or "", widgetPosX + 30-len*1.875, widgetPosY + widgetHeight -vOffset+tH-62)
end

function DrawLabelCT(text, vOffset,t)
	if widgetWidth < 67 then
		text = string.sub(text, 0, 1)
	end
	local gs 
	gs,_,_ = Spring.GetGameSpeed() or 1
	--gl.Color(0.5,0.5,0.8,1-0.1*t)
	gl.Color(1-0.5*math.sin(20*t/gs),1-0.5*math.sin(20*t/gs),1-0.25*math.sin(20*t/gs),0.8)
	if t < 3 then
		TextDraw(text or "", widgetPosX + 30, widgetPosY + widgetHeight -vOffset+tH-42)
	else
		TextDraw(text or "", widgetPosX + 30 + (t-3)^12, widgetPosY + widgetHeight -vOffset+tH-42)
	end
	gl.Color(1,1,1,1)
end

function DrawBox(hOffset, vOffset,r,g,b)
	local dx = 20
	local dy = 52
	gl.Color(.2,.2,.2)
	gl.Rect(widgetPosX+hOffset+dx+7, widgetPosY + widgetHeight -vOffset+dy+17, widgetPosX+hOffset+dx+8, widgetPosY + widgetHeight -vOffset+dy+3)
	gl.Rect(widgetPosX+hOffset+dx+20, widgetPosY + widgetHeight -vOffset+dy+17, widgetPosX + hOffset + dx + 21, widgetPosY + widgetHeight -vOffset+dy+3)
	gl.Rect(widgetPosX+hOffset+dx+7, widgetPosY + widgetHeight -vOffset+dy+17, widgetPosX + hOffset +dx + 21, widgetPosY + widgetHeight -vOffset+dy+16)
	gl.Rect(widgetPosX+hOffset+dx+7, widgetPosY + widgetHeight -vOffset+dy+4, widgetPosX + hOffset + dx + 21, widgetPosY + widgetHeight -vOffset+dy+3)
	gl.Color(r,g,b,0.5)
	gl.Rect(widgetPosX+hOffset+dx+8, widgetPosY + widgetHeight -vOffset+dy+16, widgetPosX + hOffset + dx + 20, widgetPosY + widgetHeight -vOffset+dy+4)
	gl.Color(1,1,1,1)
end

function DrawSideImage(sideImage, hOffset, vOffset, r, g, b, a, small, mouseOn,t)
		local w
		local h
		local dx
		local dy
		if small then
			w = 8
			h = 8
			dx = 28 + (WBadge-14)*4
			dy = tH - 12
		else
			w = WBadge
			h = WBadge
			dx = 25 + (WBadge-14)*4
			dy = tH - 16 - (WBadge-14)
		end
		
		if not inSpecMode then dx = dx -10 end
		
		if mouseOn then
			if ctrlDown then
				gl.Color(1,1,1,a)
			else
				local gs 
				gs,_,_ = Spring.GetGameSpeed() or 1
				gl.Color(r-0.2*math.sin(10*t/gs),g-0.2*math.sin(10*t/gs),b,a)
			end
		else
			gl.Color(r,g,b,a)
		end
		gl.Texture(sideImage)
		gl.TexRect(
		widgetPosX + hOffset + dx,
		widgetPosY + widgetHeight - vOffset + dy,
		widgetPosX + hOffset + dx + w,
		widgetPosY + widgetHeight - vOffset + dy + h
		)
		gl.Color(1,1,1,1)
end

function DrawKillLabel(vOffset)
		--gl.Color(0.8,0.8,0.8,0.6)
		--gl.Texture(defImage)
		--gl.TexRect(widgetPosX+2, widgetPosY + widgetHeight -vOffset+17, widgetPosX + 16, widgetPosY + widgetHeight -vOffset+1)
		gl.Color(0.9,1,0.9,0.8)
		TextDraw("K:", widgetPosX + 2, widgetPosY + widgetHeight -vOffset+tH-62)

end

function DrawDeathLabel(vOffset)
		--gl.Color(0.8,0.8,0.8,0.6)
		--gl.Texture(defImage)
		--gl.TexRect(widgetPosX+52, widgetPosY + widgetHeight -vOffset+1, widgetPosX + 68, widgetPosY + widgetHeight -vOffset+17)
		gl.Color(1,0.9,0.9,0.8)
		TextDraw("L:", widgetPosX + widgetWidth -50, widgetPosY + widgetHeight -vOffset+tH-62)
end
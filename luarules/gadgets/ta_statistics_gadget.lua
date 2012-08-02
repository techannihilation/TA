function gadget:GetInfo()
  return {
    name      = "TA Statistics Master",
    desc      = "TBD",
    author    = "Finkky",
    date      = "Spring 2012",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

include("luaui/3rdpartylibs/sha1.lua")
include("luaui/3rdpartylibs/dumper.lua")
include("luaui/3rdpartylibs/jsonutils.lua")

local spSetTeamRulesParam = Spring.SetTeamRulesParam
local spGetConfigString = Spring.GetConfigString
local spGetConfigInt = Spring.GetConfigInt
local spGetLocalTeamID		= Spring.GetLocalTeamID
local spGetLocalPlayerID = Spring.GetLocalPlayerID
local spGetPlayerRoster = Spring.GetPlayerRoster
local spSendLuaRulesMsg     = Spring.SendLuaRulesMsg

local spGetTeamInfo = Spring.GetTeamInfo
local spGetTeamList = Spring.GetTeamList

local spGetPlayerInfo = Spring.GetPlayerInfo
local spGetPlayerList = Spring.GetPlayerList
local spGetAIInfo = Spring.GetAIInfo
local spGetAllyTeamList = Spring.GetAllyTeamList
local spGetTeamColor = Spring.GetTeamColor

local spGetModOptions = Spring.GetModOptions

local emptyStringInd = ""
local tauid = "@@@@@TA$UID@@@@@"
wd = "|"

local floor                 = math.floor

local playersInfo = {}
local gameID
local function dump(a1)
  Spring.Echo(DataDumper(a1, nil, false))
end

local function dumper(a1)
  return DataDumper(a1, nil, true)
end

function Dec2Hex(nValue)
	return string.format("%02X", floor(nValue * 255));
end

function getGameSetup()
	players = {}
	for k, v in pairs(spGetPlayerList()) do
		name, active, spectator, teamID, allyTeamID, _, _, country, rank = spGetPlayerInfo(v)
		player = {}
		player.name = name
		player.countryCode = country
		player.isActive = active
		player.isSpectator = spectator
		player.rank = rank
		player.playerID = v
		players[v] = player
	end
	
	teams = {}
	for k, v in pairs(spGetTeamList()) do
		teamID, playerID, isDead, isAiTeam, side, allyTeam  = spGetTeamInfo(v)
		team = {}
		team.teamID = teamID
		team.playerID = playerID
		team.isAi = isAiTeam
		team.side = side
		team.allyID = allyTeam
		
		R, G, B = spGetTeamColor(teamID)
		team.color = Dec2Hex(R)..Dec2Hex(G)..Dec2Hex(B)

		if isAiTeam then
			    skirmishAIID, name, hostingPlayerID, shortName = spGetAIInfo(teamID)
				team.aiName = shortName
		end
		teams[v] = team
	end
	
	local startingConditions = {}
	
	startingConditions.metal = spGetModOptions().startmetal 
	startingConditions.energy = spGetModOptions().startenergy
	startingConditions.gracePeriod = spGetModOptions().mo_graceperiod
	startingConditions.difficulty = spGetModOptions().mo_queendifficulty

	return {
			map = Game.mapName,
			modFamily = Game.modShortName,
			modVersion = Game.modVersion,
			springVersion = Game.version,
			startingConditions = startingConditions,
			senderTokenKey = spGetConfigString("TATokenKey", emptyStringInd),
			senderID = spGetLocalPlayerID(),
			players = players,
			teams = teams
		};
end

local function CheckSingleAllyVictoryEnd()
	if aliveAllyTeamCount ~= 1 then
		return false
	end

	-- find the last remaining allyteam
	for _,candidateWinner in ipairs(spGetAllyTeamList()) do
		if IsCandidateWinner(candidateWinner) then
			return {candidateWinner}
		end
	end

	return {}
end


if (gadgetHandler:IsSyncedCode()) then

function gadget:RecvLuaMsg(msg)

	msgParts = msg:split(wd)

	if(msgParts[1] == tauid) then
	
		local pnum = tonumber(msgParts[2])
		local prop = msgParts[3]
		
		if not gameID and prop == "gameID" then
			gameID = msgParts[4]
			return
		end
		
		if prop == "gameOver" then
			SendToUnsynced("MyGameOverCallin", msgParts[4])
			return
		end
		
		if not playersInfo[pnum] then
			playersInfo[pnum] = {}
		end
		playersInfo[pnum][prop] = msgParts[4]
	end
end

local function POSTDataSync (data)

	local electionWinner = -1;
	for _, k in ipairs(spGetPlayerList()) do
		if playersInfo[k] and playersInfo[k]["postmanCandidate"] and playersInfo[k]["postmanCandidate"] == "1" then
			--electionWinner = k
			--break;
			SendToUnsynced("POSTSetupCallin", dumper({playersInfo = playersInfo, gameID=gameID}), k)
		end
	end
end



local sendAfter = 32--32*60*5
function gadget:GameFrame(n)
	if n == sendAfter then
		POSTDataSync(tauid)
	end
end 


------------------------
else --UNSYNC
------------------------

local function generateCookie()
	local leaderName,_,_,_,_,_,_,country,rank = spGetPlayerInfo(spGetLocalPlayerID())
	return sha1(leaderName .. country)
end

local function validate(cookie) 
	--TODO
	return true
end

local function checkLocalSettings()

	local isCandidate = false
	if spGetConfigInt("LuaSocketEnabled", 0) == 1 then
		local tcpAllow = spGetConfigString("TCPAllowConnect", "")
		--Spring.Echo(tcpAllow)
		--match01 = tcpAllow:find("0.0.0.0:80", 1, true)
		match0 = tcpAllow:find("ta-backend.rhcloud.com:80", 1, true)
		--match03 = tcpAllow:find("174.129.95.204:80", 1, true) --DEV PPS
		--Spring.Echo(match02)
		isCandidate = match0
	end
	match11 = (spGetConfigString("TATokenKey", emptyStringInd) ~= emptyStringInd)
	match21 = (spGetConfigString("TATokenSecret", emptyStringInd) ~= emptyStringInd)
	
	isCandidate = isCandidate and match11 and match21
	
	spSendLuaRulesMsg(tauid..wd..spGetLocalPlayerID()..wd.."postmanCandidate"..wd..(isCandidate and 1 or 0))
end

local function checkCookie()
	local cookie = Spring.GetConfigString("TASessionCookie", emptyStringInd)
	if cookie == "Empty" or not validate(cookie) then
		cookie = generateCookie()
		Spring.SetConfigString("TASessionCookie", cookie)
	end
	spSendLuaRulesMsg(tauid..wd..spGetLocalPlayerID()..wd.."cookie"..wd..cookie)
end

local gameID

local function POSTSetup(_, serializedData, electionWinner)
	if (electionWinner ~= spGetLocalPlayerID()) then
		return 
	end
		
	gameSetup = getGameSetup()

	data = loadstring(serializedData)()

	local playersInfo = data.playersInfo
	gameID = data.gameID
	
	for _, k in ipairs(spGetPlayerList()) do
		if playersInfo[k] then
			gameSetup.players[k].cookie = playersInfo[k].cookie
			gameSetup.players[k].isPostCan = playersInfo[k].postmanCandidate and true or false
		end
	end

	gameSetup.gameID = gameID
	
	if (Script.LuaUI('newDataCallin')) then
		Script.LuaUI.newDataCallin("gamesetup", dumbLua2JSON(gameSetup), gameID)
	end
end

function POSTResult(gameResult)
	if (Script.LuaUI('newDataCallin')) then
		gameResult.gameID = gameID
		Script.LuaUI.newDataCallin("gameresult", dumbLua2JSON(gameResult), gameID)
	end
end

function MyGameOver(_, winnersArraySerialized)
	winnersArray = loadstring(winnersArraySerialized)()

	gameResult = {
			winners = winnersArray,
			framesDuration = Spring.GetGameFrame(),
			secondsDuration = Spring.GetGameSeconds(),
			senderTokenKey = spGetConfigString("TATokenKey", emptyStringInd),
			techLevel = 0
		}
	POSTResult(gameResult)
end

function gadget:Initialize()

  gadgetHandler:AddSyncAction('POSTSetupCallin', POSTSetup)
  gadgetHandler:AddSyncAction('MyGameOverCallin', MyGameOver)
  checkCookie()
  checkLocalSettings()
end



end



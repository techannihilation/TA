
function gadget:GetInfo()
	return {
		name	= 'Initial Spawn',
		desc	= 'Handles initial spawning of units',
		author	= 'Niobium',
		version	= 'v1.0',
		date	= 'April 2011',
		license	= 'GNU GPL, v2 or later',
		layer	= 0,
		enabled	= true
	}
end

-- Note: (31/03/13) mo_coop_II deals with the extra startpoints etc needed for teamsIDs with more than one playerID.

----------------------------------------------------------------
-- Synced
----------------------------------------------------------------
if gadgetHandler:IsSyncedCode() then

----------------------------------------------------------------
-- Speedups
----------------------------------------------------------------
local spGetPlayerInfo = Spring.GetPlayerInfo
local spGetTeamInfo = Spring.GetTeamInfo
local spGetTeamRulesParam = Spring.GetTeamRulesParam
local spSetTeamRulesParam = Spring.SetTeamRulesParam
local spGetTeamStartPosition = Spring.GetTeamStartPosition
local spGetAllyTeamStartBox = Spring.GetAllyTeamStartBox
local spCreateUnit = Spring.CreateUnit
local spGetGroundHeight = Spring.GetGroundHeight

----------------------------------------------------------------
-- Config
----------------------------------------------------------------
local changeStartUnitRegex = '^\138(%d+)$'
local startUnitParamName = 'startUnit'

----------------------------------------------------------------
-- Vars
----------------------------------------------------------------
local armcomDefID = UnitDefNames.armcom.id
local corcomDefID = UnitDefNames.corcom.id
local tllcomDefID = UnitDefNames.tllcom.id
local taloncomDefID = UnitDefNames.talon_com.id
local gokcomDefID = UnitDefNames.gok_com.id
local rumadcomDefID = UnitDefNames.rumad_com.id

local validStartUnits = {
    [armcomDefID] = true,
    [corcomDefID] = true,
    [tllcomDefID] = true,
    [taloncomDefID] = true,
	[gokcomDefID] = true,
	[rumadcomDefID] = true,
}

local superEco = {
	[UnitDefNames.talon_ufus.id] = 1,
	[UnitDefNames.ametalmakerlvl4.id] = 2,
}


local spawnTeams = {} -- spawnTeams[teamID] = allyID

--each player gets to choose a faction
local playerStartingUnits = {} -- playerStartingUnits[unitID] = unitDefID
GG.playerStartingUnits = playerStartingUnits

--each team gets one startpos. if coop mode is on, extra startpoints are placed in GG.coopStartPoints by mo_coop
local teamStartPoints = {} -- teamStartPoints[teamID] = {x,y,z}
GG.teamStartPoints = teamStartPoints
local startPointTable = {} --temporary, only for use within this gadget & its libs

local nAllyTeams
local allyTeams = {} --allyTeams[allyTeamID] is non-nil if this allyTeam will spawn at least one starting unit

local red = "\255\255\1\1"

local mapBlackList = {
	}

----------------------------------------------------------------
-- Start Point Guesser
----------------------------------------------------------------

include("luarules/gadgets/lib_startpoint_guesser.lua") --start point guessing routines

----------------------------------------------------------------
-- FFA Startpoints (modoption)
----------------------------------------------------------------

-- ffaStartPoints is "global"
local useFFAStartPoints = false
if (tonumber(Spring.GetModOptions().mo_noowner) or 0) == 1 then
    useFFAStartPoints = true
end


function GetFFAStartPoints()
    include("luarules/configs/ffa_startpoints/ffa_startpoints.lua") -- if we have a ffa start points config for this map, use it
    if not ffaStartPoints and VFS.FileExists("luarules/configs/ffa_startpoints.lua") then
        include("luarules/configs/ffa_startpoints.lua") -- if we don't have one, see if the map has one
    end
end

----------------------------------------------------------------
-- NewbiePlacer (modoption)
----------------------------------------------------------------

--Newbie Placer (prevents newbies from choosing their own a startpoint and faction)
local NewbiePlacer = false

--Disable noobplacer

--[[
local processedNewbies = false
if (tonumber((Spring.GetModOptions() or {}).mo_newbie_placer) == 1) and (Game.startPosType == 2) then
	NewbiePlacer = true
else
	NewbiePlacer = false
end
--]]

--check if a player is to be considered as a 'newbie', in terms of startpoint placements
function isPlayerNewbie(pID)
	local customtable
	local name,_,isSpec,tID,_,_,_,_,pRank = Spring.GetPlayerInfo(pID)
	playerRank = tonumber(pRank) or 0
	customtable = select(10,Spring.GetPlayerInfo(pID)) or {}
	local tsMu = tostring(customtable.skill) or ""
	local tsSigma = tonumber(customtable.skilluncertainty) or 3
	local isNewbie
	if pRank == 0 and (string.find(tsMu, ")") or tsSigma >= 3) then --rank 0 and not enough ts data
		isNewbie = true
	else
		isNewbie = false
	end
	return isNewbie
end

--a team is a newbie team if it contains at least one newbie player
function isNewbie(teamID)
	if not NewbiePlacer then return false end
	local playerList = Spring.GetPlayerList(teamID) or {}
	local isNewbie = false
	for _,playerID in pairs(playerList) do
		if playerID then
		local _,_,isSpec,_ = Spring.GetPlayerInfo(playerID)
			if not isSpec then
				isNewbie = isNewbie or isPlayerNewbie(playerID)
			end
		end
	end
	return isNewbie
end

----------------------------------------------------------------
-- NoCloseSpawns (modoption)
----------------------------------------------------------------

local NoCloseSpawns
local closeSpawnDist = 350
local mapx = Game.mapX
local mapz = Game.mapY -- misnomer in API
local smallmap = (mapx^2 + mapz^2 < 6^2) --TODO: improve this

if (tonumber(Spring.GetModOptions().mo_no_close_spawns) or 1) and (Game.startPosType ~= 2) and smallmap then --don't load if modoptions says not too or if start pos placement is not 'choose in game' or if map is small
	NoCloseSpawns = true
else
	NoCloseSpawns = false
end


----------------------------------------------------------------
-- Initialize
----------------------------------------------------------------
function gadget:Initialize()
	for _,mapname in ipairs(mapBlackList) do
		if (Game.mapName:find(mapname)) then
			Spring.Echo(red .. "ILLEGAL MAP/MOD DETECTED, ENDING GAME!!!!!!!!!!!!!!!!")
	 		Spring.GameOver({nil})
		end
	end
	local gaiaTeamID = Spring.GetGaiaTeamID()
	local teamList = Spring.GetTeamList()
	for i = 1, #teamList do
		local teamID = teamList[i]
		if teamID ~= gaiaTeamID then
			--set & broadcast (current) start unit
			local _, _, _, _, teamSide, teamAllyID = spGetTeamInfo(teamID)
			if teamSide == 'core' then
				spSetTeamRulesParam(teamID, startUnitParamName, corcomDefID)
			elseif teamSide == 'tll' then
				spSetTeamRulesParam(teamID, startUnitParamName, tllcomDefID)
			elseif teamSide == 'talon' then
				spSetTeamRulesParam(teamID, startUnitParamName, taloncomDefID)
			elseif teamSide == 'gok' then
				spSetTeamRulesParam(teamID, startUnitParamName, gokcomDefID)
			elseif teamSide == 'rumad' then
				spSetTeamRulesParam(teamID, startUnitParamName, rumadcomDefID)
			else
				spSetTeamRulesParam(teamID, startUnitParamName, armcomDefID)
			end
			spawnTeams[teamID] = teamAllyID

			--broadcast if newbie
			local newbieParam
			if isNewbie(teamID) then
				newbieParam = 1
			else
				newbieParam = 0
			end
			spSetTeamRulesParam(teamID, 'isNewbie', newbieParam, {public=true}) --visible to all; some widgets (faction choose, initial queue) need to know if its a newbie -> they unload

			--record that this allyteam will spawn something
			local _,_,_,_,_,allyTeamID = Spring.GetTeamInfo(teamID)
			allyTeams[allyTeamID] = allyTeamID
		end
	end
	processedNewbies = true

	-- count allyteams
	nAllyTeams = 0
	for k,v in pairs(allyTeams) do
		nAllyTeams = nAllyTeams + 1
	end

	-- count teams
    nSpawnTeams = 0
    for k,v in pairs(spawnTeams) do
        nSpawnTeams = nSpawnTeams + 1
    end

	-- create the ffaStartPoints table, if we need it & can get it
    if useFFAStartPoints then
        GetFFAStartPoints()
    end
	-- make the relevant part of ffaStartPoints accessible to all, if it is use-able
    if ffaStartPoints then
		GG.ffaStartPoints = ffaStartPoints[nAllyTeams] -- NOT indexed by allyTeamID
    end

	-- mark all players as 'not yet placed'
	local initState
	if Game.startPosType ~= 2 or ffaStartPoints then
		initState = -1 -- if players won't be allowed to place startpoints
	else
		initState = 0 -- players will be allowed to place startpoints
	end
	local playerList = Spring.GetPlayerList()
	for _,playerID in pairs(playerList) do
		Spring.SetGameRulesParam("player_" .. playerID .. "_readyState" , initState)
	end

end


----------------------------------------------------------------
-- Factions
----------------------------------------------------------------

-- keep track of choosing faction ingame
function gadget:RecvLuaMsg(msg, playerID)
	local startUnit = tonumber(msg:match(changeStartUnitRegex))
	if startUnit and validStartUnits[startUnit] then
		local _, _, playerIsSpec, playerTeam = spGetPlayerInfo(playerID)
		if not playerIsSpec then
			playerStartingUnits[playerID] = startUnit
			spSetTeamRulesParam(playerTeam, startUnitParamName, startUnit, {allied=true, public=false}) -- visible to allies only, set visible to all on GameStart
			return true
		end
	end
end


----------------------------------------------------------------
-- Startpoints
----------------------------------------------------------------

function gadget:AllowStartPosition(playerID, teamID, readyState, x, y, z, rx, ry, rz)
    -- readyState:

    -- 0: player did not place startpoint, is unready
    -- 1: game starting, player is ready
    -- 2: player pressed ready OR game is starting and player is forcibly readied (note: if the player chose a startpoint, reconnected and pressed ready without re-placing, this case will have the wrong x,z)
    -- 3: game forcestarted & player absent

	-- we also add the following
	-- -1: players will not be allowed to place startpoints; automatically readied once ingame
	--  4: player has placed a startpoint but is not yet ready

	-- communicate readyState to all
    Spring.SetGameRulesParam("player_" .. playerID .. "_readyState" , readyState)

    --[[
    -- for debugging
    local name,_,_,tID = Spring.GetPlayerInfo(playerID)
    Spring.Echo(name,tID,x,z,readyState, (startPointTable[tID]~=nil))
    Spring.MarkerAddPoint(x,y,z,name .. " " .. readyState)
	]]

	if Game.startPosType ~= 2 then return true end -- accept blindly unless we are in choose-in-game mode
	if useFFAStartPoints then return true end

	local _,_,_,teamID,allyTeamID,_,_,_,_,_ = Spring.GetPlayerInfo(playerID)
	if not teamID or not allyTeamID then return false end --fail

	-- NewbiePlacer
	if NewbiePlacer then
		if not processedNewbies then return false end
		if readyState == 0 and Spring.GetTeamRulesParam(teamID, 'isNewbie') == 1 then
			return false
		end
	end

	-- don't allow player to place startpoint unless its inside the startbox, if we have a startbox
	if allyTeamID == nil then return false end
	local xmin, zmin, xmax, zmax = spGetAllyTeamStartBox(allyTeamID)
	if xmin>=xmax or zmin>=zmax then
		return true
	else
		local isOutsideStartbox = (xmin+1 >= x) or (x >= xmax-1) or (zmin+1 >= z) or (z >= zmax-1) -- the engine rounds startpoints to integers but does not round the startbox (wtf)
		if isOutsideStartbox then
			return false
		end
	end

	-- NoCloseSpawns
	for otherTeamID,startpoint in pairs(startPointTable) do
		local sx,sz = startpoint[1],startpoint[2]
		local tooClose = ((x-sx)^2+(z-sz)^2 <= closeSpawnDist^2)
		local sameTeam = (teamID == otherTeamID)
		local _,_,_,_,_,otherAllyTeamID = Spring.GetTeamInfo(otherTeamID)
		local sameAllyTeam = (allyTeamID == otherAllyTeamID)
		if (sx>0) and tooClose and sameAllyTeam and not sameTeam then
			Spring.SendMessageToPlayer(playerID,"You cannot place your start position too close to another player")
			return false
		end
	end

	-- record table of starting points for startpoint assist to use
	if readyState == 2 then
        -- player pressed ready (we have already recorded their startpoint when they placed it) OR game was force started and player is forcibly readied
		if not startPointTable[teamID] then
            startPointTable[teamID]={-5000,-5000} -- if the player was forcibly readied without having placed a startpoint, place an invalid one far away (thats what the StartPointGuesser wants)
        end
    else
        -- player placed startpoint OR game is starting and player is ready
        startPointTable[teamID]={x,z}
		if readyState ~= 1 then
            -- game is not starting (therefore, player cannot yet have pressed ready)
            Spring.SetGameRulesParam("player_" .. playerID .. "_readyState" , 4)
            SendToUnsynced("StartPointChosen", playerID)
		end
	end

	return true
end


----------------------------------------------------------------
-- Spawning
----------------------------------------------------------------

function gadget:GameStart()

    -- ffa mode spawning
    if useFFAStartPoints and ffaStartPoints and ffaStartPoints[nAllyTeams] and #(ffaStartPoints[nAllyTeams])==nAllyTeams then
		-- cycle over ally teams and spawn starting units
        local allyTeamSpawn = SetPermutedSpawns(nAllyTeams, allyTeams)
			for teamID, allyTeamID in pairs(spawnTeams) do
            SpawnFFAStartUnit(nAllyTeams, allyTeamSpawn[allyTeamID], teamID)
			end
			return
		end

    -- use ffa mode startpoints for random spawning, if possible, but per team instead of per allyTeam
    if Game.startPosType==1 and ffaStartPoints and ffaStartPoints[nSpawnTeams] and #(ffaStartPoints[nSpawnTeams])==nSpawnTeams then
        local teamSpawn = SetPermutedSpawns(nSpawnTeams, spawnTeams)
        for teamID, allyTeamID in pairs(spawnTeams) do
            SpawnFFAStartUnit(nSpawnTeams, teamSpawn[teamID], teamID)
        end
        return
	end

	-- normal spawning (also used as fallback if ffaStartPoints fails)
	-- cycle through teams and call spawn team starting unit
	for teamID, allyTeamID in pairs(spawnTeams) do
		SpawnTeamStartUnit(teamID, allyTeamID)
	end
end

function SetPermutedSpawns(nSpawns, idsToSpawn)
    -- this function assumes that idsToSpawn is a hash table with nSpawns elements
    -- returns a bijective random map from key values of idsToSpawn to [1,...,nSpawns]

    -- first, construct a random permutation of [1,...,nSpawns] using a Knuth shuffle
	local perm = {}
    for i=1,nSpawns do
		perm[i] = i
	end
    for i=1,nSpawns-1 do
        local j = math.random(i,nSpawns)
		local temp = perm[i]
		perm[i] = perm[j]
		perm[j] = temp
	end

    local permutedSpawns = {}
	local slot = 1
    for id,_ in pairs(idsToSpawn) do
        permutedSpawns[id] = perm[slot]
		slot = slot + 1
	end
    return permutedSpawns
end

function SpawnFFAStartUnit(nSpawns, spawnID, teamID)
	-- get allyTeam start pos
    local startPos = ffaStartPoints[nSpawns][spawnID]
	local x = startPos.x
	local z = startPos.z

	-- get team start pos; randomly move slightly to make it look nicer and (w.h.p.) avoid coms in same place in team ffa
	local r = math.random(50,120)
	local theta = math.random(100) / 100 * 2 * math.pi
	local cx = x + r*math.cos(theta)
	local cz = z + r*math.sin(theta)
	if not IsSteep(cx,cz) then --IsSteep comes from lib_startpoint_guesser, returns true if pos is too steep for com to walk on
		x = cx
		z = cz
	end

	-- spawn
	SpawnStartUnit(teamID, x, z)
end


function SpawnTeamStartUnit(teamID, allyTeamID)
	local x,_,z = Spring.GetTeamStartPosition(teamID)
	local xmin, zmin, xmax, zmax = spGetAllyTeamStartBox(allyTeamID)

	-- if its choose-in-game mode, see if we need to autoplace anyone
	if Game.startPosType==2 then
		if ((not startPointTable[teamID]) or (startPointTable[teamID][1] < 0)) then
			-- guess points for the ones classified in startPointTable as not genuine (newbies will not have a genuine startpoint)
			x,z=GuessStartSpot(teamID, allyID, xmin, zmin, xmax, zmax, startPointTable)
		else
			--fallback
			if x<=0 or z<=0 then
				x = (xmin + xmax) / 2
				z = (zmin + zmax) / 2
			end
		end
	end

	--spawn
	SpawnStartUnit(teamID, x, z)
end


function SpawnStartUnit(teamID, x, z)
	--get starting unit
	local startUnit = spGetTeamRulesParam(teamID, startUnitParamName)

	--overwrite startUnit with random faction for newbies
	if Spring.GetTeamRulesParam(teamID, 'isNewbie') == 1 then
		if math.random() > 0.5 then
			startUnit = corcomDefID
		else
			startUnit = armcomDefID
		end
	end

	--spawn starting unit
	local y = spGetGroundHeight(x,z)
	spCreateUnit(startUnit, x, y, z, 0, teamID)
	if startUnit == rumadcomDefID then
		spCreateUnit(UnitDefNames["rumad_king"].id, x + 40, y, z + 40, 0, teamID)
	end

	--spawn halloween
	  -- spCreateUnit(UnitDefNames["halloween"].id, x + 40 * (-1 * math.random(0,1)), y, z + 40 * (-1 * math.random(0,1)), 0, teamID)

	--spawn Christmas
		-- spCreateUnit(UnitDefNames["xmas"].id, x + 60 * (-1), y, z + 60 * (-1), 0, teamID)


	--share info
	teamStartPoints[teamID] = {x,y,z}
	spSetTeamRulesParam(teamID, startUnitParamName, startUnit, {public=true}) -- visible to all (and picked up by advpllist)

	--team storage is set up by game_team_resources
end


function gadget:GameFrame()
    gadgetHandler:RemoveGadget(self)
end


----------------------------------------------------------------
-- Unsynced
else
----------------------------------------------------------------


local myPlayerID = Spring.GetMyPlayerID()
local _,_,spec,myTeamID = Spring.GetPlayerInfo(myPlayerID)
local amNewbie
local ffaMode = (tonumber(Spring.GetModOptions().mo_noowner) or 0) == 1
local readied = false --make sure we return true,true for newbies at least once
local startPointChosen = false

local NETMSG_STARTPLAYING = 4 -- see BaseNetProtocol.h, packetID sent during the 3.2.1 countdown
local SYSTEM_ID = -1 -- see LuaUnsyncedRead::GetPlayerTraffic, playerID to get hosts traffic from
local gameStarting
local timer = 0

local tackyfont = gl.LoadFont("luarules/fonts/LCD2U___.TTF",72, 1.9, 40)
local monofont = gl.LoadFont("luaui/fonts/instruction.ttf",72, 1.9, 40)

local vsx, vsy = Spring.GetViewGeometry()
function gadget:ViewResize()
  vsx,vsy = Spring.GetViewGeometry()
end

local readyH = 60
local readyW = 160
local readyX = vsx - 7 - (readyW)
local readyY = vsy * 0.84 - (readyH/2)

local imgTexCoordX = 1  --image texture coordinate X
local imgTexCoordY = 1	--image texture coordinate Y
local button = "luarules/images/glossy_button_blank_black_rectangle.png"

local pStates = {} --local copy of playerStates table

function gadget:Initialize()
	-- add function to receive when startpoints were chosen
	gadgetHandler:AddSyncAction("StartPointChosen", StartPointChosen)

	-- create ready button
	readyButton = gl.CreateList(function()
		--draw button
		gl.Color(1,1,1,0.6)
		gl.Texture( ":c:" .. button )
		gl.PushMatrix()
		gl.TexRect( readyX , readyY , readyX + readyW , readyY + readyH , 0.0, 0.0, imgTexCoordX, imgTexCoordY )
		gl.PopMatrix()

		gl.Texture(false)


		gl.Color(0,0,0,1)
		--gl.BeginEnd(GL.LINE_LOOP, function()
		--	gl.Vertex(readyX,readyY)
		--	gl.Vertex(readyX,readyY+readyH)
		--	gl.Vertex(readyX+readyW,readyY+readyH)
		--	gl.Vertex(readyX+readyW,readyY)
		--end)


		gl.Color(1,1,1,1)
	end)
end

function StartPointChosen(_,playerID)
	if playerID == myPlayerID then
		startPointChosen = true
		if not readied and Script.LuaUI("PlayerReadyStateChanged") then
			Script.LuaUI.PlayerReadyStateChanged(playerID, 4)
		end
	end
end

function gadget:GameSetup(state,ready,playerStates)
	-- check when the 3.2.1 countdown starts
	if gameStarting==nil and ((Spring.GetPlayerTraffic(SYSTEM_ID, NETMSG_STARTPLAYING) or 0) > 0) then --ugly but effective (can also detect by parsing state string)
		gameStarting = true
	end

	-- if we can't choose startpositions, no need for ready button etc
	if Game.startPosType ~= 2 or ffaMode then
		return true,true
	end

	-- notify LuaUI if readyStates have changed
	for playerID,readyState in pairs(playerStates) do
		if pStates[playerID] ~= readyState then
            if Script.LuaUI("PlayerReadyStateChanged") then
                if readyState == "ready" then
                    Script.LuaUI.PlayerReadyStateChanged(playerID, 1)
                elseif readyState == "missing" then
                    Script.LuaUI.PlayerReadyStateChanged(playerID, 3)
                else
                    Script.LuaUI.PlayerReadyStateChanged(playerID, 0) --unready
                end
            end
			pStates[playerID] = readyState
		end
	end

	-- set my readyState to true if i am a newbie, or if ffa
	if not readied or not ready then
		amNewbie = (Spring.GetTeamRulesParam(myTeamID, 'isNewbie') == 1)
		if amNewbie or ffaMode then
			readied = true
			return true, true
		end
	end

	if not ready and readied then -- check if we just readied
		ready = true
	elseif ready and not readied then	-- check if we just reconnected/dropped
		ready = false
	end

	return true, ready
end

function gadget:MousePress(sx,sy)
	-- pressing ready
	if sx > readyX and sx < readyX+readyW and sy > readyY and sy < readyY+readyH and Spring.GetGameFrame() <= 0 and Game.startPosType == 2 and gameStarting==nil and not spec then
		if startPointChosen then
			readied = true
			return true
		else
			Spring.Echo("Please choose a start point!")
		end
	end

	-- message when trying to place startpoint but can't
	if amNewbie then
		local target,_ = Spring.TraceScreenRay(sx,sy)
		if target == "ground" then
			Spring.Echo("In this match, newbies (rank 0) will have a faction and startpoint chosen for them!")
		end
	end
end

function gadget:MouseRelease(x,y)
	return false
end

function gadget:DrawScreen()
	if not readied and readyButton and Game.startPosType == 2 and gameStarting==nil and not spec then
		-- draw 'ready' button
		gl.CallList(readyButton)

		-- ready text
		local x,y = Spring.GetMouseState()
		if x > readyX and x < readyX+readyW and y > readyY and y < readyY+readyH then
			colorString = "\255\127\127\127"
		else
			colorString = "\255\001\001\001"
		end
		monofont:Print(colorString .. "Ready", readyX+8, readyY+12, 52, "o")
		gl.Color(1,1,1,1)
	end

	if gameStarting then
		timer = timer + Spring.GetLastUpdateSeconds()
		if timer % 0.75 <= 0.375 then
			colorString = "\255\255\255\255"
		else
			colorString = "\255\068\107\169"
		end
		local text = colorString .. "Game starting in " .. math.max(1,3-math.floor(timer)) .. " seconds..."
		monofont:Print(text, vsx*0.5 - gl.GetTextWidth(text)/2*48, vsy*0.50, 48, "o")
	end

	--remove if after gamestart
	if Spring.GetGameFrame() > 0 or Spring.IsReplay() then
		gadgetHandler:RemoveGadget()
		return
	end
end

----------------------------------------------------------------
end
----------------------------------------------------------------

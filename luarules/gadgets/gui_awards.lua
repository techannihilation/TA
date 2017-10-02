function gadget:GetInfo()
  return {
    name      = "Awards",
    desc      = "AwardsAwards",
    author    = "Bluestone",
    date      = "2013-07-06",
    license   = "GPLv2",
    layer     = -1, 
    enabled   = true -- loaded by default?
  }
end


if (gadgetHandler:IsSyncedCode()) then 

local SpAreTeamsAllied = Spring.AreTeamsAllied

local teamInfo = {}
local coopInfo = {}
local present = {}

local econUnitDefIDs = { --better to hardcode these since its complicated to pick them out with UnitDef properties
	--Powerplants
	UnitDefNames.aafus.id,
	UnitDefNames.afusionplant.id,
	UnitDefNames.amgeo.id,
	UnitDefNames.armadvsol.id,
	UnitDefNames.armckfus.id,
	UnitDefNames.armfor.id,
	UnitDefNames.armfus.id,
	UnitDefNames.armgeo.id,
	UnitDefNames.armgmm.id,
	UnitDefNames.armsolar.id,
	UnitDefNames.armtide.id,
	UnitDefNames.armuwfus.id,
	UnitDefNames.armuwfus1.id,
	UnitDefNames.armwin.id,
	UnitDefNames.cafus.id,
	UnitDefNames.cfusionplant.id,
	UnitDefNames.cmgeo.id,
	UnitDefNames.coradvsol.id,
	UnitDefNames.corbhmth.id,
	UnitDefNames.corbhmth1.id,
	UnitDefNames.corfus.id,
	UnitDefNames.corgeo.id,
	UnitDefNames.corsfus.id,
	UnitDefNames.corsolar.id,
	UnitDefNames.cortide.id,
	UnitDefNames.coruwfus.id,
	UnitDefNames.corwin.id,
	UnitDefNames.crnns.id,
	UnitDefNames.tlladvsolar.id,
	UnitDefNames.tllatidal.id,
	UnitDefNames.tllcoldfus.id,
	UnitDefNames.tllgeo.id,
	UnitDefNames.tllmedfusion.id,
	UnitDefNames.tllmegacoldfus.id,
	UnitDefNames.tllmohogeo.id,
	UnitDefNames.tllsolar.id,
	UnitDefNames.tllsolarns.id,
	UnitDefNames.tlltide.id,
	UnitDefNames.tlluwfusion.id,
	UnitDefNames.tllwindtrap.id,
	UnitDefNames.tllawindtrap.id,
	UnitDefNames.corawin.id,
	UnitDefNames.armawin.id,
	UnitDefNames.coratidal.id,
	UnitDefNames.armatidal.id,
	UnitDefNames.armlightfus.id,
	UnitDefNames.armuwlightfus.id,
	UnitDefNames.corlightfus.id,
	UnitDefNames.coruwlightfus.id,
	UnitDefNames.armgen.id,
	UnitDefNames.corgen.id,
	UnitDefNames.tllgen.id,
	UnitDefNames.tllgen.id,
	UnitDefNames.corgeo_mini.id,
	UnitDefNames.armgeo_mini.id,
	UnitDefNames.tllgeo_mini.id,
	UnitDefNames.armsolar.id,
	UnitDefNames.corsolar.id,
	UnitDefNames.crnns.id,
	UnitDefNames.tllsolar.id,
	UnitDefNames.tllsolarns.id,
	UnitDefNames.tlladvsolar.id,
	--Metal Makers
	UnitDefNames.armmakr.id,
	UnitDefNames.armfmkr.id,
	UnitDefNames.ametalmakerlvl1.id,
	UnitDefNames.armamaker.id,
	UnitDefNames.armckmakr.id,
	UnitDefNames.armmmkr.id,
	UnitDefNames.armuwmmm.id,
	UnitDefNames.ametalmakerlvl2.id,
	UnitDefNames.armgen.id,
	UnitDefNames.cormakr.id,
	UnitDefNames.corfmkr.id,
	UnitDefNames.cmetalmakerlvl1.id,
	UnitDefNames.coramaker.id,
	UnitDefNames.corhmakr.id,
	UnitDefNames.cormmkr.id,
	UnitDefNames.coruwmmm.id,
	UnitDefNames.cmetalmakerlvl2.id,
	UnitDefNames.corgen.id,
	UnitDefNames.tllmm.id,
	UnitDefNames.tllwmconv.id,
	UnitDefNames.tllammaker.id,
	UnitDefNames.tllwmmohoconv.id,
	UnitDefNames.tllgen.id,
}


function gadget:GameStart()
	--make table of teams eligible for awards
	local allyTeamIDs = Spring.GetAllyTeamList()
	local gaiaTeamID = Spring.GetGaiaTeamID()
	for i=1,#allyTeamIDs do
		local teamIDs = Spring.GetTeamList(allyTeamIDs[i])
		for j=1,#teamIDs do
			local _,_,_,isAiTeam = Spring.GetTeamInfo(teamIDs[j])
			local isLuaAI = (Spring.GetTeamLuaAI(teamIDs[j]) ~= "")
			local isGaiaTeam = (teamIDs[j] == gaiaTeamID)
			if ((not isAiTeam) and (not isLuaAi) and (not isGaiaTeam)) then
				local playerIDs = Spring.GetPlayerList(teamIDs[j])
				local numPlayers = 0
				for _,playerID in pairs(playerIDs) do
					local _,_,isSpec = Spring.GetPlayerInfo(playerID) 
					if not isSpec then 
						numPlayers = numPlayers + 1
					end
				end
				
				if numPlayers > 0 then
					present[teamIDs[j]] = true
					teamInfo[teamIDs[j]] = {ecoDmg=0, fightDmg=0, otherDmg=0, dmgDealt=0, ecoUsed=0, dmgRatio=0, ecoProd=0, lastKill=0, dmgRec=0, sleepTime=0, unitsCost=0, present=true,}
					coopInfo[teamIDs[j]] = {players=numPlayers,}
				else
					present[teamIDs[j]] = false
				end
			else
				present[teamIDs[j]] = false
			end
		end
	end
end

function isEcon(unitDefID) 
	--return true if unitDefID is an eco producer, false otherwise
	for _,id in pairs(econUnitDefIDs) do
		if unitDefID == id then
			return true
		end
	end
	return false
end

function gadget:UnitDestroyed(unitID, unitDefID, teamID, attackerID, attackerDefID, attackerTeamID)
	-- add destroyed unitID cost to stats for attackerTeamID
	if not attackerTeamID then return end
	if attackerTeamID == gaiaTeamID then return end
	if not present[attackerTeamID] then return end
	if (not unitDefID) or (not teamID) then return end
	if SpAreTeamsAllied(teamID, attackerTeamID) then return end
	
	--keep track of who didn't kill for longest (sleeptimes)
	local curTime = Spring.GetGameSeconds()
	if (curTime - teamInfo[attackerTeamID].lastKill > teamInfo[attackerTeamID].sleepTime) then
		teamInfo[attackerTeamID].sleepTime = curTime - teamInfo[attackerTeamID].lastKill
	end
	teamInfo[attackerTeamID].lastKill = curTime
	
	local ud = UnitDefs[unitDefID]
	local cost = ud.energyCost + 60 * ud.metalCost
	
	--keep track of killing 
	if #(ud.weapons) > 0 then
		teamInfo[attackerTeamID].fightDmg = teamInfo[attackerTeamID].fightDmg + cost
	elseif isEcon(unitDefID) then
		teamInfo[attackerTeamID].ecoDmg = teamInfo[attackerTeamID].ecoDmg + cost
	else
		teamInfo[attackerTeamID].otherDmg = teamInfo[attackerTeamID].otherDmg + cost --currently not using this but recording it for interest
	end		
	--Spring.Echo(teamInfo[attackerTeamID].fightDmg, teamInfo[attackerTeamID].ecoDmg, teamInfo[attackerTeamID].otherDmg)
end

function gadget:UnitCreated(unitID, unitDefID, teamID, builderID)
    if not teamID then return end
    if teamID==gaiaTeamID then return end
    if not present[teamID] then return end
    if not unitDefID then return end
    
    local ud = UnitDefs[unitDefID]
	local cost = ud.energyCost + 60 * ud.metalCost
    
    if #(ud.weapons) > 0 and not ud.customParams.iscommander then
        teamInfo[teamID].unitsCost = teamInfo[teamID].unitsCost + cost   
    end
    --Spring.Echo(teamID, teamInfo[teamID].unitsCost)
end

function gadget:UnitTaken(unitID, unitDefID, teamID, newTeam)
	if not newTeam then return end 
    if newTeam==gaiaTeamID then return end
	if not present[newTeam] then return end
    if not present[teamID] then return end
	if not unitDefID then return end --should never happen

	local ud = UnitDefs[unitDefID]
	local cost = ud.energyCost + 60 * ud.metalCost

	teamInfo[newTeam].ecoUsed = teamInfo[newTeam].ecoUsed + cost 
    if #(ud.weapons) > 0 then
        teamInfo[teamID].unitsCost = teamInfo[teamID].unitsCost + cost   
    end
end


function gadget:GameOver(winningAllyTeams)
	--calculate average damage dealt
	local avgTeamDmg = 0 
	local numTeams = 0
	for teamID,_ in pairs(teamInfo) do
		local cur_max = Spring.GetTeamStatsHistory(teamID)
		local stats = Spring.GetTeamStatsHistory(teamID, 0, cur_max)
		avgTeamDmg = avgTeamDmg + stats[cur_max].damageDealt / coopInfo[teamID].players
		numTeams = numTeams + 1
	end
	avgTeamDmg = avgTeamDmg / (math.max(1,numTeams))
	
	--get other stuff from engine stats
	for teamID,_ in pairs(teamInfo) do
		local cur_max = Spring.GetTeamStatsHistory(teamID)
		local stats = Spring.GetTeamStatsHistory(teamID, 0, cur_max)
		teamInfo[teamID].dmgDealt = teamInfo[teamID].dmgDealt + stats[cur_max].damageDealt	
		teamInfo[teamID].ecoUsed = teamInfo[teamID].ecoUsed + stats[cur_max].energyUsed + 60 * stats[cur_max].metalUsed
		if teamInfo[teamID].unitsCost > 175000 and teamInfo[teamID].dmgDealt >= 0.75 * avgTeamDmg then 
			teamInfo[teamID].dmgRatio = teamInfo[teamID].dmgDealt / teamInfo[teamID].unitsCost * 100
		else
			teamInfo[teamID].dmgRatio = 0
		end
		teamInfo[teamID].dmgRec = stats[cur_max].damageReceived
		teamInfo[teamID].ecoProd = stats[cur_max].energyProduced + 60 * stats[cur_max].metalProduced
	end

	--take account of coop
	for teamID,_ in pairs(teamInfo) do
		teamInfo[teamID].ecoDmg = teamInfo[teamID].ecoDmg / coopInfo[teamID].players
		teamInfo[teamID].fightDmg = teamInfo[teamID].fightDmg / coopInfo[teamID].players
		teamInfo[teamID].otherDmg = teamInfo[teamID].otherDmg / coopInfo[teamID].players
		teamInfo[teamID].dmgRec = teamInfo[teamID].dmgRec / coopInfo[teamID].players 
		teamInfo[teamID].dmgRatio = teamInfo[teamID].dmgRatio / coopInfo[teamID].players
	end
	
	
	--award awards
	local ecoKillAward, ecoKillAwardSec, ecoKillAwardThi, ecoKillScore, ecoKillScoreSec, ecoKillScoreThi = -1,-1,-1,0,0,0
	local fightKillAward, fightKillAwardSec, fightKillAwardThi, fightKillScore, fightKillScoreSec, fightKillScoreThi = -1,-1,-1,0,0,0
	local effKillAward, effKillAwardSec, effKillAwardThi, effKillScore, effKillScoreSec, effKillScoreThi = -1,-1,-1,0,0,0
	local ecoAward, ecoScore = -1,0
	local dmgRecAward, dmgRecScore = -1,0
	local sleepAward, sleepScore = -1,0
	for teamID,_ in pairs(teamInfo) do	
		--deal with sleep times
		local curTime = Spring.GetGameSeconds()
		if (curTime - teamInfo[teamID].lastKill > teamInfo[teamID].sleepTime) then
			teamInfo[teamID].sleepTime = curTime - teamInfo[teamID].lastKill
		end
		--eco killing award
		if ecoKillScore < teamInfo[teamID].ecoDmg then
			ecoKillScoreThi = ecoKillScoreSec
			ecoKillAwardThi = ecoKillAwardSec
			ecoKillScoreSec = ecoKillScore
			ecoKillAwardSec = ecoKillAward
			ecoKillScore = teamInfo[teamID].ecoDmg
			ecoKillAward = teamID
		elseif ecoKillScoreSec < teamInfo[teamID].ecoDmg then
			ecoKillScoreThi = ecoKillScoreSec
			ecoKillAwardThi = ecoKillAwardSec
			ecoKillScoreSec = teamInfo[teamID].ecoDmg
			ecoKillAwardSec = teamID
		elseif ecoKillScoreThi < teamInfo[teamID].ecoDmg then
			ecoKillScoreThi = teamInfo[teamID].ecoDmg
			ecoKillAwardThi = teamID		
		end
		--fight killing award
		if fightKillScore < teamInfo[teamID].fightDmg then
			fightKillScoreThi = fightKillScoreSec
			fightKillAwardThi = fightKillAwardSec
			fightKillScoreSec = fightKillScore
			fightKillAwardSec = fightKillAward
			fightKillScore = teamInfo[teamID].fightDmg
			fightKillAward = teamID
		elseif fightKillScoreSec < teamInfo[teamID].fightDmg then
			fightKillScoreThi = fightKillScoreSec
			fightKillAwardThi = fightKillAwardSec
			fightKillScoreSec = teamInfo[teamID].fightDmg
			fightKillAwardSec = teamID
		elseif fightKillScoreThi < teamInfo[teamID].fightDmg then
			fightKillScoreThi = teamInfo[teamID].fightDmg
			fightKillAwardThi = teamID		
		end
		--efficiency ratio award
		if effKillScore < teamInfo[teamID].dmgRatio then
			effKillScoreThi = effKillScoreSec
			effKillAwardThi = effKillAwardSec
			effKillScoreSec = effKillScore
			effKillAwardSec = effKillAward
			effKillScore = teamInfo[teamID].dmgRatio 
			effKillAward = teamID
		elseif effKillScoreSec < teamInfo[teamID].dmgRatio then
			effKillScoreThi = effKillScoreSec
			effKillAwardThi = effKillAwardSec
			effKillScoreSec = teamInfo[teamID].dmgRatio 
			effKillAwardSec = teamID
		elseif effKillScoreThi < teamInfo[teamID].dmgRatio then
			effKillScoreThi = teamInfo[teamID].dmgRatio 
			effKillAwardThi = teamID		
		end
		
		--eco prod award
		if ecoScore < teamInfo[teamID].ecoProd then
			ecoScore = teamInfo[teamID].ecoProd
			ecoAward = teamID		
		end
		--most damage rec award
		if dmgRecScore < teamInfo[teamID].dmgRec then
			dmgRecScore = teamInfo[teamID].dmgRec
			dmgRecAward = teamID		
		end
		--longest sleeper award
		if sleepScore < teamInfo[teamID].sleepTime and teamInfo[teamID].sleepTime > 12*60 then
			sleepScore = teamInfo[teamID].sleepTime
			sleepAward = teamID		
		end
	end	
	
	--is the cow awarded?
	local cowAward = -1
	if ecoKillAward ~= -1 and (ecoKillAward == fightKillAward) and (fightKillAward == effKillAward) and ecoKillAward ~= -1 then --check if some team got all the awards
		if winningAllyTeams and winningAllyTeams[1] then
			local won = false
			local _,_,_,_,_,cowAllyTeamID = Spring.GetTeamInfo(ecoKillAward)
			for _,allyTeamID in pairs(winningAllyTeams) do
				if cowAllyTeamID == allyTeamID then --check if this team won the game
					cowAward = ecoKillAward 
					break
				end
			end
		end
	end

	
	--tell unsynced
	SendToUnsynced("ReceiveAwards", ecoKillAward, ecoKillAwardSec, ecoKillAwardThi, ecoKillScore, ecoKillScoreSec, ecoKillScoreThi, 
									fightKillAward, fightKillAwardSec, fightKillAwardThi, fightKillScore, fightKillScoreSec, fightKillScoreThi, 
									effKillAward, effKillAwardSec, effKillAwardThi, effKillScore, effKillScoreSec, effKillScoreThi, 
									ecoAward, ecoScore, 
									dmgRecAward, dmgRecScore, 
									sleepAward, sleepScore,
									cowAward)
	
end




-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
else  -- UNSYNCED
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

local glCreateList = gl.CreateList
local glCallList = gl.CallList
local glDeleteList = gl.DeleteList
local glBeginEnd = gl.BeginEnd
local glPushMatrix = gl.PushMatrix
local glPopMatrix = gl.PopMatrix
local glTranslate = gl.Translate
local glColor = gl.Color
local glScale = gl.Scale
local glVertex = gl.Vertex
local glRect = gl.Rect
local glTexture = gl.Texture
local glTexRect = gl.TexRect
local GL_LINE_LOOP = GL.LINE_LOOP
local glText = gl.Text


local widgetScale = 1
local vsx, vsy = Spring.GetViewGeometry()
local bgcorner = ":n:LuaRules/Images/bgcorner.png"

local drawAwards = false 
local cx,cy --coords for center of screen
local bx,by --coords for top left hand corner of box
local w = 800 
local h = 500
local bgMargin = 6

--h = 520-bgMargin-bgMargin
--w = 1050-bgMargin-bgMargin

local Background
local FirstAward
local SecondAward
local ThirdAward
local CowAward
local OtherAwards

local red = "\255"..string.char(171)..string.char(51)..string.char(51)
local blue = "\255"..string.char(51)..string.char(51)..string.char(151)
local green = "\255"..string.char(51)..string.char(151)..string.char(51)
local white = "\255"..string.char(251)..string.char(251)..string.char(251)
local yellow = "\255"..string.char(251)..string.char(251)..string.char(11)
local quitColour  
local graphColour

local playerListByTeam = {} --does not contain specs
local myPlayerID = Spring.GetMyPlayerID()



function gadget:Initialize()
	--register actions to SendToUnsynced messages
	gadgetHandler:AddSyncAction("ReceiveAwards", ProcessAwards)	
	
	--for testing
	--FirstAward = CreateAward('fuscup',0,'Destroying enemy resource production', white, 1,1,1,24378,1324,132,100) 
	--SecondAward = CreateAward('bullcup',0,'Destroying enemy units and defences',white, 1,1,1,24378,1324,132,200) 
	--ThirdAward = CreateAward('comwreath',0,'Effective use of resources',white,1,1,1,24378,1324,132,300) 
	--CowAward = CreateAward('cow',1,'Doing everything',white,1,1,1,24378,1324,132,400) 	
	--OtherAwards = CreateAward('',2,'',white,1,1,1,3,100,1000,400)

	--load a list of players for each team into playerListByTeam
	local teamList = Spring.GetTeamList()
	for _,teamID in pairs(teamList) do
		local playerList = Spring.GetPlayerList(teamID)
		local list = {} --without specs
		for _,playerID in pairs(playerList) do
			local name, _, isSpec = Spring.GetPlayerInfo(playerID)
			if not isSpec then
				table.insert(list, name)
			end
		end
		playerListByTeam[teamID] = list
	end
	
	
end


--[[function gadget:ViewResize(viewSizeX, viewSizeY)
	vsx,vsy = viewSizeX,viewSizeY
	if drawAwards then
		
	end
end
]]--


function ProcessAwards(_,ecoKillAward, ecoKillAwardSec, ecoKillAwardThi, ecoKillScore, ecoKillScoreSec, ecoKillScoreThi, 
						fightKillAward, fightKillAwardSec, fightKillAwardThi, fightKillScore, fightKillScoreSec, fightKillScoreThi, 
						effKillAward, effKillAwardSec, effKillAwardThi, effKillScore, effKillScoreSec, effKillScoreThi, 
						ecoAward, ecoScore, 
						dmgRecAward, dmgRecScore, 
						sleepAward, sleepScore,
						cowAward)

	--fix geometry
	vsx,vsy = Spring.GetViewGeometry()
    cx = vsx/2 
    cy = vsy/2 
	bx = cx - w/2
	by = cy - h/2 - 50
	
    --record who won which awards in chat message (for demo parsing by replays.springrts.com)
	--make all values positive, as unsigned ints are easier to parse
	local ecoKillLine    = '\161' .. tostring(1+ecoKillAward) .. ':' .. tostring(ecoKillScore) .. '\161' .. tostring(1+ecoKillAwardSec) .. ':' .. tostring(ecoKillScoreSec) .. '\161' .. tostring(1+ecoKillAwardThi) .. ':' .. tostring(ecoKillScoreThi)  
	local fightKillLine  = '\162' .. tostring(1+fightKillAward) .. ':' .. tostring(fightKillScore) .. '\162' .. tostring(1+fightKillAwardSec) .. ':' .. tostring(fightKillScoreSec) .. '\162' .. tostring(1+fightKillAwardThi) .. ':' .. tostring(fightKillScoreThi)
	local effKillLine    = '\163' .. tostring(1+effKillAward) ..  ':' .. tostring(effKillScore) .. '\163' .. tostring(1+effKillAwardSec) .. ':' .. tostring(effKillScoreSec) .. '\163' .. tostring(1+effKillAwardThi) .. ':' .. tostring(effKillScoreThi)
	local otherLine      = '\164' .. tostring(1+cowAward) .. '\165' ..  tostring(1+ecoAward) .. ':' .. tostring(ecoScore).. '\166' .. tostring(1+dmgRecAward) .. ':' .. tostring(dmgRecScore) ..'\167' .. tostring(1+sleepAward) .. ':' .. tostring(sleepScore)
	local awardsMsg = ecoKillLine .. fightKillLine .. effKillLine .. otherLine
	Spring.SendLuaRulesMsg(awardsMsg)
  
	--create awards
	CreateBackground()
	FirstAward = CreateAward('fuscup',0,'Destroying enemy resource production', white, ecoKillAward, ecoKillAwardSec, ecoKillAwardThi, ecoKillScore, ecoKillScoreSec, ecoKillScoreThi, 100) 
	SecondAward = CreateAward('bullcup',0,'Destroying enemy units and defences',white, fightKillAward, fightKillAwardSec, fightKillAwardThi, fightKillScore, fightKillScoreSec, fightKillScoreThi, 200) 
	ThirdAward = CreateAward('comwreath',0,'Efficient use of units',white,effKillAward, effKillAwardSec, effKillAwardThi, effKillScore, effKillScoreSec, effKillScoreThi, 300) 
	if cowAward ~= -1 then
		CowAward = CreateAward('cow',1,'Doing everything',white, ecoKillAward, 1,1,1,1,1, 400) 	
	else
		OtherAwards = CreateAward('',2,'',white, ecoAward, dmgRecAward, sleepAward, ecoScore, dmgRecScore, sleepScore, 400)		
	end
	drawAwards = true
	
	--don't show graph
	Spring.SendCommands('endgraph 0')	
end


local function DrawRectRound(px,py,sx,sy,cs, tl,tr,br,bl)
	
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
	
	-- bottom left
	if ((py <= 0 or px <= 0)  or (bl ~= nil and bl == 0)) and bl ~= 2   then o = 0.5 else o = offset end
	gl.TexCoord(o,o)
	gl.Vertex(px, py, 0)
	gl.TexCoord(o,1-o)
	gl.Vertex(px+cs, py, 0)
	gl.TexCoord(1-o,1-o)
	gl.Vertex(px+cs, py+cs, 0)
	gl.TexCoord(1-o,o)
	gl.Vertex(px, py+cs, 0)
	-- bottom right
	if ((py <= 0 or sx >= vsx) or (br ~= nil and br == 0)) and br ~= 2   then o = 0.5 else o = offset end
	gl.TexCoord(o,o)
	gl.Vertex(sx, py, 0)
	gl.TexCoord(o,1-o)
	gl.Vertex(sx-cs, py, 0)
	gl.TexCoord(1-o,1-o)
	gl.Vertex(sx-cs, py+cs, 0)
	gl.TexCoord(1-o,o)
	gl.Vertex(sx, py+cs, 0)
	-- top left
	if ((sy >= vsy or px <= 0) or (tl ~= nil and tl == 0)) and tl ~= 2   then o = 0.5 else o = offset end
	gl.TexCoord(o,o)
	gl.Vertex(px, sy, 0)
	gl.TexCoord(o,1-o)
	gl.Vertex(px+cs, sy, 0)
	gl.TexCoord(1-o,1-o)
	gl.Vertex(px+cs, sy-cs, 0)
	gl.TexCoord(1-o,o)
	gl.Vertex(px, sy-cs, 0)
	-- top right
	if ((sy >= vsy or sx >= vsx)  or (tr ~= nil and tr == 0)) and tr ~= 2   then o = 0.5 else o = offset end
	gl.TexCoord(o,o)
	gl.Vertex(sx, sy, 0)
	gl.TexCoord(o,1-o)
	gl.Vertex(sx-cs, sy, 0)
	gl.TexCoord(1-o,1-o)
	gl.Vertex(sx-cs, sy-cs, 0)
	gl.TexCoord(1-o,o)
	gl.Vertex(sx, sy-cs, 0)
end
function RectRound(px,py,sx,sy,cs, tl,tr,br,bl)		-- (coordinates work differently than the RectRound func in other widgets)
	gl.Texture(":n:LuaRules/Images/bgcorner.png")
	gl.BeginEnd(GL.QUADS, DrawRectRound, px,py,sx,sy,cs, tl,tr,br,bl)
	gl.Texture(false)
end


function CreateBackground()	
	if Background then
		glDeleteList(Background)
	end
	
	if (WG ~= nil and WG['guishader_api'] ~= nil) then
		WG['guishader_api'].InsertRect(math.floor(bx), math.floor(by), math.floor(bx + w), math.floor(by + h),'awards')
	end
	
	Background = glCreateList(function()
		-- background
		gl.Color(0,0,0,0.8)
		RectRound(bx-bgMargin, by-bgMargin, bx + w+bgMargin, by + h+bgMargin, 8)
		-- content area
		gl.Color(0.33,0.33,0.33,0.15)
		RectRound(bx, by, bx + w, by + h, 6)
		
		glColor(1,1,1,1)
		glTexture(':l:LuaRules/Images/awards.png')
		glTexRect(bx + w/2 - 220, by + h - 75, bx + w/2 + 120, by + h - 5)
		
		glText('Score', bx + w/2 + 275, by + h - 65, 15, "o") 
	
	end)	
end

function colourNames(teamID)
		if teamID < 0 then return "" end
    	nameColourR,nameColourG,nameColourB,nameColourA = Spring.GetTeamColor(teamID)
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

function round(num, idp)
  return string.format("%." .. (idp or 0) .. "f", num)
end


function FindPlayerName(teamID)
	local plList = playerListByTeam[teamID]
	local name 
	if plList[1] then
		name = plList[1]
		if #plList > 1 then
			name = name .. " (coop)"
		end
	else
		name = "(unknown)"
	end

	return name
end

function CreateAward(pic, award, note, noteColour, winnerID, secondID, thirdID, winnerScore, secondScore, thirdScore, offset)
	local winnerName, secondName, thirdName
	
	--award is: 0 for a normal award, 1 for the cow award, 2 for the no-cow awards
	
	if winnerID >= 0 then
		winnerName = FindPlayerName(winnerID)
	else
		winnerName = "(not awarded)"
	end
	
	if secondID >= 0 then
		secondName = FindPlayerName(secondID)
	else
		secondName = "(not awarded)"
	end
	
	if thirdID >= 0 then
		thirdName = FindPlayerName(thirdID)
	else
		thirdName = "(not awarded)"
	end
		
	thisAward = glCreateList(function()

		--names
		if award ~= 2 then	--if its a normal award or a cow award
			glColor(1,1,1,1)
			local pic = ':l:LuaRules/Images/' .. pic ..'.png'
			glTexture(pic)
			glTexRect(bx + 12, by + h - offset - 70, bx + 108, by + h - offset + 25)

			glText(colourNames(winnerID) .. winnerName, bx + 120, by + h - offset - 10, 20, "o")
			glText(noteColour .. note, bx + 120, by + h - offset - 50, 16, "o") 
		else --if the cow is not awarded, we replace it with minor awards (just text)
			local heightoffset = 0
			if winnerID >=0 then
				glText(colourNames(winnerID) .. winnerName .. white .. ' produced the most resources (' .. math.floor(winnerScore) .. ').', bx + 70, by + h - offset - 10 - heightoffset, 14, "o")
				heightoffset = heightoffset + 17
			end
			if secondID >= 0 then
				glText(colourNames(secondID) .. secondName .. white .. ' took the most damage (' .. math.floor(secondScore) .. ').', bx + 70, by + h - offset - 10 - heightoffset, 14, "o")
				heightoffset = heightoffset + 17
			end
			if thirdID >= 0 then
				glText(colourNames(thirdID) .. thirdName .. white .. ' slept longest, for ' .. math.floor(thirdScore/60) .. ' minutes.', bx + 70, by + h - offset - 10 - heightoffset, 14, "o")
			end
		end
		
		--scores
		if award == 0 then --normal awards			
			if winnerID >= 0 then
				if pic == 'comwreath' then winnerScore = round(winnerScore, 2) else winnerScore = math.floor(winnerScore) end 
				glText(colourNames(winnerID) .. winnerScore, bx + w/2 + 275, by + h - offset - 5, 14, "o")
			else
				glText('-', bx + w/2 + 275, by + h - offset - 5, 17, "o")			
			end
			glText('Runners up:', bx + 500, by + h - offset - 5, 14, "o")

			if secondScore > 0 then
				if pic == 'comwreath' then secondScore = round(secondScore, 2) else secondScore = math.floor(secondScore) end 
				glText(colourNames(secondID) .. secondName, bx + 520, by + h - offset - 25, 14, "o")
				glText(colourNames(secondID) .. secondScore, bx + w/2 + 275, by + h - offset - 25, 14, "o")
			end
			
			if thirdScore > 0 then
				if pic == 'comwreath' then thirdScore = round(thirdScore, 2) else thirdscore = math.floor (thirdScore) end
				glText(colourNames(thirdID) .. thirdName, bx + 520, by + h - offset - 45, 14, "o")
				glText(colourNames(thirdID) .. thirdScore, bx + w/2 + 275, by + h - offset - 45, 14, "o")
			end
		end
		
		--extra text for cow award
		if award == 1 then 
			glText(yellow .. 'Memorial WarCow', bx+9, by+15, 12, "o")
		end
	
	end)
	
	return thisAward
end



local quitX = 100
local graphsX = 250

function gadget:MousePress(x,y,button)
	if button ~= 1 then return end
	if drawAwards then
		x,y = correctMouseForScaling(x,y)
		if (x > bx+w-quitX-5) and (x < bx+w-quitX+16*gl.GetTextWidth('Quit')+5) and (y>by+50-5) and (y<by+50+16+5) then --quit button
			Spring.SendCommands("quitforce")
		end
		if (x > bx+w-graphsX-5) and (x < bx+w-graphsX+16*gl.GetTextWidth('Show Graphs')+5) and (y>by+50-5) and (y<by+50+16+5) then
			Spring.SendCommands('endgraph 1')
			if (WG ~= nil and WG['guishader_api'] ~= nil) then
				WG['guishader_api'].RemoveRect('awards')
			end
			drawAwards = false
		end	
	end
end

function correctMouseForScaling(x,y)
	x = x - (((x/vsx)-0.5) * vsx)*((widgetScale-1)/widgetScale)
	y = y - (((y/vsy)-0.5) * vsy)*((widgetScale-1)/widgetScale)
	return x,y
end

function gadget:DrawScreen()

	if not drawAwards then return end
	
  vsx,vsy = Spring.GetViewGeometry()
  widgetScale = (0.75 + (vsx*vsy / 7500000))
  
	glPushMatrix()
		glTranslate(-(vsx * (widgetScale-1))/2, -(vsy * (widgetScale-1))/2, 0)
		glScale(widgetScale, widgetScale, 1)
		
		if Background then
			glCallList(Background)
		end 
		
		if FirstAward and SecondAward and ThirdAward then
			glCallList(FirstAward)
			glCallList(SecondAward)
			glCallList(ThirdAward)
		end
		
		if CowAward then
			glCallList(CowAward)
		elseif OtherAwards then
			glCallList(OtherAwards)
		end
		
		--draw buttons, wastefully, but it doesn't matter now game is over
		local x1,y1 = Spring.GetMouseState()
		local x,y = correctMouseForScaling(x1,y1)
		
		if (x > bx+w-quitX-5) and (x < bx+w-quitX+16*gl.GetTextWidth('Quit')+5) and (y>by+50-5) and (y<by+50+16+5) then
			quitColour = "\255"..string.char(201)..string.char(51)..string.char(51)
		else
			quitColour = "\255"..string.char(201)..string.char(201)..string.char(201)
		end
		if (x > bx+w-graphsX-5) and (x < bx+w-graphsX+16*gl.GetTextWidth('Show Graphs')+5) and (y>by+50-5) and (y<by+50+16+5) then
			graphColour = "\255"..string.char(201)..string.char(51)..string.char(51)
		else
			graphColour = "\255"..string.char(201)..string.char(201)..string.char(201)
		end
		glText(quitColour .. 'Quit', bx+w-quitX, by+50, 16, "o")
		glText(graphColour .. 'Show Graphs', bx+w-graphsX, by+50, 16, "o")	
	glPopMatrix()
end



function gadget:Shutdown()
	Spring.SendCommands('endgraph 1')
	if (WG ~= nil and WG['guishader_api'] ~= nil) then
		WG['guishader_api'].RemoveRect('awards')
	end
end

end

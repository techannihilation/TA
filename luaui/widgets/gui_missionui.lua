
function widget:GetInfo()
	return {
		name      = 'Mission UI',
		desc      = 'Handles mission briefing, mission cycling and intro screen',
		author    = 'Deadnight Warrior',
		date      = '30 May 2013',
		license   = 'GNU LGPL v2',
		layer     = -6,
		enabled   = true,
	}
end

--------------------------------------------------------------------------------
-- Speedups
--------------------------------------------------------------------------------
local modOptions = Spring.GetModOptions()
local spSendLuaRulesMsg = Spring.SendLuaRulesMsg
local spGetUnitDefID = Spring.GetUnitDefID
local spGetUnitHealth = Spring.GetUnitHealth
local spGetUnitExperience = Spring.GetUnitExperience
local spValidUnitID = Spring.ValidUnitID

local spGetGameSpeed = Spring.GetGameSpeed
local spGetGameFrame = Spring.GetGameFrame
local spGetGameSeconds = Spring.GetGameSeconds
local spGetViewGeometry = Spring.GetViewGeometry

local glColor = gl.Color
local glRect = gl.Rect
local glTexRect = gl.TexRect
local glPushMatrix = gl.PushMatrix
local glPopMatrix = gl.PopMatrix
local glTranslate = gl.Translate
local glBeginText = gl.BeginText
local glEndText = gl.EndText
local glText = gl.Text
local glTexture = gl.Texture

local max = math.max
local floor = math.floor

local gameData, briefing = {}, {}
local msgQueue = {}
local campaignData, bonUnits = {}, {}
local victory, defeat, endTime = false, false, 0
local cmpgNotSent = true
local intro, hovMission, selMission, sndVolume = false, 0, nil, Spring.GetConfigInt("snd_volmaster", 60)
local commander, startScript
local missionList = VFS.DirList("Missions", Game.modShortName:lower() .. "_*.txt")
local nameStart = string.len("Missions/" .. Game.modShortName .. "_") + 1
local missScreen = {}

for i=1, #missionList do
	missScreen[i] = missionList[i]:sub(nameStart,-5):gsub("_", " ")
	missScreen[i] = missScreen[i]:sub(1,1):upper() .. missScreen[i]:sub(2)
end

local dispBrief = false
local X, Y = spGetViewGeometry()
local X_2, scale = X*0.5, Y/1200
local fs = 23 * scale
local lef, rig, top, bot = (X-Y*1.333*.8)*0.5, (X+Y*1.333*.8)*0.5, .9*Y, .1*Y
local okL, okR, okT, okB = X_2-2*fs, X_2+2*fs, bot+3*fs, bot+fs
local iAlpha = 1

local defCmpgData = {
[[campaignData = {
	lastMission = "]],
[[",
	currentMission = "]],
[[",
	bonusUnits = {
]],
[[	},
}
return campaignData]]
}

local function SetBonusUnits(unitID)
	bonUnits[#bonUnits+1] = unitID
end

function widget:ViewResize(viewSizeX, viewSizeY)
	X, Y = spGetViewGeometry()
	X_2, scale = X*0.5, Y/1200
	fs = 23 * scale
	lef, rig, top, bot = (X-Y*1.333*.8)*0.5, (X+Y*1.333*.8)*0.5, .9*Y, .1*Y
	okL, okR, okT, okB = X_2-2*fs, X_2+2*fs, bot+3*fs, bot+fs
end

function widget:Initialize()
	if modOptions and modOptions.mission then
		local mission = "Missions/" .. modOptions.mission ..".lua"
		if VFS.FileExists(mission) then
			gameData, _, _, _, briefing = VFS.Include(mission)
			if gameData.game == Game.modShortName then
				if gameData.map ~= Game.mapName then
					widgetHandler:RemoveWidget()
				else
					if modOptions.mission:lower() == Game.modShortName:lower() .. "_campaign" then
						intro = true
						Spring.SetConfigInt("snd_volmaster", sndVolume/3)
						--widgetHandler:RemoveWidget("XTA Unit sounds")
						--widgetHandler:RemoveWidget("SelectionButtons")
						--widgetHandler:RemoveWidget("BuildBar - XTA")
						--widgetHandler:RemoveWidget("UnitGroups v5.1 - XTA")	
					else
						intro = false
						widgetHandler:RegisterGlobal("SetBonusUnits", SetBonusUnits)
						cmpgNotSent, campaignData = pcall(include,"Config/" .. gameData.game .."_campaign.lua")
						if briefing then
							dispBrief = true
						end
					end
				end
			else
				widgetHandler:RemoveWidget()				
			end
		else
			widgetHandler:RemoveWidget()
		end
	else
		widgetHandler:RemoveWidget()
	end
end

function widget:GameStart()
	if briefing and dispBrief then
		local _, _, paused = spGetGameSpeed()
		if not paused then
			Spring.SendCommands("pause")
		end
	end
end

function widget:Update(t)
	if intro then
		iAlpha = max(0.75, 1 - spGetGameFrame()/480)
	else
		if endTime>0 and (Spring.GetGameSeconds()-endTime>5) then
			if startScript then
				Spring.Restart("", startScript)
			else
				intro = true
			end
		end
	end
end

function widget:Shutdown()
	Spring.SetConfigInt("snd_volmaster", sndVolume)
end

function widget:GameOver()
	if intro then return end
	local amIDead = select(3, Spring.GetTeamInfo(Spring.GetMyTeamID()))
	if amIDead==false then
		if gameData.nextMission then
			local nextMission = "Missions/" .. gameData.nextMission ..".txt"
			if VFS.FileExists(nextMission) then
				local file = io.open("LuaUI/Config/" .. gameData.game .. "_campaign.lua","w")
				file:write(defCmpgData[1] .. modOptions.mission .. defCmpgData[2] .. gameData.nextMission .. defCmpgData[3])
				for _, unitID in pairs(bonUnits) do
					if spValidUnitID(unitID) then
						local h, _, _, _, _ = spGetUnitHealth(unitID)
						if h>0 then
							file:write('\t\t"' .. UnitDefs[spGetUnitDefID(unitID)].name .. " " .. spGetUnitExperience(unitID) .. '"\n')
						end
					end
				end
				file:write(defCmpgData[4])
				file:flush()
				file:close()
				startScript = VFS.LoadFile(nextMission)
			end
		end
		victory = true
		endTime = Spring.GetGameSeconds()
		Spring.PlaySoundFile("sounds/victory2.wav")
	else
		defeat = true
		startScript = VFS.LoadFile("Missions/" .. modOptions.mission ..".txt")
		endTime = Spring.GetGameSeconds()
	end
end

local mouseOverOK = false
function widget:IsAbove(x, y)
	if intro then
		if x>lef+fs and x<rig-fs and y<top*0.75 and y>bot+fs then
			hovMission = floor((top*0.75-y)/(fs+2))
		else
			hovMission = 0
		end
	end
	if (dispBrief or intro) and y>okB and y<okT and x>okL and x<okR then
		mouseOverOK = true
	else	
		mouseOverOK = false
	end
end

function widget:MousePress(mx, my, mButton)
	if mButton==1 then
		if intro then
			if missionList[hovMission] then
				selMission = hovMission
			elseif mouseOverOK and selMission~=nil then
				startScript = VFS.LoadFile(missionList[selMission]:sub(1,-5) .. ".txt")
				Spring.SetConfigInt("snd_volmaster", sndVolume)
				Spring.Restart("", startScript)
			end
		else
			if mouseOverOK then
				dispBrief = false
				widgetHandler:RemoveCallIn("IsAbove")
				widgetHandler:RemoveCallIn("MousePress")
				local _, _, paused = Spring.GetGameSpeed()
				if paused then
					Spring.SendCommands("pause")
				end
			end
		end
	end
end

function widget:DrawScreen()
	if intro then
		glColor(0,0,0,iAlpha)
		glRect(0,0,X,Y)
		if iAlpha<=0.75 then
			glColor(0,0,0,0.75)
			glRect(lef,bot,rig,top)
			if missionList[hovMission] then
				glColor(0.2,0.2,0.2,0.75)
				glRect(lef+fs,top*0.75-hovMission*(fs+2)-fs,rig-fs,top*0.75-hovMission*(fs+2)+1)
			end
			if mouseOverOK then
				glColor(0.2,0.2,0.2,0.75)
				glRect(okL,okB,okR,okT)
			end
			glColor(1.0,1.0,1.0,1.0)
			glTexture("luaui/images/xtalogo.tga")
			glTexRect(X_2-244*scale, top-272*scale, X_2+244*scale, top)	
			glBeginText()
			for i=1, #missScreen do
				if i==selMission then
					glText('\255\255\255\51' .. missScreen[i], X_2, top*0.75-i*(fs+2)-fs, fs, "cd")
				else
					glText(missScreen[i], X_2, top*0.75-i*(fs+2)-fs, fs, "cd")
				end
			end
			glText("OK",X_2,bot+fs*1.4,fs,"cd")
			glEndText()
		end
	else
		if dispBrief then
			glColor(0,0,0,0.92)
			glRect(lef,bot,rig,top)
			if mouseOverOK then
				glColor(0.2,0.2,0.2,0.75)
				glRect(okL,okB,okR,okT)
			end
			glBeginText()
				for i=1, #briefing, 1 do
					if briefing[i]:sub(1,1)=="$" then
						if briefing[i]:sub(2,2)=="c" then
							glText(briefing[i]:sub(3), X_2, top-i*(fs+2)-fs, fs, "cd")
						elseif briefing[i]:sub(2,2)=="r" then
							glText(briefing[i]:sub(3), rig-fs, top-i*(fs+2)-fs, fs, "rd")
						else
							glText(briefing[i], lef+fs, top-i*(fs+2)-fs, fs, "d")
						end
					else
						glText(briefing[i], lef+fs, top-i*(fs+2)-fs, fs, "d")
					end
				end
				glText("OK",X_2,bot+fs*1.4,fs,"cd")
			glEndText()
		elseif victory then
			glColor(1.0,1.0,1.0,1.0)
			glText("Victory", X_2, Y*0.5, 4*fs, "cvo")
		elseif defeat then
			glColor(0.6,0.0,0.0,1.0)
			glText("Defeat", X_2, Y*0.5, 4*fs, "cvo")
		end
		if cmpgNotSent then
			if modOptions.mission == campaignData.currentMission then
				local bu = campaignData.bonusUnits
				local mt = " " .. tostring(Spring.GetMyTeamID())
				for i=1, #bu do
					spSendLuaRulesMsg("XTA_cmpg " .. bu[i] .. mt)
				end
				campaignData.bonusUnits = {}
				cmpgNotSent = false
			end
		end
	end
end
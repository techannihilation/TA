
function widget:GetInfo()
	return {
		name      = "Mouse Over Unit Stats",
		desc      = "Shows detailed unit stats",
		author    = "Niobium, Nixtux",
		date      = "Jan 11, 2009",
		version   = 1.6,
		license   = "GNU GPL, v2 or later",
		layer     = -9999999999,
		enabled   = true,  --  loaded by default?
	}
end

include("keysym.h.lua")
---- 1.6
-- Rework widget to show stats only on mouseover buildicons and morph icons
-- Remove mass
-- Show buildoptions and costs

---- v1.5
-- Add large icon

---- v1.4 changes
-- Remove Corner Crap
-- Update to all info shown in TechA version

---- v1.3 changes
-- Fix for 87.0
-- Added display of experience effect (when experience >25%)

---- v1.2 changes
-- Fixed drains for burst weapons (Removed 0.125 minimum)
-- Show remaining costs for units under construction

---- v1.1 changes
-- Added extra text to help explain numbers
-- Added grouping of duplicate weapons
-- Added sonar radius
-- Fixed radar/jammer detection
-- Fixed stockpiling unit drains
-- Fixed turnrate/acceleration scale
-- Fixed very low reload times

------------------------------------------------------------------------------------
-- Globals
------------------------------------------------------------------------------------
local fontSize = 14
local xOffset = 25
local yOffset = 25
local useSelection = true

local customFontSize = 16

local cX, cY

local DAMAGE_PERIOD ,weaponInfo = VFS.Include('LuaRules/Configs/area_damage_defs.lua', nil, VFS.RAW_FIRST)

local pplants = {
	["aafus"] = true,
	["afusionplant"] = true,
	["amgeo"] = true,
	["armadvsol"] = true,
	["armckfus"] = true,
	["armfor"] = true,
	["armfus"] = true,
	["armgeo"] = true,
	["armgmm"] = true,
	["armsolar"] = true,
	["armtide"] = true,
	["armuwfus"] = true,
	["armuwfus1"] = true,
	["armwin"] = true,
	["cafus"] = true,
	["cfusionplant"] = true,
	["cmgeo"] = true,
	["coradvsol"] = true,
	["corbhmth"] = true,
	["corbhmth1"] = true,
	["corfus"] = true,
	["corgeo"] = true,
	["corsfus"] = true,
	["corsolar"] = true,
	["cortide"] = true,
	["coruwfus"] = true,
	["corwin"] = true,
	["crnns"] = true,
	["tlladvsolar"] = true,
	["tllatidal"] = true,
	["tllcoldfus"] = true,
	["tllgeo"] = true,
	["tllmedfusion"] = true,
	["tllmegacoldfus"] = true,
	["tllmohogeo"] = true,
	["tllsolar"] = true,
	["tllsolarns"] = true,
	["tlltide"] = true,
	["tlluwfusion"] = true,
	["tllwindtrap"] = true,
	["tllawindtrap"] = true,
	["corawin"] = true,
	["armawin"] = true,
	["coratidal"] = true,
	["armatidal"] = true,
	["armlightfus"] = true,
	["armuwlightfus"] = true,
	["corlightfus"] = true,
	["coruwlightfus"] = true,
	["armgen"] = true,
	["corgen"] = true,
	["tllgen"] = true,
	["tllgen"] = true,
	["corgeo_mini"] = true,
	["armgeo_mini"] = true,
	["tllgeo_mini"] = true,
	["armsolar"] = true,
	["corsolar"] = true,
	["crnns"] = true,
	["tllsolar"] = true,
	["tllsolarns"] = true,
	["tlladvsolar"] = true,
}

local cbackground, cborder = include("Configs/ui_config.lua")
local triggered = nil

local update = 1.5
local uDefID
------------------------------------------------------------------------------------
-- Speedups
------------------------------------------------------------------------------------

local white = '\255\255\255\255'
local green = "\255\001\255\001"
local red = '\255\255\001\001'
local yellow = '\255\255\255\1'
local orange = '\255\255\128\1'
local blue = '\255\128\128\255'

local metalColor = '\255\48\48\128'
local energyColor = '\255\255\255\128' -- Light yellow
local buildColor = '\255\128\255\128' -- Light green

local simSpeed = Game.gameSpeed

local max = math.max
local floor = math.floor
local ceil = math.ceil
local format = string.format
local char = string.char

local glColor = gl.Color
local glText = gl.Text
local glRect = gl.Rect

local spGetMyTeamID = Spring.GetMyTeamID
local spGetTeamResources = Spring.GetTeamResources
local spGetTeamInfo = Spring.GetTeamInfo
local spGetPlayerInfo = Spring.GetPlayerInfo
local spGetTeamColor = Spring.GetTeamColor

local spGetModKeyState = Spring.GetModKeyState
local spGetMouseState = Spring.GetMouseState
local spTraceScreenRay = Spring.TraceScreenRay
local spGetSelectedUnits = Spring.GetSelectedUnits
local spGetSelectedUnitsCount	= Spring.GetSelectedUnitsCount

local spGetUnitDefID = Spring.GetUnitDefID
local spGetUnitExp = Spring.GetUnitExperience
local spGetUnitHealth = Spring.GetUnitHealth
local spGetUnitTeam = Spring.GetUnitTeam
local spGetUnitExperience = Spring.GetUnitExperience
local spGetUnitSensorRadius = Spring.GetUnitSensorRadius
local spGetUnitWeaponState = Spring.GetUnitWeaponState

local tidalStrength = Game.tidal
local windMin = Game.windMin
local windMax = Game.windMax

local uDefs = UnitDefs
local wDefs = WeaponDefs

local triggerKey = KEYSYMS.SPACE

local myTeamID = Spring.GetMyTeamID
local spGetTeamRulesParam = Spring.GetTeamRulesParam
local spGetTooltip = Spring.GetCurrentTooltip

local vsx, vsy = Spring.GetViewGeometry()

local maxWidth = 0
local textBuffer = {}
local textBufferCount = 0

local textDistance = 15
local startTimer = Spring.GetTimer()

------------------------------------------------------------------------------------
-- Functions
------------------------------------------------------------------------------------


function RectRound(px,py,sx,sy,cs)
	local px,py,sx,sy,cs = math.floor(px),math.floor(py),math.floor(sx),math.floor(sy),math.floor(cs)
	gl.Rect(px+cs, py, sx-cs, sy)
end

local function DrawText(t1, t2)
	textBufferCount = textBufferCount + 1
	textBuffer[textBufferCount] = {t1,t2,cX,cY}
	cY = cY - fontSize
	maxWidth = max(maxWidth, (gl.GetTextWidth(t1)*fontSize), (gl.GetTextWidth(t2)*fontSize)+(fontSize*textDistance))
end

local function DrawTextBuffer()
	local num = #textBuffer
	for i=1, num do
		glText(textBuffer[i][1], textBuffer[i][3], textBuffer[i][4], fontSize, "o")
		glText(textBuffer[i][2], textBuffer[i][3] + (fontSize*textDistance), textBuffer[i][4], fontSize, "o")
	end
end

local function GetTeamColorCode(teamID)

	if not teamID then return "\255\255\255\255" end

	local R, G, B = spGetTeamColor(teamID)

	if not R then return "\255\255\255\255" end

	R = floor(R * 255)
	G = floor(G * 255)
	B = floor(B * 255)

	if (R < 11) then R = 11	end -- Note: char(10) terminates string
	if (G < 11) then G = 11	end
	if (B < 11) then B = 11	end

	return "\255" .. char(R) .. char(G) .. char(B)
end

local function GetTeamName(teamID)

	if not teamID then return 'Error:NoTeamID' end

	local _, teamLeader = spGetTeamInfo(teamID)
	if not teamLeader then return 'Error:NoLeader' end

	local leaderName = spGetPlayerInfo(teamLeader)
	return leaderName or 'Error:NoName'
end

local guishaderEnabled = false	-- not a config var
function RemoveGuishader()
	if guishaderEnabled and WG['guishader_api'] ~= nil then
		WG['guishader_api'].RemoveRect('unit_stats_title')
		WG['guishader_api'].RemoveRect('unit_stats_data')
		guishaderEnabled = false
	end
end

------------------------------------------------------------------------------------
-- Code
------------------------------------------------------------------------------------

function widget:Initialize()
	init()
end

function widget:Shutdown()
	RemoveGuishader()
end

function init()
	vsx, vsy = gl.GetViewSizes()
	fontSize = customFontSize * (0.55 + (vsx*vsy / 8500000))
	
	bgcornerSize = fontSize*0.45
	bgpadding = fontSize*0.9
	xOffset = 250
	yOffset = -250
end

function widget:ViewResize(x,y)
	init()
end

local timeCounter = math.huge -- force the first update


function widget:Update(deltaTime)
  if (timeCounter < update) then
    timeCounter = timeCounter + deltaTime
    return
  end

  timeCounter = 0
	local text = Spring.GetCurrentTooltip()
	local expMorphPat = "UnitDefID (%d+)\n"
	uDefID = tonumber(text:match(expMorphPat)) or nil
	local OrderID = WG["cmdID"] or nil
	if OrderID  and OrderID < 0 then
		OrderID = math.abs(OrderID)
		uDefID = OrderID
	end
end

function widget:DrawScreen()
	if triggered == nil then
		if cbackground[4] == 0.54321 then
			cbackground[4]=WG["background_color"]
		end
	triggered = true
	end
	
	if uDefID then
		local time = Spring.DiffTimers(Spring.GetTimer(), startTimer)
		--Spring.Echo(startTimer,time)
  		if time < 1.5 then return end
	end

	if not uDefID then 
		RemoveGuishader()
		startTimer = Spring.GetTimer()
	return end

	local mx, my = spGetMouseState()

	local uDef = uDefs[uDefID]

	local uMaxHp = uDef.health

	maxWidth = 0

	cX = (vsx*.05) + xOffset
	cY = vsy + (yOffset*.5)
	cYstart = cY
	
	local text = yellow .. uDef.humanName .. white .. "    " .. uDef.name
	
	local cornersize = 0
	glColor(0,0,0,0.73)
	RectRound(cX-bgpadding+cornersize, cY-bgpadding+cornersize, cX+(gl.GetTextWidth(text)*fontSize)+bgpadding-cornersize, cY+(fontSize/2)+bgpadding-cornersize, bgcornerSize)
	cornersize = ceil(bgpadding*0.21)
	glColor(1,1,1,0.025)
	RectRound(cX-bgpadding+cornersize, cY-bgpadding+cornersize, cX+(gl.GetTextWidth(text)*fontSize)+bgpadding-cornersize, cY+(fontSize/2)+bgpadding-cornersize, bgcornerSize)
	
	if (WG['guishader_api'] ~= nil) then
		guishaderEnabled = true
		WG['guishader_api'].InsertRect(cX-bgpadding, cY-bgpadding, cX+(gl.GetTextWidth(text)*fontSize)+bgpadding, cY+(fontSize/2)+bgpadding, 'unit_stats_title')
	end
	
	glColor(1.0, 1.0, 1.0, 1.0)
	glText(text, cX, cY, fontSize, "o")
	cY = cY - 2 * fontSize
	textBuffer = {}
	textBufferCount = 0

	if(WG.energyConversion) then
		local makerTemp = WG.energyConversion.convertCapacities[uDefID]
		local curAvgEffi = spGetTeamRulesParam(myTeamID(), 'mmAvgEffi')
		local avgCR = 0.015
		if(makerTemp) then 
			DrawText(orange .. "Metal maker properties", '')
			DrawText("M-             .:", makerTemp.c)
			DrawText("M-Effi.:", format('%.2f m / 1000 e', makerTemp.e * 1000))
			cY = cY - fontSize
		end

		if pplants[uDef.name] then
		-- Powerplants 
			DrawText(orange .. "Powerplant properties", '')
			DrawText("CR is metal maker conversion rate", '')
			
			local totalEOut = uDef.energyMake
			
			if (uDef.tidalGenerator > 0 and tidalStrength > 0) then
			    local mult = 1 -- DEFAULT
			    if uDef.customParams then
					mult = uDef.customParams.energymultiplier or mult
			    end
				totalEOut = totalEOut +(tidalStrength * mult)
			end
			
			if (uDef.windGenerator > 0) then
				local mult = 1 -- DEFAULT
			    if uDef.customParams then
					mult = uDef.customParams.energymultiplier or mult
			    end
				
				local unitWindMin = math.min(windMin, uDef.windGenerator)
				local unitWindMax = math.min(windMax, uDef.windGenerator)
				totalEOut = totalEOut + (((unitWindMin + unitWindMax) / 2 ) * mult)
			end
			
			DrawText("Avg. E-Out.:", totalEOut)
			DrawText("M-Cost.:", uDef.metalCost)
			
			DrawText("Avg-Effi.:", format('%.2f%% e / (m + e * avg. CR) ', totalEOut * 100 / (uDef.metalCost + uDef.energyCost * avgCR)))
			if(curAvgEffi>0) then
				DrawText("Curr-Effi.:", format('%.2f%% e / (m + e * curr. CR) ', totalEOut * 100 / (uDef.metalCost + uDef.energyCost * curAvgEffi)))
			end
			cY = cY - fontSize
		end
			
		if not (#uDef.weapons>0) or uDef.isBuilding or pplants[uDef.name] then
			if ((uDef.extractsMetal and uDef.extractsMetal  > 0) or (uDef.metalMake and uDef.metalMake > 0) or (uDef.energyMake and uDef.energyMake>0) or (uDef.tidalGenerator and uDef.tidalGenerator > 0)  or (uDef.windGenerator and uDef.windGenerator > 0)) then
			-- Powerplants 
				--DrawText(metalColor .. "Total metal generation efficiency", '')
				DrawText(metalColor .. "Estimated time of recovering 100% of cost:", '')
				
				local totalMOut = uDef.metalMake or 0
				local totalEOut = uDef.energyMake or 0
				
				if (uDef.extractsMetal and uDef.extractsMetal  > 0) then
					local metalExtractor = {inc = 0, out = 0, passed= false}
					local tooltip = spGetTooltip()
					string.gsub(tooltip, 'Metal: ....%d+%.%d', function(x) string.gsub(x, "%d+%.%d", function(y) metalExtractor.inc = tonumber(y); end) end)
					string.gsub(tooltip, 'Energy: ....%d+%.%d+..../....-%d+%.%d+', function(x) string.gsub(x, "%d+%.%d", function(y) if (metalExtractor.passed) then metalExtractor.out = tonumber(y); else metalExtractor.passed = true end; end) end)
					
					totalMOut = totalMOut + metalExtractor.inc
					totalEOut = totalEOut -  metalExtractor.out
				end
				
				if (uDef.tidalGenerator > 0 and tidalStrength > 0) then
					  local mult = 1 -- DEFAULT
					  if uDef.customParams then
						mult = uDef.customParams.energymultiplier or mult
					  end
					  
					totalEOut = totalEOut + tidalStrength * mult
				end
				
				if (uDef.windGenerator > 0) then
				
					  local mult = 1 -- DEFAULT
					  if uDef.customParams then
						mult = uDef.customParams.energymultiplier or mult
					  end
				
					local unitWindMin = math.min(windMin, uDef.windGenerator)
					local unitWindMax = math.min(windMax, uDef.windGenerator)
					totalEOut = totalEOut + ((unitWindMin + unitWindMax) / 2) * mult
				end
		
				if(totalEOut * avgCR + totalMOut > 0) then
				
					local avgSec = (uDef.metalCost + uDef.energyCost * avgCR)/(totalEOut * avgCR + totalMOut)
					local currSec = (uDef.metalCost + uDef.energyCost * curAvgEffi)/(totalEOut * curAvgEffi + totalMOut)
				
					DrawText('Average: ', format('%i sec (%i min %i sec)', avgSec, avgSec/60, avgSec%60))
					if(curAvgEffi>0) then
						DrawText('Current: ', format('%i sec (%i min %i sec)', currSec, currSec/60, currSec%60))
					end
				else
					DrawText('Average: ', "Unknown")
				end
				cY = cY - fontSize
			end
		end
	end

	------------------------------------------------------------------------------------
	-- Generic information, cost, move, class
	------------------------------------------------------------------------------------
	
	--DrawText('Height:', uDefs[spGetUnitDefID(uID)].height)
				
	DrawText("Cost:", format(metalColor .. '%d' .. white .. ' / ' ..
							energyColor .. '%d' .. white .. ' / ' ..
							buildColor .. '%d', uDef.metalCost, uDef.energyCost, uDef.buildTime)
			)

	if not (uDef.isBuilding or uDef.isFactory) then
		DrawText("Move:", format("%.1f / %.1f / %.0f (Speed / Accel / Turn)", uDef.speed, 900 * uDef.maxAcc, simSpeed * uDef.turnRate * (180 / 32767)))
	end

	cY = cY - fontSize

	-- Buildoptions
	if uDef.buildOptions and #uDef.buildOptions > 0 then
		
		DrawText("Buildoption:","")
		for i=1, #uDef.buildOptions do
    		buildDefID = uDef.buildOptions[i] 
    		local bDef = uDefs[buildDefID]
    		DrawText(bDef.humanName, format(metalColor .. '%d' .. white .. ' / ' ..
							energyColor .. '%d' .. white .. ' / ' ..
							buildColor .. '%d', bDef.metalCost, bDef.energyCost, bDef.buildTime))
    		index = 0
    	end
	end

	cY = cY - fontSize

	if uDef.buildSpeed > 0 then	DrawText('Build:', yellow .. uDef.buildSpeed) end
	if uDef.buildDistance > 0 then DrawText("B Dist:", format(yellow .. "%d", uDef.buildDistance)) end
	if (uDef.repairSpeed > 0 and uDef.repairSpeed ~= uDef.buildSpeed) then DrawText("Repair:", format(yellow .. "%d", uDef.repairSpeed)) end
	if (uDef.reclaimSpeed > 0 and uDef.reclaimSpeed ~= uDef.buildSpeed) then DrawText("Reclaim:", format(yellow .. "%d", uDef.reclaimSpeed)) end
	if (uDef.resurrectSpeed > 0 and uDef.resurrectSpeed ~= uDef.buildSpeed) then DrawText("Resurrect:", format(yellow .. "%d", uDef.resurrectSpeed)) end
	if (uDef.captureSpeed > 0 and uDef.captureSpeed ~= uDef.buildSpeed) then DrawText("Capture:", format(yellow .. "%d", uDef.captureSpeed)) end
	if (uDef.terraformSpeed > 0 and uDef.terraformSpeed ~= uDef.buildSpeed) then DrawText("Capture:", format(yellow .. "%d", uDef.terraformSpeed)) end

	if uDef.isTransport and uDef.transportMass > 0 then DrawText("Transporter Max Mass:", format(orange .. "%d", uDef.transportMass)) end

	cY = cY - fontSize

	------------------------------------------------------------------------------------
	-- Sensors and Jamming
	------------------------------------------------------------------------------------
	
	if uDef.stealth then DrawText("Other:", "Stealth") end

	cY = cY - fontSize

	------------------------------------------------------------------------------------
	-- Armor
	------------------------------------------------------------------------------------

	DrawText("Armor:", "Class " .. Game.armorTypes[uDef.armorType or 0] or '???')

	local maxHP = uDef.health
	if ctrl then
		maxHP = uMaxHp
	end
	DrawText("Open:", format("maxHP: %d", maxHP) )
	if uDef.armoredMultiple ~= 1 then DrawText("Closed:", format(" +%d%%, maxHP: %d", (1/uDef.armoredMultiple-1) *100,maxHP/uDef.armoredMultiple)) end

	cY = cY - fontSize

	------------------------------------------------------------------------------------
	-- Weapons
	------------------------------------------------------------------------------------
	local wepCounts = {} -- wepCounts[wepDefID] = #
	local wepsCompact = {} -- uWepsCompact[1..n] = wepDefID

	local uWeps = uDef.weapons
	local weaponNums = {}
	for i = 1, #uWeps do
		local wDefID = uWeps[i].weaponDef
		local wCount = wepCounts[wDefID]
		if wCount then
			wepCounts[wDefID] = wCount + 1
		else
			wepCounts[wDefID] = 1
			wepsCompact[#wepsCompact + 1] = wDefID
			weaponNums[#wepsCompact] = i
		end
	end
	local selfDWeaponID = WeaponDefNames[uDef.selfDExplosion].id
	local deathWeaponID = WeaponDefNames[uDef.deathExplosion].id
	local selfDWeaponIndex
	local deathWeaponIndex

	if shift then
		wepCounts = {}
		wepsCompact = {}
		wepCounts[selfDWeaponID] = 1
		wepCounts[deathWeaponID] = 1
		deathWeaponIndex = #wepsCompact+1
		wepsCompact[deathWeaponIndex] = deathWeaponID
		selfDWeaponIndex = #wepsCompact+1
		wepsCompact[selfDWeaponIndex] = selfDWeaponID
	end

	for i = 1, #wepsCompact do

		local wDefId = wepsCompact[i]
		local uWep = wDefs[wDefId]

		if uWep.range > 16 and not uWep.name:find("teleport",1,true) then

			local oBurst = uWep.salvoSize * uWep.projectiles
			local oRld = max(1/30,uWep.stockpile and uWep.stockpileTime or uWep.reload)
			if useExp and not (uWep.stockpile and uWep.stockpileTime) then
				oRld = spGetUnitWeaponState(uID,weaponNums[i] or -1,"reloadTime") or oRld
			end
			local wepCount = wepCounts[wDefId]

			local typeName =  uWep.type
			if i == deathWeaponIndex then
				typeName = "Death explosion"
				oRld = 1
			elseif i == selfDWeaponIndex then
				typeName = "Self Destruct"
				oRld = uDef.selfDCountdown
			end
			if wepCount > 1 then
				DrawText("Weap:", format(yellow .. "%dx" .. white .. " %s", wepCount, typeName))
			else
				DrawText("Weap:", typeName)
			end

			DrawText("Info:", format("%d range, %d aoe, %d%% edge", uWep.range, uWep.damageAreaOfEffect, 100 * uWep.edgeEffectiveness))
			
			if uWep.coverageRange and uWep.stockpile then
			  	DrawText("Anti:", format("%d Interceptor Range", uWep.coverageRange))
			end

			if uWep.coverageRange and uWep.interceptor == 16 then
			  	DrawText("MDS:", format("%d Interceptor Range", uWep.coverageRange))
			end

			if uWep.targetable == 16 then
			  	DrawText("MDS:","Is Targetable", '')
			end

			local reload = uWep.reload
			local accuracy = uWep.accuracy
			local moveError = uWep.targetMoveError
			local reloadBonus = reload ~= 0 and (uWep.reload/reload-1) or 0
			local accuracyBonus = accuracy ~= 0 and (uWep.accuracy/accuracy-1) or 0
			local moveErrorBonus = moveError ~= 0 and (uWep.targetMoveError/moveError-1) or 0
			local range = uWep.range
			local rangeBonus = range ~= 0 and (range/uWep.range-1) or 0
			if uExp ~= 0 then
				DrawText("Exp:", format("+%d%% accuracy, +%d%% aim, +%d%% firerate, +%d%% range", accuracyBonus*100, moveErrorBonus*100, reloadBonus*100, rangeBonus*100 ))
			end
			local infoText = format("%d range, %d aoe, %d%% edge", useExp and range or uWep.range, uWep.damageAreaOfEffect, 100 * uWep.edgeEffectiveness)
			if uWep.damages.paralyzeDamageTime > 0 then
				infoText = format("%s, %ds paralyze", infoText, uWep.damages.paralyzeDamageTime)
			end
			if uWep.damages.impulseBoost > 0 then
				infoText = format("%s, %d impulse", infoText, uWep.damages.impulseBoost*100)
			end
			if uWep.damages.craterBoost > 0 then
				infoText = format("%s, %d crater", infoText, uWep.damages.craterBoost*100)
			end
			DrawText("Info:", infoText)

			local defaultDamage = uWep.damages[0]
			for cat=0, #uWep.damages do
				local oDmg = uWep.damages[cat]
				local catName = Game.armorTypes[cat]
				if catName and oDmg and (oDmg ~= defaultDamage or cat == 0) then
					local dmgString
					if oBurst > 1 then
						dmgString = format(yellow .. "%d (x%d)" .. white .. " / " .. yellow .. "%.2f\s" .. white .. " = " .. yellow .. "%.2f \d\p\s", oDmg, oBurst, oRld, oBurst * oDmg / oRld)
					else
						dmgString = format(yellow .. "%d" .. white .. " / " .. yellow .. "%.2f\s" .. white .. " = " .. yellow .. "%.2f \d\p\s", oDmg, oRld, oDmg / oRld)
					end

					if wepCount > 1 then
						dmgString = dmgString .. white .. " (Each)"
					end

					dmgString = dmgString .. white .. " (" .. catName .. ")"

					DrawText("Dmg:", dmgString)
				end
			end

			if uWep.metalCost > 0 or uWep.energyCost > 0 then

				-- Stockpiling weapons are weird
				-- They take the correct amount of resources overall
				-- They take the correct amount of time
				-- They drain ((simSpeed+2)/simSpeed) times more resources than they should (And the listed drain is real, having lower income than listed drain WILL stall you)
				local drainAdjust = uWep.stockpile and (simSpeed+2)/simSpeed or 1
				
				DrawText('Cost:', format(metalColor .. '%d' .. white .. ', ' ..
										 energyColor .. '%d' .. white .. ' = ' ..
										 metalColor .. '-%d' .. white .. ', ' ..
										 energyColor .. '-%d' .. white .. ' per second',
										 uWep.metalCost,
										 uWep.energyCost,
										 drainAdjust * uWep.metalCost / oRld,
										 drainAdjust * uWep.energyCost / oRld))
			end

			if (weaponInfo[wDefId]) then
			local radius = weaponInfo[wDefId].radius
			local damage = weaponInfo[wDefId].damage
			local duration = weaponInfo[wDefId].duration
			DrawText("Area Dmg:", format(white .. "%d aoe, %d max damage per second , %d seconds", radius, damage * 30 / DAMAGE_PERIOD, duration / 30 ))
		end
				
			cY = cY - fontSize
		end
	end
	
	-- background
	glColor(cbackground)
	cornersize = 0
	RectRound(floor(cX-bgpadding)+cornersize, ceil(cY+(fontSize/3)+bgpadding)+cornersize, ceil(cX+maxWidth+bgpadding)-cornersize, floor(cYstart-bgpadding)-cornersize, bgcornerSize)
	cornersize = ceil(bgpadding*0.16)
	glColor(1,1,1,0.017)
	RectRound(floor(cX-bgpadding)+cornersize, ceil(cY+(fontSize/3)+bgpadding)+cornersize, ceil(cX+maxWidth+bgpadding)-cornersize, floor(cYstart-bgpadding)-cornersize, bgcornerSize)

	DrawTextBuffer()

	if (WG['guishader_api'] ~= nil) then
		guishaderEnabled = true
		WG['guishader_api'].InsertRect(cX-bgpadding, cY+(fontSize/3)+bgpadding, cX+maxWidth+bgpadding, cYstart-bgpadding, 'unit_stats_data')
	end
end

------------------------------------------------------------------------------------

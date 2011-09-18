
function widget:GetInfo()
	return {
		name      = "Unit Stats",
		desc      = "Shows detailed unit stats",
		author    = "Niobium",
		date      = "Jan 11, 2009",
		version   = 1.1,
		license   = "GNU GPL, v2 or later",
		layer     = 6,
		enabled   = true,  --  loaded by default?
		handler   = true
	}
end

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
local fontSize = 16
local xOffset = 25
local yOffset = 25

local cX, cY


local pplants = {
	["aafus"] = true,
	["afusionplant"] = true,
	["amgeo"] = true,
	["apocketfusion"] = true,
	["arm_wind_generator"] = true,
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
	["core_wind_generator"] = true,
	["corfus"] = true,
	["corgeo"] = true,
	["corsfus"] = true,
	["corsolar"] = true,
	["cortide"] = true,
	["coruwfus"] = true,
	["corwin"] = true,
	["cpocketfusion"] = true,
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
}

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

local max = math.max
local floor = math.floor
local format = string.format
local char = string.char

local glColor = gl.Color
local glText = gl.Text
local glRect = gl.Rect

local spGetTeamInfo = Spring.GetTeamInfo
local spGetPlayerInfo = Spring.GetPlayerInfo
local spGetTeamColor = Spring.GetTeamColor

local spGetModKeyState = Spring.GetModKeyState
local spGetMouseState = Spring.GetMouseState
local spTraceScreenRay = Spring.TraceScreenRay

local spGetUnitDefID = Spring.GetUnitDefID
local spGetUnitExp = Spring.GetUnitExperience
local spGetUnitHealth = Spring.GetUnitHealth
local spGetUnitTeam = Spring.GetUnitTeam

local tidalStrength = Game.tidal
local windMin = Game.windMin
local windMax = Game.windMax

local uDefs = UnitDefs
local wDefs = WeaponDefs

local myTeamID = Spring.GetMyTeamID
local spGetTeamRulesParam = Spring.GetTeamRulesParam
local spGetTooltip = Spring.GetCurrentTooltip

------------------------------------------------------------------------------------
-- Functions
------------------------------------------------------------------------------------
local function DrawText(t1, t2)
	glText(t1, cX, cY, fontSize, "o")
	glText(t2, cX + 100, cY, fontSize, "o")
	cY = cY - fontSize
end

local function teamColorStr(teamID)
	
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

local function teamName(teamID)
	
	if not teamID then
		return "Error:NoTeamID"
	end
	
	local _, teamLeader = spGetTeamInfo(teamID)
	if not teamLeader then
		return "Error:NoLeader"
	end
	
	local leaderName = spGetPlayerInfo(teamLeader)
	return leaderName or "Error:NoName"
end

------------------------------------------------------------------------------------
-- Code
------------------------------------------------------------------------------------
function widget:Initialize()
	local highlightWidget = widgetHandler:FindWidget("HighlightUnit")
	if highlightWidget then
		widgetHandler:RemoveWidgetCallIn("DrawScreen", highlightWidget)
	end
end

function widget:Shutdown()
	local highlightWidget = widgetHandler:FindWidget("HighlightUnit")
	if highlightWidget then
		widgetHandler:UpdateWidgetCallIn("DrawScreen", highlightWidget)
	end
end

function widget:DrawScreen()
	
	local alt, ctrl, meta, shift = spGetModKeyState()
	if not meta then return end
	
	local mx, my = spGetMouseState()
	local rType, uID = spTraceScreenRay(mx, my)
	if (rType ~= "unit") or not uID then return end
	
	local uDefID = spGetUnitDefID(uID) ; if not uDefID then return end
	local uDef = uDefs[uDefID]
	local _, _, _, _, buildProg = spGetUnitHealth(uID)
	local uTeam = spGetUnitTeam(uID)
	
	cX = mx + xOffset
	cY = my + yOffset
	
	glColor(1.0, 1.0, 1.0, 1.0)

	glText(teamColorStr(uTeam) .. teamName(uTeam) .. "'s " .. yellow .. uDef.humanName .. white .. " (" .. uDef.name .. ", #" .. uID .. ")", cX, cY, fontSize, "o")
	cY = cY - 2 * fontSize

	
	if(WG.energyConversion) then
		local makerTemp = WG.energyConversion.convertCapacities[uDefID]
		local curAvgEffi = spGetTeamRulesParam(myTeamID(), 'mmAvgEffi')
		local avgCR = 0.015
		if(makerTemp) then 
			DrawText(orange .. "Metal maker properties", '')
			DrawText("M-Capac.:", makerTemp.c)
			DrawText("M-Effi.:", format('%.2f m / 1000 e', makerTemp.e * 1000))
			cY = cY - fontSize
		end

		if pplants[uDef.name] then
		-- Powerplants 
			DrawText(orange .. "Powerplant properties", '')
			DrawText("CR is metal maker conversion rate", '')
			
			local totalEOut = uDef.energyMake
			
			if (uDef.tidalGenerator > 0 and tidalStrength > 0) then
				totalEOut = totalEOut + tidalStrength
			end
			
			if (uDef.windGenerator > 0) then
				local unitWindMin = math.min(windMin, uDef.windGenerator)
				local unitWindMax = math.min(windMax, uDef.windGenerator)
				totalEOut = totalEOut + (unitWindMin + unitWindMax) / 2
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
					totalEOut = totalEOut + tidalStrength
				end
				
				if (uDef.windGenerator > 0) then
					local unitWindMin = math.min(windMin, uDef.windGenerator)
					local unitWindMax = math.min(windMax, uDef.windGenerator)
					totalEOut = totalEOut + (unitWindMin + unitWindMax) / 2
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
	
	-- Units that are still building
	if buildProg and (buildProg < 1.0) then
		
		local mTotal = uDef.metalCost
		local eTotal = uDef.energyCost
		local buildRem = 1 - buildProg
		
		DrawText("Prog:", format("%d%% / %d%%", 100 * buildProg, 100 * buildRem))
		DrawText("M:", format("%d / %d (" .. yellow .. "%d" .. white .. ")", mTotal * buildProg, mTotal, mTotal * buildRem))
		DrawText("E:", format("%d / %d (" .. yellow .. "%d" .. white .. ")", eTotal * buildProg, eTotal, eTotal * buildRem))
		cY = cY - fontSize
	end
	
	if not (uDef.isBuilding or uDef.isFactory) then
		DrawText("Move:", format("%.1f / %.1f / %.0f (Speed / Accel / Turn)", uDef.speed, 900 * uDef.maxAcc, 30 * uDef.turnRate * (180 / 32767)))
	end
	
	DrawText("Los:", format("%d", 32 * uDef.losRadius))
	if uDef.radarRadius >= 64 then DrawText("Radar:", format(green .. "%d", uDef.radarRadius)) end
	if uDef.sonarRadius >= 64 then DrawText("Sonar:", format(blue .. "%d", uDef.sonarRadius)) end
	if uDef.jammerRadius >= 64 then DrawText("Jam:", format(orange .. "%d", uDef.jammerRadius)) end
	if uDef.buildSpeed > 0 then DrawText("Build:", format(yellow .. "%d", uDef.buildSpeed)) end
	if uDef.stealth then DrawText("Other:", "Stealthy") end
	cY = cY - fontSize
	
	local uWeps = uDef.weapons
	
	local wepCounts = {} -- wepCounts[wepDefID] = 1, 2, ...
	local wepsCompact = {} -- uWepsCompact[1..n] = wepDefID
	for i = 1, #uWeps do
		local wDefID = uWeps[i].weaponDef
		local wCount = wepCounts[wDefID]
		if wCount then
			wepCounts[wDefID] = wCount + 1
		else
			wepCounts[wDefID] = 1
			wepsCompact[#wepsCompact + 1] = wDefID
		end
	end
	
	for i = 1, #wepsCompact do
		
		local wDefId = wepsCompact[i]
		local uWep = wDefs[wDefId]
		
		if uWep.range > 16 then
			
			local oDmg = uWep.damages[1]
			local oBurst = uWep.salvoSize
			local oRld = max((uWep.stockpile and uWep.stockpileTime) or uWep.reload, 0.125) -- Weapon state only checked 8 times/sec (From looking at BA beamer)
			local wepCount = wepCounts[wDefId]
			
			if wepCount > 1 then
				DrawText("Weap:", format(yellow .. "%dx" .. white .. " %s", wepCount, uWep.type))
			else
				DrawText("Weap:", uWep.type)
			end
			
			DrawText("Info:", format("%d range, %d aoe, %d%% edge", uWep.range, uWep.areaOfEffect, 100 * uWep.edgeEffectiveness))
			
			local dmgString
			if oBurst > 1 then
				dmgString = format(yellow .. "%d (x%d)" .. white .. " / " .. yellow .. "%.2f" .. white .. " = " .. yellow .. "%.2f", oDmg, oBurst, oRld, oBurst * oDmg / oRld)
			else
				dmgString = format(yellow .. "%d" .. white .. " / " .. yellow .. "%.2f" .. white .. " = " .. yellow .. "%.2f", oDmg, oRld, oDmg / oRld)
			end
			
			if wepCount > 1 then
				dmgString = dmgString .. white .. " (Each)"
			end
			
			DrawText("Dmg:", dmgString)
			
			if (uWep.metalCost > 0) or (uWep.energyCost > 0) then
				
				-- Stockpiling weapons are weird
				-- They take the correct amount of resources overall
				-- They take the correct amount of time
				-- They drain (32/30) times more resources than they should (And the listed drain is real, having lower income than listed drain WILL stall you)
				local drainReload = (uWep.stockpile and ((30 / 32) * oRld)) or oRld
				
				DrawText("Cost:", format(white .. "%dm, %de = -%.1f, -%.0f", uWep.metalCost, uWep.energyCost, uWep.metalCost / drainReload, uWep.energyCost / drainReload))
			end
			
			cY = cY - fontSize
		end
	end
end

------------------------------------------------------------------------------------

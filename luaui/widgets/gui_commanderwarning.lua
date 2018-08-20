function widget:GetInfo()
	return {
		name = "Commander Warning",
		desc = "Changes UI background color if your commander is attacked",
		author = "Nixtux",
		date = "13th Aug 2018",
		license = "GPLv2",
		version = "1.0",
		layer = 1,
		enabled = true
	}
end

local commanderTable				= {}
local localTeamID 					= nil	
local warningList					= {}
local DISPLAYTIME					= 210
local FADETIME						= 60
local UPDATERATE					= 0.05
local MASTERRATE 					= 0.08
local GLOWRATE						= MASTERRATE
local color 						= WG["background_opacity_custom"]
local gameover 						= false

function widget:Initialize()
    localTeamID = Spring.GetLocalTeamID()   
	if Spring.GetSpectatingState() or Spring.IsReplay() then
		widgetHandler:RemoveWidget()
		return false
	end
    
	for id, unitDef in ipairs(UnitDefs) do
		if unitDef.customParams.iscommander then
			if unitDef.name then
				commanderTable[id] = true
			end
		end
	end
end

function widget:UnitDamaged (unitID, unitDefID, unitTeam, damage, paralyzer, weaponID, attackerID, attackerDefID, attackerTeam)
	if localTeamID ~= unitTeam or Spring.IsUnitInView(unitID) then
		return --ignore other teams and units in view
	end
	
	if commanderTable[unitDefID] then 
		local health, maxhealth = Spring.GetUnitHealth(unitID)
		if health > 0 then
			local udef = UnitDefs[unitDefID]
			local now = Spring.GetGameFrame()
			local aName 
			if attackerDefID then
				aName = table.concat({"by ",(UnitDefs[attackerDefID] or "enemy"),"!"})
			end
			warningList[1] = udef.humanName
			warningList[2] = health/maxhealth
			warningList[3] = aName
			warningList[4] = now
		end
	end
end

function widget:GameFrame(n)
	--WG["background_opacity_custom"] = {0, 0, 0 , color[4]}
	if n == 1 then
		color = WG["background_opacity_custom"]
	end
end

local tick = 0
local lasttick  = 0
local colorRed = color[1]
function widget:Update(tock)
	tick = tick + tock
	if tick > lasttick + UPDATERATE then
		lasttick = tick
		colorRed = colorRed + GLOWRATE
		if colorRed > 0.33 and GLOWRATE > 0 then 
			GLOWRATE = -MASTERRATE
		elseif colorRed < 0.05 and GLOWRATE < 0 then 
			GLOWRATE = MASTERRATE
		end

		if #warningList > 0 then
			if Spring.GetGameFrame() > warningList[4] + DISPLAYTIME then
				warningList = {}
				WG["background_opacity_custom"] = color
			else
				WG["background_opacity_custom"] = {colorRed, colorRed*0.25, colorRed*0.25, color[4]}
				--Spring.Echo(colorRed,tock)
			end
		else
			WG["background_opacity_custom"] = color
		end
	end
end
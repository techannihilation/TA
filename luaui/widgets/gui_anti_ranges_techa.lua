--------------------------------------------------------------------------------
function widget:GetInfo()
    return {
        name      = "Anti Ranges (TechA)",
        desc      = "Draws circle to show anti defence ranges (options: /antiranges_glow, antiranges_fade)",
        author    = "[teh]decay, Floris",
        date      = "25 january 2015",
        license   = "GNU GPL, v2 or later",
        version   = 5,
        layer     = 5,
        enabled   = true  --  loaded by default?
    }
end

-- project page on github: https://github.com/jamerlan/gui_mobile_anti_defence_range

--Changelog
-- v2 [teh]decay:  Add water antinukes
-- v3 Floris:  added normal anti, changed widget name, optional glow, optional fadeout on closeup, changed line thickness and opacity, empty anti uses different color
-- v5 Nixtux: Minor performace change, Update for techa anti list (added jools check if stockpilenumber is nil change)
--------------------------------------------------------------------------------
-- Console commands
--------------------------------------------------------------------------------

--/antiranges_glow		-- toggles a faint glow on the line
--/antiranges_fade		-- toggles hiding of ranges when zoomed in

--------------------------------------------------------------------------------
-- Options
--------------------------------------------------------------------------------

local opacityMultiplier			= 0.85
local multiStockpileColor		= {1,1,0}
local filledStockpileColor		= {1,0.73,0}
local plentyStockpileColor		= {0.2,0.85,0.66}
local emptyStockpileColor		= {1,0.28,0}
local enemyStockpileColor		= {0.7,0.7,0.7}
local showLineGlow			= true
local fadeOnCloseup        		= true
local fadeStartDistance			= 3300

--------------------------------------------------------------------------------
-- Speedups
--------------------------------------------------------------------------------

local spGetActiveCommand		= Spring.GetActiveCommand
local spGetMouseState			= Spring.GetMouseState
local spTraceScreenRay			= Spring.TraceScreenRay
local spPos2BuildPos			= Spring.Pos2BuildPos

local glColor				= gl.Color
local glDepthTest			= gl.DepthTest
local glLineWidth			= gl.LineWidth
local glDrawGroundCircle		= gl.DrawGroundCircle


local spGetMyPlayerID			= Spring.GetMyPlayerID
local spGetPlayerInfo			= Spring.GetPlayerInfo
local spGetMyAllyTeamID			= Spring.GetMyAllyTeamID
local spGetUnitDefID			= Spring.GetUnitDefID
local spGetUnitPosition			= Spring.GetUnitPosition
local spGetUnitVelocity			= Spring.GetUnitVelocity
local spMarkerAddPoint			= Spring.MarkerAddPoint
local spGetTeamUnits			= Spring.GetTeamUnits
local spGetPositionLosState		= Spring.GetPositionLosState
local spGetCameraPosition		= Spring.GetCameraPosition
local spGetUnitStockpile		= Spring.GetUnitStockpile
local spGetAllUnits    			= Spring.GetAllUnits

local antiInLos					= {}
local antiOutLos				= {}

local antiNukes = {
--Arm 
  [UnitDefNames["armscab"].id] = true,
  [UnitDefNames["armscab1"].id] = true,
  [UnitDefNames["armamd"].id] = true,
  [UnitDefNames["armamd1"].id] = true,
  [UnitDefNames["armamd2"].id] = true,
  [UnitDefNames["armcarry"].id] = true,
--Core
  [UnitDefNames["cormabm"].id] = true,
  [UnitDefNames["cormabm1"].id] = true,
  [UnitDefNames["corfmd"].id] = true,
  [UnitDefNames["corfmd1"].id] = true,
  [UnitDefNames["corfmd2"].id] = true,
  [UnitDefNames["corcarry"].id] = true,
--The lost legacy
  [UnitDefNames["tllturtle"].id] = true,
  [UnitDefNames["tllantinuke"].id] = true,
  [UnitDefNames["tllantinuke1"].id] = true,
}

for unitDefID, _ in pairs(antiNukes) do
      antiNukes[unitDefID] = {coverageRange = WeaponDefs[UnitDefs[unitDefID].weapons[1].weaponDef].coverageRange , isMobile = UnitDefs[unitDefID]["canMove"]} 
end

--------------------------------------------------------------------------------
-- Callins
--------------------------------------------------------------------------------

function widget:DrawWorld()
    if Spring.IsGUIHidden() then return end
	local camX, camY, camZ = spGetCameraPosition()
    for uID, pos in pairs(antiInLos) do
        local x, y, z = spGetUnitPosition(uID)
        
        if x ~= nil and y ~= nil and z ~= nil then
			drawCircle(uID, pos.coverageRange, x, y, z, camX, camY, camZ)
        end
    end

    for uID, pos in pairs(antiOutLos) do
        local LosOrRadar, inLos, inRadar = spGetPositionLosState(pos.x, pos.y, pos.z)
        if inLos then
            antiOutLos[uID] = nil
        end
    end

    for uID, pos in pairs(antiOutLos) do
        if pos.x ~= nil and pos.y ~= nil and pos.z ~= nil then
			drawCircle(uID, pos.coverageRange, pos.x, pos.y, pos.z, camX, camY, camZ)
        end
    end
end

function drawCircle(uID, coverageRange, x, y, z, camX, camY, camZ)
        local xDifference = camX - x
        local yDifference = camY - y
        local zDifference = camZ - z
        local camDistance = math.sqrt(xDifference*xDifference + yDifference*yDifference + zDifference*zDifference)
        
        local lineWidthMinus = (camDistance/fadeStartDistance)
        if lineWidthMinus > 2 then
                lineWidthMinus = 2
        end
        local lineOpacityMultiplier = 1
        if fadeOnCloseup then
                lineOpacityMultiplier = (camDistance - fadeStartDistance) / 1800
                if lineOpacityMultiplier > 1 then
                        lineOpacityMultiplier = 1
                end
        end
        lineOpacityMultiplier = lineOpacityMultiplier * opacityMultiplier
        
        if lineOpacityMultiplier > 0 then
                local numStockpiled,numStockpileQued,stockpileBuild = spGetUnitStockpile(uID)
                local circleColor = enemyStockpileColor
                
                if numStockpiled and numStockpiled == 0 then
                        circleColor = emptyStockpileColor
                elseif numStockpiled and numStockpiled == 1 then
                        circleColor = filledStockpileColor 
                elseif numStockpiled and numStockpiled > 1 and numStockpiled < 6 then
                        circleColor = multiStockpileColor
                elseif numStockpiled and numStockpiled > 5 then
                        circleColor = plentyStockpileColor
                end
                
                glDepthTest(true)
                if showLineGlow then
                        glLineWidth(10)
                        glColor(circleColor[1],circleColor[2],circleColor[3], .016*lineOpacityMultiplier)
                        glDrawGroundCircle(x, y, z, coverageRange, 256)
                end
                glColor(circleColor[1],circleColor[2],circleColor[3], .5*lineOpacityMultiplier)
                glLineWidth(3-lineWidthMinus)
                glDrawGroundCircle(x, y, z, coverageRange, 256)  
        end
end

function widget:UnitEnteredLos(unitID)
    local unitDefId = spGetUnitDefID(unitID)
    processVisibleUnit(unitID, unitDefId)
end

function processVisibleUnit(unitID, unitDefId)
    if antiNukes[unitDefId] then
        local x, y, z = spGetUnitPosition(unitID)
        local pos = {}
        pos["x"] = x
        pos["y"] = y
        pos["z"] = z
	
        pos.coverageRange = antiNukes[unitDefId].coverageRange
	
        antiInLos[unitID] = pos
        antiOutLos[unitID] = nil
    end
end

function widget:UnitLeftLos(unitID)
    local unitDefId = spGetUnitDefID(unitID)
    if antiNukes[unitDefId] and antiNukes[unitDefId].isMobile then
        local x, y, z = spGetUnitPosition(unitID)
        local pos = {}
        pos["x"] = x or antiInLos[unitID].x
        pos["y"] = y or antiInLos[unitID].y
        pos["z"] = z or antiInLos[unitID].z

        pos.coverageRange = antiNukes[unitDefId].coverageRange

        antiOutLos[unitID] = pos
        antiInLos[unitID] = nil
    end
end

function widget:UnitCreated(unitID, unitDefID, teamID, builderID)
    processVisibleUnit(unitID, unitDefID)
end

function widget:UnitTaken(unitID, unitDefID, unitTeam, newTeam)
    processVisibleUnit(unitID, unitDefID)
end

function widget:UnitGiven(unitID, unitDefID, unitTeam, oldTeam)
    processVisibleUnit(unitID, unitDefID)
end

function widget:GameFrame(n)
    for uID, _ in pairs(antiInLos) do
        if not spGetUnitDefID(uID) then
            antiInLos[uID] = nil -- has died
        end
    end
end

function widget:Initialize()
	checkAllUnits()
end

function widget:PlayerChanged(playerID)
	checkAllUnits()
end

function checkAllUnits()
    local _, _, spec, teamId = spGetPlayerInfo(spGetMyPlayerID())
	
	antiInLos				= {}
	antiOutLos				= {}
	
	local allUnits = spGetAllUnits()
    for _, unitID in ipairs(allUnits) do
        processVisibleUnit(unitID)
    end
end

--------------------------------------------------------------------------------

function widget:GetConfigData(data)
    savedTable = {}
    savedTable.showLineGlow			= showLineGlow
    savedTable.fadeOnCloseup		= fadeOnCloseup
    return savedTable
end

function widget:SetConfigData(data)
    if data.showLineGlow ~= nil 		then  showLineGlow			= data.showLineGlow end
    if data.fadeOnCloseup ~= nil 		then  fadeOnCloseup			= data.fadeOnCloseup end
end

function widget:TextCommand(command)
    if (string.find(command, "antiranges_glow") == 1  and  string.len(command) == 15) then 
		showLineGlow = not showLineGlow
		if showLineGlow then
			Spring.Echo("Anti Ranges:  Glow on")
		else
			Spring.Echo("Anti Ranges:  Glow off")
		end
	end
    if (string.find(command, "antiranges_fade") == 1  and  string.len(command) == 15) then 
		fadeOnCloseup = not fadeOnCloseup
		if fadeOnCloseup then
			Spring.Echo("Anti Ranges:  Fade-out on closeup enabled")
		else
			Spring.Echo("Anti Ranges:  Fade-out on closeup disabled")
		end
	end
end

function widget:GetInfo()
    return {
        name      = "Com Counter Display",
        desc      = "Shows the number of coms left on each team",
        author    = "Jazcash",
        date      = "Dec 17, 2012",
        license   = "GNU GPL, v2 or later",
        layer     = 0,
        enabled   = true
    }
end

---------------------------------------------------------------------------------------------------
-- Config
local lastComWarning = true

local spEcho                = Spring.Echo
local X, Y                  = Spring.GetViewGeometry()
local spGetMyPlayerID       = Spring.GetMyPlayerID
local spGetMyAllyTeamID	    = Spring.GetMyAllyTeamID
local spGetTeamList         = Spring.GetTeamList
local spGetAllyTeamList     = Spring.GetAllyTeamList
local spGetTeamUnits        = Spring.GetTeamUnits
local spGetAllUnits         = Spring.GetAllUnits
local spGetPlayerList       = Spring.GetPlayerList
local spGetPlayerInfo		= Spring.GetPlayerInfo
local spIsUnitAllied        = Spring.IsUnitAllied
local spGetUnitDefID	    = Spring.GetUnitDefID
local spGetUnitAllyTeam     = Spring.GetUnitAllyTeam
local spGetGameFrame        = Spring.GetGameFrame
local spGetFeatureTeam      = Spring.GetFeatureTeam
local spGetFeatureAllyTeam  = Spring.GetFeatureAllyTeam
local spGetFeatureDefID     = Spring.GetFeatureDefID
local spGetFeaturePosition  = Spring.GetFeaturePosition
local spGetAllFeatures      = Spring.GetAllFeatures
local spMarkerAddPoint      = Spring.MarkerAddPoint
local spMarkerErasePosition = Spring.MarkerErasePosition
local spGetFeatureHealth    = Spring.GetFeatureHealth
local spGetTeamColour       = Spring.GetTeamColor

local glTranslate           = gl.Translate
local glColor               = gl.Color
local glPushMatrix          = gl.PushMatrix
local glPopMatrix           = gl.PopMatrix
local glTexture             = gl.Texture
local glRect                = gl.Rect
local glTexRect             = gl.TexRect
local glText                = gl.Text

local floor                 = math.floor
local max                   = math.max
local min                   = math.min
local insert                = table.insert
local toChar                = string.char

local textSize              = 20
local xPos, yPos            = 1200, 100
local panelWidth            = 100
local panelHeight           = 50
local panelColor            = {0, 0, 0, 0.5}
local totalPlayers          = 0
local allyComs              = 0
local enemyComs             = 0
local deadComs              = {}
--------------------------------------------------------------------------------

function widget:Initialize()
    for _, playerID in pairs(spGetPlayerList()) do
        local _, _, spec, _, aID = spGetPlayerInfo(playerID)
        if spec == false and aID ~= spGetMyAllyTeamID() then
            enemyComs = enemyComs + 1
        elseif spec == false and aID == spGetMyAllyTeamID() then
            allyComs = allyComs + 1
        end
    end
    totalPlayers = allyComs + enemyComs
    getMode()
end

function widget:GameFrame(n)
    if n > 1 then
        if isSpec(spGetMyPlayerID()) then
            specCount(n)
        else
            allyComs = checkTeamComCount(spGetMyAllyTeamID())
            wreckCheck(n)
        end
    end
end

function specCount() -- If speccing then this is executed instead of wreckCheck() 
    allyComs = 0
    enemyComs = 0
    for _, unitID in pairs(spGetAllUnits()) do
        if isCom(unitID) then
            if spGetUnitAllyTeam(unitID) == spGetMyAllyTeamID() then
                allyComs = allyComs + 1
            else
                enemyComs = enemyComs + 1
            end
        end
    end
end

function checkTeamComCount(allyID)
    local comCount = 0
    for _, teamID in ipairs(spGetTeamList(allyID)) do
      for _, unitID in ipairs(spGetTeamUnits(teamID)) do
          if isCom(unitID) then
            comCount = comCount + 1
          end
      end
    end
    return comCount
end

function wreckCheck()
    for _, featureDef in ipairs(spGetAllFeatures()) do
        local fID = spGetFeatureDefID(featureDef)
        if fID ~= nil then
            local fName = FeatureDefs[fID].name
            if isDeadCom(fName) then
                local fAllyID               = spGetFeatureAllyTeam(featureDef)
                local fTeamID               = spGetFeatureTeam(featureDef)
                local fPlayerID             = getPlayerID(fTeamID)
                local _, _, _, fX, fY, fZ   = spGetFeaturePosition(featureDef, true, false)
                local pName
                if fPlayerID ~= nil then
                    pName                   = spGetPlayerInfo(fPlayerID)
                else
                    pName                   = ""
                end
                local _, _, fRez            = spGetFeatureHealth(featureDef)
                fRez                        = fRez * 100
                if getWreckIndex(featureDef) ~= nil then
                    if fAllyID == spGetMyAllyTeamID() and not deadComs[getWreckIndex(featureDef)]["marked"] then
                        --spMarkerErasePosition(fX, fY, fZ)
                        spMarkerAddPoint(fX, fY, fZ, colourNames(fTeamID)..pName.." (ally) just lost their Com", true)
                        deadComs[getWreckIndex(featureDef)]["marked"] = true
                    elseif not deadComs[getWreckIndex(featureDef)]["marked"] then
                        enemyComs = enemyComs - 1
                        --spMarkerErasePosition(fX, fY, fZ)
                        spMarkerAddPoint(fX, fY, fZ, colourNames(fTeamID)..pName.." (enemy) just lost their Com", true)
                        deadComs[getWreckIndex(featureDef)]["marked"] = true
                    end
                    if fRez > 5 and not deadComs[getWreckIndex(featureDef)]["rezMark1"] then
                        --spMarkerErasePosition(fX, fY, fZ)
                        spMarkerAddPoint(fX, fY, fZ, "Com is being rezzed", true)
                        deadComs[getWreckIndex(featureDef)]["rezMark1"] = true
                    elseif fRez > 99 and not deadComs[getWreckIndex(featureDef)]["rezMark2"] then
                        --spMarkerErasePosition(fX, fY, fZ)
                        spMarkerAddPoint(fX, fY, fZ, "Com has been rezzed", true)
                        deadComs[getWreckIndex(featureDef)]["rezMark2"] = true
                        remove(deadComs, deadCom[getWreckIndex(featureDef)])
                        if allyComs == checkTeamComCount(spGetMyAllyTeamID()) then
                            enemyComs = enemyComs + 1
                        end
                    end
                else
                    local deadCom = {fDef = featureDef, marked = false, rezMark1 = false, rezMark2 = false}
                    insert(deadComs, deadCom)
                end
            end
        end
    end
end

function widget:UnitEnteredLOS(unitID, teamID)
    if isCom(unitID) and spIsUnitAllied(unitID) and allyComs == 1 and getMode() ~= "FFA" then
        spMarkerAddPoint(fX, fY, fZ, colourNames(teamID).."Their last Com", true)
        lastEnemyComMarked = true
    elseif isCom(unitID) and enemyComs == 1 and getMode() ~= "FFA" then
        spMarkerAddPoint(fX, fY, fZ, colourNames(teamID).."Our last Com", true)
        lastAllyComMarked = true
    end
end

function getWreckIndex(fDef)
    for i=1, #deadComs do
        if deadComs[i]["fDef"] == fDef then
            return i
        end
    end
end

function getPlayerID(_teamID)
    for _, playerID in pairs(spGetPlayerList()) do
        local _, _, _, teamID = spGetPlayerInfo(playerID)
        if teamID == _teamID then
            return playerID
        end
    end
end

function getMode()
    local allyTeams = -1 --Gaia
    for allyID in pairs(spGetAllyTeamList()) do
        allyTeams = allyTeams + 1
    end
    if totalPlayers <= 2 then
        return "Duel"
    elseif totalPlayers > 2 and allyTeams > 2 then
        return "FFA"
    else
        return "Team"
    end
end

function isSpec(playerID)
	local _, _, spec= spGetPlayerInfo(playerID)
	if spec then
		return true
    else
        return false
	end
end

function isCom(unitID)
    if UnitDefs[spGetUnitDefID(unitID)].customParams.iscommander == "1" then
        return true
    else
        return false
    end
end

function isDeadCom(fName)
    if fName == "corcom_dead" or fName == "corcom_heap" or fName == "armcom_dead" or fName == "armcom_heap" then
        return true
    else
        return false
    end
end

function colourNames(teamID) -- I didn't make this, but thank you to whoever did!
    nameColourR, nameColourG, nameColourB, nameColourA = spGetTeamColour(teamID)
    R255 = floor(nameColourR*255)
    G255 = floor(nameColourG*255)
    B255 = floor(nameColourB*255)
    if ( R255%10 == 0) then
        R255 = R255+1
    end
    if( G255%10 == 0) then
        G255 = G255+1
    end
    if ( B255%10 == 0) then
        B255 = B255+1
    end
    return "\255"..toChar(R255)..toChar(G255)..toChar(B255)
end

function widget:DrawScreen()
    if spGetGameFrame() > 1 then	
        glPushMatrix()
            glTranslate(xPos, yPos, 0)
            glColor(panelColor)
            glRect(0, 0, panelWidth, panelHeight)
            if lastComWarning and allyComs == 1 then
                glColor(1,0,0,1)
            else
                glColor(1,1,1,0.3)
            end
            glTexture('LuaUI/Images/comIcon.png')
            x,y = 33, 5
            glTexRect(x, y, x+34, y+40)
            glTexture(false)
            glColor(0,1,0,1)
            glText(allyComs, (33-(gl.GetTextWidth(allyComs)*textSize))/2, 18, textSize) 
            glColor(1,0,0,1)
            glText(enemyComs, 66+(33-(gl.GetTextWidth(enemyComs)*textSize))/2, 18, textSize)    
        glPopMatrix()
    end
end

function widget:TweakMousePress(mx, my)
    if mx > xPos and my > yPos and mx < xPos + panelWidth and my < yPos + panelHeight then
        return true
    end
end

function widget:TweakMouseMove(mx, my, dx, dy)
    if xPos + dx >= 0 and xPos + panelWidth + dx <= X then xPos = xPos + dx end
    if yPos + dy >= 0 and yPos + panelHeight + dy <= Y then yPos = yPos + dy end
end

function widget:GetConfigData()
	local vsx, vsy = gl.GetViewSizes()
	return {xPos / vsx, yPos / vsy}
end

function widget:SetConfigData(data)
	local vsx, vsy = gl.GetViewSizes()
	xPos = floor(max(0, vsx * min(data[1] or 0, 0.95)))
	yPos = floor(max(0, vsy * min(data[2] or 0, 0.95)))
end
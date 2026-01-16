
function widget:GetInfo()
  return {
    name      = "Unit Stats",
    desc      = "Shows detailed unit stats",
    author    = "Niobium + Doo",
    date      = "Jan 11, 2009",
    version   = 1.7,
    license   = "GNU GPL, v2 or later",
    layer     = -9999999999,
    enabled   = true,  --  loaded by default?
  }
end

include("keysym.h.lua")
----v1.7 by Doo changes
-- Reverted "Added beamtime to oRld value to properly count dps of BeamLaser weapons" because reload starts at the beginning of the beamtime
-- Reduced the "minimal" reloadTime to properly calculate dps for low reloadtime weapons
-- Hid range from gui for explosion (death/selfd) as it is irrelevant.

----v1.6 by Doo changes
-- Fixed crashing when hovering some enemy units

----v1.5 by Doo changes
-- Fixed some issues with the add of BeamTime values
-- Added a 1/30 factor to stockpiling weapons (seems like the lua wDef.stockpileTime is in frames while the weaponDefs uses seconds) Probably the 1/30 value in older versions wasnt a "min reloadtime" but the 1/30 factor for stockpile weapons with a typo

----v1.4 by Doo changes
-- Added beamtime to oRld value to properly count dps of BeamLaser weapons

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
local fontSize = 13
local useSelection = true

local customFontSize = 13
local textDistance = 0
local cX, cY

local vsx, vsy = gl.GetViewSizes()
local widgetScale = (0.60 + (vsx*vsy / 5000000))
local xOffset = (32 + (fontSize*0.9))*widgetScale
local yOffset = -((32 - (fontSize*0.9))*widgetScale)


local DAMAGE_PERIOD ,weaponInfo = VFS.Include('LuaRules/Configs/area_damage_defs.lua', nil, VFS.RAW_FIRST)
local oldUnitpicsDir = LUAUI_DIRNAME.."Images/oldunitpics/"

local OtaIconExist = {}
local onlytarget = {}

for i=1,#UnitDefs do
  if VFS.FileExists(oldUnitpicsDir..UnitDefs[i].name..'.png') then
    OtaIconExist[i] = oldUnitpicsDir..UnitDefs[i].name..'.png'
    --Spring.Echo("Icon Path ",oldUnitpicsDir..UnitDefs[i].name..'.png')
  end
end

local pos = nil
local dummyUnitID = nil
local dummyRange = {}
local modConfig, colorConfig = include("Configs/defensive_range_defs.lua")
local currentMod = string.upper(Game.modShortName or "")

local pplants = {
  ["aafus"] = true,
  ["talon_afus"] = true,
  ["talon_ckfus"] = true,
  ["talon_advsolar"] = true,
  ["talon_sfus"] = true,
  ["talon_efus"] = true,
  ["talon_ufus"] = true,
  ["talon_mohogeo"] = true,
  ["talon_pyroclastic"] = true,
  ["afusionplant"] = true,
  ["amgeo"] = true,
  ["armadvsol"] = true,
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
  ["corfus"] = true,
  ["corgeo"] = true,
  ["corsolar"] = true,
  ["talon_solar"] = true,
  ["cortide"] = true,
  ["talon_tide"] = true,
  ["talon_tide1"] = true,
  ["talon_uwfus"] = true,
  ["coruwfus"] = true,
  ["corwin"] = true,
  ["talon_win"] = true,
  ["talon_win1"] = true,
  ["crnns"] = true,
  ["tlladvsolar"] = true,
  ["tllatidal"] = true,
  ["tllcoldfus"] = true,
  ["tllgeo"] = true,
  ["talon_geo"] = true,
  ["tllmedfusion"] = true,
  ["tllmegacoldfus"] = true,
  ["tllmohogeo"] = true,
  ["tllsolar"] = true,
  ["tlltide"] = true,
  ["tlluwfusion"] = true,
  ["tllwin"] = true,
  ["tllwin1"] = true,
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
  ["talon_gen"] = true,
  ["corgeo_mini"] = true,
  ["armgeo_mini"] = true,
  ["tllgeo_mini"] = true,
  ["talon_geo_mini"] = true,
  ["armsolar"] = true,
  ["corsolar"] = true,
  ["crnns"] = true,
  ["tllsolar"] = true,
  ["tlladvsolar"] = true,
  ["armefus"] = true,
  ["corefus"] = true,
  ["tllefus"] = true,
  ["tllgeo_armored"] = true,

--T5
  ["corufus"] = true,
  ["armufus"] = true,
  ["tllufus"] = true,
  ["talon_ufus"] = true,
  ["gok_ufus"] = true,

  --Gok
  ["gok_solar"] = true,
  ["gok_advsolar"] = true,
  ["gok_fus"] = true,
  ["gok_gen"] = true,
  ["gok_geo_mini"] = true,
  ["gok_geo"] = true,
  ["gok_gen"] = true,

  --Rumad
  ["rumad_solar"] = true,
  ["rumad_advsolar"] = true,
  ["rumad_win"] = true,
  ["rumad_win1"] = true,
  ["rumad_gen"] = true,
  ["rumad_fusion"] = true,
  ["rumad_afusion"] = true,
  ["rumad_geo_mini"] = true,
  ["rumad_geo"] = true,
  ["rumad_sfusion"] = true,
  ["rumad_efusion"] = true,
  ["rumad_ufus"] = true,

  --T3 Geo
  ["armfor"] = true,
  ["corbhmth1"] = true,
  ["talon_egeo"] = true,
  ["tllegeo"] = true,
  ["gok_egeo"] = true,
  ["rumad_egeo"] = true,

}

local tidalStrength = Game.tidal
local windMin = Game.windMin
local windMax = Game.windMax

------------------------------------------------------------------------------------
-- Speedups
------------------------------------------------------------------------------------

local bgcorner = "LuaUI/Images/bgcorner.png"

local white = '\255\255\255\255'
local grey = '\255\190\190\190'
local green = '\255\1\255\1'
local yellow = '\255\255\255\1'
local orange = '\255\255\128\1'
local blue = '\255\128\128\255'

local metalColor = '\255\196\196\255' -- Light blue
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
local glTexture = gl.Texture
local glRect = gl.Rect
local glTexRect = gl.TexRect

local spGetMyTeamID = Spring.GetMyTeamID
local spGetTeamResources = Spring.GetTeamResources
local spGetTeamInfo = Spring.GetTeamInfo
local spGetPlayerInfo = Spring.GetPlayerInfo
local spGetTeamColor = Spring.GetTeamColor

local spGetModKeyState = Spring.GetModKeyState
local spGetMouseState = Spring.GetMouseState
local spTraceScreenRay = Spring.TraceScreenRay
local spGetSelectedUnits = Spring.GetSelectedUnits
local spGetSelectedUnitsCount = Spring.GetSelectedUnitsCount

local spGetUnitDefID = Spring.GetUnitDefID
local spGetUnitExp = Spring.GetUnitExperience
local spGetUnitHealth = Spring.GetUnitHealth
local spGetUnitTeam = Spring.GetUnitTeam
local spGetUnitExperience = Spring.GetUnitExperience
local spGetUnitSensorRadius = Spring.GetUnitSensorRadius
local spGetUnitWeaponState = Spring.GetUnitWeaponState

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

local spec = Spring.GetSpectatingState()

------------------------------------------------------------------------------------
-- Functions
------------------------------------------------------------------------------------


function RectRound(px,py,sx,sy,cs)

  local px,py,sx,sy,cs = math.floor(px),math.floor(py),math.floor(sx),math.floor(sy),math.floor(cs)

  gl.Rect(px+cs, py, sx-cs, sy)
  gl.Rect(sx-cs, py+cs, sx, sy-cs)
  gl.Rect(px+cs, py+cs, px, sy-cs)

  gl.Texture(bgcorner)
  gl.TexRect(px, py+cs, px+cs, py)    -- top left
  gl.TexRect(sx, py+cs, sx-cs, py)    -- top right
  gl.TexRect(px, sy-cs, px+cs, sy)    -- bottom left
  gl.TexRect(sx, sy-cs, sx-cs, sy)    -- bottom right
  gl.Texture(false)
end

local function DrawText(t1, t2)
  textBufferCount = textBufferCount + 1
  textBuffer[textBufferCount] = {white..t1,white..t2,cX,cY}
  cY = cY - fontSize
  maxWidth = max(maxWidth, (gl.GetTextWidth(t1)*fontSize), (gl.GetTextWidth(t2)*fontSize)+(fontSize*6.5+textDistance))
end

local function DrawTextBuffer()
  local num = #textBuffer
  for i=1, num do
    glText(textBuffer[i][1], textBuffer[i][3], textBuffer[i][4], fontSize, "o")
    glText(textBuffer[i][2], textBuffer[i][3] + (fontSize*6.5)+textDistance, textBuffer[i][4], fontSize, "o")
  end
end

local function GetTeamColorCode(teamID)

  if not teamID then return "\255\255\255\255" end

  local R, G, B = spGetTeamColor(teamID)

  if not R then return "\255\255\255\255" end

  R = floor(R * 255)
  G = floor(G * 255)
  B = floor(B * 255)

  if (R < 11) then R = 11 end -- Note: char(10) terminates string
  if (G < 11) then G = 11 end
  if (B < 11) then B = 11 end

  return "\255" .. char(R) .. char(G) .. char(B)
end

local function GetTeamName(teamID)

  if not teamID then return 'Error:NoTeamID' end

  local _, teamLeader = spGetTeamInfo(teamID)
  if not teamLeader then return 'Error:NoLeader' end

  local leaderName = spGetPlayerInfo(teamLeader)
  return leaderName or 'Error:NoName'
end

local guishaderEnabled = false  -- not a config var
function RemoveGuishader()
  if guishaderEnabled and WG['guishader_api'] ~= nil then
    WG['guishader_api'].RemoveRect('unit_stats_title')
    WG['guishader_api'].RemoveRect('unit_stats_data')
    guishaderEnabled = false
  end
end

local darkOpacity = 0
function SetOpacity(dark,light)
    darkOpacity = dark
end

------------------------------------------------------------------------------------
-- Code
------------------------------------------------------------------------------------

function widget:Initialize()
  widgetHandler:RegisterGlobal('SetOpacity_Unit_Stats', SetOpacity)
  if not WG["background_opacity_custom"] then
        WG["background_opacity_custom"] = {0,0,0,0.5}
    end
  init()
end

function widget:Shutdown()
  widgetHandler:DeregisterGlobal('SetOpacity_Unit_Stats', SetOpacity)
  RemoveGuishader()
end

function widget:PlayerChanged()
  spec = Spring.GetSpectatingState()
end

function init()
  vsx, vsy = gl.GetViewSizes()
  widgetScale = (0.60 + (vsx*vsy / 5000000))
  fontSize = customFontSize * widgetScale

  bgcornerSize = fontSize*0.45
  bgpadding = fontSize*0.9

  xOffset = (32 + bgpadding)*widgetScale
  yOffset = -((32 + bgpadding)*widgetScale)
end

function widget:ViewResize(x,y)
  init()
end

function widget:DrawScreen()
  local alt, ctrl, meta, shift = spGetModKeyState()
  if not meta then
    --WG.hoverID = nil
    dummyUnitID = nil
    RemoveGuishader()
    return
  end
  local mx, my = spGetMouseState()
  local uID
  local rType, unitID = spTraceScreenRay(mx, my)
  if rType == 'unit' then
    uID = unitID
  end
  --if spec and useSelection then
  --  local selUnits = spGetSelectedUnits()
  --  if #selUnits >= 1 then
  --    uID = selUnits[1]
  --  end
  --end
  local useHoverID = false
  local morphID = false
  dummyUnitID = nil
  local _, activeID = Spring.GetActiveCommand()
  local text = Spring.GetCurrentTooltip()
  local expMorphPat = "UnitDefID (%d+)\n"
  local morphDefID = tonumber(text:match(expMorphPat)) or nil
  if not activeID then activeID = 0 end
  if not uID then
    if morphDefID then
      uID = nil
      useHoverID = false
      morphID = true
      local selUnits = spGetSelectedUnits()
      if #selUnits >= 1 then
        dummyUnitID = selUnits[1]
      end
    elseif (not WG.hoverID) and not (activeID < 0) then
      RemoveGuishader() return
    elseif WG.hoverID and WG.hoverID < 0 and not (activeID < 0) then
      uID = nil
      useHoverID = true
      morphID = false
    elseif activeID < 0 then
      uID = nil
      useHoverID = false
      morphID = false
    end
  end
  local useExp = ctrl

  local uDefID = (uID and spGetUnitDefID(uID)) or (useHoverID and -WG.hoverID) or (UnitDefs[-activeID] and -activeID)
  or (morphID and morphDefID)

  if not uDefID then
    RemoveGuishader() return
  end
  if uID then
    textDistance = 0
    local uDef = uDefs[uDefID]
    local uCurHp, uMaxHp, _, _, buildProg = spGetUnitHealth(uID)
    local uTeam = spGetUnitTeam(uID)

    local _, xp = Spring.GetUnitExperience(uID)

    maxWidth = 0

    cX = mx + xOffset
    cY = my + yOffset
    cYstart = cY

    local titleFontSize = fontSize*1.12
    local cornersize = ceil(bgpadding*0.21)

    cY = cY - 2 * titleFontSize
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
    -- Units under construction
    ------------------------------------------------------------------------------------
    if buildProg and buildProg < 1 then

      local myTeamID = spGetMyTeamID()
      local mCur, mStor, mPull, mInc, mExp, mShare, mSent, mRec = spGetTeamResources(myTeamID, 'metal')
      local eCur, eStor, ePull, eInc, eExp, eShare, eSent, eRec = spGetTeamResources(myTeamID, 'energy')

      local mTotal = uDef.metalCost
      local eTotal = uDef.energyCost
      local buildRem = 1 - buildProg
      local mRem = mTotal * buildRem
      local eRem = eTotal * buildRem
      local mEta = (mRem - mCur) / (mInc + mRec)
      local eEta = (eRem - eCur) / (eInc + eRec)

      DrawText("Prog:", format("%d%%", 100 * buildProg))
      DrawText("Metal:", format("%d / %d (" .. yellow .. "%d" .. white .. ", %ds)", mTotal * buildProg, mTotal, mRem, mEta))
      DrawText("Energy:", format("%d / %d (" .. yellow .. "%d" .. white .. ", %ds)", eTotal * buildProg, eTotal, eRem, eEta))
      --DrawText("MaxBP:", format(white .. '%d', buildRem * uDef.buildTime / math.max(mEta, eEta)))
      cY = cY - fontSize
    end

    ------------------------------------------------------------------------------------
    -- Generic information, cost, move, class
    ------------------------------------------------------------------------------------

    --DrawText('Height:', uDefs[spGetUnitDefID(uID)].height)
    local metalCost = Spring.GetUnitRulesParam(unitID, "metalCost") or uDef.metalCost
    local energyCost = Spring.GetUnitRulesParam(unitID, "energyCost") or uDef.energyCost
    local buildTime = Spring.GetUnitRulesParam(unitID, "buildTime") or uDef.buildTime
    local weaponMulti = Spring.GetUnitRulesParam(unitID, "weaponMulti") or 1
    local rangeMulti = Spring.GetUnitRulesParam(unitID, "rangeMulti") or 1
    DrawText("Cost:", format(metalColor .. '%d' .. white .. ' / ' ..
                energyColor .. '%d' .. white .. ' / ' ..
                buildColor .. '%d', metalCost, energyCost, buildTime)
        )


    if not (uDef.isBuilding or uDef.isFactory) then
      if not Spring.GetUnitMoveTypeData(uID) then
        DrawText("Move:", format("%.1f / %.1f / %.0f (Speed / Accel / Turn)", uDef.speed, 900 * uDef.maxAcc, simSpeed * uDef.turnRate * (180 / 32767)))
      else
        local mData = Spring.GetUnitMoveTypeData(uID)
        local mSpeed = mData.maxSpeed or uDef.speed
        local mAccel = mData.accRate or uDef.maxAcc
        local mTurnRate = mData.baseTurnRate or uDef.turnRate
        DrawText("Move:", format("%.1f / %.1f / %.0f (Speed / Accel / Turn)", mSpeed, 900 * mAccel, simSpeed * mTurnRate * (180 / 32767)))
      end
    end

    cY = cY - fontSize


    DrawText('Build:', yellow .. uDef.buildSpeed)


    cY = cY - fontSize

    ------------------------------------------------------------------------------------
    -- Sensors and Jamming
    ------------------------------------------------------------------------------------
    local losRadius = spGetUnitSensorRadius(uID, 'los') or 0
    local airLosRadius = spGetUnitSensorRadius(uID, 'airLos') or 0
    local radarRadius = spGetUnitSensorRadius(uID, 'radar') or 0
    local sonarRadius = spGetUnitSensorRadius(uID, 'sonar') or 0
    local jammingRadius = spGetUnitSensorRadius(uID, 'radarJammer') or 0
    local sonarJammingRadius = spGetUnitSensorRadius(uID, 'sonarJammer') or 0
    local seismicRadius = spGetUnitSensorRadius(uID, 'seismic') or 0

    DrawText('Los:', losRadius .. (airLosRadius > losRadius and format(' (AirLos: %d)', airLosRadius) or ''))

    if radarRadius   > 0 then DrawText('Radar:', '\255\77\255\77' .. radarRadius) end
    if sonarRadius   > 0 then DrawText('Sonar:', '\255\128\128\255' .. sonarRadius) end
    if jammingRadius > 0 then DrawText('Jam:'  , '\255\255\77\77' .. jammingRadius) end
    if sonarJammingRadius > 0 then DrawText('Sonar Jam:', '\255\255\77\77' .. sonarJammingRadius) end
    if seismicRadius > 0 then DrawText('Seis:' , '\255\255\26\255' .. seismicRadius) end

    if uDef.stealth then DrawText("Other:", "Stealth") end

    cY = cY - fontSize

    local uExp = spGetUnitExperience(uID)
    ------------------------------------------------------------------------------------
    -- Armor
    ------------------------------------------------------------------------------------

    DrawText("Armor:", "class " .. Game.armorTypes[uDef.armorType or 0] or '???')
    local _, spMaxHP = Spring.GetUnitHealth(uID)
    local maxHP = spMaxHP or uDef.health
    if ctrl then
      maxHP = uMaxHp or '???'
    end
    if uExp ~= 0 then
      if uMaxHp then
      DrawText("Exp:", format("+%d%% health", (uMaxHp/uDef.health-1)*100))
      else
      DrawText("Exp:                 unknown",'\255\255\77\77')
      end

    end
    DrawText("Open:", format("maxHP: %d", maxHP) )
    local _, armoredMultiple = Spring.GetUnitArmored(uID)

      if armoredMultiple and armoredMultiple ~= 1 then
      DrawText("Closed:", format(" +%d%%, maxHP: %d", (1/armoredMultiple-1) *100,maxHP/armoredMultiple))
      elseif uDef.armoredMultiple ~= 1 then
      DrawText("Closed:", format(" +%d%%, maxHP: %d", (1/uDef.armoredMultiple-1) *100,maxHP/uDef.armoredMultiple))
      end

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

      if uWep.range > 0 and not uWep.name:find("teleport",1,true) then
        local oBurst = uWep.salvoSize * uWep.projectiles
        local oRld = max(0.00000000001,uWep.stockpile == true and uWep.stockpileTime/30 or uWep.reload)
        if useExp and not ((uWep.stockpile and uWep.stockpileTime)) then
          oRld = spGetUnitWeaponState(uID,weaponNums[i] or -1,"reloadTime") or oRld
        end
        local wepCount = wepCounts[wDefId]

        local typeName =  uWep.type
        local wpnName = uWep.description
        if i == deathWeaponIndex then
          wpnName = "Death explosion"
          oRld = 1
        elseif i == selfDWeaponIndex then
          wpnName = "Self Destruct"
          oRld = uDef.selfDCountdown
        end
        if wepCount > 1 then
          DrawText("Weap:", format(yellow .. "%dx" .. white .. " %s", wepCount, wpnName))
        else
          DrawText("Weap:", wpnName)
        end
        if uWep.coverageRange and uWep.stockpile then
            DrawText("Anti:", format("%d Interceptor Range", uWep.coverageRange))
        end

        if uWep.coverageRange and uWep.interceptor == 16 then
            DrawText("MDS:", format("%d Interceptor Range", uWep.coverageRange))
        end

        if uWep.coverageRange and uWep.interceptor == 4 then
            DrawText("MDS:", format("%d Interceptor Range", uWep.coverageRange))
        end

        if uWep.targetable == 16 then
            DrawText("MDS:","Is Targetable", '')
        end

        local reload = spGetUnitWeaponState(uID,weaponNums[i] or -1,"reloadTimeXP") or spGetUnitWeaponState(uID,weaponNums[i] or -1,"reloadTime")  or uWep.reload
        local accuracy = spGetUnitWeaponState(uID,weaponNums[i] or -1,"accuracy") or uWep.accuracy
        local moveError = spGetUnitWeaponState(uID,weaponNums[i] or -1,"targetMoveError") or uWep.targetMoveError
        local reloadBonus = reload ~= 0 and (uWep.reload/reload-1) or 0
        local accuracyBonus = accuracy ~= 0 and (uWep.accuracy/accuracy-1) or 0
        local moveErrorBonus = moveError ~= 0 and (uWep.targetMoveError/moveError-1) or 0
        local range = spGetUnitWeaponState(uID,weaponNums[i] or -1,"range") or uWep.range
        local rangeBonus = range ~= 0 and (range/uWep.range-1) or 0
        cY = cY - 2
        if uExp ~= 0 then
          local colorAdjust = (255 * reloadBonus) / 0.7
          local red = 255
          local green = 255 - colorAdjust
          local blue = 255 - colorAdjust
          green = math.max(0, green)
          blue = math.max(0, blue)
          local colorRed = string.char(red)
          local colorGreen = string.char(green)
          local colorBlue = string.char(blue)
          DrawText("Exp:", string.format("\255" .. colorRed .. colorGreen .. colorBlue .. "+%d%% firerate,\255\255\255\255 +%d%% accuracy, +%d%% aim, +%d%% range", reloadBonus*100, accuracyBonus*100, moveErrorBonus*100, rangeBonus*100))

        end
        cY = cY - 2
        local infoText = ""
        if wpnName == "Death explosion" or wpnName == "Self Destruct" then
          infoText = format("%d aoe, %d%% edge", uWep.damageAreaOfEffect, 100 * uWep.edgeEffectiveness)
        else
          infoText = format("%d range, %d aoe, %d%% edge", useExp and range * rangeMulti or uWep.range * rangeMulti, uWep.damageAreaOfEffect, 100 * uWep.edgeEffectiveness)
        end
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
          local oDmg = uWep.damages[cat] * weaponMulti
          local catName = Game.armorTypes[cat]
          if catName and oDmg and (oDmg ~= defaultDamage * weaponMulti or cat == 0) then
            local dmgString
            if oBurst > 1 then
              dmgString = format(yellow .. "%d (x%d)" .. white .. " / " .. yellow .. "%.2fs" .. white .. " = " .. yellow .. "%.2f dps", oDmg, oBurst, oRld, oBurst * oDmg / oRld)
            else
              dmgString = format(yellow .. "%d" .. white .. " / " .. yellow .. "%.2fs" .. white .. " = " .. yellow .. "%.2f dps", oDmg, oRld, oDmg / oRld)
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
    glColor(WG["background_opacity_custom"])

    -- correct position when it goes below screen
    if cY < 0 then
      cYstart = cYstart - cY
      local num = #textBuffer
      for i=1, num do
        textBuffer[i][4] = textBuffer[i][4] - (cY/2)
        textBuffer[i][4] = textBuffer[i][4] - (cY/2)
      end
      cY = 0
    end
    -- correct position when it goes off screen
    if cX + maxWidth+bgpadding+bgpadding > vsx then
      local cXnew = vsx-maxWidth-bgpadding-bgpadding
      local num = #textBuffer
      for i=1, num do
        textBuffer[i][3] = textBuffer[i][3] - ((cX-cXnew)/2)
        textBuffer[i][3] = textBuffer[i][3] - ((cX-cXnew)/2)
      end
      cX = cXnew
    end

    -- title
    local text = "\255\190\255\190" .. uDef.humanName .. "   " .. grey .. uDef.name .. grey .. "   #" .. uID .. "   "..GetTeamColorCode(uTeam) .. GetTeamName(uTeam)
    local iconHalfSize = titleFontSize*0.75
    cornersize = 0
    glColor(WG["background_opacity_custom"])
    RectRound(cX-bgpadding+cornersize, cYstart-bgpadding+cornersize, cX+(gl.GetTextWidth(text)*titleFontSize)+iconHalfSize+iconHalfSize+bgpadding+(bgpadding/1.5)-cornersize, cYstart+(titleFontSize/2)+bgpadding-cornersize, bgcornerSize)
    cornersize = ceil(bgpadding*0.21)
    glColor(1,1,1,0.025)
    RectRound(cX-bgpadding+cornersize, cYstart-bgpadding+cornersize, cX+(gl.GetTextWidth(text)*titleFontSize)+bgpadding-cornersize, cYstart+(titleFontSize/2)+bgpadding-cornersize, bgcornerSize)

    if (WG['guishader_api'] ~= nil) then
      guishaderEnabled = true
      WG['guishader_api'].InsertRect(cX-bgpadding, cYstart-bgpadding, cX+(gl.GetTextWidth(text)*titleFontSize)+bgpadding, cYstart+(titleFontSize/2)+bgpadding, 'unit_stats_title')
    end

    -- icon
    glColor(1,1,1,1)
    if WG['OtaIcons'] and OtaIconExist[uDefID] then
      gl.Texture(OtaIconExist[uDefID])
    else
      glTexture('#' .. uDefID)
    end
    glTexRect(cX, cYstart+cornersize-iconHalfSize, cX+iconHalfSize+iconHalfSize, cYstart+cornersize+iconHalfSize)
    glTexture(false)

    -- title text
    glColor(1,1,1,1)
    glText(text, cX+iconHalfSize+iconHalfSize+(bgpadding/1.5), cYstart, titleFontSize, "o")

    -- stats
    cornersize = 0
    glColor(WG["background_opacity_custom"])
    RectRound(floor(cX-bgpadding)+cornersize, ceil(cY+(fontSize/3)+bgpadding)+cornersize, ceil(cX+maxWidth+bgpadding)-cornersize, floor(cYstart-bgpadding)-cornersize, bgcornerSize)
    cornersize = ceil(bgpadding*0.16)
    glColor(1,1,1,0.025)
    RectRound(floor(cX-bgpadding)+cornersize, ceil(cY+(fontSize/3)+bgpadding)+cornersize, ceil(cX+maxWidth+bgpadding)-cornersize, floor(cYstart-bgpadding)-cornersize, bgcornerSize)

    DrawTextBuffer()

    if (WG['guishader_api'] ~= nil) then
      guishaderEnabled = true
      WG['guishader_api'].InsertRect(cX-bgpadding, cY+(fontSize/3)+bgpadding, cX+maxWidth+bgpadding, cYstart-bgpadding, 'unit_stats_data')
    end

  else
    local uDef = uDefs[uDefID]
    local uMaxHp = uDef.health
    local uTeam = Spring.GetMyTeamID()

    maxWidth = 0

    cX = mx + xOffset
    cY = my + yOffset
    cYstart = cY

    local titleFontSize = fontSize*1.12
    local cornersize = ceil(bgpadding*0.21)

    cY = cY - 2 * titleFontSize
    textBuffer = {}
    textBufferCount = 0


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

    -- Buildoptions
    cY = cY - fontSize

        textDistance = customFontSize * 5
    if (uDef.buildOptions and #uDef.buildOptions > 0) then
      DrawText(orange .."Buildoption:",metalColor ..'Metal' .. white .. ' / ' .. energyColor .. 'Energy' .. white .. ' / ' ..
      buildColor .. 'Build')
      cY = cY - fontSize
      for i=1, #uDef.buildOptions do
          buildDefID = uDef.buildOptions[i]
          local bDef = uDefs[buildDefID]
          DrawText(bDef.humanName, format(metalColor .. '%d' .. white .. ' / ' ..
        energyColor .. '%d' .. white .. ' / ' ..
        buildColor .. '%d', bDef.metalCost, bDef.energyCost, bDef.buildTime))
        end
    end

    cY = cY - fontSize

    if uDef.buildSpeed > 0 then
      DrawText('Build:', yellow .. uDef.buildSpeed)
    end
    cY = cY - fontSize

    ------------------------------------------------------------------------------------
    -- Sensors and Jamming
    ------------------------------------------------------------------------------------
    local losRadius = uDef.losRadius
    local airLosRadius = uDef.airLosRadius
    local radarRadius = uDef.radarRadius
    local sonarRadius = uDef.sonarRadius
    local jammingRadius = uDef.jammerRadius
    local sonarJammingRadius = uDef.sonarJamRadius
    local seismicRadius = uDef.seismicRadius

    DrawText('Los:', losRadius .. (airLosRadius > losRadius and format(' (AirLos: %d)', airLosRadius) or ''))

    if radarRadius   > 0 then DrawText('Radar:', '\255\77\255\77' .. radarRadius) end
    if sonarRadius   > 0 then DrawText('Sonar:', '\255\128\128\255' .. sonarRadius) end
    if jammingRadius > 0 then DrawText('Jam:'  , '\255\255\77\77' .. jammingRadius) end
    if sonarJammingRadius > 0 then DrawText('Sonar Jam:', '\255\255\77\77' .. sonarJammingRadius) end
    if seismicRadius > 0 then DrawText('Seis:' , '\255\255\26\255' .. seismicRadius) end

    if uDef.stealth then DrawText("Other:", "Stealth") end

    cY = cY - fontSize

    ------------------------------------------------------------------------------------
    -- Armor
    ------------------------------------------------------------------------------------

    DrawText("Armor:", "class " .. Game.armorTypes[uDef.armorType or 0] or '???')
    local maxHP = uDef.health
    DrawText("Open:", format("maxHP: %d", maxHP) )
    DrawText("Closed:", format(" +%d%%, maxHP: %d", (1/uDef.armoredMultiple-1) *100,maxHP/uDef.armoredMultiple))

    cY = cY - fontSize

    ------------------------------------------------------------------------------------
    -- Weapons
    ------------------------------------------------------------------------------------
    local wepCounts = {} -- wepCounts[wepDefID] = #
    local wepsCompact = {} -- uWepsCompact[1..n] = wepDefID
    uWeps = uDef.weapons
    local weaponNums = {}
    local surface = nil
    local air = nil
    for i = 1, #uWeps do
      surface = uWeps[i].onlyTargets["surface"]
      air = uWeps[i].onlyTargets["vtol"]
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

      if uWep.range > 0 and not uWep.name:find("teleport",1,true) then

        local oBurst = uWep.salvoSize * uWep.projectiles
        local oRld = max(0.00000000001,uWep.stockpile == true and uWep.stockpileTime/30 or uWep.reload)

        local wepCount = wepCounts[wDefId]

        local typeName =  uWep.type
        local wpnName = uWep.description
        if i == deathWeaponIndex then
          wpnName = "Death explosion"
          oRld = 1
        elseif i == selfDWeaponIndex then
          wpnName = "Self Destruct"
          oRld = uDef.selfDCountdown
        end
        if wepCount > 1 then
          DrawText("Weap:", format(yellow .. "%dx" .. white .. " %s", wepCount, wpnName))
        else
          DrawText("Weap:", wpnName)
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
        local range = uWep.range or nil
        dummyRange[i] = {range = range or false, defID = uDef.id ,name = uDef.name, index = i, surface = surface, air = air}
        local infoText = ""
        if wpnName == "Death explosion" or wpnName == "Self Destruct" then
          infoText = format("%d aoe, %d%% edge", uWep.damageAreaOfEffect, 100 * uWep.edgeEffectiveness)
        else
          infoText = format("%d range, %d aoe, %d%% edge", useExp and range or uWep.range, uWep.damageAreaOfEffect, 100 * uWep.edgeEffectiveness)
        end
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
              dmgString = format(yellow .. "%d (x%d)" .. white .. " / " .. yellow .. "%.2f" .. white .. " = " .. yellow .. "%.2f", oDmg, oBurst, oRld, oBurst * oDmg / oRld)
            else
              dmgString = format(yellow .. "%d" .. white .. " / " .. yellow .. "%.2f" .. white .. " = " .. yellow .. "%.2f", oDmg, oRld, oDmg / oRld)
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
    glColor(WG["background_opacity_custom"])


    -- correct position when it goes below screen
    if cY < 0 then
      cYstart = cYstart - cY
      local num = #textBuffer
      for i=1, num do
        textBuffer[i][4] = textBuffer[i][4] - (cY/2)
        textBuffer[i][4] = textBuffer[i][4] - (cY/2)
      end
      cY = 0
    end
    -- correct position when it goes off screen
    if cX + maxWidth+bgpadding+bgpadding > vsx then
      local cXnew = vsx-maxWidth-bgpadding-bgpadding
      local num = #textBuffer
      for i=1, num do
        textBuffer[i][3] = textBuffer[i][3] - ((cX-cXnew)/2)
        textBuffer[i][3] = textBuffer[i][3] - ((cX-cXnew)/2)
      end
      cX = cXnew
    end

    -- title
    local text = "\255\190\255\190" .. uDef.humanName .. "   " .. grey .. uDef.name .. grey
    local iconHalfSize = titleFontSize*0.75
    cornersize = 0

    glColor(WG["background_opacity_custom"])

    RectRound(cX-bgpadding+cornersize, cYstart-bgpadding+cornersize, cX+(gl.GetTextWidth(text)*titleFontSize)+iconHalfSize+iconHalfSize+bgpadding+(bgpadding/1.5)-cornersize, cYstart+(titleFontSize/2)+bgpadding-cornersize, bgcornerSize)
    cornersize = ceil(bgpadding*0.21)
    glColor(1,1,1,0.025)
    RectRound(cX-bgpadding+cornersize, cYstart-bgpadding+cornersize, cX+(gl.GetTextWidth(text)*titleFontSize)+bgpadding-cornersize, cYstart+(titleFontSize/2)+bgpadding-cornersize, bgcornerSize)

    if (WG['guishader_api'] ~= nil) then
      guishaderEnabled = true
      WG['guishader_api'].InsertRect(cX-bgpadding, cYstart-bgpadding, cX+(gl.GetTextWidth(text)*titleFontSize)+bgpadding, cYstart+(titleFontSize/2)+bgpadding, 'unit_stats_title')
    end

    -- icon
     --glColor(1,1,1,1)
    --glTexture('#' .. uDefID)
    --glTexRect(cX, cYstart+cornersize-iconHalfSize, cX+iconHalfSize+iconHalfSize, cYstart+cornersize+iconHalfSize)
    --glTexture(false)

    -- title text
    glColor(1,1,1,1)
    --glText(text, cX+iconHalfSize+iconHalfSize+(bgpadding/1.5), cYstart, titleFontSize, "o")
    glText(text, cX, cYstart, titleFontSize, "o")

    -- stats
    glColor(WG["background_opacity_custom"])


    cornersize = 0
    RectRound(floor(cX-bgpadding)+cornersize, ceil(cY+(fontSize/3)+bgpadding)+cornersize, ceil(cX+maxWidth+bgpadding)-cornersize, floor(cYstart-bgpadding)-cornersize, bgcornerSize)
    cornersize = ceil(bgpadding*0.16)
    glColor(1,1,1,0.025)
    RectRound(floor(cX-bgpadding)+cornersize, ceil(cY+(fontSize/3)+bgpadding)+cornersize, ceil(cX+maxWidth+bgpadding)-cornersize, floor(cYstart-bgpadding)-cornersize, bgcornerSize)

    DrawTextBuffer()

    if (WG['guishader_api'] ~= nil) then
      guishaderEnabled = true
      WG['guishader_api'].InsertRect(cX-bgpadding, cY+(fontSize/3)+bgpadding, cX+maxWidth+bgpadding, cYstart-bgpadding, 'unit_stats_data')
    end
  end
end

function widget:DrawWorld()
    if dummyUnitID then
      for i, keys in pairs(dummyRange) do
        local color = {1, 0, 0, darkOpacity}
        --Spring.Echo(currentMod,keys.name,keys.defID,keys.index,keys.surface,keys.air)
        if modConfig[currentMod]["unitList"][keys.name] then
          local weapontype = modConfig[currentMod]["unitList"][keys.name]["weapons"][keys.index]
        if ( weapontype == 1 or weapontype == 4 ) then   -- show combo units with ground-dps-colors
          color = colorConfig["ally"]["ground"]["min"]
        elseif ( weapontype == 2 ) then
          color = colorConfig["ally"]["air"]["min"]
        elseif ( weapontype == 3 ) then -- antinuke
          color = colorConfig["ally"]["nuke"]
        end
      else
        if keys.surface then
          color = colorConfig["ally"]["ground"]["min"]
        elseif keys.air then
          color = colorConfig["ally"]["air"]["min"]
        end
      end
        gl.Color(color[1], color[2], color[3], darkOpacity)
          gl.LineWidth(1.2)
          x, y, z = Spring.GetUnitBasePosition(dummyUnitID)
          gl.DrawGroundCircle(x, y, z, keys.range, 64)
          gl.Color(1,1,1,1)
      end
    end
end

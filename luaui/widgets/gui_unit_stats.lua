--------------------------------------------------------------------------------
-- Widget Metadata
--------------------------------------------------------------------------------
function widget:GetInfo()
  return {
    name    = "Unit Stats",
    desc    = "Shows detailed unit stats",
    author  = "Niobium + Doo",
    date    = "Jan 11, 2009",
    version = 1.7,
    license = "GNU GPL, v2 or later",
    layer   = -9999999999,
    enabled = true, -- loaded by default?
  }
end

--------------------------------------------------------------------------------
-- Includes & Definitions
--------------------------------------------------------------------------------
include("keysym.h.lua")

--[[
  Change Log:
  v1.7 by Doo:
    - Reverted "Added beamtime to oRld value to properly count dps of BeamLaser weapons" because 
      reload starts at the beginning of the beamtime.
    - Reduced the "minimal" reloadTime to properly calculate dps for low-reloadtime weapons.
    - Hid range from GUI for explosion (death/selfd) as it is irrelevant.

  v1.6 by Doo:
    - Fixed crashing when hovering some enemy units.

  v1.5 by Doo:
    - Fixed some issues with the addition of BeamTime values.
    - Added a 1/30 factor to stockpiling weapons (lua wDef.stockpileTime is in frames while 
      weaponDefs uses seconds). Probably the 1/30 value in older versions wasn't a "min reloadtime"
      but the 1/30 factor for stockpile weapons with a typo.

  v1.4 by Doo:
    - Added beamtime to oRld value to properly count dps of BeamLaser weapons.

  v1.3:
    - Fix for engine version 87.0
    - Added display of experience effect (when experience >25%)

  v1.2:
    - Fixed drains for burst weapons (Removed 0.125 minimum).
    - Show remaining costs for units under construction.

  v1.1:
    - Added extra text to help explain numbers.
    - Added grouping of duplicate weapons.
    - Added sonar radius.
    - Fixed radar/jammer detection.
    - Fixed stockpiling unit drains.
    - Fixed turnrate/acceleration scale.
    - Fixed very low reload times.
]]

--------------------------------------------------------------------------------
-- Locals / Speedups
--------------------------------------------------------------------------------
local VFS             = VFS
local Game            = Game
local WG              = WG
local GL              = GL
local Spring          = Spring
local spGetMyTeamID   = Spring.GetMyTeamID
local spGetTeamResources   = Spring.GetTeamResources
local spGetTeamInfo        = Spring.GetTeamInfo
local spGetPlayerInfo      = Spring.GetPlayerInfo
local spGetTeamColor       = Spring.GetTeamColor
local spGetModKeyState     = Spring.GetModKeyState
local spGetMouseState      = Spring.GetMouseState
local spTraceScreenRay     = Spring.TraceScreenRay
local spGetSelectedUnits   = Spring.GetSelectedUnits
local spGetSelectedUnitsCount = Spring.GetSelectedUnitsCount
local spGetUnitDefID       = Spring.GetUnitDefID
local spGetUnitExperience  = Spring.GetUnitExperience
local spGetUnitHealth      = Spring.GetUnitHealth
local spGetUnitTeam        = Spring.GetUnitTeam
local spGetUnitSensorRadius = Spring.GetUnitSensorRadius
local spGetUnitWeaponState = Spring.GetUnitWeaponState
local spGetTooltip         = Spring.GetCurrentTooltip
local spGetTeamRulesParam  = Spring.GetUnitRulesParam

local glText    = gl.Text
local glTexture = gl.Texture
local glRect    = gl.Rect
local glTexRect = gl.TexRect
local glColor   = gl.Color

local floor     = math.floor
local ceil      = math.ceil
local max       = math.max
local format    = string.format
local char      = string.char

local uDefs     = UnitDefs
local wDefs     = WeaponDefs
local simSpeed  = Game.gameSpeed
local triggerKey= KEYSYMS.SPACE

--------------------------------------------------------------------------------
-- Widget Globals & Config
--------------------------------------------------------------------------------
local DAMAGE_PERIOD, weaponInfo   = VFS.Include("LuaRules/Configs/area_damage_defs.lua", nil, VFS.RAW_FIRST)
local modConfig, colorConfig      = include("Configs/defensive_range_defs.lua")
local currentMod                  = string.upper(Game.modShortName or "")

local oldUnitpicsDir             = LUAUI_DIRNAME .. "Images/oldunitpics/"
local OtaIconExist               = {}
local onlytarget                 = {}

local widgetScale                = 1
local vsx, vsy                   = gl.GetViewSizes()
local fontSize                   = 13
local customFontSize             = 13
local textDistance               = 0
local cX, cY                     = 0, 0

local xOffset                    = 0
local yOffset                    = 0
local maxWidth                   = 0
local textBuffer                 = {}
local textBufferCount            = 0

local bgcorner                   = "LuaUI/Images/bgcorner.png"
local bgcornerSize               = 0
local bgpadding                  = 0

local darkOpacity                = 0
local guishaderEnabled           = false

local dummyUnitID                = nil
local dummyRange                 = {}
local spec                       = Spring.GetSpectatingState()

-- Resource-based powerplant definitions (for specialized info)
local pplants = {
  -- Format: ["unitName"] = true
  ["aafus"] = true,
  ["talon_afus"] = true,
  -- ...
  -- [Truncated for brevity—keep your full dictionary here]
  -- ...
  ["rumad_geo"] = true,
  ["rumad_sfusion"] = true,
  ["rumad_efusion"] = true,
  ["rumad_ufus"] = true,
  ["rumad_egeo"] = true,
}

local windMin        = Game.windMin
local windMax        = Game.windMax
local tidalStrength  = Game.tidal

--------------------------------------------------------------------------------
-- Initialization
--------------------------------------------------------------------------------

-- Pre-fill table for old/OTA icons
for i = 1, #uDefs do
  local testFile = oldUnitpicsDir .. uDefs[i].name .. ".png"
  if VFS.FileExists(testFile) then
    OtaIconExist[i] = testFile
  end
end

--------------------------------------------------------------------------------
-- Utility & Drawing Functions
--------------------------------------------------------------------------------

local function RemoveGuishader()
  if guishaderEnabled and WG["guishader_api"] then
    WG["guishader_api"].RemoveRect("unit_stats_title")
    WG["guishader_api"].RemoveRect("unit_stats_data")
    guishaderEnabled = false
  end
end

local function SetOpacity(dark, light)
  -- The 'light' param is unused by this code, but kept for API compatibility
  darkOpacity = dark
end

local function DrawRoundedRect(px, py, sx, sy, cs)
  local pxF = floor(px)
  local pyF = floor(py)
  local sxF = floor(sx)
  local syF = floor(sy)
  local csF = floor(cs)

  gl.Rect(pxF + csF, pyF,        sxF - csF, syF)
  gl.Rect(sxF - csF, pyF + csF,  sxF,       syF - csF)
  gl.Rect(pxF + csF, pyF + csF,  pxF,       syF - csF)

  gl.Texture(bgcorner)
  -- top left
  gl.TexRect(pxF,        pyF + csF, pxF + csF, pyF)
  -- top right
  gl.TexRect(sxF,        pyF + csF, sxF - csF, pyF)
  -- bottom left
  gl.TexRect(pxF,        syF - csF, pxF + csF, syF)
  -- bottom right
  gl.TexRect(sxF,        syF - csF, sxF - csF, syF)
  gl.Texture(false)
end

local function AddTextLine(t1, t2)
  textBufferCount = textBufferCount + 1
  textBuffer[textBufferCount] = {
    "\255\255\255\255" .. t1,
    "\255\255\255\255" .. t2,
    cX,
    cY
  }
  cY = cY - fontSize
  maxWidth = max(
    maxWidth,
    (gl.GetTextWidth(t1) * fontSize),
    (gl.GetTextWidth(t2) * fontSize) + (fontSize * 6.5 + textDistance)
  )
end

local function RenderTextBuffer()
  for i = 1, textBufferCount do
    local lineData = textBuffer[i]
    glText(lineData[1], lineData[3], lineData[4], fontSize, "o")
    glText(lineData[2], lineData[3] + (fontSize * 6.5) + textDistance, lineData[4], fontSize, "o")
  end
end

local function GetTeamColorCode(teamID)
  if not teamID then
    return "\255\255\255\255"
  end
  local R, G, B = spGetTeamColor(teamID)
  if not R then
    return "\255\255\255\255"
  end
  R = floor(R * 255)
  G = floor(G * 255)
  B = floor(B * 255)
  -- Note: char(10) terminates string in some contexts, clamp them
  if R < 11 then R = 11 end
  if G < 11 then G = 11 end
  if B < 11 then B = 11 end
  return "\255" .. char(R) .. char(G) .. char(B)
end

local function GetTeamName(teamID)
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

--------------------------------------------------------------------------------
-- Local Initialization
--------------------------------------------------------------------------------
local function InitWidget()
  vsx, vsy     = gl.GetViewSizes()
  widgetScale  = 0.60 + (vsx * vsy / 5000000)
  fontSize     = customFontSize * widgetScale
  bgcornerSize = fontSize * 0.45
  bgpadding    = fontSize * 0.9

  xOffset = (32 + bgpadding) * widgetScale
  yOffset = -((32 + bgpadding) * widgetScale)
end

--------------------------------------------------------------------------------
-- Widget Call-ins
--------------------------------------------------------------------------------

function widget:Initialize()
  widgetHandler:RegisterGlobal("SetOpacity_Unit_Stats", SetOpacity)
  if not WG["background_opacity_custom"] then
    WG["background_opacity_custom"] = {0, 0, 0, 0.5}
  end
  InitWidget()
end

function widget:Shutdown()
  widgetHandler:DeregisterGlobal("SetOpacity_Unit_Stats", SetOpacity)
  RemoveGuishader()
end

function widget:PlayerChanged()
  spec = Spring.GetSpectatingState()
end

function widget:ViewResize()
  InitWidget()
end

--------------------------------------------------------------------------------
-- Main Drawing (Screen)
--------------------------------------------------------------------------------
function widget:DrawScreen()
  local alt, ctrl, meta, shift = spGetModKeyState()
  if not meta then
    dummyUnitID = nil
    RemoveGuishader()
    return
  end

  local mx, my         = spGetMouseState()
  local rType, unitID  = spTraceScreenRay(mx, my)

  local hoveredUnitID = (rType == "unit") and unitID or nil
  local useHoverID    = false
  local morphID       = false
  dummyUnitID         = nil

  local _, activeID   = Spring.GetActiveCommand()
  activeID            = activeID or 0
  local tooltipText   = Spring.GetCurrentTooltip()
  local expMorphPat   = "UnitDefID (%d+)\n"
  local morphDefID    = tonumber(tooltipText:match(expMorphPat)) or nil

  if morphDefID then
    -- Possibly morphing from selection
    local selUnits = spGetSelectedUnits()
    if #selUnits >= 1 then
      dummyUnitID = selUnits[1]
    end
    morphID    = true
  elseif (WG.hoverID and WG.hoverID < 0 and not (activeID < 0)) then
    hoveredUnitID = nil
    useHoverID    = true
  elseif activeID < 0 then
    hoveredUnitID = nil
  end

  local useExp = ctrl

  -- Derive the unitDefID from either the hovered unit, a negative weapon ID, morph, or activeID.
  local uDefID = (hoveredUnitID and spGetUnitDefID(hoveredUnitID))
    or (useHoverID and -WG.hoverID)
    or (UnitDefs[-activeID] and -activeID)
    or (morphID and morphDefID)

  if not uDefID then
    RemoveGuishader()
    return
  end

  ------------------------------------------------------------------------------
  -- If we have an actual existing unit (not just a blueprint)
  ------------------------------------------------------------------------------
  if hoveredUnitID then
    textDistance = 0
    local uDef        = uDefs[uDefID]
    local uCurHp,
          uMaxHp,
          _,
          _,
          buildProg   = spGetUnitHealth(hoveredUnitID)
    local uTeam       = spGetUnitTeam(hoveredUnitID)
    local _, xp       = Spring.GetUnitExperience(hoveredUnitID)

    maxWidth = 0
    cX       = mx + xOffset
    cY       = my + yOffset
    local cYstart = cY

    local titleFontSize = fontSize * 1.12
    local cornersize    = ceil(bgpadding * 0.21)
    cY = cY - 2 * titleFontSize

    textBuffer       = {}
    textBufferCount  = 0

    ----------------------------------------------------------------------------
    -- Additional Resource & Conversion Info (optional or mod-specific)
    ----------------------------------------------------------------------------
    if WG["energyConversion"] then
      local makerTemp = WG.energyConversion.convertCapacities[uDefID]
      local curAvgEffi = spGetTeamRulesParam(spGetMyTeamID(), "mmAvgEffi") or 0
      local avgCR = 0.015

      if makerTemp then
        AddTextLine("\255\255\128\1Metal maker properties", "")
        AddTextLine("M-             .:", makerTemp.c)
        AddTextLine("M-Effi.:", format("%.2f m / 1000 e", makerTemp.e * 1000))
        cY = cY - fontSize
      end

      if pplants[uDef.name] then
        AddTextLine("\255\255\128\1Powerplant properties", "")
        AddTextLine("CR is metal maker conversion rate", "")

        local totalEOut = uDef.energyMake or 0

        if (uDef.tidalGenerator or 0) > 0 and tidalStrength > 0 then
          local mult = (uDef.customParams and uDef.customParams.energymultiplier) or 1
          totalEOut = totalEOut + (tidalStrength * mult)
        end

        if (uDef.windGenerator or 0) > 0 then
          local mult = (uDef.customParams and uDef.customParams.energymultiplier) or 1
          local unitWindMin = math.min(windMin, uDef.windGenerator)
          local unitWindMax = math.min(windMax, uDef.windGenerator)
          totalEOut = totalEOut + ((unitWindMin + unitWindMax) * 0.5 * mult)
        end

        AddTextLine("Avg. E-Out.:", totalEOut)
        AddTextLine("M-Cost.:", uDef.metalCost)
        local avgEffiPercent = (totalEOut * 100) / (uDef.metalCost + uDef.energyCost * avgCR)
        AddTextLine("Avg-Effi.:", format("%.2f%% e / (m + e * avg. CR)", avgEffiPercent))

        if (curAvgEffi > 0) then
          local currEffiPercent = (totalEOut * 100) / (uDef.metalCost + uDef.energyCost * curAvgEffi)
          AddTextLine("Curr-Effi.:", format("%.2f%% e / (m + e * curr. CR)", currEffiPercent))
        end
        cY = cY - fontSize
      end

      if (not (#uDef.weapons > 0)) or uDef.isBuilding or pplants[uDef.name] then
        if ((uDef.extractsMetal and uDef.extractsMetal > 0)
          or (uDef.metalMake   and uDef.metalMake   > 0)
          or (uDef.energyMake  and uDef.energyMake  > 0)
          or (uDef.tidalGenerator and uDef.tidalGenerator > 0)
          or (uDef.windGenerator  and uDef.windGenerator  > 0)) then

          AddTextLine("\255\128\128\255Estimated time of recovering 100% of cost:", "")

          local totalMOut = uDef.metalMake or 0
          local totalEOut = uDef.energyMake or 0

          -- Extractor: parse the tooltip for an incremental addition
          if (uDef.extractsMetal and uDef.extractsMetal > 0) then
            local metalExtractor = {inc = 0, out = 0, passed= false}
            local ttip = spGetTooltip()  -- local to the hovered unit
            ttip:gsub("Metal: ....%d+%.%d", 
              function(x) 
                x:gsub("%d+%.%d", function(y) metalExtractor.inc = tonumber(y) end)
              end
            )
            ttip:gsub("Energy: ....%d+%.%d+..../....-%d+%.%d+",
              function(x)
                x:gsub("%d+%.%d", function(y)
                  if metalExtractor.passed then 
                    metalExtractor.out = tonumber(y)
                  else 
                    metalExtractor.passed = true
                  end
                end)
              end
            )
            totalMOut = totalMOut + metalExtractor.inc
            totalEOut = totalEOut - metalExtractor.out
          end

          -- Tidal
          if (uDef.tidalGenerator or 0) > 0 and tidalStrength > 0 then
            local mult = (uDef.customParams and uDef.customParams.energymultiplier) or 1
            totalEOut  = totalEOut + tidalStrength * mult
          end

          -- Wind
          if (uDef.windGenerator or 0) > 0 then
            local mult = (uDef.customParams and uDef.customParams.energymultiplier) or 1
            local unitWindMin = math.min(windMin, uDef.windGenerator)
            local unitWindMax = math.min(windMax, uDef.windGenerator)
            totalEOut = totalEOut + ((unitWindMin + unitWindMax) * 0.5 * mult)
          end

          local denomAvg  = (totalEOut * avgCR + totalMOut)
          local denomCurr = (totalEOut * (curAvgEffi or 0) + totalMOut)
          if denomAvg > 0 then
            local avgSec  = (uDef.metalCost + uDef.energyCost * avgCR) / denomAvg
            AddTextLine("Average:", format("%i sec (%i min %i sec)", avgSec, avgSec/60, avgSec % 60))

            if curAvgEffi > 0 then
              local currSec = (uDef.metalCost + uDef.energyCost * curAvgEffi) / denomCurr
              AddTextLine("Current:", format("%i sec (%i min %i sec)", currSec, currSec/60, currSec % 60))
            end
          else
            AddTextLine("Average:", "Unknown")
          end
          cY = cY - fontSize
        end
      end
    end

    ----------------------------------------------------------------------------
    -- If the unit is under construction, show progress and resource usage
    ----------------------------------------------------------------------------
    if buildProg and (buildProg < 1) then
      local myTeamID       = spGetMyTeamID()
      local mCur, mStor,
            mPull, mInc,
            mExp, mShare,
            mSent, mRec    = spGetTeamResources(myTeamID, "metal")
      local eCur, eStor,
            ePull, eInc,
            eExp, eShare,
            eSent, eRec    = spGetTeamResources(myTeamID, "energy")

      local mTotal     = uDef.metalCost
      local eTotal     = uDef.energyCost
      local buildRem   = 1 - buildProg
      local mRem       = mTotal * buildRem
      local eRem       = eTotal * buildRem
      local mEta       = (mRem - mCur) / (mInc + mRec)
      local eEta       = (eRem - eCur) / (eInc + eRec)

      AddTextLine("Prog:", format("%d%%", 100 * buildProg))
      AddTextLine("Metal:", format("%d / %d (\255\255\255\1%d\255\255\255\255, %ds)", 
                  mTotal * buildProg, mTotal, mRem, mEta))
      AddTextLine("Energy:", format("%d / %d (\255\255\255\1%d\255\255\255\255, %ds)",
                  eTotal * buildProg, eTotal, eRem, eEta))
      cY = cY - fontSize
    end

    ----------------------------------------------------------------------------
    -- Basic unit stats: cost, move, build
    ----------------------------------------------------------------------------
    local metalCost  = Spring.GetUnitRulesParam(hoveredUnitID, "metalCost")  or uDef.metalCost
    local energyCost = Spring.GetUnitRulesParam(hoveredUnitID, "energyCost") or uDef.energyCost
    local buildTime  = Spring.GetUnitRulesParam(hoveredUnitID, "buildTime")  or uDef.buildTime
    local weaponMulti= Spring.GetUnitRulesParam(hoveredUnitID, "weaponMulti")or 1
    local rangeMulti = Spring.GetUnitRulesParam(hoveredUnitID, "rangeMulti") or 1

    AddTextLine("Cost:", format("\255\196\196\255%d\255\255\255\255 / \255\255\255\128%d\255\255\255\255 / \255\128\255\128%d",
                                metalCost, energyCost, buildTime))

    if not (uDef.isBuilding or uDef.isFactory) then
      local moveData = Spring.GetUnitMoveTypeData(hoveredUnitID)
      if moveData then
        local mSpeed   = moveData.maxSpeed or uDef.speed
        local mAccel   = moveData.accRate or uDef.maxAcc
        local mTurn    = moveData.baseTurnRate or uDef.turnRate
        AddTextLine("Move:", format("%.1f / %.1f / %.0f (Speed / Accel / Turn)", 
                                     mSpeed, 900 * mAccel, simSpeed * mTurn * (180 / 32767)))
      else
        AddTextLine("Move:", format("%.1f / %.1f / %.0f (Speed / Accel / Turn)",
                                     uDef.speed, 900 * uDef.maxAcc, simSpeed * uDef.turnRate * (180 / 32767)))
      end
    end
    cY = cY - fontSize

    AddTextLine("Build:", "\255\255\255\1" .. uDef.buildSpeed)
    cY = cY - fontSize

    ----------------------------------------------------------------------------
    -- Sensors & Jamming
    ----------------------------------------------------------------------------
    local losRadius          = spGetUnitSensorRadius(hoveredUnitID, "los")         or 0
    local airLosRadius       = spGetUnitSensorRadius(hoveredUnitID, "airLos")      or 0
    local radarRadius        = spGetUnitSensorRadius(hoveredUnitID, "radar")       or 0
    local sonarRadius        = spGetUnitSensorRadius(hoveredUnitID, "sonar")       or 0
    local jammingRadius      = spGetUnitSensorRadius(hoveredUnitID, "radarJammer") or 0
    local sonarJammingRadius = spGetUnitSensorRadius(hoveredUnitID, "sonarJammer") or 0
    local seismicRadius      = spGetUnitSensorRadius(hoveredUnitID, "seismic")     or 0

    AddTextLine("Los:", losRadius .. 
      ((airLosRadius > losRadius) and format(" (AirLos: %d)", airLosRadius) or ""))

    if radarRadius   > 0 then AddTextLine("Radar:", "\255\77\255\77" .. radarRadius) end
    if sonarRadius   > 0 then AddTextLine("Sonar:", "\255\128\128\255" .. sonarRadius) end
    if jammingRadius > 0 then AddTextLine("Jam:",   "\255\255\77\77" .. jammingRadius) end
    if sonarJammingRadius > 0 then
      AddTextLine("Sonar Jam:", "\255\255\77\77" .. sonarJammingRadius)
    end
    if seismicRadius > 0 then AddTextLine("Seis:", "\255\255\26\255" .. seismicRadius) end
    if uDef.stealth  then AddTextLine("Other:", "Stealth") end
    cY = cY - fontSize

    ----------------------------------------------------------------------------
    -- Armor
    ----------------------------------------------------------------------------
    local armorStr = Game.armorTypes[uDef.armorType or 0] or "???"
    AddTextLine("Armor:", "class " .. armorStr)

    local _, spMaxHP = Spring.GetUnitHealth(hoveredUnitID)
    local unitMaxHP  = spMaxHP or uDef.health or 0
    local uExp       = spGetUnitExperience(hoveredUnitID)

    if (uExp ~= 0) and (unitMaxHP > 0) and (uDef.health > 0) then
      local expBonusPct = (unitMaxHP / uDef.health - 1) * 100
      AddTextLine("Exp:", format("+%d%% health", expBonusPct))
    end

    AddTextLine("Open:", format("maxHP: %d", unitMaxHP))

    local _, armoredMultiple = Spring.GetUnitArmored(hoveredUnitID)
    local realArmoredMult    = armoredMultiple or uDef.armoredMultiple
    if (realArmoredMult ~= 1) then
      AddTextLine("Closed:", format(" +%d%%, maxHP: %d", 
                   (1 / realArmoredMult - 1) * 100, unitMaxHP / realArmoredMult))
    elseif (uDef.armoredMultiple ~= 1) then
      AddTextLine("Closed:", format(" +%d%%, maxHP: %d", 
                   (1 / uDef.armoredMultiple - 1) * 100, unitMaxHP / uDef.armoredMultiple))
    end

    cY = cY - fontSize

    ----------------------------------------------------------------------------
    -- Weapons
    ----------------------------------------------------------------------------
    local wepCounts    = {}
    local wepsCompact  = {}
    local weaponNums   = {}
    for i = 1, #uDef.weapons do
      local wDefID  = uDef.weapons[i].weaponDef
      wepCounts[wDefID] = (wepCounts[wDefID] or 0) + 1
      if wepCounts[wDefID] == 1 then
        wepsCompact[#wepsCompact + 1] = wDefID
        weaponNums[#wepsCompact]      = i
      end
    end

    local selfDWeaponID   = WeaponDefNames[uDef.selfDExplosion] and WeaponDefNames[uDef.selfDExplosion].id
    local deathWeaponID   = WeaponDefNames[uDef.deathExplosion] and WeaponDefNames[uDef.deathExplosion].id
    local selfDWeaponIndex
    local deathWeaponIndex

    if shift and selfDWeaponID and deathWeaponID then
      wepCounts   = {}
      wepsCompact = {}
      wepCounts[selfDWeaponID] = 1
      wepCounts[deathWeaponID] = 1
      deathWeaponIndex         = #wepsCompact + 1
      wepsCompact[deathWeaponIndex] = deathWeaponID
      selfDWeaponIndex         = #wepsCompact + 1
      wepsCompact[selfDWeaponIndex] = selfDWeaponID
    end

    for i = 1, #wepsCompact do
      local wDefId = wepsCompact[i]
      local uWep   = wDefs[wDefId]
      if (uWep.range > 0) and (not uWep.name:find("teleport", 1, true)) then
        local oBurst = uWep.salvoSize * uWep.projectiles
        local oRld   = max(1e-11, (uWep.stockpile and (uWep.stockpileTime/30) or uWep.reload))
        if useExp and (not uWep.stockpile) then
          oRld = spGetUnitWeaponState(hoveredUnitID, weaponNums[i] or -1, "reloadTime") or oRld
        end

        local wepCount = wepCounts[wDefId]
        local wpnName  = uWep.description
        if (i == deathWeaponIndex) then
          wpnName = "Death explosion"
          oRld    = 1
        elseif (i == selfDWeaponIndex) then
          wpnName = "Self Destruct"
          oRld    = uDef.selfDCountdown
        end

        if wepCount > 1 then
          AddTextLine("Weap:", format("\255\255\255\1%dx\255\255\255\255 %s", wepCount, wpnName))
        else
          AddTextLine("Weap:", wpnName)
        end

        if (uWep.coverageRange and uWep.stockpile) then
          AddTextLine("Anti:", format("%d Interceptor Range", uWep.coverageRange))
        end

        if (uWep.coverageRange and (uWep.interceptor == 16)) then
          AddTextLine("MDS:", format("%d Interceptor Range", uWep.coverageRange))
        end
        if (uWep.interceptor == 4 and uWep.coverageRange) then
          AddTextLine("MDS:", format("%d Interceptor Range", uWep.coverageRange))
        end
        if (uWep.targetable == 16) then
          AddTextLine("MDS:", "Is Targetable")
        end

        local reload    = spGetUnitWeaponState(hoveredUnitID, weaponNums[i] or -1, "reloadTimeXP")
                         or spGetUnitWeaponState(hoveredUnitID, weaponNums[i] or -1, "reloadTime")
                         or uWep.reload
        local accuracy  = spGetUnitWeaponState(hoveredUnitID, weaponNums[i] or -1, "accuracy")         or uWep.accuracy
        local moveError = spGetUnitWeaponState(hoveredUnitID, weaponNums[i] or -1, "targetMoveError")  or uWep.targetMoveError
        local range     = spGetUnitWeaponState(hoveredUnitID, weaponNums[i] or -1, "range")            or uWep.range

        local reloadBonus    = (reload ~= 0)    and ((uWep.reload / reload) - 1)               or 0
        local accuracyBonus  = (accuracy ~= 0)  and ((uWep.accuracy / accuracy) - 1)           or 0
        local moveErrorBonus = (moveError ~= 0) and ((uWep.targetMoveError / moveError) - 1)   or 0
        local rangeBonus     = (range ~= 0)     and ((range / uWep.range) - 1)                 or 0

        if (uExp ~= 0) then
          AddTextLine("Exp:", format("\255%d%d%d+%d%% firerate,\255\255\255\255 +%d%% accuracy, +%d%% aim, +%d%% range",
            255, 
            max(0, 255 - (255 * reloadBonus / 0.7)), 
            max(0, 255 - (255 * reloadBonus / 0.7)),
            reloadBonus    * 100,
            accuracyBonus  * 100,
            moveErrorBonus * 100,
            rangeBonus     * 100
          ))
        end

        local infoText
        if (wpnName == "Death explosion") or (wpnName == "Self Destruct") then
          infoText = format("%d aoe, %d%% edge", uWep.damageAreaOfEffect, 100 * uWep.edgeEffectiveness)
        else
          infoText = format("%d range, %d aoe, %d%% edge",
                            (useExp and (range * rangeMulti) or (uWep.range * rangeMulti)),
                            uWep.damageAreaOfEffect,
                            100 * uWep.edgeEffectiveness)
        end
        if (uWep.damages.paralyzeDamageTime > 0) then
          infoText = format("%s, %ds paralyze", infoText, uWep.damages.paralyzeDamageTime)
        end
        if (uWep.damages.impulseBoost > 0) then
          infoText = format("%s, %d impulse", infoText, uWep.damages.impulseBoost * 100)
        end
        if (uWep.damages.craterBoost > 0) then
          infoText = format("%s, %d crater", infoText, uWep.damages.craterBoost * 100)
        end
        AddTextLine("Info:", infoText)

        local defaultDamage = uWep.damages[0]
        for cat = 0, #uWep.damages do
          local catDamage = uWep.damages[cat] * weaponMulti
          local catName   = Game.armorTypes[cat]
          if catName and catDamage and ((catDamage ~= defaultDamage * weaponMulti) or (cat == 0)) then
            local dmgString
            if oBurst > 1 then
              dmgString = format("\255\255\255\1%d (x%d)\255\255\255\255 / \255\255\255\1%.2fs\255\255\255\255 = \255\255\255\1%.2f dps",
                                 catDamage, oBurst, oRld, (oBurst * catDamage / oRld))
            else
              dmgString = format("\255\255\255\1%d\255\255\255\255 / \255\255\255\1%.2fs\255\255\255\255 = \255\255\255\1%.2f dps",
                                 catDamage, oRld, (catDamage / oRld))
            end
            if wepCount > 1 then
              dmgString = dmgString .. "\255\255\255\255 (Each)"
            end
            dmgString = dmgString .. " (" .. catName .. ")"
            AddTextLine("Dmg:", dmgString)
          end
        end

        if (uWep.metalCost > 0) or (uWep.energyCost > 0) then
          local drainAdjust = (uWep.stockpile and ((simSpeed+2) / simSpeed)) or 1
          AddTextLine("Cost:", format(
            "\255\196\196\255%d\255\255\255\255, \255\255\255\128%d\255\255\255\255 = \255\196\196\255-%d\255\255\255\255, \255\255\255\128-%d\255\255\255\255 per second",
            uWep.metalCost, uWep.energyCost,
            (drainAdjust * uWep.metalCost  / oRld),
            (drainAdjust * uWep.energyCost / oRld)
          ))
        end

        if weaponInfo[wDefId] then
          local radius  = weaponInfo[wDefId].radius
          local damage  = weaponInfo[wDefId].damage
          local duration= weaponInfo[wDefId].duration
          AddTextLine("Area Dmg:", format("%d aoe, %d max damage per second , %d seconds",
                          radius, damage * 30 / DAMAGE_PERIOD, duration / 30))
        end

        cY = cY - fontSize
      end
    end

    ----------------------------------------------------------------------------
    -- Render the background boxes
    ----------------------------------------------------------------------------
    glColor(WG["background_opacity_custom"])

    -- If we go below the screen, push back up
    if cY < 0 then
      local shiftY = -cY
      cYstart = cYstart + shiftY
      for i = 1, textBufferCount do
        textBuffer[i][4] = textBuffer[i][4] + shiftY
      end
      cY = 0
    end

    -- If we go off the right edge, push left
    if (cX + maxWidth + bgpadding + bgpadding) > vsx then
      local shiftX = (cX + maxWidth + bgpadding + bgpadding) - vsx
      cX = cX - shiftX
      for i = 1, textBufferCount do
        textBuffer[i][3] = textBuffer[i][3] - shiftX
      end
    end

    -- Title box
    local text = format("\255\190\255\190%s   \255\190\190\190%s\255\190\190\190   #%d   %s%s",
                        uDef.humanName, uDef.name, hoveredUnitID,
                        GetTeamColorCode(uTeam), GetTeamName(uTeam))

    local iconHalfSize = titleFontSize * 0.75
    cornersize         = 0
    glColor(WG["background_opacity_custom"])
    DrawRoundedRect(
      cX - bgpadding + cornersize,
      cYstart - bgpadding + cornersize,
      cX + (gl.GetTextWidth(text) * titleFontSize) + iconHalfSize + iconHalfSize
         + bgpadding + (bgpadding / 1.5) - cornersize,
      cYstart + (titleFontSize / 2) + bgpadding - cornersize,
      bgcornerSize
    )

    cornersize = ceil(bgpadding * 0.21)
    glColor(1, 1, 1, 0.025)
    DrawRoundedRect(
      cX - bgpadding + cornersize,
      cYstart - bgpadding + cornersize,
      cX + (gl.GetTextWidth(text) * titleFontSize) + bgpadding - cornersize,
      cYstart + (titleFontSize / 2) + bgpadding - cornersize,
      bgcornerSize
    )

    if WG["guishader_api"] then
      guishaderEnabled = true
      WG["guishader_api"].InsertRect(
        cX - bgpadding,
        cYstart - bgpadding,
        cX + (gl.GetTextWidth(text) * titleFontSize) + bgpadding,
        cYstart + (titleFontSize / 2) + bgpadding,
        "unit_stats_title"
      )
    end

    -- Icon
    glColor(1, 1, 1, 1)
    if WG["OtaIcons"] and OtaIconExist[uDefID] then
      glTexture(OtaIconExist[uDefID])
    else
      glTexture("#" .. uDefID)
    end
    glTexRect(cX,
              cYstart + cornersize - iconHalfSize,
              cX + iconHalfSize + iconHalfSize,
              cYstart + cornersize + iconHalfSize)
    glTexture(false)

    -- Title text
    glColor(1, 1, 1, 1)
    glText(text,
           cX + iconHalfSize + iconHalfSize + (bgpadding / 1.5),
           cYstart,
           titleFontSize,
           "o")

    -- Main stats background
    cornersize = 0
    glColor(WG["background_opacity_custom"])
    DrawRoundedRect(
      floor(cX - bgpadding) + cornersize,
      ceil(cY + (fontSize / 3) + bgpadding) + cornersize,
      ceil(cX + maxWidth + bgpadding) - cornersize,
      floor(cYstart - bgpadding) - cornersize,
      bgcornerSize
    )

    cornersize = ceil(bgpadding * 0.16)
    glColor(1, 1, 1, 0.025)
    DrawRoundedRect(
      floor(cX - bgpadding) + cornersize,
      ceil(cY + (fontSize / 3) + bgpadding) + cornersize,
      ceil(cX + maxWidth + bgpadding) - cornersize,
      floor(cYstart - bgpadding) - cornersize,
      bgcornerSize
    )

    RenderTextBuffer()
    if WG["guishader_api"] then
      guishaderEnabled = true
      WG["guishader_api"].InsertRect(
        cX - bgpadding,
        cY + (fontSize / 3) + bgpadding,
        cX + maxWidth + bgpadding,
        cYstart - bgpadding,
        "unit_stats_data"
      )
    end

  ------------------------------------------------------------------------------
  -- Otherwise, it might be a blueprint (no actual unit)
  ------------------------------------------------------------------------------
  else
    local uDef   = uDefs[uDefID]
    local uMaxHp = uDef.health

    maxWidth = 0
    cX       = mx + xOffset
    cY       = my + yOffset
    local cYstart       = cY
    local titleFontSize = fontSize * 1.12
    local cornersize    = ceil(bgpadding * 0.21)
    cY = cY - 2 * titleFontSize

    textBuffer      = {}
    textBufferCount = 0

    -- Basic info: cost, move
    AddTextLine("Cost:",
      format("\255\196\196\255%d\255\255\255\255 / \255\255\255\128%d\255\255\255\255 / \255\128\255\128%d",
        uDef.metalCost, uDef.energyCost, uDef.buildTime
      )
    )
    if not (uDef.isBuilding or uDef.isFactory) then
      AddTextLine("Move:", format("%.1f / %.1f / %.0f (Speed / Accel / Turn)",
                   uDef.speed, 900 * uDef.maxAcc, simSpeed * uDef.turnRate * (180 / 32767)))
    end
    cY = cY - fontSize

    textDistance = customFontSize * 5

    -- Build Options
    if (uDef.buildOptions and #uDef.buildOptions > 0) then
      AddTextLine("\255\255\128\1Buildoption:",
        "\255\196\196\255Metal\255\255\255\255 / \255\255\255\128Energy\255\255\255\255 / \255\128\255\128Build"
      )
      cY = cY - fontSize
      for i = 1, #uDef.buildOptions do
        local buildDefID = uDef.buildOptions[i]
        local bDef       = uDefs[buildDefID]
        AddTextLine(
          bDef.humanName,
          format("\255\196\196\255%d\255\255\255\255 / \255\255\255\128%d\255\255\255\255 / \255\128\255\128%d",
            bDef.metalCost, bDef.energyCost, bDef.buildTime
          )
        )
      end
    end
    cY = cY - fontSize

    if uDef.buildSpeed > 0 then
      AddTextLine("Build:", "\255\255\255\1" .. uDef.buildSpeed)
    end
    cY = cY - fontSize

    -- Sensors
    local losRadius          = uDef.losRadius
    local airLosRadius       = uDef.airLosRadius
    local radarRadius        = uDef.radarRadius
    local sonarRadius        = uDef.sonarRadius
    local jammingRadius      = uDef.jammerRadius
    local sonarJammingRadius = uDef.sonarJamRadius
    local seismicRadius      = uDef.seismicRadius

    AddTextLine("Los:",
      losRadius .. ((airLosRadius > losRadius) and format(" (AirLos: %d)", airLosRadius) or "")
    )

    if radarRadius   > 0 then AddTextLine("Radar:", "\255\77\255\77" .. radarRadius)   end
    if sonarRadius   > 0 then AddTextLine("Sonar:", "\255\128\128\255" .. sonarRadius) end
    if jammingRadius > 0 then AddTextLine("Jam:",   "\255\255\77\77" .. jammingRadius) end
    if sonarJammingRadius > 0 then
      AddTextLine("Sonar Jam:", "\255\255\77\77" .. sonarJammingRadius)
    end
    if seismicRadius > 0 then AddTextLine("Seis:", "\255\255\26\255" .. seismicRadius) end
    if uDef.stealth  then AddTextLine("Other:", "Stealth") end
    cY = cY - fontSize

    -- Armor
    AddTextLine("Armor:", "class " .. (Game.armorTypes[uDef.armorType or 0] or "???"))
    AddTextLine("Open:", format("maxHP: %d", uDef.health or 0))
    if (uDef.armoredMultiple ~= 1) then
      AddTextLine("Closed:", format(" +%d%%, maxHP: %d",
                     (1 / uDef.armoredMultiple - 1) * 100,
                     uDef.health / uDef.armoredMultiple))
    end
    cY = cY - fontSize

    -- Weapons
    local wepCounts   = {}
    local wepsCompact = {}
    local weaponNums  = {}
    local surface, air

    for i = 1, #uDef.weapons do
      surface = uDef.weapons[i].onlyTargets["surface"]
      air     = uDef.weapons[i].onlyTargets["vtol"]
      local wDefID = uDef.weapons[i].weaponDef
      wepCounts[wDefID] = (wepCounts[wDefID] or 0) + 1
      if wepCounts[wDefID] == 1 then
        wepsCompact[#wepsCompact + 1] = wDefID
        weaponNums[#wepsCompact]      = i
      end
    end

    local selfDWeaponID = WeaponDefNames[uDef.selfDExplosion] and WeaponDefNames[uDef.selfDExplosion].id
    local deathWeaponID = WeaponDefNames[uDef.deathExplosion] and WeaponDefNames[uDef.deathExplosion].id
    local selfDWeaponIndex
    local deathWeaponIndex

    if shift and selfDWeaponID and deathWeaponID then
      wepCounts   = {}
      wepsCompact = {}
      wepCounts[selfDWeaponID] = 1
      wepCounts[deathWeaponID] = 1
      deathWeaponIndex         = #wepsCompact + 1
      wepsCompact[deathWeaponIndex] = deathWeaponID
      selfDWeaponIndex         = #wepsCompact + 1
      wepsCompact[selfDWeaponIndex] = selfDWeaponID
    end

    for i = 1, #wepsCompact do
      local wDefId = wepsCompact[i]
      local uWep   = wDefs[wDefId]
      if (uWep.range > 0) and (not uWep.name:find("teleport", 1, true)) then
        local oBurst = uWep.salvoSize * uWep.projectiles
        local oRld   = max(1e-11, (uWep.stockpile and (uWep.stockpileTime / 30) or uWep.reload))
        local wepCount = wepCounts[wDefId]
        local wpnName  = uWep.description

        if (i == deathWeaponIndex) then
          wpnName = "Death explosion"
          oRld    = 1
        elseif (i == selfDWeaponIndex) then
          wpnName = "Self Destruct"
          oRld    = uDef.selfDCountdown
        end

        if wepCount > 1 then
          AddTextLine("Weap:", format("\255\255\255\1%dx\255\255\255\255 %s", wepCount, wpnName))
        else
          AddTextLine("Weap:", wpnName)
        end
        AddTextLine("Info:", format("%d range, %d aoe, %d%% edge",
                      uWep.range, uWep.damageAreaOfEffect, 100 * uWep.edgeEffectiveness))

        if (uWep.coverageRange and uWep.stockpile) then
          AddTextLine("Anti:", format("%d Interceptor Range", uWep.coverageRange))
        end
        if (uWep.coverageRange and (uWep.interceptor == 16)) then
          AddTextLine("MDS:", format("%d Interceptor Range", uWep.coverageRange))
        end
        if (uWep.targetable == 16) then
          AddTextLine("MDS:", "Is Targetable")
        end

        dummyRange[i] = {
          range = uWep.range,
          defID = uDef.id,
          name  = uDef.name,
          index = i,
          surface = surface,
          air     = air
        }

        local defaultDamage = uWep.damages[0]
        for cat = 0, #uWep.damages do
          local oDmg   = uWep.damages[cat]
          local catName= Game.armorTypes[cat]
          if catName and oDmg and ((oDmg ~= defaultDamage) or (cat == 0)) then
            local dmgString
            if oBurst > 1 then
              dmgString = format("\255\255\255\1%d (x%d)\255\255\255\255 / \255\255\255\1%.2f\255\255\255\255 = \255\255\255\1%.2f",
                                 oDmg, oBurst, oRld, (oBurst * oDmg / oRld))
            else
              dmgString = format("\255\255\255\1%d\255\255\255\255 / \255\255\255\1%.2f\255\255\255\255 = \255\255\255\1%.2f",
                                 oDmg, oRld, (oDmg / oRld))
            end
            if wepCount > 1 then
              dmgString = dmgString .. "\255\255\255\255 (Each)"
            end
            dmgString = dmgString .. " (" .. catName .. ")"
            AddTextLine("Dmg:", dmgString)
          end
        end

        if (uWep.metalCost > 0) or (uWep.energyCost > 0) then
          local drainAdjust = (uWep.stockpile and ((simSpeed+2) / simSpeed)) or 1
          AddTextLine("Cost:", format(
            "\255\196\196\255%d\255\255\255\255, \255\255\255\128%d\255\255\255\255 = \255\196\196\255-%d\255\255\255\255, \255\255\255\128-%d\255\255\255\255 per second",
            uWep.metalCost, uWep.energyCost,
            (drainAdjust * uWep.metalCost  / oRld),
            (drainAdjust * uWep.energyCost / oRld)
          ))
        end

        if weaponInfo[wDefId] then
          local radius   = weaponInfo[wDefId].radius
          local damage   = weaponInfo[wDefId].damage
          local duration = weaponInfo[wDefId].duration
          AddTextLine("Area Dmg:",
            format("%d aoe, %d max damage per second , %d seconds",
              radius,
              damage * 30 / DAMAGE_PERIOD,
              duration / 30
            )
          )
        end

        cY = cY - fontSize
      end
    end

    -- Position correction if needed
    glColor(WG["background_opacity_custom"])
    if cY < 0 then
      local shiftY = -cY
      cYstart = cYstart + shiftY
      for i = 1, textBufferCount do
        textBuffer[i][4] = textBuffer[i][4] + shiftY
      end
      cY = 0
    end

    if (cX + maxWidth + bgpadding + bgpadding) > vsx then
      local shiftX = (cX + maxWidth + bgpadding + bgpadding) - vsx
      cX = cX - shiftX
      for i = 1, textBufferCount do
        textBuffer[i][3] = textBuffer[i][3] - shiftX
      end
    end

    -- Title Box
    local text = format("\255\190\255\190%s   \255\190\190\190%s", uDef.humanName, uDef.name)
    cornersize = 0
    glColor(WG["background_opacity_custom"])
    DrawRoundedRect(
      cX - bgpadding + cornersize,
      cYstart - bgpadding + cornersize,
      cX + (gl.GetTextWidth(text) * titleFontSize) + (titleFontSize * 1.5)
        + bgpadding + (bgpadding / 1.5) - cornersize,
      cYstart + (titleFontSize / 2) + bgpadding - cornersize,
      bgcornerSize
    )
    cornersize = ceil(bgpadding * 0.21)
    glColor(1,1,1,0.025)
    DrawRoundedRect(
      cX - bgpadding + cornersize,
      cYstart - bgpadding + cornersize,
      cX + (gl.GetTextWidth(text) * titleFontSize) + bgpadding - cornersize,
      cYstart + (titleFontSize / 2) + bgpadding - cornersize,
      bgcornerSize
    )

    if WG["guishader_api"] then
      guishaderEnabled = true
      WG["guishader_api"].InsertRect(
        cX - bgpadding,
        cYstart - bgpadding,
        cX + (gl.GetTextWidth(text) * titleFontSize) + bgpadding,
        cYstart + (titleFontSize / 2) + bgpadding,
        "unit_stats_title"
      )
    end

    -- Title text
    glColor(1, 1, 1, 1)
    glText(text, cX, cYstart, titleFontSize, "o")

    -- Stats Box
    glColor(WG["background_opacity_custom"])
    cornersize = 0
    DrawRoundedRect(
      floor(cX - bgpadding) + cornersize,
      ceil(cY + (fontSize / 3) + bgpadding) + cornersize,
      ceil(cX + maxWidth + bgpadding) - cornersize,
      floor(cYstart - bgpadding) - cornersize,
      bgcornerSize
    )
    cornersize = ceil(bgpadding * 0.16)
    glColor(1, 1, 1, 0.025)
    DrawRoundedRect(
      floor(cX - bgpadding) + cornersize,
      ceil(cY + (fontSize / 3) + bgpadding) + cornersize,
      ceil(cX + maxWidth + bgpadding) - cornersize,
      floor(cYstart - bgpadding) - cornersize,
      bgcornerSize
    )

    RenderTextBuffer()
    if WG["guishader_api"] then
      guishaderEnabled = true
      WG["guishader_api"].InsertRect(
        cX - bgpadding,
        cY + (fontSize / 3) + bgpadding,
        cX + maxWidth + bgpadding,
        cYstart - bgpadding,
        "unit_stats_data"
      )
    end
  end
end

--------------------------------------------------------------------------------
-- Main Drawing (World)
--------------------------------------------------------------------------------
function widget:DrawWorld()
  if dummyUnitID then
    for i, keys in pairs(dummyRange) do
      local color = {1, 0, 0, darkOpacity}
      if modConfig[currentMod]
         and modConfig[currentMod]["unitList"]
         and modConfig[currentMod]["unitList"][keys.name] then
        local weapontype = modConfig[currentMod]["unitList"][keys.name]["weapons"][keys.index]
        if (weapontype == 1 or weapontype == 4) then
          color = colorConfig["ally"]["ground"]["min"]
        elseif (weapontype == 2) then
          color = colorConfig["ally"]["air"]["min"]
        elseif (weapontype == 3) then
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
      local x, y, z = Spring.GetUnitBasePosition(dummyUnitID)
      gl.DrawGroundCircle(x, y, z, keys.range, 64)
      gl.Color(1, 1, 1, 1)
    end
  end
end

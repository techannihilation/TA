function widget:GetInfo()
  return {
    name    = "build queue fast forward fix",
    desc    = "Lots of code from gui_build_costs.lua Milan Satala and also some from ecostats.lua by Jools, iirc",
    author  = "his_face",
    date    = "feb, 2016", -- 23.11.2025 refactor and fixes
    license = "GNU GPL, v2 or later",
    layer   = 99,
    enabled = true,
  }
end

--------------------------------------------------------------------------------
-- Spring API shortcuts
--------------------------------------------------------------------------------

local GetMyTeamID        = Spring.GetMyTeamID
local GetSelectedUnits   = Spring.GetSelectedUnits
local GetTeamResources   = Spring.GetTeamResources
local GetTeamRulesParam  = Spring.GetTeamRulesParam
local GetTeamUnits       = Spring.GetTeamUnits
local GetUnitCommands    = Spring.GetUnitCommands
local GetUnitDefID       = Spring.GetUnitDefID
local GetUnitHealth      = Spring.GetUnitHealth
local GetUnitIsBuilding  = Spring.GetUnitIsBuilding
local GetUnitPosition    = Spring.GetUnitPosition
local GetUnitResources   = Spring.GetUnitResources
local GetUnitsInCylinder = Spring.GetUnitsInCylinder
local GiveOrderToUnit    = Spring.GiveOrderToUnit
local GetSpectatingState = Spring.GetSpectatingState
local IsReplay           = Spring.IsReplay
local GetGameFrame       = Spring.GetGameFrame
local GetTimer           = Spring.GetTimer
local Echo               = Spring.Echo

--------------------------------------------------------------------------------
-- State
--------------------------------------------------------------------------------

local abandonedTargetIDs                = {}
local builders                          = {}
local commanderBuildSpeed               = 100
local conversionLevelHistory            = {}
local log                               = Echo
local mainIterationModuloLimit          = 5

-- keep a short rolling history of resource derivative sign
local regularizedResourceDerivativesMetal  = {}
local regularizedResourceDerivativesEnergy = {}

local metalMakers                       = {}
local myTeamID                          = GetMyTeamID()
local possibleMetalMakersProduction     = 0
local possibleMetalMakersUpkeep         = 0
local releasedMetal                     = 0
local selectedUnits                     = nil
local t0                                = GetTimer()
local t1                                = nil
local tidalStrength                     = Game.tidal
local totalSavedTime                    = 0
local willStall                         = false
local windMax                           = Game.windMax
local windMin                           = Game.windMin

-- resource status (updated by getResourceStatus/builderIteration)
local regularizedPositiveMetal          = true
local regularizedPositiveEnergy         = true
local regularizedNegativeMetal          = false
local regularizedNegativeEnergy         = false
local metalLevel                        = 0
local positiveMMLevel                   = 0
local isPositiveMetalDerivative         = false
local isPositiveEnergyDerivative        = false
local energyLevel                       = 0
local isEnergyStalling                  = false
local isEnergyLeaking                   = false

--------------------------------------------------------------------------------
-- Helpers
--------------------------------------------------------------------------------

local function isBuilder(unitDef)
  return unitDef
    and ((unitDef.isBuilder and unitDef.canAssist) or unitDef.isFactory)
end

local function registerUnit(unitID, unitDefID, unitTeam)
  -- Only track our own units
  if unitTeam and unitTeam ~= myTeamID then
    return
  end

  if not unitDefID then
    return
  end

  local unitDef = UnitDefs[unitDefID]
  if not unitDef then
    return
  end

  if isBuilder(unitDef) then
    builders[unitID] = {
      buildSpeed         = unitDef.buildSpeed,
      originalBuildSpeed = unitDef.buildSpeed,
      unitDef            = unitDef,
      guards             = {},
      previousBuilding   = nil,
      owned              = (unitTeam == myTeamID),
    }

    if unitDef.customParams and unitDef.customParams.iscommander then
      commanderBuildSpeed = unitDef.buildSpeed
    end
  end
end

local function registerUnits()
  builders                      = {}
  metalMakers                   = {}
  possibleMetalMakersUpkeep     = 0
  possibleMetalMakersProduction = 0

  myTeamID = GetMyTeamID()

  local myUnits = GetTeamUnits(myTeamID)
  for _, unitID in ipairs(myUnits) do
    local unitDefID = GetUnitDefID(unitID)
    registerUnit(unitID, unitDefID, myTeamID)
  end
end

-- Sum build speed of the given builder set (no guard/target indirection; safer)
local function getBuildersBuildSpeed(selectedBuilders)
  local totalSpeed = 0

  if not selectedBuilders then
    return 0
  end

  for _, unitID in pairs(selectedBuilders) do
    local builder = builders[unitID]
    if builder then
      totalSpeed = totalSpeed + (builder.buildSpeed or builder.originalBuildSpeed or 0)
    end
  end

  return totalSpeed
end

local function getBuildTimeLeft(unitID)
  local _, _, _, _, build = GetUnitHealth(unitID)
  if not build then
    return 0
  end

  local currentBuildSpeed = 0

  for builderID in pairs(builders) do
    local targetID = GetUnitIsBuilding(builderID)
    if targetID == unitID and builderID ~= unitID then
      local builder = builders[builderID]
      if builder and builder.originalBuildSpeed then
        currentBuildSpeed = currentBuildSpeed + builder.originalBuildSpeed
      end
    end
  end

  if currentBuildSpeed <= 0 then
    return math.huge
  end

  local unitDefID = GetUnitDefID(unitID)
  local unitDef   = unitDefID and UnitDefs[unitDefID]
  if not unitDef or not unitDef.buildTime then
    return 0
  end

  local buildLeft  = (1 - build) * unitDef.buildTime
  local timeLeft   = buildLeft / currentBuildSpeed

  return timeLeft
end

-- Currently unused, but left for completeness
local function getTargetsBuild(unitID)
  return GetUnitIsBuilding(unitID)
end

local function getUnitsBuildingUnit(unitID)
  local building = {}

  for builderID in pairs(builders) do
    local targetID = GetUnitIsBuilding(builderID)
    if targetID == unitID then
      building[builderID] = builderID
    end
  end

  return building
end

local function getMetalMakingEfficiency(unitDefID)
  if not WG or not WG.energyConversion or not WG.energyConversion.convertCapacities then
    return 0
  end

  local makerDef = WG.energyConversion.convertCapacities[unitDefID]
  if makerDef and makerDef.e then
    return makerDef.e
  end
  return 0
end

local function getEout(unitDef)
  local totalEOut = unitDef.energyMake or 0

  if unitDef.energyUpkeep then
    totalEOut = totalEOut - unitDef.energyUpkeep
  end

  if unitDef.tidalGenerator and unitDef.tidalGenerator > 0 and tidalStrength > 0 then
    local mult = 1
    if unitDef.customParams and unitDef.customParams.energymultiplier then
      mult = unitDef.customParams.energymultiplier
    end
    totalEOut = totalEOut + (tidalStrength * mult)
  end

  if unitDef.windGenerator and unitDef.windGenerator > 0 then
    local mult = 1
    if unitDef.customParams and unitDef.customParams.energymultiplier then
      mult = unitDef.customParams.energymultiplier
    end

    local unitWindMin = math.min(windMin, unitDef.windGenerator)
    local unitWindMax = math.min(windMax, unitDef.windGenerator)
    totalEOut = totalEOut + (((unitWindMin + unitWindMax) / 2) * mult)
  end

  return totalEOut
end

local function getResourceProperties(unitDefID, unitDef)
  local metalMakingEfficiency = getMetalMakingEfficiency(unitDefID)
  local energyMaking          = getEout(unitDef)
  return metalMakingEfficiency or 0, energyMaking or 0
end

local function getResourceStatus()
  local mmLevel = GetTeamRulesParam(myTeamID, "mmLevel") or 0

  local m_curr, m_max, m_pull, m_inc, m_exp = GetTeamResources(myTeamID, "metal")
  local e_curr, e_max, e_pull, e_inc, e_exp = GetTeamResources(myTeamID, "energy")

  if not (m_curr and e_curr and m_max and e_max) then
    return
  end

  isPositiveMetalDerivative  = m_inc > (m_pull + m_exp) / 2
  metalLevel                 = (m_max > 0) and (m_curr / m_max) or 0

  isPositiveEnergyDerivative = e_inc > (e_pull + e_exp) / 2
  energyLevel                = (e_max > 0) and (e_curr / e_max) or 0

  local tooLittleMMs = energyLevel > mmLevel * 1.1
  local tooMuchMMs   = energyLevel < mmLevel * 0.9

  positiveMMLevel = (energyLevel >= mmLevel)

  isEnergyStalling = energyLevel < 0.01 and not isPositiveEnergyDerivative
  isEnergyLeaking  = energyLevel > 0.99 and isPositiveEnergyDerivative

  return positiveMMLevel,
         tooLittleMMs,
         tooMuchMMs,
         metalLevel,
         isPositiveMetalDerivative,
         energyLevel,
         isPositiveEnergyDerivative
end

local function getMyResources(resType)
  local lvl, storage, pull, inc, exp, share, sent, received = GetTeamResources(myTeamID, resType)

  if not inc then
    Echo("ERROR in getMyResources", myTeamID, resType)
    myTeamID = GetMyTeamID()
    return 0, 0, 0, 0, false
  end

  local total = received or 0
  local used  = 0
  local units = GetTeamUnits(myTeamID)

  if resType == "metal" then
    for _, unitID in ipairs(units) do
      local metalMake, metalUse = GetUnitResources(unitID)
      total = total + (metalMake or 0) - (metalUse or 0)
      used  = used  + (metalUse or 0)
    end
  else
    for _, unitID in ipairs(units) do
      local _, _, energyMake, energyUse = GetUnitResources(unitID)
      total = total + (energyMake or 0) - (energyUse or 0)
      used  = used  + (energyUse or 0)
    end
  end

  local alreadyInStall = pull > used and lvl < pull

  return total, lvl, storage, used, alreadyInStall
end

local function traceUpkeep(unitID, alreadyCounted)
  if alreadyCounted[unitID] then
    return 0, 0
  end

  local metalMake, metalUse, energyMake, energyUse = GetUnitResources(unitID)
  metalUse   = metalUse   or 0
  metalMake  = metalMake  or 0
  energyUse  = energyUse  or 0
  energyMake = energyMake or 0

  local builder = builders[unitID]
  if builder then
    for _, guardID in ipairs(builder.guards) do
      local guard = builders[guardID]
      if guard and guard.owned then
        local guardMetal, guardEnergy = traceUpkeep(guardID, alreadyCounted)
        metalUse  = metalUse  + guardMetal
        energyUse = energyUse + guardEnergy
      end
    end
  end

  alreadyCounted[unitID] = unitID

  local unitDef        = builder and builder.unitDef
  local unitMetalMake  = unitDef and unitDef.metalMake  or 0
  local unitEnergyMake = unitDef and unitDef.energyMake or 0

  return metalUse - metalMake + unitMetalMake,
         energyUse - energyMake + unitEnergyMake
end

local function getSelectedUnitsUpkeep()
  local alreadyCounted = {}
  local metal          = 0
  local energy         = 0

  if not selectedUnits then
    return { metal = 0, energy = 0 }
  end

  for _, unitID in ipairs(selectedUnits) do
    if builders[unitID] then
      local metalUse, energyUse = traceUpkeep(unitID, alreadyCounted)
      metal  = metal  + metalUse
      energy = energy + energyUse
    end
  end

  return { metal = metal, energy = energy }
end

local function calcResourceChange(resType, consumption, secondsLeft, releasedExpenditures)
  local currentChange, lvl, storage, _, alreadyInStall = getMyResources(resType)

  local changeWhenBuilding = currentChange - consumption + releasedExpenditures

  if metalMakersControlled and resType == "metal" then
    changeWhenBuilding = changeWhenBuilding - releasedMetal
  end

  releasedMetal = 0

  -- Only call getMetalMakersUpkeep if it actually exists
  if metalMakersControlled
    and type(getMetalMakersUpkeep) == "function"
    and resType == "energy"
    and possibleMetalMakersUpkeep > 0
  then
    local metalMakersUpkeep = getMetalMakersUpkeep()
    if changeWhenBuilding < 0 then
      changeWhenBuilding = changeWhenBuilding + metalMakersUpkeep

      local releasedEnergy
      if changeWhenBuilding > 0 then
        releasedEnergy     = changeWhenBuilding
        changeWhenBuilding = 0
      else
        releasedEnergy = metalMakersUpkeep
      end
      releasedMetal = possibleMetalMakersProduction * releasedEnergy / possibleMetalMakersUpkeep
    end
  end

  local after = lvl + secondsLeft * changeWhenBuilding

  if consumption < 1 or (not alreadyInStall and after > 0) then
    willStall = false

    if changeWhenBuilding < 0 then
      if after < 0 then
        after = 0
      end
    else
      if after > storage then
        after = storage
      end
    end
  else
    willStall = true
  end
end

local function isResourceToMoveOn(secondsLeft, unitDef, currentBuildSpeed)
  if not unitDef or not unitDef.buildTime or currentBuildSpeed <= 0 then
    return true
  end

  local speed  = unitDef.buildTime / currentBuildSpeed
  local metal  = unitDef.metalCost  / speed
  local energy = unitDef.energyCost / speed

  local releasedExpenditures = getSelectedUnitsUpkeep()

  calcResourceChange("energy", energy, secondsLeft, releasedExpenditures.energy)
  calcResourceChange("metal",  metal,  secondsLeft, releasedExpenditures.metal)

  return not willStall
end

local function isTimeToMoveOn(secondsLeft, builderID, unitDef, totalBuildSpeed)
  local builder = builders[builderID]
  if not builder or not unitDef or not unitDef.speed or totalBuildSpeed <= 0 then
    return false
  end

  local plannerBuildSpeed = builder.originalBuildSpeed or builder.buildSpeed or 0
  if plannerBuildSpeed <= 0 then
    return false
  end

  local plannerBuildShare = plannerBuildSpeed / totalBuildSpeed
  local slowness          = 45 / unitDef.speed

  if (plannerBuildShare < 0.75 and secondsLeft < 1.2 * slowness)
    or (plannerBuildShare < 0.5  and secondsLeft < 3.4 * slowness)
    or (plannerBuildShare < 0.15 and secondsLeft < 8.0 * slowness)
    or (plannerBuildShare < 0.05 and secondsLeft < 12.0 * slowness)
  then
    totalSavedTime = totalSavedTime + secondsLeft
    -- log(string.format('Con moved on, %.0f%% buildshare and %.1f sec left, saved %.0f moving sec, lost %.0f con total sec', plannerBuildShare*100, secondsLeft, totalSavedTime, Spring.DiffTimers(GetTimer(), t0)))
    return true
  end

  return false
end

-- Remove exactly the commands associated with the current build job
local function moveOnFromBuilding(builderID, targetID, tagsToRemove)
  if not tagsToRemove or #tagsToRemove == 0 then
    return
  end

  GiveOrderToUnit(builderID, CMD.REMOVE, tagsToRemove, { "ctrl" })

  local builder = builders[builderID]
  if builder then
    builder.previousBuilding = targetID
  end

  abandonedTargetIDs[targetID] = true
  t1 = GetTimer()
end

local function builderForceAssist(assistType, builderID, targetID, targetDef, neighbours, targetMM, targetE)
  local foundBuildPowerUnit = false

  if (metalLevel > 0.8 or regularizedPositiveMetal) and (positiveMMLevel or not regularizedNegativeEnergy) then
    for _, candidateID in ipairs(neighbours) do
      local _, _, _, _, candidateBuild = GetUnitHealth(candidateID)
      if candidateBuild and candidateBuild < 1 then
        local candidateDefID = GetUnitDefID(candidateID)
        local candidateDef   = candidateDefID and UnitDefs[candidateDefID]
        if candidateDef and candidateDef.buildSpeed and candidateDef.buildSpeed > 0 then
          GiveOrderToUnit(builderID, CMD.INSERT, { 0, CMD.REPAIR, CMD.OPT_CTRL, candidateID }, { "alt" })
          foundBuildPowerUnit = true
          break
        end
      end
    end

  elseif targetDef.buildSpeed and targetDef.buildSpeed > 0 then
    -- older heuristic for moving on when assisting buildpower units
    local cmdQueue = GetUnitCommands(builderID, 3)
    if cmdQueue and #cmdQueue > 2 and cmdQueue[2].id < 0 then
      local tagsToRemove = { cmdQueue[1].tag }
      moveOnFromBuilding(builderID, targetID, tagsToRemove)
    end
  end

  if not foundBuildPowerUnit then
    for _, candidateID in ipairs(neighbours) do
      local _, _, _, _, candidateBuild = GetUnitHealth(candidateID)
      if candidateBuild and candidateBuild < 1 then
        local candidateDefID = GetUnitDefID(candidateID)
        local candidateDef   = candidateDefID and UnitDefs[candidateDefID]
        if candidateDef then
          local candidateMM, candidateE = getResourceProperties(candidateDefID, candidateDef)
          if assistType == "energy" then
            if candidateE > targetE then
              GiveOrderToUnit(builderID, CMD.INSERT, { 0, CMD.REPAIR, CMD.OPT_CTRL, candidateID }, { "alt" })
              break
            end
          elseif assistType == "mm" then
            if candidateMM > targetMM then
              GiveOrderToUnit(builderID, CMD.INSERT, { 0, CMD.REPAIR, CMD.OPT_CTRL, candidateID }, { "alt" })
              break
            end
          elseif assistType == "metal" then
            break
          end
        end
      end
    end
  end
end

local function doFastForwardDecision(builderID, targetID, tagsToRemove)
  selectedUnits = GetSelectedUnits()

  local totalBuildSpeed = getBuildersBuildSpeed(getUnitsBuildingUnit(targetID))
  if totalBuildSpeed <= 0 then
    return
  end

  local secondsLeft = getBuildTimeLeft(targetID)
  local targetDefID = GetUnitDefID(targetID)
  local unitDef     = targetDefID and UnitDefs[targetDefID]

  if not unitDef then
    return
  end

  if isTimeToMoveOn(secondsLeft, builderID, unitDef, totalBuildSpeed)
    and isResourceToMoveOn(secondsLeft, unitDef, totalBuildSpeed)
  then
    moveOnFromBuilding(builderID, targetID, tagsToRemove)
  end
end

-- Scan the queue and find:
--  - the build command that corresponds to targetID's unitDefID (current build)
--  - a later build command (next build)
-- Returns:
--  tagsToRemove (list of tags to remove to skip current build, inc. optional preceding MOVE)
--  hasNextBuild (bool)
local function findBuildJumpTargets(builderID, targetID)
  if not targetID then
    return nil, false
  end

  local cmdQueue = GetUnitCommands(builderID, 32)
  if not cmdQueue or #cmdQueue == 0 then
    return nil, false
  end

  local targetDefID = GetUnitDefID(targetID)
  if not targetDefID then
    return nil, false
  end

  local curIndex = nil
  local nextBuildIndex = nil

  for i, cmd in ipairs(cmdQueue) do
    if cmd.id < 0 then
      local buildDefID = -cmd.id
      if not curIndex and buildDefID == targetDefID then
        curIndex = i
      elseif curIndex and not nextBuildIndex then
        nextBuildIndex = i
        break
      end
    end
  end

  -- need current build and at least one later build to jump to
  if not curIndex or not nextBuildIndex then
    return nil, false
  end

  local tagsToRemove = {}

  -- Optional preceding MOVE command belonging to this build
  if curIndex > 1 then
    local prevCmd = cmdQueue[curIndex - 1]
    if prevCmd and prevCmd.id == CMD.MOVE then
      tagsToRemove[#tagsToRemove + 1] = prevCmd.tag
    end
  end

  -- Always remove the current build command
  tagsToRemove[#tagsToRemove + 1] = cmdQueue[curIndex].tag

  return tagsToRemove, true
end

local function builderIteration(n)
  for builderID, builderData in pairs(builders) do
    local targetID = GetUnitIsBuilding(builderID)
    if targetID then
      local builderDefID = GetUnitDefID(builderID)
      local builderDef   = builderDefID and UnitDefs[builderDefID]
      local targetDefID  = GetUnitDefID(targetID)
      local targetDef    = targetDefID and UnitDefs[targetDefID]

      if builderDef and targetDef then
        -- neighbourhood cache
        local neighbours = {}
        local mpx, _, mpz = GetUnitPosition(builderID, true)
        if mpx and mpz then
          local buildDistance = builderDef.buildDistance or 0
          if buildDistance > 0 then
            neighbours = GetUnitsInCylinder(mpx, mpz, buildDistance, myTeamID) or {}
          end
        end

        -- fast forwarder (queue-aware)
        local tagsToRemove, hasNextBuild = findBuildJumpTargets(builderID, targetID)
        if hasNextBuild and tagsToRemove and not abandonedTargetIDs[targetID] then
          local previousBuilding = builderData.previousBuilding
          if not previousBuilding then
            doFastForwardDecision(builderID, targetID, tagsToRemove)
          else
            local _, _, _, _, prevBuild = GetUnitHealth(previousBuilding)
            local _, _, _, _, currBuild = GetUnitHealth(targetID)
            if not prevBuild or prevBuild == 1 then
              doFastForwardDecision(builderID, targetID, tagsToRemove)
            end
          end
        end

        -- mm/e switcher
        local targetMM, targetE = getResourceProperties(targetDefID, targetDef)
        positiveMMLevel,
        tooLittleMMs,
        tooMuchMMs,
        metalLevel,
        isPositiveMetalDerivative,
        energyLevel,
        isPositiveEnergyDerivative = getResourceStatus()

        -- keep original precedence: (n % mainIterationModuloLimit) * 30 == 0
        if (n % mainIterationModuloLimit) * 30 == 0 then
          table.insert(regularizedResourceDerivativesMetal,  1, isPositiveMetalDerivative)
          table.insert(regularizedResourceDerivativesEnergy, 1, isPositiveEnergyDerivative)
          if #regularizedResourceDerivativesMetal > 7 then
            table.remove(regularizedResourceDerivativesMetal)
            table.remove(regularizedResourceDerivativesEnergy)
          end
        end

        regularizedPositiveMetal  = table.full_of(regularizedResourceDerivativesMetal,  true)
        regularizedPositiveEnergy = table.full_of(regularizedResourceDerivativesEnergy, true)
        regularizedNegativeMetal  = table.full_of(regularizedResourceDerivativesMetal,  false)
        regularizedNegativeEnergy = table.full_of(regularizedResourceDerivativesEnergy, false)

        isEnergyLeaking = energyLevel > 0.99 and isPositiveEnergyDerivative

        if not regularizedPositiveEnergy
          and not isEnergyLeaking
          and ((targetMM >= 0 and not positiveMMLevel) or (targetE < 0 and isEnergyStalling))
        then
          builderForceAssist("energy", builderID, targetID, targetDef, neighbours, targetMM, targetE)
        elseif targetE > 0 and positiveMMLevel and regularizedPositiveEnergy then
          builderForceAssist("mm", builderID, targetID, targetDef, neighbours, targetMM, targetE)
        end

        -- easy finish neighbour
        local _, _, _, _, targetBuild = GetUnitHealth(targetID)
        for _, candidateID in ipairs(neighbours) do
          if candidateID ~= targetID then
            local candidateDefID = GetUnitDefID(candidateID)
            local candidateDef   = candidateDefID and UnitDefs[candidateDefID]
            if candidateDef == targetDef then
              local _, _, _, _, candidateBuild = GetUnitHealth(candidateID)
              if candidateBuild and candidateBuild < 1 and candidateBuild > targetBuild then
                local targetBuildTimeLeft = getBuildTimeLeft(targetID)
                if targetBuildTimeLeft > 0.5 then
                  GiveOrderToUnit(builderID, CMD.INSERT, { 0, CMD.REPAIR, CMD.OPT_CTRL, candidateID }, { "alt" })
                end
              end
            end
          end
        end
      end
    end
  end
end

--------------------------------------------------------------------------------
-- Widget call-ins
--------------------------------------------------------------------------------

function widget:Initialize()
  if GetSpectatingState() or IsReplay() then
    self:PlayerChanged()
  end

  registerUnits()
end

function widget:PlayerChanged()
  if GetSpectatingState() and GetGameFrame() > 0 then
    widgetHandler:RemoveWidget(self)
  end
end

function widget:GameStart()
  self:PlayerChanged()
end

function widget:GameFrame(n)
  if n % mainIterationModuloLimit == 0 then
    builderIteration(n)
  end
end

function widget:UnitCreated(unitID, unitDefID, unitTeam)
  registerUnit(unitID, unitDefID, unitTeam)
end

function widget:UnitGiven(unitID, unitDefID, unitTeam, oldTeam)
  -- unit was given to us
  if unitTeam == myTeamID then
    if not builders[unitID] then
      registerUnit(unitID, unitDefID, unitTeam)
    end
    if builders[unitID] then
      builders[unitID].owned = true
    end
  else
    -- unit was ours and got given away
    if builders[unitID] then
      builders[unitID] = nil
    end
  end
end

function widget:UnitFinished(unitID, unitDefID, unitTeam)
  if abandonedTargetIDs[unitID] then
    abandonedTargetIDs[unitID] = nil
  end
end

function widget:UnitDestroyed(unitID, unitDefID, unitTeam)
  if builders[unitID] then
    builders[unitID] = nil
  end
  if abandonedTargetIDs[unitID] then
    abandonedTargetIDs[unitID] = nil
  end
end

--------------------------------------------------------------------------------
-- table helpers (logging / utilities)
--------------------------------------------------------------------------------

function table.val_to_str(v)
  if type(v) == "string" then
    v = string.gsub(v, "\n", "\\n")
    if string.match(string.gsub(v, "[^'\"]", ""), '^"+$') then
      return "'" .. v .. "'"
    end
    return '"' .. string.gsub(v, '"', '\\"') .. '"'
  else
    return type(v) == "table" and table.tostring(v) or tostring(v)
  end
end

function table.key_to_str(k)
  if type(k) == "string" and string.match(k, "^[_%a][_%a%d]*$") then
    return k
  else
    return "[" .. table.val_to_str(k) .. "]"
  end
end

function table.tostring(tbl)
  local result, done = {}, {}
  for k, v in ipairs(tbl) do
    table.insert(result, table.val_to_str(v))
    done[k] = true
  end
  for k, v in pairs(tbl) do
    if not done[k] then
      table.insert(result, table.key_to_str(k) .. "=" .. table.val_to_str(v))
    end
  end
  return "{" .. table.concat(result, ",") .. "}"
end

function table.has_value(tab, val)
  for _, value in ipairs(tab) do
    if value == val then
      return true
    end
  end
  return false
end

function table.full_of(tab, val)
  for _, value in ipairs(tab) do
    if value ~= val then
      return false
    end
  end
  return true
end

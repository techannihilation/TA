function widget:GetInfo()
  return {
    name      = "Assist-Aware FastBuild",
    desc      = "Safely skips construction tasks only when other builders can finish and redirects builders based on metal/energy needs",
    author    = "[ur]uncle", -- inspired by build queue fast forward by his_face, widget re-written from scratch
    date      = "2025-11-23",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true,
  }
end

--------------------------------------------------------------------------------
-- Local references
--------------------------------------------------------------------------------

local spGetMyTeamID         = Spring.GetMyTeamID
local spGetGameFrame        = Spring.GetGameFrame
local spGetSpectatingState  = Spring.GetSpectatingState
local spIsReplay            = Spring.IsReplay
local spGetTeamUnits        = Spring.GetTeamUnits
local spGetUnitDefID        = Spring.GetUnitDefID
local spGetUnitIsBuilding   = Spring.GetUnitIsBuilding
local spGetUnitHealth       = Spring.GetUnitHealth
local spGetUnitCommands     = Spring.GetUnitCommands
local spGiveOrderToUnit     = Spring.GiveOrderToUnit
local spGetTeamResources    = Spring.GetTeamResources
local spGetUnitResources    = Spring.GetUnitResources
local spGetUnitPosition     = Spring.GetUnitPosition
local spGetUnitsInCylinder  = Spring.GetUnitsInCylinder
local spGetSelectedUnits    = Spring.GetSelectedUnits

local CMD_MOVE   = CMD.MOVE
local CMD_REPAIR = CMD.REPAIR
local CMD_REMOVE = CMD.REMOVE
local CMD_INSERT = CMD.INSERT

--------------------------------------------------------------------------------
-- Config
--------------------------------------------------------------------------------

local mainIterationModuloLimit = 5
local MAX_CMDS                = 32
local RESOURCE_HISTORY_LENGTH = 7
local SKIP_PERCENTAGE = 0.01 -- 1%
--------------------------------------------------------------------------------
-- State
--------------------------------------------------------------------------------

local myTeamID = spGetMyTeamID()

-- builders[unitID] = {
--   buildSpeed,
--   originalBuildSpeed,
--   unitDef,
--   guards = {},
--   previousBuilding = unitID or nil,
--   owned = boolean,
-- }
local builders = {}

-- abandonedTargetIDs[unitID] = true if we deliberately moved builders away from it
local abandonedTargetIDs = {}

-- Resource trend history
local metalTrendHistory  = {}
local energyTrendHistory = {}
local historyIndex       = 0
local historyCount       = 0

-- Last resource snapshot
local lastMetal, lastMetalStorage, lastMetalNet = 0, 0, 0
local lastEnergy, lastEnergyStorage, lastEnergyNet = 0, 0, 0

--------------------------------------------------------------------------------
-- Utility / classification
--------------------------------------------------------------------------------

local function IsImmobileBuilder(ud)
  return ud and ud.isBuilder and not ud.canMove and not ud.isFactory
end

local function isMobileConstructor(ud)
  return ud and ud.isBuilder and ud.canMove and not ud.isFactory
end

local function isBuilderUnitDef(ud)
  if not ud then
    return false
  end
  -- Generic builder / factory detection
  if ud.isFactory or ud.isBuilder then
    return true
  end
  if ud.canAssist or ud.canReclaim or ud.canRepair then
    return true
  end
  return false
end

local function registerBuilder(unitID, unitDefID, unitTeam)
  if unitTeam ~= myTeamID then
    return
  end
  if not unitDefID then
    unitDefID = spGetUnitDefID(unitID)
  end
  local ud = unitDefID and UnitDefs[unitDefID]
  if not isBuilderUnitDef(ud) then
    return
  end

  local buildSpeed = ud.buildSpeed or 0
  builders[unitID] = {
    buildSpeed         = buildSpeed,
    originalBuildSpeed = buildSpeed,
    unitDef            = ud,
    guards             = {},
    previousBuilding   = nil,
    owned              = true,
  }
end

local function unregisterBuilder(unitID)
  builders[unitID] = nil
  -- Clear any references in previousBuilding
  for bID, data in pairs(builders) do
    if data.previousBuilding == unitID then
      data.previousBuilding = nil
    end
  end
end

local function registerUnits()
  local teamUnits = spGetTeamUnits(myTeamID)
  if not teamUnits then
    return
  end
  for i = 1, #teamUnits do
    local unitID = teamUnits[i]
    local unitDefID = spGetUnitDefID(unitID)
    if unitDefID then
      local ud = UnitDefs[unitDefID]
      if isBuilderUnitDef(ud) then
        registerBuilder(unitID, unitDefID, myTeamID)
      end
    end
  end
end

local function isUnitFinished(unitID)
  if not unitID then
    return true
  end
  local _, _, _, _, buildProgress = spGetUnitHealth(unitID)
  if not buildProgress then
    -- Probably destroyed or out of LOS; treat as finished
    return true
  end
  return buildProgress >= 1
end

--------------------------------------------------------------------------------
-- Resource trend and estimates
--------------------------------------------------------------------------------

local function updateResourceTrends()
  local curM, storM, _, incM, expM = spGetTeamResources(myTeamID, "metal")
  local curE, storE, _, incE, expE = spGetTeamResources(myTeamID, "energy")

  if not curM or not curE then
    return
  end

  local netM = (incM or 0) - (expM or 0)
  local netE = (incE or 0) - (expE or 0)

  lastMetal, lastMetalStorage, lastMetalNet     = curM, storM or 0, netM
  lastEnergy, lastEnergyStorage, lastEnergyNet  = curE, storE or 0, netE

  historyIndex = (historyIndex % RESOURCE_HISTORY_LENGTH) + 1
  historyCount = math.min(historyCount + 1, RESOURCE_HISTORY_LENGTH)

  metalTrendHistory[historyIndex]  = netM
  energyTrendHistory[historyIndex] = netE
end

local function getTrendPositive(history)
  if historyCount == 0 then
    return true -- neutral default
  end
  local pos, neg = 0, 0
  for i = 1, historyCount do
    local v = history[i] or 0
    if v > 0.1 then
      pos = pos + 1
    elseif v < -0.1 then
      neg = neg + 1
    end
  end
  return pos >= neg
end

local function isMetalTrendPositive()
  return getTrendPositive(metalTrendHistory)
end

local function isEnergyTrendPositive()
  return getTrendPositive(energyTrendHistory)
end

local function isMetalStalling()
  if lastMetalStorage <= 0 then
    return false
  end
  if lastMetal < lastMetalStorage * 0.1 and lastMetalNet < 0 then
    return true
  end
  return false
end

local function isEnergyStalling()
  if lastEnergyStorage <= 0 then
    return false
  end
  if lastEnergy < lastEnergyStorage * 0.1 and lastEnergyNet < 0 then
    return true
  end
  return false
end

-- Estimate how much resource usage is released if this builder stops its current activity
-- Returns (metalReleasePerSecond, energyReleasePerSecond)
local function estimateBuilderRelease(builderID, secondsLeft)
  local metalReleasePerSec  = 0
  local energyReleasePerSec = 0

  if builderID then
    local mu, _, eu = spGetUnitResources(builderID)
    if mu then
      metalReleasePerSec = metalReleasePerSec + mu
    end
    if eu then
      energyReleasePerSec = energyReleasePerSec + eu
    end
  end

  -- Sample selected units as a rough heuristic on typical builder draw
  local selected = spGetSelectedUnits()
  if selected and #selected > 0 then
    local totalMU, totalEU, count = 0, 0, 0
    for i = 1, #selected do
      local uid = selected[i]
      local smu, _, seu = spGetUnitResources(uid)
      if smu or seu then
        totalMU = totalMU + (smu or 0)
        totalEU = totalEU + (seu or 0)
        count   = count + 1
      end
    end
    if count > 0 then
      metalReleasePerSec  = metalReleasePerSec  + (totalMU / count)
      energyReleasePerSec = energyReleasePerSec + (totalEU / count)
    end
  end

  return metalReleasePerSec, energyReleasePerSec
end

--------------------------------------------------------------------------------
-- Time / resource decision helpers
--------------------------------------------------------------------------------

local function computeSecondsLeft(targetID, targetDef, totalBuildSpeed)
  if not targetID or not targetDef or not totalBuildSpeed or totalBuildSpeed <= 0 then
    return nil
  end
  local _, _, _, _, buildProgress = spGetUnitHealth(targetID)
  -- new: require at least 5% built
  if not buildProgress or buildProgress >= 1 or buildProgress < SKIP_PERCENTAGE then
    return nil
  end

  local remainingProgress = 1 - buildProgress
  local B = targetDef.buildTime or 1
  -- framesLeft = remainingProgress * B / totalBuildSpeed
  local framesLeft  = remainingProgress * B / totalBuildSpeed
  local secondsLeft = framesLeft / 30
  return secondsLeft
end


local function isTimeToMoveOn(secondsLeft, builderID, builderState, targetDef, totalBuildSpeed)
  if not secondsLeft or not totalBuildSpeed or totalBuildSpeed <= 0 then
    return false
  end

  -- Very long remaining time: do not move on
  if secondsLeft > 20 then
    return false
  end

  local builderShare = 0
  if builderState and builderState.buildSpeed and builderState.buildSpeed > 0 then
    builderShare = builderState.buildSpeed / totalBuildSpeed
  end

  -- If it is almost finished, always OK to move on
  if secondsLeft < 1 then
    return true
  end

  -- Moderate time, small share: OK
  if builderShare < 0.25 and secondsLeft < 8 then
    return true
  end

  -- Shorter time, moderate share: OK
  if builderShare < 0.5 and secondsLeft < 4 then
    return true
  end

  return false
end

local function isResourceToMoveOn(secondsLeft, targetDef, totalBuildSpeed, builderID)
  if not secondsLeft then
    return false
  end

  local curM, storM, _, incM, expM = spGetTeamResources(myTeamID, "metal")
  local curE, storE, _, incE, expE = spGetTeamResources(myTeamID, "energy")
  if not curM or not curE then
    -- Cannot assess; be conservative
    return false
  end

  local netM = (incM or 0) - (expM or 0)
  local netE = (incE or 0) - (expE or 0)

  -- Hard safety: already extremely low and draining, avoid changes
  if storM and storM > 0 and curM < storM * 0.05 and netM < 0 then
    return false
  end
  if storE and storE > 0 and curE < storE * 0.05 and netE < 0 then
    return false
  end

  -- Trend-based gate
  local metalTrendOk  = isMetalTrendPositive()
  local energyTrendOk = isEnergyTrendPositive()
  if metalTrendOk and energyTrendOk then
    return true
  end

  -- Estimate effect of releasing builder load
  local releaseMps, releaseEps = estimateBuilderRelease(builderID, secondsLeft)
  local projectedM = curM + (netM + releaseMps) * secondsLeft
  local projectedE = curE + (netE + releaseEps) * secondsLeft

  if projectedM < 0 or projectedE < 0 then
    return false
  end

  if storM and storM > 0 and projectedM > storM * 1.5 then
    return false
  end
  if storE and storE > 0 and projectedE > storE * 1.5 then
    return false
  end

  return true
end

--------------------------------------------------------------------------------
-- Queue scanning
--------------------------------------------------------------------------------

-- Returns: cmdQueue, curIndex, nextIndex
local function scanBuildQueue(builderID, targetDefID)
  local cmdQueue = spGetUnitCommands(builderID, MAX_CMDS)
  if not cmdQueue or #cmdQueue == 0 or not targetDefID then
    return nil, nil, nil
  end

  local curIndex, nextIndex
  for i = 1, #cmdQueue do
    local cmd = cmdQueue[i]
    local id  = cmd.id
    if id and id < 0 then
      local buildDefID = -id
      if not curIndex and buildDefID == targetDefID then
        curIndex = i
      elseif curIndex and not nextIndex then
        nextIndex = i
        break
      end
    end
  end

  return cmdQueue, curIndex, nextIndex
end

local function buildTagsToRemove(cmdQueue, curIndex)
  if not cmdQueue or not curIndex then
    return nil
  end

  local tagsToRemove = {}
  local curCmd = cmdQueue[curIndex]
  if not curCmd or not curCmd.tag then
    return nil
  end
  tagsToRemove[#tagsToRemove + 1] = curCmd.tag

  -- Optionally remove preceding MOVE command
  if curIndex > 1 then
    local prevCmd = cmdQueue[curIndex - 1]
    if prevCmd and prevCmd.id == CMD_MOVE and prevCmd.tag then
      tagsToRemove[#tagsToRemove + 1] = prevCmd.tag
    end
  end

  if #tagsToRemove == 0 then
    return nil
  end

  return tagsToRemove
end

--------------------------------------------------------------------------------
-- Resource property analysis for MM / energy logic
--------------------------------------------------------------------------------

local function getResourceProperties(unitDefID, unitDef)
  if not unitDef and unitDefID then
    unitDef = UnitDefs[unitDefID]
  end
  if not unitDef then
    return nil
  end

  local cp = unitDef.customParams or {}

  local metalMake    = unitDef.metalMake or tonumber(cp.metal_make) or 0
  local energyMake   = unitDef.energyMake or tonumber(cp.energy_make) or 0
  local energyUpkeep = unitDef.energyUpkeep or tonumber(cp.energy_upkeep) or 0
  local extractsMetal = unitDef.extractsMetal or tonumber(cp.extracts_metal) or 0

  local tidalGenerator = unitDef.tidalGenerator or tonumber(cp.tidal_generator) or 0
  local windGenerator  = unitDef.windGenerator  or tonumber(cp.wind_generator)  or 0

  local avgWind = 0
  if windGenerator and windGenerator > 0 and Game.windMin and Game.windMax then
    local avgWindSpeed = (Game.windMin + Game.windMax) * 0.5
    avgWind = windGenerator * avgWindSpeed
  end

  local tidal = 0
  if tidalGenerator and tidalGenerator > 0 and Game.tidal then
    tidal = tidalGenerator * Game.tidal
  end

  local energyPerSecond = energyMake + avgWind + tidal - (energyUpkeep or 0)
  local metalPerSecond  = metalMake + extractsMetal

  -- Metal maker detection
  local isMetalMaker = false
  if metalMake > 0 and (energyUpkeep or 0) > 0 then
    isMetalMaker = true
  end
  if cp.metal_maker == "1" or cp.metalMaker == "1" then
    isMetalMaker = true
  end
  if WG and WG.energyConversion and WG.energyConversion[unitDefID] then
    isMetalMaker = true
  end

  local isEnergyProducer = (energyPerSecond or 0) > 0

  return {
    metalPerSecond   = metalPerSecond,
    energyPerSecond  = energyPerSecond,
    isMetalMaker     = isMetalMaker,
    isEnergyProducer = isEnergyProducer,
  }
end

--------------------------------------------------------------------------------
-- Structural safety gate for skipping
--------------------------------------------------------------------------------

-- Implements:
-- A) If any immobile builder is in build range of the target, skip allowed.
-- B) If more than one builder is currently building this target, skip allowed.
-- C) Otherwise (single constructor and no immobile in range), skip forbidden.
local function canBuilderSkipStructurally(builderID, builderState, targetID, targetBuilderCount, targetHasImmobileSupport)
  if not builderID or not builderState or not targetID then
    return false
  end

  local ud = builderState.unitDef
  if not ud then
    return false
  end

  -- Rules specifically apply to mobile constructors.
  -- Other builders (immobile, factories) behave as before.
  if not isMobileConstructor(ud) then
    return true
  end

  local countOnTarget = targetBuilderCount[targetID] or 0
  local hasImmobile   = targetHasImmobileSupport[targetID] or false

  -- A) Immobile builder can assist within range
  if hasImmobile then
    return true
  end

  -- B) More than one builder is currently building the same target
  if countOnTarget > 1 then
    return true
  end

  -- C) Single constructor, no immobile support -> cannot skip
  return false
end

--------------------------------------------------------------------------------
-- MM / energy assist redirection
--------------------------------------------------------------------------------

local function insertAssistOrder(builderID, targetID)
  if not builderID or not targetID then
    return
  end
  -- Insert REPAIR at the front of the queue
  spGiveOrderToUnit(builderID, CMD_INSERT, {0, CMD_REPAIR, 0, targetID}, {"shift"})
end

local function redirectBuilderToAssist(builderID, builderState, currentTargetID, assistTargetID)
  if not builderID or not builderState or not currentTargetID or not assistTargetID then
    return
  end

  local targetDefID = spGetUnitDefID(currentTargetID)
  if not targetDefID then
    return
  end

  local cmdQueue, curIndex = scanBuildQueue(builderID, targetDefID)
  if cmdQueue and curIndex then
    local tagsToRemove = buildTagsToRemove(cmdQueue, curIndex)
    if tagsToRemove then
      spGiveOrderToUnit(builderID, CMD_REMOVE, tagsToRemove, {"ctrl"})
    end
  end

  builderState.previousBuilding = currentTargetID
  abandonedTargetIDs[currentTargetID] = true

  insertAssistOrder(builderID, assistTargetID)
end

local function runAssistLogic(builderID, builderState, targetID, targetDefID, targetDef, canSkipStructurally)
  if not builderID or not builderState or not targetID or not targetDefID or not targetDef then
    return
  end

  -- If skipping is structurally forbidden, we must not redirect away either
  if not canSkipStructurally then
    return
  end

  local resProps = getResourceProperties(targetDefID, targetDef)
  if not resProps or (not resProps.isMetalMaker and not resProps.isEnergyProducer) then
    return
  end

  local energyStall = isEnergyStalling()
  local metalStall  = isMetalStalling()
  local energyTrendOk = isEnergyTrendPositive()
  local metalTrendOk  = isMetalTrendPositive()

  local x, _, z = spGetUnitPosition(builderID, true)
  if not x or not z then
    return
  end

  local radius = builderState.unitDef.buildDistance or 200
  local neighbors = spGetUnitsInCylinder(x, z, radius, myTeamID)
  if not neighbors or #neighbors == 0 then
    return
  end

  local bestEnergyID, bestEnergyScore = nil, -1
  local bestMMID, bestMMScore = nil, -1

  for i = 1, #neighbors do
    local nid = neighbors[i]
    if nid ~= targetID then
      local nDefID = spGetUnitDefID(nid)
      local nDef   = nDefID and UnitDefs[nDefID]
      if nDef then
        local _, _, _, _, buildProgress = spGetUnitHealth(nid)
        if buildProgress and buildProgress < 1 then
          local nRes = getResourceProperties(nDefID, nDef)
          if nRes then
            if nRes.isEnergyProducer and nRes.energyPerSecond > bestEnergyScore then
              bestEnergyScore = nRes.energyPerSecond
              bestEnergyID    = nid
            end
            if nRes.isMetalMaker and nRes.metalPerSecond > bestMMScore then
              bestMMScore = nRes.metalPerSecond
              bestMMID    = nid
            end
          end
        end
      end
    end
  end

  local assistTargetID = nil

  -- If building metal maker but energy is stalling, prioritize nearby energy producer
  if resProps.isMetalMaker and energyStall and bestEnergyID then
    assistTargetID = bestEnergyID
  end

  -- If building non-maker energy, metal is stalling and energy trend is OK, assist better metal maker
  if not assistTargetID and resProps.isEnergyProducer and not resProps.isMetalMaker and not energyStall and metalStall and bestMMID then
    assistTargetID = bestMMID
  end

  -- If already building a weak metal maker and energy is plentiful, redirect to a stronger one
  if not assistTargetID and resProps.isMetalMaker and energyTrendOk and not metalTrendOk and bestMMID and bestMMScore > resProps.metalPerSecond * 1.2 then
    assistTargetID = bestMMID
  end

  if assistTargetID then
    redirectBuilderToAssist(builderID, builderState, targetID, assistTargetID)
  end
end

--------------------------------------------------------------------------------
-- Fast-forward core logic
--------------------------------------------------------------------------------

local function maybeFastForwardBuilder(builderID, builderState, targetID, targetDefID, targetDef, totalBuildSpeed, secondsLeft)
  if not builderID or not builderState or not targetID or not targetDefID or not targetDef then
    return
  end

  -- Do not try to fast-forward the same building repeatedly
  if abandonedTargetIDs[targetID] then
    return
  end

  -- Respect previousBuilding flag: wait until previous building is done/gone
  if builderState.previousBuilding then
    if isUnitFinished(builderState.previousBuilding) then
      builderState.previousBuilding = nil
    else
      return
    end
  end

  if not isTimeToMoveOn(secondsLeft, builderID, builderState, targetDef, totalBuildSpeed) then
    return
  end
  if not isResourceToMoveOn(secondsLeft, targetDef, totalBuildSpeed, builderID) then
    return
  end

  local cmdQueue, curIndex, nextIndex = scanBuildQueue(builderID, targetDefID)
  if not cmdQueue or not curIndex or not nextIndex then
    -- Must have both current and at least one later build command
    return
  end

  local tagsToRemove = buildTagsToRemove(cmdQueue, curIndex)
  if not tagsToRemove or #tagsToRemove == 0 then
    return
  end

  spGiveOrderToUnit(builderID, CMD_REMOVE, tagsToRemove, {"ctrl"})

  builderState.previousBuilding = targetID
  abandonedTargetIDs[targetID]  = true
end

--------------------------------------------------------------------------------
-- Per-frame iteration
--------------------------------------------------------------------------------

local function builderIteration(frame)
  updateResourceTrends()

  -- First pass: collect builder->target and per-target build speed and counts
  local builderTargets        = {}
  local targetBuildSpeeds     = {}
  local targetBuilderCount    = {}
  for builderID, data in pairs(builders) do
    if data.owned then
      local targetID = spGetUnitIsBuilding(builderID)
      if targetID then
        builderTargets[builderID] = targetID
        targetBuildSpeeds[targetID]  = (targetBuildSpeeds[targetID]  or 0) + (data.buildSpeed or 0)
        targetBuilderCount[targetID] = (targetBuilderCount[targetID] or 0) + 1
      end
    end
  end

  -- Second pass: for all active targets, determine if there is an immobile builder in range
  local targetHasImmobileSupport = {}
  if next(targetBuilderCount) ~= nil then
    -- Collect immobile builders and their positions/ranges
    local immobileBuilders = {}
    for builderID, data in pairs(builders) do
      if data.owned then
        local ud = data.unitDef
        if IsImmobileBuilder(ud) then
          local x, _, z = spGetUnitPosition(builderID, true)
          if x and z then
            local range = ud.buildDistance or 200
            immobileBuilders[#immobileBuilders + 1] = {
              x     = x,
              z     = z,
              range = range,
            }
          end
        end
      end
    end

    if #immobileBuilders > 0 then
      for targetID, _ in pairs(targetBuilderCount) do
        local tx, _, tz = spGetUnitPosition(targetID, true)
        if tx and tz then
          for i = 1, #immobileBuilders do
            local im = immobileBuilders[i]
            local dx = im.x - tx
            local dz = im.z - tz
            if dx * dx + dz * dz <= im.range * im.range then
              targetHasImmobileSupport[targetID] = true
              break
            end
          end
        end
      end
    end
  end

  -- Cache secondsLeft per target
  local targetSecondsLeft = {}

  for builderID, data in pairs(builders) do
    if data.owned then
      local targetID = builderTargets[builderID]
      if targetID then
        -- Clear previousBuilding flag if that unit is done
        if data.previousBuilding and isUnitFinished(data.previousBuilding) then
          data.previousBuilding = nil
        end

        -- Skip if current target is marked abandoned already
        if not abandonedTargetIDs[targetID] then
          local targetDefID = spGetUnitDefID(targetID)
          local targetDef   = targetDefID and UnitDefs[targetDefID]
          if targetDef then
            local totalBuildSpeed = targetBuildSpeeds[targetID] or 0
            if totalBuildSpeed > 0 then
              local secondsLeft = targetSecondsLeft[targetID]
              if not secondsLeft then
                secondsLeft = computeSecondsLeft(targetID, targetDef, totalBuildSpeed)
                targetSecondsLeft[targetID] = secondsLeft
              end

              -- Structural gate (A/B/C) for this builder/target
              local canSkipStructurally = canBuilderSkipStructurally(
                builderID,
                data,
                targetID,
                targetBuilderCount,
                targetHasImmobileSupport
              )

              -- MM / energy assist logic (will only redirect if skipping is allowed structurally)
              runAssistLogic(builderID, data, targetID, targetDefID, targetDef, canSkipStructurally)

              -- Fast-forward logic (only if we are allowed structurally and time/resource checks pass)
              if secondsLeft and secondsLeft > 0 and canSkipStructurally then
                maybeFastForwardBuilder(builderID, data, targetID, targetDefID, targetDef, totalBuildSpeed, secondsLeft)
              end
            end
          end
        end
      end
    end
  end
end

--------------------------------------------------------------------------------
-- Widget lifecycle
--------------------------------------------------------------------------------

function widget:Initialize()
  myTeamID = spGetMyTeamID()
  if spGetSpectatingState() or spIsReplay() then
    self:PlayerChanged()
  end
  registerUnits()
end

function widget:GameStart()
  self:PlayerChanged()
end

function widget:PlayerChanged(playerID)
  myTeamID = spGetMyTeamID()
  local spectating = spGetSpectatingState()
  if spectating and spGetGameFrame() > 0 then
    widgetHandler:RemoveWidget(self)
  end
end

function widget:GameFrame(n)
  if n % mainIterationModuloLimit == 0 then
    builderIteration(n)
  end
end

--------------------------------------------------------------------------------
-- Unit call-ins
--------------------------------------------------------------------------------

function widget:UnitCreated(unitID, unitDefID, unitTeam)
  if unitTeam == myTeamID then
    registerBuilder(unitID, unitDefID, unitTeam)
  end
end

function widget:UnitGiven(unitID, unitDefID, newTeam, oldTeam)
  if newTeam == myTeamID then
    registerBuilder(unitID, unitDefID, newTeam)
  elseif oldTeam == myTeamID then
    unregisterBuilder(unitID)
  end
end

function widget:UnitFinished(unitID, unitDefID, unitTeam)
  -- The building is complete; no longer considered "abandoned"
  abandonedTargetIDs[unitID] = nil
end

function widget:UnitDestroyed(unitID, unitDefID, unitTeam)
  if builders[unitID] then
    unregisterBuilder(unitID)
  end
  abandonedTargetIDs[unitID] = nil
end

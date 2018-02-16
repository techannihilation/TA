function widget:GetInfo()
    return {
        name = "build queue fast forward",
        desc = "Lots of code from gui_build_costs.lua Milan Satala and also some from ecostats.lua by Jools, iirc",
        author = "his_face",
        date = "feb, 2016",
        license = "GNU GPL, v2 or later",
        layer = 99,
        enabled = false
    }
end

local GetAllyTeamList = Spring.GetAllyTeamList
local GetMyTeamID = Spring.GetMyTeamID
local GetSelectedUnits = Spring.GetSelectedUnits
local GetTeamResources = Spring.GetTeamResources
local GetTeamResources = Spring.GetTeamResources
local GetTeamRulesParam = Spring.GetTeamRulesParam
local GetTeamRulesParam = Spring.GetTeamRulesParam
local GetTeamUnits = Spring.GetTeamUnits
local GetUnitCommands = Spring.GetUnitCommands
local GetUnitDefID = Spring.GetUnitDefID
local GetUnitHealth = Spring.GetUnitHealth
local GetUnitIsBuilding = Spring.GetUnitIsBuilding
local GetUnitPosition = Spring.GetUnitPosition
local GetUnitResources = Spring.GetUnitResources
local GetUnitsInCylinder = Spring.GetUnitsInCylinder
local GetUnitsInSphere = Spring.GetUnitsInSphere
local GiveOrderToUnit = Spring.GiveOrderToUnit


local abandonedTargetIDs = {}
local builders = {}
local commanderBuildSpeed = 100
local conversionLevelHistory = {}
local log = Spring.Echo
local mainIterationModuloLimit = 5
local regularizedResourceDerivativesMetal = {1}
local regularizedResourceDerivativesEnergy = {1}
local metalMakers = {}
local myTeamID = Spring.GetMyTeamID()
local possibleMetalMakersProduction = 0
local possibleMetalMakersUpkeep = 0
local releasedMetal = 0
local selectedUnits = nil
local t0 = Spring.GetTimer()
local tidalStrength = Game.tidal
local totalSavedTime = 0
local willStall = false
local windMax = Game.windMax
local windMin = Game.windMin
local regularizedPositiveMetal = true
local regularizedPositiveEnergy = true
local regularizedNegativeMetal = false
local regularizedNegativeEnergy = false
local metalLevel = 0
local positiveMMLevel = 0


function widget:Initialize()
    if Spring.GetSpectatingState() or Spring.IsReplay() then
	    widget:PlayerChanged()
    end

    registerUnits()
end

function widget:PlayerChanged(playerID)
	if Spring.GetSpectatingState() and Spring.GetGameFrame() > 0 then
		widgetHandler:RemoveWidget(self)
	end
end

function widget:GameStart()
	widget:PlayerChanged()
end

function registerUnits()
    builders = {}
    metalMakers = {}
    possibleMetalMakersUpkeep = 0
    possibleMetalMakersProduction = 0

    local myUnits = GetTeamUnits(myTeamID)
    for _, unitID in ipairs(myUnits) do
        local unitDefID = GetUnitDefID(unitID)
        registerUnit(unitID, unitDefID, teamID)
    end
end



function registerUnit(unitID, unitDefID, unitTeam)

  if not unitDefID then
    return
  end

  local unitDef = UnitDefs[unitDefID]

  if isBuilder(unitDef) then

    builders[unitID] = {["buildSpeed"] = unitDef.buildSpeed, originalBuildSpeed = unitDef.buildSpeed, ['unitDef'] = unitDef, ["targetID"] = nil, ["guards"] = {}, ['previousBuilding'] = nil}
    -- log(UnitDefs[unitDefID].humanName .. " registered")

    if unitDef.customParams.iscommander then
      commanderBuildSpeed = unitDef.buildSpeed
    end

  -- elseif unitTeam == myTeamID and isMetalMaker(unitDef) then
    -- registerMetalMaker(unitID, unitDef)
  -- else
    -- return
  -- end
  end

end



function widget:UnitCreated(unitID, unitDefID, unitTeam)
  registerUnit(unitID, unitDefID, unitTeam)
end

function widget:UnitGiven(unitID, unitDefID, unitTeam, oldTeam)
  if unitTeam == myTeamID then
    if builders[unitID] then
      builders[unitID].owned = true
    else
      -- local unitDef = UnitDefs[unitDefID]
      -- if isMetalMaker(unitDef) then
        -- registerMetalMaker(unitID, unitDef)
      -- end
    end
  end
end


function getBuildersBuildSpeed(selectedBuilders)
  local totalSpeed = 0

  for _, unitID in pairs(selectedBuilders) do
    local targetID = builders[unitID].targetID
    if not targetID or not isAlreadyInTable(targetID, selectedBuilders) then
      totalSpeed = totalSpeed + builders[unitID].buildSpeed
    end
  end

  return totalSpeed
end


function getBuildTimeLeft(unitID)

  -- local health, maxHealth, paralyzeDamage, capture, build = GetUnitHealth(unitID)
  local _, _, _, _, build = GetUnitHealth(unitID)

  -- local alreadyBuilding = {}
  local currentBuildSpeed = 0
  -- local releasedExpenditures = getSelectedUnitsUpkeep()  --{metal = 0, energy = 0}

  for builderID, _ in pairs(builders) do
    local targetID = GetUnitIsBuilding(builderID)
    if targetID == unitID and builderID ~= unitID then
      -- alreadyBuilding[builderID] = builderID
      currentBuildSpeed = currentBuildSpeed + builders[builderID].originalBuildSpeed

      -- if selectedBuilders[builderID] or isAlreadyInTable(builderID, selectedBuilders) then
        -- selectedBuilders[builderID] = nil
      -- end
    end
  end

  local unitDef = UnitDefs[GetUnitDefID(unitID)]

  local buildLeft = (1 - build) * unitDef.buildTime

  local time =  buildLeft / currentBuildSpeed

  return time
end


function getTargetsBuild(unitID)
  local targetID = builders[unitID].targetID
  if targetID then
    return getTargetsBuild(targetID)
  else
    return GetUnitIsBuilding(unitID)
  end
end


function getUnitsBuildingUnit(unitID)
  local building = {}

  for builderID, _ in pairs(builders) do
    local targetID = GetUnitIsBuilding(builderID)
    if targetID == unitID then
      building[builderID] = builderID
    end
  end

  return building
end


function isBuilder(unitDef)
  if (unitDef.isBuilder and unitDef.canAssist) or unitDef.isFactory then
    return true
  else
    return false
  end
end


function widget:GameFrame(n)
  if n % mainIterationModuloLimit == 0 then
    builderIteration(n)
  end

  -- if t1 then
  --   log(string.format('%.1f seconds since last action', Spring.DiffTimers(Spring.GetTimer(), t1)))
  --   if Spring.DiffTimers(Spring.GetTimer(), t1) > 30 then
  --     -- log(Spring.DiffTimers(Spring.GetTimer(), t1))
  --     t0 = Spring.GetTimer()
  --   end
  -- end

  -- if n % 96 == 0 then
    -- log(string.format('%.1f seconds from t0', Spring.DiffTimers(Spring.GetTimer(), t0)))
  -- end

  if n % 1000 == 0 then
    for k, v in pairs(abandonedTargetIDs) do
      -- this probably doesn't work at all since
      local _, _, _, _, build = GetUnitHealth(k)
      if build == nil or build == 1 then
        table.remove(abandonedTargetIDs, k)
      end
    end
  end
end

function builderIteration(n)
  for builderID, _ in pairs(builders) do
    local targetID = GetUnitIsBuilding(builderID)
    if targetID then
      -- target id recieved

      local builderDef = UnitDefs[GetUnitDefID(builderID)]
      local targetDefID = GetUnitDefID(targetID)
      local targetDef = UnitDefs[targetDefID]

      -- fast forwarder
      local cmdQueue = GetUnitCommands(builderID, 3);
      if cmdQueue and #cmdQueue > 2 and cmdQueue[3].id < 0 then
        -- next command is build command
        if not abandonedTargetIDs[targetID] then
          -- target has not previously been abandoned
          previousBuilding = builders[builderID].previousBuilding
          if not previousBuilding then
            -- this is the first building for builder
            -- t0 = Spring.GetTimer()
            -- totalSavedTime = 0
            doFastForwardDecision(builderID, targetID, cmdQueue[1].tag, cmdQueue[2].tag)

          else
            local _, _, _, _, prevBuild = GetUnitHealth(previousBuilding)
            local _, _, _, _, currBuild = GetUnitHealth(targetID)
            if prevBuild == nil or prevBuild == 1 then
              -- previous building is done
              -- doFastForwardDecision(builderID, targetID, cmdQueue[1].tag, cmdQueue[2].tag)
              doFastForwardDecision(builderID, targetID, cmdQueue[1].tag, cmdQueue[2].tag)
            end
          end
        end
      end


      local mpx, _, mpz = GetUnitPosition(builderID, true)
      local neighbours = GetUnitsInCylinder(mpx, mpz, builderDef.buildDistance, myTeamID)

      -- mm/e switcher
      targetMM, targetE = getResourceProperties(targetDefID, targetDef)
      -- tooMuchMMs, tooLittleMMs, isMetalStalling, isMetalLeaking, isEnergyStalling, isEnergyLeaking = getResourceStatus()
      positiveMMLevel, tooLittleMMs, tooMuchMMs, metalLevel, isPositiveMetalDerivative, energyLevel, isPositiveEnergyDerivative = getResourceStatus()

      if n % mainIterationModuloLimit*30 == 0 then
        table.insert(regularizedResourceDerivativesMetal, 1, isPositiveMetalDerivative)
        table.insert(regularizedResourceDerivativesEnergy, 1, isPositiveEnergyDerivative)
        if table.getn(regularizedResourceDerivativesMetal) > 7 then
          table.remove(regularizedResourceDerivativesMetal)
          table.remove(regularizedResourceDerivativesEnergy)
        end
      end

      regularizedPositiveMetal = table.full_of(regularizedResourceDerivativesMetal, true)
      regularizedPositiveEnergy = table.full_of(regularizedResourceDerivativesEnergy, true)
      regularizedNegativeMetal = table.full_of(regularizedResourceDerivativesMetal, false)
      regularizedNegativeEnergy = table.full_of(regularizedResourceDerivativesMetal, false)


      -- isMetalStalling = metalLevel < 0.01 and not regularizedPositiveMetal
      -- isMetalLeaking = metalLevel > 0.99 and regularizedPositiveMetal
      -- isEnergyStalling = energyLevel < 0.01 and not regularizedPositiveEnergy
      -- isEnergyLeaking = energyLevel > 0.99 and regularizedPositiveEnergy

      -- isMetalStalling = metalLevel < 0.01 and regularizedNegativeMetal
      -- isMetalLeaking = metalLevel > 0.99 and regularizedPositiveMetal
      -- isEnergyStalling = energyLevel < 0.01 and regularizedNegativeEnergy
      isEnergyLeaking = energyLevel > 0.99 and isPositiveEnergyDerivative

      if regularizedPositiveMetal then
        -- log('m+')
      end
      if regularizedPositiveEnergy then
        -- log('e+')
      end

      -- log(targetMM, targetE, tooMuchMMs, isEnergyStalling, isEnergyLeaking)
      -- m is increasing, e is not decreasing
      -- if metalLevel > 0.5 and regularizedPositiveMetal and not regularizedNegativeEnergy then
      --   log('find buildpower unit')
      --   builderForceAssist(0, builderID, targetDef, neighbours, targetMM, targetE)
      -- end

      -- not building buildpower unit or
      -- or building buildpower unit, m not increasing
      -- if unitDef.buildpower <= 0 or (unitDef.buildpower > 0 and not regularizedPositiveMetal) then
        -- e is not increasing, building a mm, under mm level
        -- e is not increasing, building a non-e building
      if not regularizedPositiveEnergy and not isEnergyLeaking and ((targetMM >= 0 and not positiveMMLevel) or targetE < 0 and isEnergyStalling) then
        builderForceAssist('energy', builderID, targetID, targetDef, neighbours, targetMM, targetE)
      -- building e building,
      elseif targetE > 0 and positiveMMLevel and regularizedPositiveEnergy then
        builderForceAssist('mm', builderID, targetID, targetDef, neighbours, targetMM, targetE)
      end
      -- end

      -- easy finish neighbour
      local _, _, _, _, targetBuild = GetUnitHealth(targetID)
      for _, candidateID in ipairs(neighbours) do
        local candidateDef = UnitDefs[GetUnitDefID(candidateID)]
        if candidateID ~= targetID and candidateDef == targetDef then
          -- same type and not actually same buildings
          local _, _, _, _, candidateBuild = GetUnitHealth(candidateID)
          if candidateBuild and candidateBuild < 1 and candidateBuild > targetBuild then
            -- candidate is better
            local targetBuildTimeLeft = getBuildTimeLeft(targetID)
            local cmdQueue = GetUnitCommands(builderID, 2);
            -- log('targetID ' .. targetID)
            if targetBuildTimeLeft > 0.5 then
              -- log('moving on to nearby')
              GiveOrderToUnit(builderID, CMD.INSERT, {0, CMD.REPAIR, CMD.OPT_CTRL, candidateID}, {"alt"})
              -- builders[builderID].previousBuilding = targetID
              -- t1 = Spring.GetTimer()
            else
            end
          end
        end
      end

    end

  end
end


function builderForceAssist(assistType, builderID, targetID, targetDef, neighbours, targetMM, targetE)
  foundBuildPowerUnit = false
  if (metalLevel > 0.8 or regularizedPositiveMetal) and (positiveMMLevel or not regularizedNegativeEnergy) then
    -- log('looking for buildpower')
    for _, candidateID in ipairs(neighbours) do
      local _, _, _, _, candidateBuild = GetUnitHealth(candidateID)
      if candidateBuild ~= nil and candidateBuild < 1 then

        local candidateDefID = GetUnitDefID(candidateID)
        local candidateDef = UnitDefs[candidateDefID]
        if candidateDef.buildSpeed ~= nil then
          -- log('build ' .. candidateBuild .. ' buildpower ' .. candidateDef.buildSpeed)
        end
        if candidateDef.buildSpeed ~= nil and candidateDef.buildSpeed > 0 then
          GiveOrderToUnit(builderID, CMD.INSERT, {0, CMD.REPAIR, CMD.OPT_CTRL, candidateID}, {"alt"})
          foundBuildPowerUnit = true
          -- log('found buildpower')
          break
        end
      end
    end
  elseif targetDef.buildSpeed > 0 then
    -- log('maybe switch from buildpower building')
    local cmdQueue = GetUnitCommands(builderID, 3);
    if cmdQueue and #cmdQueue > 2 then
      local _, _, _, _, targetBuild = GetUnitHealth(targetID)
      -- log('queue ids ', cmdQueue[1].id, cmdQueue[2].id, cmdQueue[3].id, 'target', targetID, targetBuild)
    end
    if cmdQueue and #cmdQueue > 2 and cmdQueue[2].id < 0 then
      -- log('continue on build queue instead of buildpower unit')
      moveOnFromBuilding(builderID, targetID, cmdQueue[1].tag)
    end
  end

  if foundBuildPowerUnit == false then
    for _, candidateID in ipairs(neighbours) do
      -- log('looking for ' .. assistType)
      local _, _, _, _, candidateBuild = GetUnitHealth(candidateID)
      if candidateBuild ~= nil and candidateBuild < 1 then
        local candidateDefID = GetUnitDefID(candidateID)
        local candidateDef = UnitDefs[candidateDefID]
        local candidateMM, candidateE = getResourceProperties(candidateDefID, candidateDef)
        if assistType == 'energy' then
          -- log('candidateE ' .. candidateE .. ' >? ' .. targetE )
          if candidateE > targetE then
            GiveOrderToUnit(builderID, CMD.INSERT, {0, CMD.REPAIR, CMD.OPT_CTRL, candidateID}, {"alt"})
            -- log('found e')
            break
          end
        elseif assistType == 'mm' then
          -- log('candidateMM ' .. candidateMM .. ' >? ' .. targetMM )
          if candidateMM > targetMM then
            GiveOrderToUnit(builderID, CMD.INSERT, {0, CMD.REPAIR, CMD.OPT_CTRL, candidateID}, {"alt"})
            -- log('found mm')
            break
          end
        elseif assistType == 'metal' then
          -- log('metal')
          break
        end
      end
    end
  end
end

function getResourceStatus()
  mm_level = GetTeamRulesParam(myTeamID, 'mmLevel')
  m_curr, m_max, m_pull, m_inc, m_exp = GetTeamResources(myTeamID, 'metal')
  e_curr, e_max, e_pull, e_inc, e_exp = GetTeamResources(myTeamID, 'energy')

  isPositiveMetalDerivative = m_inc > (m_pull+m_exp)/2
  metalLevel = m_curr/m_max

  -- log('e_pull '.. e_pull .. ' e_inc ' .. e_inc .. ' e_exp ' ..  e_exp)
  isPositiveEnergyDerivative = e_inc > (e_pull+e_exp)/2
  energyLevel = e_curr/e_max

  tooLittleMMs = energyLevel > mm_level*1.1
  tooMuchMMs = energyLevel < mm_level*0.9
  if energyLevel >= mm_level then
    positiveMMLevel = true
    else
    positiveMMLevel = false
  end
  isMetalStalling = metalLevel < 0.01 and not isPositiveMetalDerivative
  isMetalLeaking = metalLevel > 0.99 and isPositiveMetalDerivative
  isEnergyStalling = energyLevel < 0.01 and not isPositiveEnergyDerivative
  isEnergyLeaking = energyLevel > 0.99 and isPositiveEnergyDerivative
  return positiveMMLevel, tooLittleMMs, tooMuchMMs, metalLevel, isPositiveMetalDerivative, energyLevel, isPositiveEnergyDerivative
end

function getResourceProperties(unitDefID, unitDef)
  local metalMakingEfficiency = getMetalMakingEfficiency(unitDefID)
  if metalMakingEfficiency == nil then
    metalMakingEfficiency = 0
  end
  local energyMaking = getEout(unitDef)
  return metalMakingEfficiency, energyMaking
end

function getMetalMakingEfficiency(unitDefID)
  makerDef = WG.energyConversion.convertCapacities[unitDefID]
  if makerDef ~= nil then
    return makerDef.e
  else
    return 0
  end
end

function getEout(unitDef)
  local totalEOut = unitDef.energyMake or 0

  -- if negsolar[unitDef.name] then
      -- totalEOut = totalEOut + math.abs(unitDef.energyUpkeep)
  -- end

  totalEOut = totalEOut + -1*unitDef.energyUpkeep

  if unitDef.tidalGenerator > 0 and tidalStrength > 0 then
      local mult = 1 -- DEFAULT
      if unitDef.customParams then
          mult = unitDef.customParams.energymultiplier or mult
      end
      totalEOut = totalEOut +(tidalStrength * mult)
  end

  if unitDef.windGenerator > 0 then
      local mult = 1 -- DEFAULT
      if unitDef.customParams then
          mult = unitDef.customParams.energymultiplier or mult
      end

      local unitWindMin = math.min(windMin, unitDef.windGenerator)
      local unitWindMax = math.min(windMax, unitDef.windGenerator)
      totalEOut = totalEOut + (((unitWindMin + unitWindMax) / 2 ) * mult)
  end
  return totalEOut
end

function doFastForwardDecision(builderID, targetID, cmdQueueTag, cmdQueueTagg)
  selectedUnits = GetSelectedUnits()
  local totalBuildSpeed = getBuildersBuildSpeed(getUnitsBuildingUnit(targetID))
  local secondsLeft = getBuildTimeLeft(targetID)
  local unitDef = UnitDefs[GetUnitDefID(targetID)]
  if isTimeToMoveOn(secondsLeft, builderID, unitDef, totalBuildSpeed) and isResourceToMoveOn(secondsLeft, unitDef, totalBuildSpeed) then
    moveOnFromBuilding(builderID, targetID, cmdQueueTag, cmdQueueTagg)
  end
end

function moveOnFromBuilding(builderID, targetID, cmdQueueTag, cmdQueueTagg)
  if not cmdQueueTagg then
    GiveOrderToUnit(builderID, CMD.REMOVE, {cmdQueueTag}, {"ctrl"})
  else
    GiveOrderToUnit(builderID, CMD.REMOVE, {cmdQueueTag,cmdQueueTagg}, {"ctrl"})
  end
  -- log(builderID .. ' moved on from ' .. targetID)
  builders[builderID].previousBuilding = targetID
  abandonedTargetIDs[targetID] = true
  -- log('prev ' .. targetID, builders[builderID].previousBuilding)
  t1 = Spring.GetTimer()
end

function isTimeToMoveOn(secondsLeft, builderID, unitDef, totalBuildSpeed)
  local plannerBuildSpeed = builders[builderID].originalBuildSpeed
  local plannerBuildShare = plannerBuildSpeed / totalBuildSpeed
  local slowness = 45/unitDef.speed
  -- log("plannerBuild calc " .. plannerBuildShare .. " = " .. plannerBuildSpeed .. " / " .. totalBuildSpeed)
  if ((plannerBuildShare < 0.75 and secondsLeft < 1.2*slowness) or (plannerBuildShare < 0.5 and secondsLeft < 3.4*slowness) or (plannerBuildShare < 0.15 and secondsLeft < 8*slowness) or (plannerBuildShare < 0.05 and secondsLeft < 12*slowness)) then
    totalSavedTime = totalSavedTime + secondsLeft
    -- log(string.format('Con moved on, %.0f%% buildshare and %.1f sec left, saved %.0f moving sec, lost %.0f con total sec', plannerBuildShare*100, secondsLeft, totalSavedTime, Spring.DiffTimers(Spring.GetTimer(), t0)))
    return true
  else
    return false
  end
end

function isResourceToMoveOn(secondsLeft, unitDef, currentBuildSpeed)
  local speed = unitDef.buildTime / currentBuildSpeed
  local metal = unitDef.metalCost / speed
  local energy = unitDef.energyCost / speed

  local releasedExpenditures = getSelectedUnitsUpkeep()

  calcResourceChange("energy", energy, secondsLeft, releasedExpenditures.energy)
  calcResourceChange("metal", metal, secondsLeft, releasedExpenditures.metal)

  if (willStall == true) then
    return false
  else
    return true
  end

end

function calcResourceChange(type, consumption, secondsLeft, releasedExpenditures)
  local currentChange, lvl, storage, _, alreadyInStall = getMyResources(type)

  local changeWhenBuilding = currentChange - consumption + releasedExpenditures

  if metalMakersControlled and type == "metal" then
    changeWhenBuilding = changeWhenBuilding - releasedMetal
  end

  releasedMetal = 0
  if metalMakersControlled and type == "energy" and possibleMetalMakersUpkeep > 0 then
    local metalMakersUpkeep = getMetalMakersUpkeep()
    if changeWhenBuilding < 0 then
      changeWhenBuilding = changeWhenBuilding + metalMakersUpkeep

      local releasedEnergy = 0
      if changeWhenBuilding > 0 then
        releasedEnergy = changeWhenBuilding
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



function getMyResources(type)
  local lvl, storage, pull, inc, exp, share, sent , recieved = GetTeamResources(myTeamID, type)

  if not inc then
    Spring.Echo("ERROR", myTeamID, type)
    myTeamID = Spring.GetMyTeamID()
    return
  end

  local total = recieved
  local exp = 0
  local units = GetTeamUnits(myTeamID)

  if type == "metal" then
    for _, unitID in ipairs(units) do
      local metalMake, metalUse, energyMake, energyUse = GetUnitResources(unitID)
      total = total +  metalMake - metalUse
      exp = exp + metalUse
    end
  else
    for _, unitID in ipairs(units) do
      local metalMake, metalUse, energyMake, energyUse = GetUnitResources(unitID)
      total = total +  energyMake - energyUse
      exp = exp + energyUse
    end
  end

  local alreadyInStall = pull > exp and lvl < pull

  return total, lvl, storage, exp, alreadyInStall
end


function getSelectedUnitsUpkeep()
  local alreadyCounted = {}

  local metal = 0
  local energy = 0

  for _, unitID in ipairs(selectedUnits) do
    if builders[unitID] then
      local metalUse, energyUse = traceUpkeep(unitID, alreadyCounted)
      metal = metal + metalUse
      energy = energy + energyUse
    end
  end
  return {["metal"] = metal, ["energy"] = energy}
end


function traceUpkeep(unitID, alreadyCounted)
  if alreadyCounted[unitID] then
    return 0, 0
  end

  local metalMake, metal, energyMake, energy = GetUnitResources(unitID)
  for _, guardID in ipairs(builders[unitID].guards) do
    if builders[guardID].owned then
      local guarderMetal, guarderEnergy = traceUpkeep(guardID, alreadyCounted)
      metal = metal + guarderMetal
      energy = energy + guarderEnergy
    end
  end

  alreadyCounted[unitID] = unitID

  return metal - metalMake + builders[unitID].unitDef.metalMake, energy - energyMake + builders[unitID].unitDef.energyMake
end

-- for logging
function table.val_to_str (v )
  if "string" == type(v ) then
    v = string.gsub(v, "\n", "\\n" )
    if string.match(string.gsub(v,"[^'\"]",""), '^"+$' ) then
      return "'" .. v .. "'"
    end
    return '"' .. string.gsub(v,'"', '\\"' ) .. '"'
  else
    return "table" == type(v ) and table.tostring(v ) or
      tostring(v )
  end
end

function table.key_to_str (k )
  if "string" == type(k ) and string.match(k, "^[_%a][_%a%d]*$" ) then
    return k
  else
    return "[" .. table.val_to_str(k ) .. "]"
  end
end

function table.tostring(tbl )
  local result, done = {}, {}
  for k, v in ipairs(tbl ) do
    table.insert(result, table.val_to_str(v ) )
    done[ k ] = true
  end
  for k, v in pairs(tbl ) do
    if not done[ k ] then
      table.insert(result,
        table.key_to_str(k ) .. "=" .. table.val_to_str(v ) )
    end
  end
  return "{" .. table.concat(result, "," ) .. "}"
end

function table.has_value (tab, val)
    for _, value in ipairs (tab) do
        if value == val then
            return true
        end
    end
    return false
end

function table.full_of (tab, val)
    for _, value in ipairs (tab) do
        if value ~= val then
            return false
        end
    end
    return true
end
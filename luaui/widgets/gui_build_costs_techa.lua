--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    gui_build_costs.lua
--  brief:   Shows metal and energy consumption + time required to construct a unit/building.
--  original author:  Milan Satala
--
--  Copyright (C) 2007.
--  Licensed under the terms of the GNU GPL, v2 or later.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:GetInfo()
  return {
    name      = "Build costs 1.02-TechA",
    desc      = "Shows metal and energy consumption + time required to construct a unit/building.",
    author    = "author: BigHead",
    date      = "September 13, 2007",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    handler   = true,
    enabled   = false -- loaded by default?
  }
end

local metalMakersControled = true --change to false if you don't use any metal makers controling widget/ai

local commandsPanelHeight = 0
local width = 245
local height = 55
local windowX=230
local windowY=70
local myTeamID = Spring.GetMyTeamID()
local builders = {}
local debug = false
local commanderBuildSpeed = 100
local fontSize = 12
local commandsPanelWidth = 100
local mouseX, mouseY = 0, 0
local selectedUnits = nil
local tooltipDefaultY = 0
local barWidth = 100
local barHeight = 10
local screenHeight = 0
local screenWidth = 0
local widgetXPosition = 0
local tweakX = 0
local gameSpeed = 1
local spectacing = false
local willStall = false

local metalMakers = {}
local possibleMetalMakersUpkeep = 0
local possibleMetalMakersProduction = 0
local releasedMetal = 0

local red = {1, 0, 0}
local green = {0, 1, 0}
local white = {1, 1, 1}
local yellow = {1, 1, 0}

local GetAllyTeamList = Spring.GetAllyTeamList
local GetUnitDefID = Spring.GetUnitDefID
local GetUnitHealth = Spring.GetUnitHealth
local GetUnitIsBuilding = Spring.GetUnitIsBuilding
local GetUnitResources = Spring.GetUnitResources
local GetTeamUnits = Spring.GetTeamUnits
local GetMouseState = Spring.GetMouseState
local GetSelectedUnits = Spring.GetSelectedUnits
local GetCurrentTooltip = Spring.GetCurrentTooltip
local GetTeamResources = Spring.GetTeamResources
local TraceScreenRay = Spring.TraceScreenRay
local GetUnitTeam = Spring.GetUnitTeam
local AreTeamsAllied = Spring.AreTeamsAllied
local GetUnitStates = Spring.GetUnitStates
local GetGameSpeed = Spring.GetGameSpeed
local GetMyTeamID = Spring.GetMyTeamID
local GetTeamList = Spring.GetTeamList
local GetMyAllyTeamID = Spring.GetMyAllyTeamID

local glColor = gl.Color
local glShape = gl.Shape
local glText = gl.Text
local GL_QUADS = GL.QUADS

local isReplay = Spring.IsReplay()
local GetSpectatingState = Spring.GetSpectatingState

function widget:Initialize()
  widgetXPosition = Spring.GetConfigInt("buildCostsWidgetXPosition", 175) / 1000
  
  spectating =  isSpec() and debug == false
  
  registerUnits()
end

function widget:Shutdown()
  Spring.SetConfigInt("buildCostsWidgetXPosition", widgetXPosition * 1000)
end

function drawFrame(docked)
  if not docked then
    --windowX, windowY = mouseX + 10,mouseY - height/2
  else
    windowX = commandsPanelWidth + 10
    windowY = commandsPanelHeight
  end

  glColor(0.3, 0.3, 0.3, 0.5)
  drawBox(windowX, windowY, width, height)
  glColor(0.0, 0.0, 0.0, 1.0)
end

function drawMediumFrame()
  --windowX, windowY = mouseX + 10,mouseY - height/2
  
  glColor(0.3, 0.3, 0.3, 0.5)
  drawBox(windowX, windowY, width * 0.4, height)
end

function drawBox(x, y, w, h)
  glShape(GL_QUADS, {
    {v = {x, y}},
    {v = {x, y + h}},
    {v = {x + w, y +h}},
    {v = {x + w, y}}
  })
end

function widget:ViewResize(viewSizeX, viewSizeY) 
  screenWidth = viewSizeX
  screenHeight = viewSizeY
  screenStettingChanged()
end

function screenStettingChanged()
  commandsPanelWidth = screenWidth * widgetXPosition
  tweakX = commandsPanelWidth
  commandsPanelHeight = screenHeight * 0.125
end


function addFactoryBuildingCosts(releasedExpenditures)
  if # selectedUnits ~= 1 then
    return
  end
  
  local unitID = selectedUnits[1]  
  if not builders[unitID] then
    return
  end
  
  local unitDef = builders[unitID].unitDef
  if not unitDef.isFactory then
    return
  end

  local health,maxHealth,paralyzeDamage,capture,build = GetUnitHealth(unitID)
  if not build or build == 1 then
    return
  end

  for builderID, _ in pairs(builders) do
    local targetID = GetUnitIsBuilding(builderID)
    if targetID == unitID then
      local _, metal, _, energy = GetUnitResources(builderID)  
      releasedExpenditures.metal = releasedExpenditures.metal + metal
      releasedExpenditures.energy = releasedExpenditures.energy + energy
    end
  end
  
  hideBars = true
end

function registerUnits()
  builders = {}
  metalMakers = {}
  possibleMetalMakersUpkeep = 0
  possibleMetalMakersProduction = 0
  
  teams = GetTeamList(GetMyAllyTeamID())
  for _, teamID in ipairs(teams) do
    local units = GetTeamUnits(teamID)
    for _, unitID in ipairs(units) do
      local unitDefID = GetUnitDefID(unitID)
      registerUnit(unitID, unitDefID, teamID)    
    end
  end
end

function widget:DrawScreen()  
  mouseX, mouseY = GetMouseState()
  selectedUnits = GetSelectedUnits()  
  local _userSpeed, _internalSpeed, pause = GetGameSpeed()
  gameSpeed = _internalSpeed
  hideBars = false
  willStall = false
  
  if spectating then
    newTeamID = GetMyTeamID()
    if newTeamID ~= myTeamID then
      myTeamID = newTeamID
      registerUnits()
    end
    if not assistBuildingTooltip() then
      displayBuildSpeed()
    end
    return
  end
  
  local tooltip = GetCurrentTooltip()
  if tooltip and string.find(tooltip, "Build:") then
    drawFrame(mouseX > commandsPanelWidth)             
    local buildTime = getBuildTime(tooltip)
    local speed = getSelectedUnitsBuildSpeed()
      
    local time = buildTime / speed
    local metalConsumption = getMetalCost(tooltip) / time
    local energyConsumption = getEnergyCost(tooltip) / time      
    local releasedExpenditures = getSelectedUnitsUpkeep()  
    
    addFactoryBuildingCosts(releasedExpenditures)
    
    drawResourceChange("Energy", "energy", energyConsumption, time, releasedExpenditures.energy, 5, yellow)
    drawResourceChange("Metal", "metal", metalConsumption, time, releasedExpenditures.metal, 20, white)
    drawText("Time: ", 0, 35)    
    
    if not willStall then
      drawText(formatTime(time), 50, 35)
    else
      drawText(formatTime(time) .. " ???", 50, 35)      
    end
    
  elseif not assistBuildingTooltip() then
    return
    displayBuildSpeed()
  end
end

function displayBuildSpeed()
  if not selectedUnits or # selectedUnits == 0 then
    return
  end
  
  local speed = getSelectedUnitsBuildSpeed() 
  local str = "Build speed: " .. format(getRelativeBuildSpeed(speed), true)
  
  if # selectedUnits == 1 and builders[selectedUnits[1]] then
    local buildSpeed = builders[selectedUnits[1]].originalBuildSpeed
    if speed > buildSpeed then
      str = str .. " (" .. format(getRelativeBuildSpeed(buildSpeed), true) .. ")"
    end
  end
  if speed > 0 then
    drawFrame(true)
    drawText(str, 0, 35) 
  end
end

function getRelativeBuildSpeed(speed)
  return 100 * speed / commanderBuildSpeed
end

function drawText(str, x, y, op)
  glText(str, windowX + 5 + x, windowY + y, fontSize, op or "o")
end

function getMetalMakersUpkeep()
  local totalUpKeep = 0
  for unitID, upKeep in pairs(metalMakers) do
    local state = GetUnitStates(unitID)
    if state.active then
      -- totalUpKeep = totalUpKeep + upKeep
    end  
    local _, metal, _, energy = GetUnitResources(unitID)
    totalUpKeep = totalUpKeep + energy
  end

  return totalUpKeep
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

function drawResourceChange(name, type, consumption, time, releasedExpenditures, position, color)      
  local currentChange, lvl, storage, _, alreadyInStall = getMyResources(type)

  local changeWhenBuilding = currentChange - consumption + releasedExpenditures

  if metalMakersControled and type == "metal" then  
    changeWhenBuilding = changeWhenBuilding - releasedMetal
  end
  
  releasedMetal = 0
  if metalMakersControled and type == "energy" and possibleMetalMakersUpkeep > 0 then     
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

  drawText(name .. ": ", 0, position)     
  drawText(numberToColorText(changeWhenBuilding), 30, position)
  drawText("<-",90, position)
  drawText(numberToColorText(currentChange), 95, position)
  
  if not hideBars then  
    local after = lvl + time * changeWhenBuilding
    drawResourceBar(type, after, lvl, storage, color, changeWhenBuilding, consumption, alreadyInStall, time, position)
  end
end

function drawResourceBar(type, after, lvl, storage, color, changeWhenBuilding, consumption, alreadyInStall, time, position)
    if consumption < 1 or (not alreadyInStall and after > 0) then
      local ratio = barWidth / storage
      glColor(0.2, 0.2, 0.2, 1)
      drawBox(windowX + 135, windowY + position + 3, barWidth, barHeight)
      glColor(color[1], color[2], color[3], 1)
      drawBox(windowX + 135, windowY + position + 3, lvl * ratio, barHeight)      
      if changeWhenBuilding< 0 then
        glColor(1, 0, 0, 1)
        if after < 0 then 
          after = 0
        end
      else
        glColor(0, 1, 0, 1)
        if after > storage then 
          after = storage
        end
      end
      local afterX = after * ratio
      local afetrWidth = (lvl - after) * ratio
      drawBox(windowX + 135 + afterX, windowY + position + 3, afetrWidth, barHeight)
    
    else
      willStall = true
      
      local remainingTime = lvl / (-changeWhenBuilding)
      local str
      if not alreadyInStall and remainingTime > 2 then
        str = "insuff. in " .. format(remainingTime, true) .. "/" .. formatTime(time)
      else
        str = "insuff. " .. type
      end
      glColor(1, 0, 0, 1)
      drawText(str, 130, position, "on")
    end
end

function numberToColorText(n)
  local str = "\255\255\255\255"
  if n < -1 then
    str = "\1\1\255\255 -"
  elseif n > 1 then
    str = "\1\255\1\255 +"
  end
  
  str = str .. string.format("%d", n) .. "\255\255\255\255"
  return str
end

function format(number, noPlus)
  local str = string.format("%d", number)
  if number > 0 and not noPlus then
    str = "+" .. str
  end
  return str
end

function formatTime(time)
  return string.format("%d", 1 + (time / gameSpeed)) .. "s"
end

function getBuildTime(tooltip)
    local s, e = string.find(tooltip, "Build time %d*")
    return tonumber(string.sub(tooltip, s + 11, e))
end

function getMetalCost(tooltip)
  s, e = string.find(tooltip, "Metal cost %d*")
  return tonumber(string.sub(tooltip, s + 11, e))
end

function getEnergyCost(tooltip)
  s, e = string.find(tooltip, "Energy cost %d*")
  return tonumber(string.sub(tooltip, s + 12, e))
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

function isAlreadyInTable(unitID, t)
  local targetID = builders[unitID].targetID
  if t[unitID] then
    return true
  elseif targetID then
    return isAlreadyInTable(targetID, t)
  else
    return false
  end
end

function getSelectedUnitsBuildSpeed()  
  if not selectedUnits then
    return 0
  end
  
  if # selectedUnits == 1 then
    if builders[selectedUnits[1]] then
      return builders[selectedUnits[1]].buildSpeed
    else
      return 0
    end
  end

  local selectedBuilders = {}  
  
  for _, unitID in ipairs(selectedUnits) do    
    if builders[unitID] then
      selectedBuilders[unitID] = unitID
    end
  end
  
  return getBuildersBuildSpeed(selectedBuilders)
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

function widget:CommandNotify(commandID, params, options)
  if commandID == 25 then
    local targetID = params[1]
    if not guard(targetID) then
      Spring.Echo("Command canceled - two units can't guard each other")
      return true
    end
  else
    stopGuarding()
  end    
end

function stopGuarding()  
  if not selectedUnits or # selectedUnits == 0 then
    return
  end  

  for _, unitID in ipairs(selectedUnits) do
    if builders[unitID] then
      changeGuardTarget(unitID, nil)
    end
  end
end

function traceTargets(unitID, testID)
  local targetID = builders[unitID].targetID
  if not targetID then
    return false
  elseif targetID == testID then
    return true
  else
    return traceTargets(targetID, testID)
  end
end

function guard(targetID, units)
  if not units  then
    units = selectedUnits
  end

  if not builders[targetID] or not units then
    return true
  end  
  local targetsTargetID = builders[targetID].targetID
  
  for _, unitID in ipairs(units) do
    if builders[unitID] and unitID ~= targetID then
      if traceTargets(targetID, unitID) then
        return false
      end        
      changeGuardTarget(unitID, targetID)
    end
  end
  return true
end

function changeGuardTarget(unitID, targetID)
   local currentTargetID = builders[unitID].targetID
   
   if currentTargetID then
    local guards = builders[currentTargetID].guards
    for index, guardID in ipairs(guards) do
      if guardID == unitID then
        table.remove(guards, index)
      end
    end 
    changeBuildSpeed(currentTargetID, -builders[unitID].buildSpeed)
   end
   
   if targetID then    
    table.insert(builders[targetID].guards, unitID)
    changeBuildSpeed(targetID, builders[unitID].buildSpeed)
   end
   builders[unitID].targetID = targetID
end

function changeBuildSpeed(unitID, change)
  builders[unitID].buildSpeed = builders[unitID].buildSpeed + change
  local targetID = builders[unitID].targetID 
  if targetID then
    if builders[targetID].targetID ~= unitID then
      changeBuildSpeed(targetID, change)
    end
  end
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

function constructionTooltip(unitID, originalTarget, build)
  if originalTarget and not builders[originalTarget].unitDef.isFactory then
    return
  end
  
  local metalUpkeep, energyUpkeep = 0, 0
  local currentBuildSpeed = 0
  
  for builderID, _ in pairs(builders) do
    local targetID = GetUnitIsBuilding(builderID)
    if targetID == unitID then
      if spectating or builders[builderID].owned then
        local _, metal, _, energy = GetUnitResources(builderID)
        metalUpkeep = metalUpkeep + metal
        energyUpkeep = energyUpkeep + energy
      end
      currentBuildSpeed = currentBuildSpeed + builders[builderID].originalBuildSpeed
    end
  end

  local unitDef = UnitDefs[GetUnitDefID(unitID)]
  
  local buildLeft = (1 - build) * unitDef.buildTime
  local time =  buildLeft / currentBuildSpeed
  
  local currentTime
  if currentBuildSpeed > 0 then
     currentTime =  formatTime(buildLeft / currentBuildSpeed)
  else
    currentTime = "NEVER"
  end  
  
  if not spectating then
    drawFrame(false)
  else
    drawMediumFrame()
  end
    
  drawConstructionTooltipResource("Energy", "energy", energyUpkeep, time, 5, yellow)
  drawConstructionTooltipResource("Metal", "metal", metalUpkeep, time, 20, white)

  drawText("Time: ", 0, 35) 
  
  if not willStall then
    drawText(currentTime, 50, 35)
  else
    drawText(currentTime .. " ???", 50, 35)
  end
  
  return true
end

function drawConstructionTooltipResource(name, type, consumption, time, position, color)       
  drawText(name .. ": ", 0, position)
  
  local currentChange, lvl, storage, exp, alreadyInStall = getMyResources(type)
  local changeWhenBuilding = currentChange

  if metalMakersControled and type == "metal" then  
    changeWhenBuilding = changeWhenBuilding - releasedMetal
  end
  
  releasedMetal = 0
  if metalMakersControled and type == "energy" and possibleMetalMakersUpkeep > 0 then     
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
   
  drawText(numberToColorText(-consumption), 50, position)
  local percent = 100 * consumption / exp, true
  if percent > 100 then
    percent = 100
  elseif exp == 0 then
    percent = 0
  end
  
  if spectating then
    return
  end
  
  drawText("(" .. format(percent, true) .. "%)", 80, position)
  
  if not hideBars then
    local after = lvl + time * changeWhenBuilding
    drawResourceBar(type, after, lvl, storage, color, changeWhenBuilding, consumption, alreadyInStall, time, position)
  end   
end

function assistBuildingTooltip()
  local type, data = TraceScreenRay(mouseX, mouseY) 
  
  if type ~= "unit" then
    return
  end
  local unitID = data
  
  local unitTeam = GetUnitTeam(unitID)
  if not unitTeam or not AreTeamsAllied(unitTeam, myTeamID) then
    return
  end
  local health,maxHealth,paralyzeDamage,capture,build = GetUnitHealth(unitID)
  local originalTarget = nil
  
  if not build or build == 1 then
    if builders[unitID] then
      targetID = getTargetsBuild(unitID)
      if targetID then
        originalTarget = unitID
        unitID = targetID        
        health,maxHealth,paralyzeDamage,capture,build = GetUnitHealth(unitID)
      else        
        return
      end
    else    
      return
    end
  end
  
  if spectating or not selectedUnits or # selectedUnits == 0 then    
    return constructionTooltip(unitID, originalTarget, build)
  end


  local selectedBuilders = {}  
  
  for _, id in ipairs(selectedUnits) do    
    if builders[id] then
      selectedBuilders[id] = id
    end
  end

  local alreadyBuilding = {}
  local currentBuildSpeed = 0  
  local releasedExpenditures = getSelectedUnitsUpkeep()  --{metal = 0, energy = 0}
  
  for builderID, _ in pairs(builders) do
    local targetID = GetUnitIsBuilding(builderID)
    if targetID == unitID and builderID ~= unitID then
      alreadyBuilding[builderID] = builderID
      currentBuildSpeed = currentBuildSpeed + builders[builderID].originalBuildSpeed
      
      if selectedBuilders[builderID] or isAlreadyInTable(builderID, selectedBuilders) then
        selectedBuilders[builderID] = nil
      end      
    end
  end
  
  local buildSpeed = getBuildersBuildSpeed(selectedBuilders)
  
  if buildSpeed == 0 then    
    return constructionTooltip(unitID, originalTarget, build)
  end   
  
  drawFrame(false)
  
  local unitDef = UnitDefs[GetUnitDefID(unitID)]

  local buildLeft = (1 - build) * unitDef.buildTime
  local currentTime
  if currentBuildSpeed > 0 then
     currentTime =  formatTime(buildLeft / currentBuildSpeed)
  else
    currentTime = "NEVER"
  end  
  
  local time =  buildLeft / (currentBuildSpeed + buildSpeed)
  local speed = unitDef.buildTime / buildSpeed
  local metal = unitDef.metalCost / speed
  local energy = unitDef.energyCost / speed
  
  drawText("Time: ", 0, 35) 
  drawText(formatTime(time), 50, 35)
  drawText("<-", 78, 35)  
  
  drawResourceChange("Energy", "energy", energy, time, releasedExpenditures.energy, 5, yellow)  
  drawResourceChange("Metal", "metal", metal, time, releasedExpenditures.metal, 20, white)

  if not willStall then
    drawText(currentTime, 95, 35)
  else
    drawText(currentTime .. " ???", 95, 35)
  end
  
  return true
end

function registerUnit(unitID, unitDefID, unitTeam)
  
  if not unitDefID then
    return  
  end   
    
  local unitDef = UnitDefs[unitDefID]
  
  if isBuilder(unitDef) then  
  
    builders[unitID] = {["buildSpeed"] = unitDef.buildSpeed, originalBuildSpeed = unitDef.buildSpeed, ['unitDef'] = unitDef, ["owned"] = (unitTeam == myTeamID), ["targetID"] = nil, ["guards"] = {}}
    
    if unitDef.customParams.iscommander then
      commanderBuildSpeed = unitDef.buildSpeed
    end
    
  elseif unitTeam == myTeamID and isMetalMaker(unitDef) then    
    registerMetalMaker(unitID, unitDef)
  else
    return
  end
  
  echo(UnitDefs[unitDefID].humanName .. " registered")
end

function registerMetalMaker(unitID, unitDef)
  metalMakers[unitID] = unitDef.energyUpkeep
  possibleMetalMakersUpkeep = possibleMetalMakersUpkeep + unitDef.energyUpkeep
  possibleMetalMakersProduction = possibleMetalMakersProduction + unitDef.makesMetal    
end

function unregisterMetalMaker(unitID, unitDef)
  if not unitDef then
    unitDef = UnitDefs[GetUnitDefID(unitID)]
  end
  metalMakers[unitID] = nil
  possibleMetalMakersUpkeep = possibleMetalMakersUpkeep - unitDef.energyUpkeep
  possibleMetalMakersProduction = possibleMetalMakersProduction - unitDef.makesMetal    
end

function isBuilder(unitDef)
  if (unitDef.isBuilder and unitDef.canAssist) or unitDef.isFactory then
    return true
  else
    return false
  end
end

function unregisterUnit(unitID, unitDefID, unitTeam)
  if builders[unitID] then 

    changeGuardTarget(unitID, nil)
    local guards = builders[unitID].guards
    for index, guardID in ipairs(guards) do
      changeGuardTarget(guardID, nil)
    end   

  elseif metalMakers[unitID] then
    
    unregisterMetalMaker(unitID)
  
  else
    return
  end
  
  echo(UnitDefs[unitDefID].humanName .. " unregistered")
  
end

function widget:UnitCreated(unitID, unitDefID, unitTeam)
  registerUnit(unitID, unitDefID, unitTeam)
end

function widget:UnitGiven(unitID, unitDefID, unitTeam, oldTeam)
  if unitTeam == myTeamID then
    if builders[unitID] then
      builders[unitID].owned = true
    else
      local unitDef = UnitDefs[unitDefID]
      if isMetalMaker(unitDef) then  
        registerMetalMaker(unitID, unitDef)
      end
    end
  end
end

function widget:UnitDestroyed(unitID, unitDefID, unitTeam)
  unregisterUnit(unitID, unitDefID, unitTeam)
end

function widget:UnitTaken(unitID, unitDefID, unitTeam, newTeam) 
  if unitTeam == myTeamID then
    if builders[unitID] then
      builders[unitID].owned = false
      
    elseif metalMakers[unitID] then
      unregisterMetalMaker(unitID)
    end
  end
end

function widget:UnitFromFactory(unitID, unitDefID, unitTeam, factID, factDefID, userOrders)
  if unitTeam == myTeamID and not userOrders and builders[unitID] and isFactoryGuardWidgetEnabled() then  
    guard(factID, {unitID})
  end
end

function isFactoryGuardWidgetEnabled()
  local factoryGuard = widgetHandler.knownWidgets["FactoryGuard"]
  if not factoryGuard or not factoryGuard.active then
    return false
  else
    return true
  end
end

function isMetalMaker(inUnit)
  if (inUnit.isBuilding) and (inUnit.onOffable) and (inUnit.makesMetal > 0) and (inUnit.energyUpkeep > 0) then
    return true
  else
    return false
  end
end

function widget:TeamDied(teamID)
  if teamID == myTeamID and debug == false then
    spectating = true
  end
end

function isSpec()
  if isReplay then 
    return true
  end  
  if GetSpectatingState() then 
    return true
  else
    return false
  end
end

function echo(msg)
	if debug then
    Spring.Echo(msg)
   end
end

------------------------------------------------------TWEAK MODE----------------------------------------------------------


local TweakMousePressed = false
local TweakMouseMoved   = false
local TweakPressedPos_X, TweakPressedPos_Y = 0,0
local TweakAbove        = false
local tweakWidth = 10;

function widget:TweakDrawScreen()
  glColor(1,1,1,1,1)
  drawBox(tweakX, 0, tweakWidth, screenHeight)
end

function widget:TweakIsAbove(x,y)
  TweakAbove = x > tweakX and x < tweakX + tweakWidth
  return TweakAbove
end

function widget:TweakGetTooltip(x,y)
  return 'Drag to match the left side of this box with the right side of your menu\n' ..
  "Use only if you don't use standard 3 column menu."
end

function widget:TweakMousePress(x, y, button)
  if (TweakAbove) then
    TweakMousePressed = true
    TweakPressedPos_X = tweakX - x
    return true
  end
  return false
end

function widget:TweakMouseRelease(x, y, button)
  TweakPressedPos_X, TweakPressedPos_Y = 0,0

  if (TweakMousePressed)and(TweakAbove) then
    TweakMousePressed = false
    if not TweakMouseMoved then
      TweakMouseMoved = false
      if (button == 1) then
      elseif (button == 3) then
      elseif (button == 2) then
      end
    end
    
    widgetXPosition = tweakX / screenWidth
    screenStettingChanged()
  end
  TweakMousePressed = false
  TweakMouseMoved   = false
  return false
end

function widget:TweakMouseMove(x, y, dx, dy, button)
  if TweakMousePressed then
    TweakMouseMoved = true
    tweakX = x + TweakPressedPos_X
  end
end
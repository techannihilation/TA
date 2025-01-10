function gadget:GetInfo()
  return {
    name    = "UnitUpgrades",
    desc    = "Units purchase upgrades over time.",
    author  = "[ur]uncle",
    date    = "07.01.2025",
    version = "2.2",
    license = "GNU GPL v2 or later",
    layer   = 0,
    enabled = true
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--  SYNCED SECTION
--------------------------------------------------------------------------------

if gadgetHandler:IsSyncedCode() then

--------------------------------------------------------------------------------
--  CONFIG / CONSTANTS
--------------------------------------------------------------------------------

-- Localizing Spring functions
local spEditUnitCmdDesc     = Spring.EditUnitCmdDesc
local spFindUnitCmdDesc     = Spring.FindUnitCmdDesc
local spInsertUnitCmdDesc   = Spring.InsertUnitCmdDesc
local spRemoveUnitCmdDesc   = Spring.RemoveUnitCmdDesc
local spSetUnitRulesParam   = Spring.SetUnitRulesParam
local spSetUnitHealth       = Spring.SetUnitHealth
local spSetUnitCloak        = Spring.SetUnitCloak
local spSetUnitArmored      = Spring.SetUnitArmored
local spUseTeamResource     = Spring.UseTeamResource
local spAddTeamResource     = Spring.AddTeamResource
local spSetUnitBuildSpeed   = Spring.SetUnitBuildSpeed
local spGetUnitDefID        = Spring.GetUnitDefID
local spGetUnitPosition     = Spring.GetUnitPosition
local spSpawnCEG            = Spring.SpawnCEG
local spGetGameFrame        = Spring.GetGameFrame
local spGetUnitMoveTypeData = Spring.GetUnitMoveTypeData
local spMoveCtrlSetGroundMoveTypeData = Spring.MoveCtrl.SetGroundMoveTypeData
local spMoveCtrlSetAirMoveTypeData     = Spring.MoveCtrl.SetAirMoveTypeData
local spMoveCtrlSetGunshipMoveTypeData = Spring.MoveCtrl.SetGunshipMoveTypeData

-- Localizing standard Lua functions
local string_format = string.format
local table_insert  = table.insert
local pairs         = pairs
local math_random   = math.random
local coroutine_resume = coroutine.resume
local coroutine_create = coroutine.create
local coroutine_yield  = coroutine.yield

local CMD_UPG_SPEED     = Spring.Utilities.CMD.UPG_SPEED
local CMD_UPG_ARMOR     = Spring.Utilities.CMD.UPG_ARMOR
local CMD_UPG_CLOAK     = Spring.Utilities.CMD.UPG_CLOAK
local CMD_UPG_BUILDPWR  = Spring.Utilities.CMD.UPG_BUILDPWR

-- Multipliers
local SPEED_BOOST_FACTOR    = 1.80
local SPEED_COST_MULT       = 1.50

local ARMOR_BOOST_FACTOR    = 2.50
local ARMOR_COST_MULT       = 1.00

local CLOAK_COST_MULT       = 0.40
local DECLAK_DISTANCE_MULT  = 0.05

-- NEW: Build Speed Upgrade
local BUILDPWR_BOOST_FACTOR = 3.00
local BUILDPWR_COST_MULT    = 0.50

local CMD_TO_COST = {
  [CMD_UPG_SPEED]     = SPEED_COST_MULT,
  [CMD_UPG_ARMOR]     = ARMOR_COST_MULT,
  [CMD_UPG_CLOAK]     = CLOAK_COST_MULT,
  [CMD_UPG_BUILDPWR]  = BUILDPWR_COST_MULT,
}

-- CEG
local SPEED_MOVING_CEG    = "speedboost_effect"
local ARMOR_MOVING_CEG    = "armorboost_effect"
local BUILDPWR_MOVING_CEG = "buildpwr_effect"

local TARGET_FRAMES_FULL = 12 * 30  -- 12 seconds * 30fps = 360 frames

local validUnitDefs = {}

--------------------------------------------------------------------------------
--  HELPER / INITIALIZE
--------------------------------------------------------------------------------

function gadget:Initialize()
  for udid, ud in pairs(UnitDefs) do
      validUnitDefs[udid] = {
        -- Excludes units that can't move
        [CMD_UPG_SPEED] = false -- disable for now -- not ud.isImmobile,

        -- All units can upgrade armor
        [CMD_UPG_ARMOR]     = true,

        -- Excludes bomber air units and units that already have cloaking capability
        [CMD_UPG_CLOAK]     = not ud.isBomberAirUnit and not ud.canCloak,

        -- Allows Build Power upgrade for units with buildSpeed > 0, builders, or factories
        -- Excludes static builders that are not buildings (e.g., Nano Towers) and commanders
        [CMD_UPG_BUILDPWR]  = (ud.buildSpeed > 0 or ud.isBuilder or ud.isFactory)
                           and not (ud.isStaticBuilder and not ud.isBuilding)
                           and not ud.customParams.iscommander,
      }
  end
end

--------------------------------------------------------------------------------
--  UPGRADE STATE
--------------------------------------------------------------------------------

-- Track units that are fully upgraded, in progress, or have a particular upgrade
local upgradedUnits         = {}  -- [unitID] = true if some upgrade has completed
local inProgress            = {}  -- [unitID] = { cmdID, teamID, totalCost, accumCost, baseDefID, cmdDescID }
local speedBoostedUnits     = {}
local armorBoostedUnits     = {}
local cloakedUnits          = {}
local buildPwrBoostedUnits  = {}

--------------------------------------------------------------------------------
--  COROUTINE-BASED CEG SYSTEM
--------------------------------------------------------------------------------

local coroutinesTable = {}  -- [co] = { unitID = x, effect = "speedboost_effect", interval = 90, ... }
local unitCoroutines = {}   -- [unitID] = co or {co1, co2, ...}
local coroutineWaitFrame = {}  -- [co] = number (the engine frame on which we resume the coroutine)

local function Sleep(frames)
  local co = coroutine.running()
  coroutineWaitFrame[co] = spGetGameFrame() + (frames or 0)
  return coroutine_yield()
end

local function UnitEffectCoroutine(unitID, cegName, interval)
  while true do
    -- Get unit position & spawn the effect
    local x, y, z = spGetUnitPosition(unitID)
    if x then
      spSpawnCEG(cegName, x, y + (Spring.GetUnitHeight(unitID) or 20), z)
    end
    Sleep(interval)
  end
end

-- Start up a coroutine that repeatedly spawns the given CEG for the given unit
local function StartUnitCEGCoroutine(unitID, cegName, interval)
  local co = coroutine_create(UnitEffectCoroutine)
  unitCoroutines[unitID] = unitCoroutines[unitID] or {}
  -- Keep track of the new coroutine
  coroutinesTable[co] = {
    unitID   = unitID,
    effect   = cegName,
    interval = interval,
  }
  table_insert(unitCoroutines[unitID], co)
  -- Start it
  local ok, err = coroutine_resume(co, unitID, cegName, interval)
  if not ok then
    Spring.Echo("[UnitUpgradesWithCoroutineEffects] Error starting coroutine:", err)
  end
end

-- Stop all coroutines for a unit
local function StopAllUnitCoroutines(unitID)
  if not unitCoroutines[unitID] then
    return
  end
  for _, co in ipairs(unitCoroutines[unitID]) do
    coroutinesTable[co] = nil
    coroutineWaitFrame[co] = nil
    -- effectively kills the coroutine
  end
  unitCoroutines[unitID] = nil
end

--------------------------------------------------------------------------------
--  COMMAND DESCRIPTORS
--------------------------------------------------------------------------------

local function SpeedCmdDesc(cost)
  local speedPercent = (SPEED_BOOST_FACTOR - 1) * 100
  cost = cost or 0
  return {
    id      = CMD_UPG_SPEED,
    type    = CMDTYPE.ICON,
    name    = string_format(" Speed\n +%.0f%% ", speedPercent),
    tooltip = string_format(
      "\255\1\255\1Purchase a +%.0f%% move speed upgrade.\n\255\255\255\1Costs %.1f metal total.\255\255\255\255",
      speedPercent, cost
    ),
    disabled = false,
  }
end

local function ArmorCmdDesc(cost)
  local armorPercent = (ARMOR_BOOST_FACTOR - 1) * 100
  return {
    id      = CMD_UPG_ARMOR,
    type    = CMDTYPE.ICON,
    name    = string_format(" Armor\n +%.0f%% ", armorPercent),
    tooltip = string_format(
      "\255\1\255\1Purchase a +%.0f%% armor upgrade.\n\255\255\255\1Costs %.1f metal total.\255\255\255\255",
      armorPercent, cost
    ),
    disabled = false,
  }
end

local function CloakCmdDesc(cost)
  return {
    id      = CMD_UPG_CLOAK,
    type    = CMDTYPE.ICON,
    name    = " Make\n Cloak ",
    tooltip = string_format(
      "\255\1\255\1Purchase permanent cloak.\n\255\255\255\1Costs %.1f metal total.\255\255\255\255",
      cost
    ),
    disabled = false,
  }
end

local function BuildPwrCmdDesc(cost)
  local buildPwrPercent = (BUILDPWR_BOOST_FACTOR - 1) * 100
  return {
    id      = CMD_UPG_BUILDPWR,
    type    = CMDTYPE.ICON,
    name    = string_format(" Build\n +%.0f%% ", buildPwrPercent),
    tooltip = string_format(
      "\255\1\255\1Increases build speed by +%.0f%%.\n\255\255\255\1Costs %.1f metal total.\255\255\255\255",
      buildPwrPercent, cost
    ),
    disabled = false,
  }
end

local function SetCmdDescToStop(unitID, cmdDescID)
  spEditUnitCmdDesc(unitID, cmdDescID, {
    name    = " Stop\nUpgrade",
    tooltip = "Stop/cancel the in-progress upgrade.",
  })
end

local function RevertCmdDesc(unitID, data)
  local cmdDescID = data.cmdDescID
  local cmdID     = data.cmdID
  local cost      = data.totalCost

  if not cmdDescID then
    return
  end

  if cmdID == CMD_UPG_SPEED then
    spEditUnitCmdDesc(unitID, cmdDescID, SpeedCmdDesc(cost))

  elseif cmdID == CMD_UPG_ARMOR then
    spEditUnitCmdDesc(unitID, cmdDescID, ArmorCmdDesc(cost))

  elseif cmdID == CMD_UPG_CLOAK then
    spEditUnitCmdDesc(unitID, cmdDescID, CloakCmdDesc(cost))

  elseif cmdID == CMD_UPG_BUILDPWR then
    spEditUnitCmdDesc(unitID, cmdDescID, BuildPwrCmdDesc(cost))
  end
end

--------------------------------------------------------------------------------
--  UPGRADE PROCESS
--------------------------------------------------------------------------------

local function ParalyzeUnit(unitID, yes)
  if yes then
    spSetUnitHealth(unitID, { paralyze = 1.0e9 })
  else
    spSetUnitHealth(unitID, { paralyze = -1 })  -- negative un-paralyzes
  end
end

local function StartUpgrade(unitID, cmdID, teamID, totalCost, cmdDescID)
  inProgress[unitID] = {
    cmdID     = cmdID,
    teamID    = teamID,
    totalCost = totalCost,
    accumCost = 0,
    baseDefID = spGetUnitDefID(unitID),
    cmdDescID = cmdDescID,
  }
  ParalyzeUnit(unitID, true)
  spSetUnitRulesParam(unitID, "upgrade_inProgress", 1)
  spSetUnitRulesParam(unitID, "upgrade_totalCost",  totalCost)
  spSetUnitRulesParam(unitID, "upgrade_accumCost",  0)

  SetCmdDescToStop(unitID, cmdDescID)

  -- **Unsynced**: call UpgradeStart
  SendToUnsynced("UpgradeStart", unitID)
end

local function ReturnMetal(unitID)
  local data = inProgress[unitID]
  if data then
    spAddTeamResource(data.teamID, "metal", data.accumCost)
  end
end

local function StopUpgrade(unitID)
  local data = inProgress[unitID]
  if not data then return end

  ParalyzeUnit(unitID, false)

  RevertCmdDesc(unitID, data)
  ReturnMetal(unitID)

  inProgress[unitID] = nil
  spSetUnitRulesParam(unitID, "upgrade_inProgress", 0)

  -- **Unsynced**: call UpgradeStop
  SendToUnsynced("UpgradeStop", unitID)
end

local function FinishUpgrade(unitID, data)
  inProgress[unitID] = nil
  upgradedUnits[unitID] = true
  ParalyzeUnit(unitID, false)

  spSetUnitRulesParam(unitID, "upgrade_inProgress", 0)
  SendToUnsynced("UpgradeStop", unitID)  -- notify unsynced

  local cmdID     = data.cmdID
  local currDefID = spGetUnitDefID(unitID)
  local ud        = UnitDefs[currDefID or -1]

  if cmdID == CMD_UPG_SPEED then
    speedBoostedUnits[unitID] = true

    local moveData  = spGetUnitMoveTypeData(unitID)
    local baseSpeed = (moveData and moveData.maxSpeed) or (ud and ud.speed) or 0

    if ud.canFly then
      if ud.isHoveringAirUnit or ud.hoverAttack then
        -- Gunship / hover-type air unit
        spMoveCtrlSetGunshipMoveTypeData(unitID, {
          maxSpeed = baseSpeed * SPEED_BOOST_FACTOR
        })
      else
        -- Fighter or other flying unit
        spMoveCtrlSetAirMoveTypeData(unitID, {
          maxSpeed = baseSpeed * SPEED_BOOST_FACTOR
        })
      end
    else
      -- Ground or ship
      spMoveCtrlSetGroundMoveTypeData(unitID, {
        maxSpeed       = baseSpeed * SPEED_BOOST_FACTOR,
        maxWantedSpeed = baseSpeed * SPEED_BOOST_FACTOR
      })
    end

    -- Start a coroutine to spawn the Speed CEG effect for this unit
    StartUnitCEGCoroutine(unitID, SPEED_MOVING_CEG, math_random(30,60))

  elseif cmdID == CMD_UPG_ARMOR then
    armorBoostedUnits[unitID] = true
    spSetUnitArmored(unitID, true, 1 / ARMOR_BOOST_FACTOR)

    -- Start a coroutine to spawn the Armor CEG effect for this unit
    StartUnitCEGCoroutine(unitID, ARMOR_MOVING_CEG, math_random(30,60))

  elseif cmdID == CMD_UPG_CLOAK then
    cloakedUnits[unitID] = true

    if ud then
      local baseLOS = ud.losRadius or 0
      local decloakDistance = baseLOS * DECLAK_DISTANCE_MULT
      spSetUnitCloak(unitID, 2, decloakDistance)
    end

  elseif cmdID == CMD_UPG_BUILDPWR then
    buildPwrBoostedUnits[unitID] = true
    local baseBuildSpeed = ud.buildSpeed or 0
    local newBuildSpeed  = baseBuildSpeed * BUILDPWR_BOOST_FACTOR
    spSetUnitBuildSpeed(unitID, newBuildSpeed)

    -- Start a coroutine to spawn the Build Power CEG effect for this unit
    StartUnitCEGCoroutine(unitID, BUILDPWR_MOVING_CEG, math_random(30,60))
  end

  -- remove all upgrade commands so there's no second purchase
  local removeList = {
    CMD_UPG_SPEED,
    CMD_UPG_ARMOR,
    CMD_UPG_CLOAK,
    CMD_UPG_BUILDPWR,
  }
  for _, cID in ipairs(removeList) do
    local cDesc = spFindUnitCmdDesc(unitID, cID)
    if cDesc then
      spRemoveUnitCmdDesc(unitID, cDesc)
    end
  end
end

--------------------------------------------------------------------------------
--  Gadget Callins (Synced)
--------------------------------------------------------------------------------

function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)
  if cmdID == 16 then return true end

  if cmdID ~= CMD.STOP and not validUnitDefs[unitDefID][cmdID] then
    return true
  end

  -- If upgrade is in progress and we press STOP or the same upgrade cmd => stop/cancel it
  if inProgress[unitID] then
    StopUpgrade(unitID)
    return true
  elseif cmdID == CMD.STOP then
    return true
  end

  -- If the unit has already completed an upgrade, disallow further upgrades
  if upgradedUnits[unitID] then
    return true
  end

  -- compute cost
  local ud = UnitDefs[unitDefID]
  local baseMetal = ud.metalCost or 0
  local totalCost = 0
  totalCost = baseMetal * CMD_TO_COST[cmdID]

  local cmdDescID = spFindUnitCmdDesc(unitID, cmdID)
  StartUpgrade(unitID, cmdID, teamID, totalCost, cmdDescID)
  return true
end

function gadget:GameFrame(f)
  -- Pay partial cost each frame
  for unitID, data in pairs(inProgress) do
    if (not Spring.ValidUnitID(unitID)) or Spring.GetUnitIsDead(unitID) then
      StopUpgrade(unitID)
    else
      local costRate = data.totalCost / TARGET_FRAMES_FULL
      local canPay   = spUseTeamResource(data.teamID, "metal", costRate)
      if canPay then
        data.accumCost = data.accumCost + costRate
      end
      spSetUnitRulesParam(unitID, "upgrade_accumCost", data.accumCost)

      if data.accumCost >= data.totalCost then
        FinishUpgrade(unitID, data)
      end
    end
  end
  -- Resume coroutines that need to run this frame
  for co in pairs(coroutinesTable) do
    local resumeFrame = coroutineWaitFrame[co]
    if (not resumeFrame) or (f >= resumeFrame) then
       coroutine_resume(co)
    end
  end
end

function gadget:UnitCreated(unitID, unitDefID, unitTeam)
  local def = validUnitDefs[unitDefID]
  if not def then return end

  local ud = UnitDefs[unitDefID]
  if not ud then return end

  -- Insert command desc only for allowed upgrades
  local baseMetal = ud.metalCost or 0

  if def[CMD_UPG_SPEED] then
    local speedCost = baseMetal * SPEED_COST_MULT
    spInsertUnitCmdDesc(unitID, SpeedCmdDesc(speedCost))
  end

  if def[CMD_UPG_ARMOR] then
    local armorCost = baseMetal * ARMOR_COST_MULT
    spInsertUnitCmdDesc(unitID, ArmorCmdDesc(armorCost))
  end

  if def[CMD_UPG_CLOAK] then
    local cloakCost = baseMetal * CLOAK_COST_MULT
    spInsertUnitCmdDesc(unitID, CloakCmdDesc(cloakCost))
  end

  if def[CMD_UPG_BUILDPWR] then
    local buildPwrCost = baseMetal * BUILDPWR_COST_MULT
    spInsertUnitCmdDesc(unitID, BuildPwrCmdDesc(buildPwrCost))
  end
end

function gadget:UnitDestroyed(unitID)
  if inProgress[unitID] then
    StopUpgrade(unitID)
  end
  upgradedUnits[unitID]         = nil
  speedBoostedUnits[unitID]     = nil
  armorBoostedUnits[unitID]     = nil
  cloakedUnits[unitID]          = nil
  buildPwrBoostedUnits[unitID]  = nil
  -- Stop coroutines for this unit
  StopAllUnitCoroutines(unitID)
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  UNSYNCED SECTION
--
--------------------------------------------------------------------------------
else
  local upgradeStart = Script and Script.LuaUI and Script.LuaUI.UpgradeStart
  local upgradeStop  = Script and Script.LuaUI and Script.LuaUI.UpgradeStop

  local function HandleUpgradeStart(_, unitID)
    if upgradeStart then
      upgradeStart(unitID)
    end
  end

  local function HandleUpgradeStop(_, unitID)
    if upgradeStop then
      upgradeStop(unitID)
    end
  end

  function gadget:Initialize()
    gadgetHandler:AddSyncAction("UpgradeStart", HandleUpgradeStart)
    gadgetHandler:AddSyncAction("UpgradeStop",  HandleUpgradeStop)
  end

  function gadget:Shutdown()
    gadgetHandler:RemoveSyncAction("UpgradeStart")
    gadgetHandler:RemoveSyncAction("UpgradeStop")
  end
end

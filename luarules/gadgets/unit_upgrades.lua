function gadget:GetInfo()
  return {
    name    = "UnitUpgrades",
    desc    = "Units purchase upgrades over time.",
    author  = "[ur]uncle",
    date    = "17.01.2025",
    version = "2.4", -- bump the version
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
local spSetUnitStealth      = Spring.SetUnitStealth
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
local string_format         = string.format
local table_insert          = table.insert
local pairs                 = pairs
local math_random           = math.random
local coroutine_resume      = coroutine.resume
local coroutine_create      = coroutine.create
local coroutine_yield       = coroutine.yield

local CMD_UPG_SPEED         = Spring.Utilities.CMD.UPG_SPEED
local CMD_UPG_ARMOR         = Spring.Utilities.CMD.UPG_ARMOR
local CMD_UPG_CLOAK         = Spring.Utilities.CMD.UPG_CLOAK
local CMD_UPG_BUILDPWR      = Spring.Utilities.CMD.UPG_BUILDPWR
local CMD_UPG_STEALTH       = Spring.Utilities.CMD.UPG_STEALTH

-- Multipliers
local SPEED_BOOST_FACTOR    = 1.80
local SPEED_COST_MULT       = 1.50

local ARMOR_BOOST_FACTOR    = 51.00
local ARMOR_COST_MULT       = 100.00

local CLOAK_COST_MULT       = 1.00
local DECLAK_DISTANCE_MULT  = 0.05
local MIN_DECLAK_DISTANCE   = 50

local BUILDPWR_BOOST_FACTOR = 8.00
local BUILDPWR_COST_MULT    = 1.00

local STEALTH_COST_MULT     = 0.8

--------------------------------------------------------------------------------
-- Map each CMD to the associated cost multiplier
--------------------------------------------------------------------------------
local CMD_TO_COST = {
  [CMD_UPG_SPEED]    = SPEED_COST_MULT,
  [CMD_UPG_ARMOR]    = ARMOR_COST_MULT,
  [CMD_UPG_CLOAK]    = CLOAK_COST_MULT,
  [CMD_UPG_BUILDPWR] = BUILDPWR_COST_MULT,

  -- new stealth
  [CMD_UPG_STEALTH]  = STEALTH_COST_MULT,
}

local SPEED_MOVING_CEG    = "speedboost_effect"
local ARMOR_MOVING_CEG    = "armorboost_effect"
local BUILDPWR_MOVING_CEG = "buildpwr_effect"

local TARGET_FRAMES_FULL = 12 * 30  -- 12 seconds * 30fps = 360 frames

--------------------------------------------------------------------------------
--  For each unitDef, determine what upgrades are allowed
--------------------------------------------------------------------------------
local validUnitDefs = {}

function gadget:Initialize()
  for udid, ud in pairs(UnitDefs) do
    validUnitDefs[udid] = {
      [CMD_UPG_SPEED]    = false,  -- `not ud.isImmobile` if you want them to have Speed
      [CMD_UPG_ARMOR]    = ud.armoredMultiple == 1.0,
      [CMD_UPG_CLOAK]    = false, --not ud.isBomberAirUnit and not ud.canCloak,
      [CMD_UPG_BUILDPWR] = (ud.buildSpeed > 0 or ud.isBuilder or ud.isFactory)
                           and not (ud.isStaticBuilder and not ud.isBuilding)
                           and not ud.customParams.iscommander,

      -- NEW stealth: only for units that cannot cloak
      [CMD_UPG_STEALTH]  = not ud.canCloak,
    }
  end
end

--------------------------------------------------------------------------------
--  UPGRADE STATE
--------------------------------------------------------------------------------

local upgradedUnits         = {}  -- [unitID] = true if some upgrade has completed
local inProgress            = {}  -- [unitID] = { cmdID, teamID, totalCost, accumCost, baseDefID, cmdDescID }
local speedBoostedUnits     = {}
local armorBoostedUnits     = {}
local cloakedUnits          = {}
local buildPwrBoostedUnits  = {}
local stealthUnits          = {}  -- track new stealth

--------------------------------------------------------------------------------
--  COROUTINE-BASED CEG SYSTEM
--  (We won't use it for the stealth upgrade—no effects requested)
--------------------------------------------------------------------------------

local coroutinesTable = {}  
local unitCoroutines = {}
local coroutineWaitFrame = {}

local function Sleep(frames)
  local co = coroutine.running()
  coroutineWaitFrame[co] = spGetGameFrame() + (frames or 0)
  return coroutine_yield()
end

local function UnitEffectCoroutine(unitID, cegName, interval)
  while true do
    local x, y, z = spGetUnitPosition(unitID)
    if x then
      spSpawnCEG(cegName, x, y + (Spring.GetUnitHeight(unitID) or 20), z)
    end
    Sleep(interval)
  end
end

local function StartUnitCEGCoroutine(unitID, cegName, interval)
  local co = coroutine_create(UnitEffectCoroutine)
  unitCoroutines[unitID] = unitCoroutines[unitID] or {}
  coroutinesTable[co] = {
    unitID   = unitID,
    effect   = cegName,
    interval = interval,
  }
  table_insert(unitCoroutines[unitID], co)
  local ok, err = coroutine_resume(co, unitID, cegName, interval)
  if not ok then
    Spring.Echo("[UnitUpgrades] Error starting coroutine:", err)
  end
end

local function StopAllUnitCoroutines(unitID)
  if not unitCoroutines[unitID] then
    return
  end
  for _, co in ipairs(unitCoroutines[unitID]) do
    coroutinesTable[co] = nil
    coroutineWaitFrame[co] = nil
  end
  unitCoroutines[unitID] = nil
end

--------------------------------------------------------------------------------
--  COMMAND DESCRIPTORS
--------------------------------------------------------------------------------

local function SpeedCmdDesc(cost)
  local speedPercent = (SPEED_BOOST_FACTOR - 1) * 100
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

--------------------------------------------------------------------------------
--  NEW STEALTH COMMAND DESCRIPTOR
--------------------------------------------------------------------------------
local function StealthCmdDesc(cost)
  return {
    id      = CMD_UPG_STEALTH,
    type    = CMDTYPE.ICON,
    name    = " Make\n Stealth ",
    tooltip = string_format(
      "\255\1\255\1Purchase permanent stealth.\n\255\255\255\1Costs %.1f metal total.\255\255\255\255",
      cost
    ),
    disabled = false,
  }
end

--------------------------------------------------------------------------------

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
  elseif cmdID == CMD_UPG_STEALTH then
    spEditUnitCmdDesc(unitID, cmdDescID, StealthCmdDesc(cost))
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
  if not data then
    return
  end

  ParalyzeUnit(unitID, false)
  RevertCmdDesc(unitID, data)
  ReturnMetal(unitID)

  inProgress[unitID] = nil
  spSetUnitRulesParam(unitID, "upgrade_inProgress", 0)

  SendToUnsynced("UpgradeStop", unitID)
end

local function FinishUpgrade(unitID, data)
  inProgress[unitID] = nil
  upgradedUnits[unitID] = true
  ParalyzeUnit(unitID, false)

  spSetUnitRulesParam(unitID, "upgrade_inProgress", 0)
  SendToUnsynced("UpgradeStop", unitID)

  local cmdID     = data.cmdID
  local currDefID = spGetUnitDefID(unitID)
  local ud        = UnitDefs[currDefID or -1]
  if not ud then return end

  if cmdID == CMD_UPG_SPEED then
    speedBoostedUnits[unitID] = true
    local moveData  = spGetUnitMoveTypeData(unitID)
    local baseSpeed = (moveData and moveData.maxSpeed) or (ud and ud.speed) or 0

    if ud.canFly then
      if ud.isHoveringAirUnit or ud.hoverAttack then
        spMoveCtrlSetGunshipMoveTypeData(unitID, {
          maxSpeed = baseSpeed * SPEED_BOOST_FACTOR
        })
      else
        spMoveCtrlSetAirMoveTypeData(unitID, {
          maxSpeed = baseSpeed * SPEED_BOOST_FACTOR
        })
      end
    else
      spMoveCtrlSetGroundMoveTypeData(unitID, {
        maxSpeed       = baseSpeed * SPEED_BOOST_FACTOR,
        maxWantedSpeed = baseSpeed * SPEED_BOOST_FACTOR
      })
    end
    StartUnitCEGCoroutine(unitID, SPEED_MOVING_CEG, math_random(30,60))

  elseif cmdID == CMD_UPG_ARMOR then
    armorBoostedUnits[unitID] = true
    spSetUnitArmored(unitID, true, 1 / ARMOR_BOOST_FACTOR)
    StartUnitCEGCoroutine(unitID, ARMOR_MOVING_CEG, math_random(15,35))

  elseif cmdID == CMD_UPG_CLOAK then
    cloakedUnits[unitID] = true
    local baseLOS = ud.losRadius or 0
    local decloakDistance = baseLOS * DECLAK_DISTANCE_MULT
    if decloakDistance < MIN_DECLAK_DISTANCE then
      decloakDistance = MIN_DECLAK_DISTANCE
    end
    spSetUnitCloak(unitID, 2, decloakDistance)

  elseif cmdID == CMD_UPG_BUILDPWR then
    buildPwrBoostedUnits[unitID] = true
    local baseBuildSpeed = ud.buildSpeed or 0
    local newBuildSpeed  = baseBuildSpeed * BUILDPWR_BOOST_FACTOR
    spSetUnitBuildSpeed(unitID, newBuildSpeed)
    StartUnitCEGCoroutine(unitID, BUILDPWR_MOVING_CEG, math_random(30,60))

  --------------------------------------------------------------------------------
  -- NEW STEALTH UPGRADE FINISH LOGIC
  --------------------------------------------------------------------------------
  elseif cmdID == CMD_UPG_STEALTH then
    stealthUnits[unitID] = true
    -- Just set permanent stealth; no CEG or coroutines
    spSetUnitStealth(unitID, true)

  end

  -- Remove all upgrade commands so there's no second purchase
  local removeList = {
    CMD_UPG_SPEED,
    CMD_UPG_ARMOR,
    CMD_UPG_CLOAK,
    CMD_UPG_BUILDPWR,
    CMD_UPG_STEALTH,
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
  -- let MOVE/PATROL/ATTACK/etc pass
  if cmdID == CMD.STOP or cmdID < 0 or cmdID == 16 then
    return true
  end

  -- If the command is not one of our upgrade commands, allow it
  if not CMD_TO_COST[cmdID] then
    return true
  end

  -- If an upgrade is in progress for this unit, pressing the same or STOP cancels it
  if inProgress[unitID] then
    StopUpgrade(unitID)
    return true
  end

  -- If the unit has already completed an upgrade, no new upgrades are allowed
  if upgradedUnits[unitID] then
    return true
  end

  -- Calculate cost
  local ud = UnitDefs[unitDefID]
  local baseMetal = ud and ud.metalCost or 0
  local totalCost = baseMetal * CMD_TO_COST[cmdID]

  local cmdDescID = spFindUnitCmdDesc(unitID, cmdID)
  StartUpgrade(unitID, cmdID, teamID, totalCost, cmdDescID)
  return true
end

function gadget:GameFrame(f)
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

  -- Resume coroutines
  for co in pairs(coroutinesTable) do
    local resumeFrame = coroutineWaitFrame[co]
    if (not resumeFrame) or (f >= resumeFrame) then
      coroutine_resume(co)
    end
  end
end

function gadget:UnitCreated(unitID, unitDefID, unitTeam)
  local def = validUnitDefs[unitDefID]
  if not def then
    return
  end
  local ud = UnitDefs[unitDefID]
  if not ud then
    return
  end

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

  --------------------------------------------------------------------------------
  -- NEW STEALTH UPGRADE CMD
  --------------------------------------------------------------------------------
  if def[CMD_UPG_STEALTH] then
    local stealthCost = baseMetal * STEALTH_COST_MULT
    spInsertUnitCmdDesc(unitID, StealthCmdDesc(stealthCost))
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
  stealthUnits[unitID]          = nil  -- new stealth
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

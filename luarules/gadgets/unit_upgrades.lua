function gadget:GetInfo()
  return {
    name    = "UnitUpgrades",
    desc    = "Units purchase upgrades over time.",
    author  = "[ur]uncle",
    date    = "2024-12-29",
    version = "1.7",
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

local CMD_BUY_SPEED_BOOST   = 34797
local CMD_BUY_ARMOR_BOOST   = 34798
local CMD_BUY_CLOAK         = 34799

local UPGRADE_COMMANDS = {
  [CMD_BUY_SPEED_BOOST] = true,
  [CMD_BUY_ARMOR_BOOST] = true,
  [CMD_BUY_CLOAK]       = true,
}

-- Multipliers
local SPEED_BOOST_FACTOR = 1.85
local SPEED_COST_MULT    = 1.35

local ARMOR_BOOST_FACTOR = 2.50
local ARMOR_COST_MULT    = 1.00

local CLOAK_COST_MULT    = 0.40

local DECLAK_DISTANCE_MULT = 0.05

-- CEG
local REPAIR_PAD_FX       = "repairpad_effect"
local SPEED_MOVING_CEG    = "speedboost_effect"
local ARMOR_MOVING_CEG    = "armorboost_effect"
local CLOAK_MOVING_CEG    = "cloak_effect"

local TARGET_FRAMES_FULL = 12 * 30

local validUnitDefs = {}

function gadget:Initialize()
  for udid, ud in pairs(UnitDefs) do
    if not ud.isBomberAirUnit then --(not ud.isFactory) and
      validUnitDefs[udid] = true
    end
  end
end

--------------------------------------------------------------------------------
--  UPGRADE STATE
--------------------------------------------------------------------------------

local upgradedUnits      = {}  -- [unitID] = true if upgrade is completed
local inProgress         = {}  -- [unitID] = { cmdID, teamID, totalCost, accumPaid, baseDefID, cmdDescID }
local speedBoostedUnits  = {}
local armorBoostedUnits  = {}
local cloakedUnits       = {}

local function MakeSpeedCmdDesc(cost)
  return {
    id      = CMD_BUY_SPEED_BOOST,
    type    = CMDTYPE.ICON,
    name    = "Buy\nSpeed",
    action  = "buyspeedboost",
    tooltip = string.format(
      "\255\1\255\1Purchase a +85%% Speed upgrade.\n\255\255\255\1Costs %.1f metal total.\255\255\255\255",
      cost
    ),
    cursor  = "Attack",
    disabled = false,
  }
end

local function MakeARMORCmdDesc(cost)
  return {
    id      = CMD_BUY_ARMOR_BOOST,
    type    = CMDTYPE.ICON,
    name    = "Buy\nArmor",
    action  = "buyarmorboost",
    tooltip = string.format(
      "\255\1\255\1Purchase a +150%% Armor upgrade.\n\255\255\255\1Costs %.1f metal total.\255\255\255\255",
      cost
    ),
    cursor  = "Attack",
    disabled = false,
  }
end

local function MakeCloakCmdDesc(cost)
  return {
    id      = CMD_BUY_CLOAK,
    type    = CMDTYPE.ICON,
    name    = "Buy\nCloak",
    action  = "buycloak",
    tooltip = string.format(
      "\255\1\255\1Purchase permanent cloak.\n\255\255\255\1Costs %.1f metal total.\255\255\255\255",
      cost
    ),
    cursor  = "Attack",
    disabled = false,
  }
end

local function SetCmdDescToStop(unitID, cmdDescID)
  Spring.EditUnitCmdDesc(unitID, cmdDescID, {
    name    = "Stop\nUpgrade",
    tooltip = "Stop/cancel the in-progress upgrade.",
  })
end

local function SetCmdDescToBuy(unitID, cmdDescID, oldName)
  Spring.EditUnitCmdDesc(unitID, cmdDescID, {
    name    = oldName,
  })
end

local function ParalyzeUnit(unitID, yes)
  if yes then
    Spring.SetUnitHealth(unitID, { paralyze = 1.0e9 })
  else
    Spring.SetUnitHealth(unitID, { paralyze = -1 })
  end
end

local function StartUpgrade(unitID, cmdID, teamID, totalCost, cmdDescID)
  inProgress[unitID] = {
    cmdID     = cmdID,
    teamID    = teamID,
    totalCost = totalCost,
    accumPaid = 0,
    baseDefID = Spring.GetUnitDefID(unitID),
    cmdDescID = cmdDescID,
  }
  ParalyzeUnit(unitID, true)
  Spring.SetUnitRulesParam(unitID, "upgrade_inProgress", 1)
  Spring.SetUnitRulesParam(unitID, "upgrade_totalCost",  totalCost)
  Spring.SetUnitRulesParam(unitID, "upgrade_accumPaid",  0)

  SetCmdDescToStop(unitID, cmdDescID)

  -- spawn CEG
  local x,y,z = Spring.GetUnitPosition(unitID)
  if x then
    Spring.SpawnCEG(REPAIR_PAD_FX, x,y,z, 0,0,0,0)
  end

  -- **Unsynced**: call UpgradeStart
  SendToUnsynced("UpgradeStart", unitID)
end

local function StopUpgrade(unitID)
  local data = inProgress[unitID]
  if not data then return end

  -- un-paralyze
  ParalyzeUnit(unitID, false)

  -- revert name
  local cmdDescID = data.cmdDescID
  if cmdDescID then
    if data.cmdID == CMD_BUY_SPEED_BOOST then
      SetCmdDescToBuy(unitID, cmdDescID, "Buy\nSpeed")
    elseif data.cmdID == CMD_BUY_ARMOR_BOOST then
      SetCmdDescToBuy(unitID, cmdDescID, "Buy\nARMOR")
    elseif data.cmdID == CMD_BUY_CLOAK then
      SetCmdDescToBuy(unitID, cmdDescID, "Buy\nCloak")
    end
  end

  inProgress[unitID] = nil
  Spring.SetUnitRulesParam(unitID, "upgrade_inProgress", 0)

  -- **Unsynced**: call UpgradeStop
  SendToUnsynced("UpgradeStop", unitID)
end

local function FinishUpgrade(unitID, data)
  inProgress[unitID] = nil
  upgradedUnits[unitID] = true
  ParalyzeUnit(unitID, false)

  Spring.SetUnitRulesParam(unitID, "upgrade_inProgress", 0)
  SendToUnsynced("UpgradeStop", unitID) -- notify unsynced (Stop once it's completed)

  local cmdID = data.cmdID
  local currDefID = Spring.GetUnitDefID(unitID)
  local ud        = UnitDefs[currDefID or -1]

  if cmdID == CMD_BUY_SPEED_BOOST then
    speedBoostedUnits[unitID] = true

    -- figure out the correct move-type call
    local moveData  = Spring.GetUnitMoveTypeData(unitID)
    local baseSpeed = (moveData and moveData.maxSpeed) or (ud and ud.speed) or 0

    if ud.canFly then
      if ud.isHoveringAirUnit or ud.hoverAttack then
        -- Gunship / hover-type air unit
        Spring.MoveCtrl.SetGunshipMoveTypeData(unitID, {
          maxSpeed = baseSpeed * SPEED_BOOST_FACTOR
        })
      else
        -- Fighter or other flying unit
        Spring.MoveCtrl.SetAirMoveTypeData(unitID, {
          maxSpeed = baseSpeed * SPEED_BOOST_FACTOR
        })
      end
    else
      -- Ground or ship
      --if ud.yardmap == nil and ud.workertime == true then return end -- nano turret (not uDef.yardmap and not uDef.workertime)
      Spring.MoveCtrl.SetGroundMoveTypeData(unitID, {
        maxSpeed = baseSpeed * SPEED_BOOST_FACTOR,
        maxWantedSpeed = baseSpeed * SPEED_BOOST_FACTOR
      })
    end

  elseif cmdID == CMD_BUY_ARMOR_BOOST then
    armorBoostedUnits[unitID] = true
    Spring.SetUnitArmored(unitID, true , 1 / ARMOR_BOOST_FACTOR)

  elseif cmdID == CMD_BUY_CLOAK then
    cloakedUnits[unitID] = true

    if ud then
      local baseLOS = ud.losRadius or 0
      local decloakDistance = baseLOS * DECLAK_DISTANCE_MULT
      Spring.SetUnitCloak(unitID, 2, decloakDistance)
    end
  end

  -- some special-effect
  local x,y,z = Spring.GetUnitPosition(unitID)
  if x then
    Spring.SpawnCEG(REPAIR_PAD_FX, x,y,z, 0,0,0,0)
  end

  -- remove all upgrade commands so there's no second purchase
  local removeList = {CMD_BUY_SPEED_BOOST, CMD_BUY_ARMOR_BOOST, CMD_BUY_CLOAK}
  for _, cID in ipairs(removeList) do
    local cDesc = Spring.FindUnitCmdDesc(unitID, cID)
    if cDesc then
      Spring.RemoveUnitCmdDesc(unitID, cDesc)
    end
  end
end

--------------------------------------------------------------------------------
--  Gadget Callins (Synced)
--------------------------------------------------------------------------------

function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)
  if not validUnitDefs[unitDefID] then return true end

  if cmdID == CMD.STOP then
    if inProgress[unitID] then
      StopUpgrade(unitID)
    end
    return true
  end

  if not UPGRADE_COMMANDS[cmdID] then
    return true
  end

  if upgradedUnits[unitID] then
    Spring.SendMessageToTeam(teamID, "\255\255\64\64This unit already completed an upgrade.")
    return false
  end

  local data = inProgress[unitID]
  if data then
    -- toggling => STOP
    StopUpgrade(unitID)
    return false
  end

  -- else => start
  local ud = UnitDefs[unitDefID]
  if not ud then return false end

  local baseMetal = ud.metalCost or 0
  local totalCost = 0
  local cmdDescID = Spring.FindUnitCmdDesc(unitID, cmdID)

  if cmdID == CMD_BUY_SPEED_BOOST then
    totalCost = baseMetal * SPEED_COST_MULT
  elseif cmdID == CMD_BUY_ARMOR_BOOST then
    totalCost = baseMetal * ARMOR_COST_MULT
  elseif cmdID == CMD_BUY_CLOAK then
    totalCost = baseMetal * CLOAK_COST_MULT
  end

  if totalCost <= 0 then
    return false
  end

  StartUpgrade(unitID, cmdID, teamID, totalCost, cmdDescID)
  return false
end

function gadget:GameFrame(f)
  -- Basic effects for completed upgrades
  if f % 20 == 0 then
    for uID in pairs(speedBoostedUnits) do
      if Spring.ValidUnitID(uID) and not Spring.GetUnitIsDead(uID) then
        local x,y,z = Spring.GetUnitPosition(uID)
        if x then
          Spring.SpawnCEG(SPEED_MOVING_CEG, x, y+(Spring.GetUnitHeight(uID) or 50), z)
        end
      end
    end
    for uID in pairs(armorBoostedUnits) do
      if Spring.ValidUnitID(uID) and not Spring.GetUnitIsDead(uID) then
        local x,y,z = Spring.GetUnitPosition(uID)
        if x then
          Spring.SpawnCEG(ARMOR_MOVING_CEG, x, y+(Spring.GetUnitHeight(uID) or 50), z)
        end
      end
    end
  end

  if f % 180 == 0 then
    for uID in pairs(cloakedUnits) do
      if Spring.ValidUnitID(uID) and not Spring.GetUnitIsDead(uID) then
        local x,y,z = Spring.GetUnitPosition(uID)
        if x then
          Spring.SpawnCEG(CLOAK_MOVING_CEG, x, y+(Spring.GetUnitHeight(uID) or 50), z)
        end
      end
    end
  end

  -- Pay partial cost
  for unitID, data in pairs(inProgress) do
    if (not Spring.ValidUnitID(unitID)) or Spring.GetUnitIsDead(unitID) then
      StopUpgrade(unitID)
    else
      local costRate = data.totalCost / TARGET_FRAMES_FULL
      local canPay   = Spring.UseTeamResource(data.teamID, "metal", costRate)
      if canPay then
        data.accumPaid = data.accumPaid + costRate
      end
      Spring.SetUnitRulesParam(unitID, "upgrade_accumPaid", data.accumPaid)

      if data.accumPaid >= data.totalCost then
        FinishUpgrade(unitID, data)
      end
    end
  end
end

function gadget:UnitFinished(unitID, unitDefID, unitTeam)
  if not validUnitDefs[unitDefID] then return end
  local ud = UnitDefs[unitDefID]
  local baseMetal = ud.metalCost or 0
  local speedCost = baseMetal * SPEED_COST_MULT
  local armorCost = baseMetal * ARMOR_COST_MULT
  local cloakCost = baseMetal * CLOAK_COST_MULT

  Spring.InsertUnitCmdDesc(unitID, MakeSpeedCmdDesc(speedCost))
  Spring.InsertUnitCmdDesc(unitID, MakeARMORCmdDesc(armorCost))
  Spring.InsertUnitCmdDesc(unitID, MakeCloakCmdDesc(cloakCost))
end

function gadget:UnitDestroyed(unitID)
  if inProgress[unitID] then
    StopUpgrade(unitID)
  end
  upgradedUnits[unitID]     = nil
  speedBoostedUnits[unitID] = nil
  armorBoostedUnits[unitID] = nil
  cloakedUnits[unitID]      = nil
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  UNSYNCED SECTION
--
--------------------------------------------------------------------------------
else
    local function HandleUpgradeStart(_, unitID)
      if Script and Script.LuaUI and Script.LuaUI.UpgradeStart then
        Script.LuaUI.UpgradeStart(unitID)
      end
    end

    local function HandleUpgradeStop(_, unitID)
      if Script and Script.LuaUI and Script.LuaUI.UpgradeStop then
        Script.LuaUI.UpgradeStop(unitID)
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

function gadget:GetInfo()
  return {
    name    = "UnitUpgrades",
    desc    = "Allows units to purchase various upgrades (Speed, HP, Cloak). Only one upgrade per unit.",
    author  = "[ur]uncle",
    date    = "2024-12-27",
    license = "GNU GPL v2 or later",
    layer   = 0,
    enabled = true
  }
end

--------------------------------------------------------------------------------
--  Only run in synced context
--------------------------------------------------------------------------------
if not gadgetHandler:IsSyncedCode() then
  return
end

--------------------------------------------------------------------------------
--  Constants / Config
--------------------------------------------------------------------------------
-- Command IDs
local CMD_BUY_SPEED_BOOST = 34567
local CMD_BUY_HP_BOOST    = 34568
local CMD_BUY_CLOAK       = 34569

-- Multipliers & Costs
local SPEED_BOOST_FACTOR = 1.50  -- +50% speed
local SPEED_COST_MULT    = 1.45  -- 150% of metal cost

local HP_BOOST_FACTOR    = 1.75  -- +75% HP
local HP_COST_MULT       = 1.50  -- 150% of metal cost

-- Note: The comment in your original code said "300%" 
-- but the CLOAK_COST_MULT was 4.00. Adjust as you see fit.
local CLOAK_COST_MULT    = 4.00  -- 400% of metal cost

-- Cloak Settings
local DECLAK_DISTANCE_MULT = 0.20  -- 20% of unit LOS

-- Effects
local INSTANT_CEG        = "repairpad_effect"
local MOVING_CEG         = "repairpad_effect"

--------------------------------------------------------------------------------
--  State Tracking
--------------------------------------------------------------------------------
-- These track who has purchased which upgrade (for debugging or further logic)
local speedBoostedUnits  = {}
local hpBoostedUnits     = {}
local cloakedUnits       = {}

-- This table tracks if a unit has *any* of the special upgrades,
-- ensuring only one upgrade may be purchased per unit.
local upgradedUnits      = {}

--------------------------------------------------------------------------------
--  Helper Functions for inserting commands
--------------------------------------------------------------------------------
-- We’ll display the cost in red: \255\255\64\64

local function InsertSpeedBoostCmdDesc(unitID, cost)
  Spring.InsertUnitCmdDesc(unitID, {
    id      = CMD_BUY_SPEED_BOOST,
    type    = CMDTYPE.ICON,
    name    = "+50%\nSpeed",
    action  = "buyspeedboost",
    tooltip = string.format(
      "\255\255\64\64Costs %.1f metal.\n\255\255\255\255Grants +50%% move speed.", 
      cost
    ),
    cursor  = "Attack",
  })
end

local function InsertHPBoostCmdDesc(unitID, cost)
  Spring.InsertUnitCmdDesc(unitID, {
    id      = CMD_BUY_HP_BOOST,
    type    = CMDTYPE.ICON,
    name    = "+75%\nHP",
    action  = "buyhpboost",
    tooltip = string.format(
      "\255\255\64\64Costs %.1f metal.\n\255\255\255\255Grants +75%% max HP.", 
      cost
    ),
    cursor  = "Attack",
  })
end

local function InsertCloakCmdDesc(unitID, cost)
  Spring.InsertUnitCmdDesc(unitID, {
    id      = CMD_BUY_CLOAK,
    type    = CMDTYPE.ICON,
    name    = "Buy\nCloak",
    action  = "buycloak",
    tooltip = string.format(
      "\255\255\64\64Costs %.1f metal.\n\255\255\255\255Grants permanent cloak.", 
      cost
    ),
    cursor  = "Attack",
  })
end

--------------------------------------------------------------------------------
--  Callins
--------------------------------------------------------------------------------

function gadget:UnitCreated(unitID, unitDefID, unitTeam)
  local ud = UnitDefs[unitDefID]
  if not ud then
    return
  end

  local baseMetalCost = ud.metalCost or 0
  local speedCost     = baseMetalCost * SPEED_COST_MULT
  local hpCost        = baseMetalCost * HP_COST_MULT
  local cloakCost     = baseMetalCost * CLOAK_COST_MULT

  -- Insert command descriptors with the calculated cost for *this* unit
  InsertSpeedBoostCmdDesc(unitID, speedCost)
  InsertHPBoostCmdDesc(unitID, hpCost)
  InsertCloakCmdDesc(unitID, cloakCost)
end

function gadget:AllowCommand(unitID, unitDefID, unitTeam, cmdID, cmdParams, cmdOptions)
  local ud = UnitDefs[unitDefID]
  if not ud then
    -- Let engine handle non-upgrade commands
    return true
  end

  -- If this unit has already purchased one upgrade, disallow any more
  if upgradedUnits[unitID] 
     and (cmdID == CMD_BUY_SPEED_BOOST 
       or cmdID == CMD_BUY_HP_BOOST 
       or cmdID == CMD_BUY_CLOAK) 
  then
    Spring.SendMessageToTeam(unitTeam, "\255\255\64\64Unit already has a special upgrade!")
    return false
  end

  if cmdID == CMD_BUY_SPEED_BOOST then
    -- SPEED BOOST
    if speedBoostedUnits[unitID] then
      Spring.SendMessageToTeam(unitTeam, "\255\255\128\0Already has speed boost!")
      return false
    end

    local baseMetalCost = ud.metalCost or 0
    local upgradeCost   = baseMetalCost * SPEED_COST_MULT
    if not TrySpendMetal(unitTeam, upgradeCost) then
      return false
    end

    Spring.SendMessageToTeam(unitTeam, "\255\128\255\128Speed boost purchased!")
    speedBoostedUnits[unitID] = true
    upgradedUnits[unitID]     = true  -- mark that this unit has *any* special upgrade now

    local moveData = Spring.GetUnitMoveTypeData(unitID)
    if moveData and moveData.maxSpeed then
      Spring.MoveCtrl.SetGroundMoveTypeData(unitID, {
        maxSpeed = moveData.maxSpeed * SPEED_BOOST_FACTOR,
      })
    else
      -- fallback if there's no valid moveData
      Spring.MoveCtrl.SetGroundMoveTypeData(unitID, {
        maxSpeed = (ud.speed or 0) * SPEED_BOOST_FACTOR,
      })
    end

    DisableUnitCmd(unitID, CMD_BUY_SPEED_BOOST)
    DisableUnitCmd(unitID, CMD_BUY_HP_BOOST)   -- disable the other upgrades
    DisableUnitCmd(unitID, CMD_BUY_CLOAK)
    SpawnInstantCEG(unitID)
    return false

  elseif cmdID == CMD_BUY_HP_BOOST then
    -- HP BOOST
    if hpBoostedUnits[unitID] then
      Spring.SendMessageToTeam(unitTeam, "\255\255\128\0Already has HP boost!")
      return false
    end

    local baseMetalCost = ud.metalCost or 0
    local upgradeCost   = baseMetalCost * HP_COST_MULT
    if not TrySpendMetal(unitTeam, upgradeCost) then
      return false
    end

    Spring.SendMessageToTeam(unitTeam, "\255\128\255\128HP boost purchased!")
    hpBoostedUnits[unitID] = true
    upgradedUnits[unitID]  = true  -- mark that this unit has *any* special upgrade now

    local currHP, maxHP = Spring.GetUnitHealth(unitID)
    if currHP and maxHP then
      local newMaxHP  = maxHP  * HP_BOOST_FACTOR
      local newCurrHP = currHP * HP_BOOST_FACTOR
      Spring.SetUnitMaxHealth(unitID, newMaxHP)
      Spring.SetUnitHealth(unitID, newCurrHP)
    end

    DisableUnitCmd(unitID, CMD_BUY_HP_BOOST)
    DisableUnitCmd(unitID, CMD_BUY_SPEED_BOOST) -- disable the other upgrades
    DisableUnitCmd(unitID, CMD_BUY_CLOAK)
    SpawnInstantCEG(unitID)
    return false

  elseif cmdID == CMD_BUY_CLOAK then
    -- CLOAK
    if cloakedUnits[unitID] then
      Spring.SendMessageToTeam(unitTeam, "\255\255\128\0Already cloaked!")
      return false
    end

    local baseMetalCost = ud.metalCost or 0
    local upgradeCost   = baseMetalCost * CLOAK_COST_MULT
    if not TrySpendMetal(unitTeam, upgradeCost) then
      return false
    end

    Spring.SendMessageToTeam(unitTeam, "\255\128\255\128Cloak purchased!")
    cloakedUnits[unitID]  = true
    upgradedUnits[unitID] = true  -- mark that this unit has *any* special upgrade now

    -- Determine decloak distance as 20% of the unit's LOS radius
    local baseLOS = ud.losRadius or 0
    local decloakDistance = baseLOS * DECLAK_DISTANCE_MULT

    Spring.SetUnitCloak(unitID, true, decloakDistance)

    DisableUnitCmd(unitID, CMD_BUY_CLOAK)
    DisableUnitCmd(unitID, CMD_BUY_SPEED_BOOST) -- disable the other upgrades
    DisableUnitCmd(unitID, CMD_BUY_HP_BOOST)
    SpawnInstantCEG(unitID)
    return false
  end

  -- If it's not one of our custom commands, allow normal processing
  return true
end

function gadget:GameFrame(frame)
  -- Example: If you'd like a "moving" effect for speed-boosted units
  if frame % 15 ~= 0 then
    return
  end

  for unitID in pairs(speedBoostedUnits) do
    if Spring.ValidUnitID(unitID) and not Spring.GetUnitIsDead(unitID) then
      local x, y, z = Spring.GetUnitPosition(unitID)
      Spring.SpawnCEG(MOVING_CEG, x, y, z, 0, 0, 0, 0)
    end
  end
end

function gadget:UnitDestroyed(unitID)
  speedBoostedUnits[unitID] = nil
  hpBoostedUnits[unitID]    = nil
  cloakedUnits[unitID]      = nil
  upgradedUnits[unitID]     = nil
end

--------------------------------------------------------------------------------
--  Utility Functions
--------------------------------------------------------------------------------

function TrySpendMetal(teamID, amount)
  if amount <= 0 then
    Spring.SendMessageToTeam(teamID, "\255\255\64\64Invalid cost!")
    return false
  end

  local currentMetal = Spring.GetTeamResources(teamID, "metal")
  if currentMetal < amount then
    Spring.SendMessageToTeam(teamID, "\255\255\64\64Not enough metal!")
    return false
  end

  if not Spring.UseTeamResource(teamID, "metal", amount) then
    Spring.SendMessageToTeam(teamID, "\255\255\64\64Unable to spend metal!")
    return false
  end

  return true
end

function DisableUnitCmd(unitID, cmdID)
  local cmdDescID = Spring.FindUnitCmdDesc(unitID, cmdID)
  if cmdDescID then
    Spring.EditUnitCmdDesc(unitID, cmdDescID, { disabled = true })
  end
end

function SpawnInstantCEG(unitID)
  local x, y, z = Spring.GetUnitPosition(unitID)
  if x and y and z then
    Spring.SpawnCEG(INSTANT_CEG, x, y, z, 0, 0, 0, 0)
  end
end

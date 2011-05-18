function gadget:GetInfo()
  return {
    name      = "MissileControl",
    desc      = "Allows you to specify a fire delay for Mercury/Screamer",
    author    = "TheFatController",
    date      = "15 Dec 2008",
    license   = "GNU GPL, v2 or later",
    layer     = 5,
    enabled   = true  --  loaded by default?
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

if (not gadgetHandler:IsSyncedCode()) then
  return
end

local GetUnitWeaponState = Spring.GetUnitWeaponState
local GetGameFrame = Spring.GetGameFrame
local EditUnitCmdDesc = Spring.EditUnitCmdDesc
local FindUnitCmdDesc = Spring.FindUnitCmdDesc
local InsertUnitCmdDesc = Spring.InsertUnitCmdDesc
local SetUnitCOBValue = Spring.SetUnitCOBValue
local DELAY_UNIT_VAR = 1024

local DELAY_UNIT = {
  [UnitDefNames["screamer"].id] = WeaponDefs[UnitDefNames["screamer"].weapons[1].weaponDef].reload,
  [UnitDefNames["mercury"].id] = WeaponDefs[UnitDefNames["mercury"].weapons[1].weaponDef].reload,
  [UnitDefNames["corerad"].id] = WeaponDefs[UnitDefNames["corerad"].weapons[1].weaponDef].reload,
  [UnitDefNames["armcir"].id] = WeaponDefs[UnitDefNames["armcir"].weapons[1].weaponDef].reload,
  [UnitDefNames["corerad1"].id] = WeaponDefs[UnitDefNames["corerad1"].weapons[1].weaponDef].reload,
  [UnitDefNames["armcir1"].id] = WeaponDefs[UnitDefNames["armcir1"].weapons[1].weaponDef].reload,
  [UnitDefNames["tllhmt"].id] = WeaponDefs[UnitDefNames["tllhmt"].weapons[1].weaponDef].reload,

}

local staggerCmd = {
      id      = 34566,
      name    = "Stagger",
      action  = "stagger",
      type    = CMDTYPE.ICON_MODE,
      tooltip = "Delay firing for a percentage of the units max reload time",
      params  = { '0', 'Delay Off', 'Delay 10%', 'Delay 20%', 'Delay 30%', 'Delay 40%', 'Delay 50%'}
}

function gadget:Initialize()
  gadgetHandler:RegisterGlobal("LRMTGetFireDelay",LRMTGetFireDelay)
end

function gadget:UnitCreated(unitID, unitDefID, unitTeam)
  if DELAY_UNIT[unitDefID] then
    InsertUnitCmdDesc(unitID, 500, staggerCmd)
  end
end

function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)
  if (cmdID == 34566) and DELAY_UNIT[unitDefID] then
    local cmdDescID = FindUnitCmdDesc(unitID, 34566)
    staggerCmd.params[1] = cmdParams[1]
    SetUnitCOBValue(unitID, DELAY_UNIT_VAR, ((DELAY_UNIT[unitDefID] * (cmdParams[1] / 10)) * 30))
    EditUnitCmdDesc(unitID, cmdDescID, staggerCmd)
    staggerCmd.params[1] = 0
  end
  return true
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
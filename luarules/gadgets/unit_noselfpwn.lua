--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "No Self Pwn",
    desc      = "Prevents Some units from damaging themselves.",
    author    = "quantum/TheFatController",
    date      = "Feb 1, 2008",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

if (not gadgetHandler:IsSyncedCode()) then
  return false  --  silent removal
end

local GetUnitHealth = Spring.GetUnitHealth
local SetUnitHealth = Spring.SetUnitHealth
local newSpring = false

local PWN_UNITS = {}
--Arm
PWN_UNITS[UnitDefNames["armpt"].id] = true
PWN_UNITS[UnitDefNames["armham"].id] = true
PWN_UNITS[UnitDefNames["armfav"].id] = true
--Core
PWN_UNITS[UnitDefNames["corpyro"].id] = true
PWN_UNITS[UnitDefNames["cormaw"].id] = true
PWN_UNITS[UnitDefNames["corthud"].id] = true
PWN_UNITS[UnitDefNames["corfav"].id] = true
PWN_UNITS[UnitDefNames["corak"].id] = true
PWN_UNITS[UnitDefNames["corpt"].id] = true
--The lost legacy
PWN_UNITS[UnitDefNames["tllpbot"].id] = true
PWN_UNITS[UnitDefNames["tllburner"].id] = true
--PWN_UNITS[UnitDefNames["tlllft"].id] = true
PWN_UNITS[UnitDefNames["tllotter"].id] = true


function gadget:UnitPreDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, 
                            weaponID, projectileID, attackerID, attackerDefID, attackerTeam)
  if ((unitID == attackerID) and PWN_UNITS[unitDefID]) then
    return 0, 0
  else
    return damage,1
  end
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
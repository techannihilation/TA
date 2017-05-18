--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "No Land Damage",
    desc      = "Stops torpedos and stuff from damaging units when they're on land.",
    author    = "TheFatController",
    date      = "Aug 31, 2009",
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

local GetUnitBasePosition = Spring.GetUnitBasePosition

local NO_LAND_DAMAGE = {
  [WeaponDefNames['armdl_coax_depthcharge'].id] = true,
  [WeaponDefNames['cordl_coax_depthcharge'].id] = true,
  [WeaponDefNames['armtl_coax_torpedo'].id] = true,
  [WeaponDefNames['cortl_coax_torpedo'].id] = true,
  [WeaponDefNames['tlltorp_coax_torpedo'].id] = true,
  [WeaponDefNames['armatl_armatl_torpedo'].id] = true,
  [WeaponDefNames['coratl_coratl_torpedo'].id] = true,
  [WeaponDefNames['armlance_armair_torpedo'].id] = true,
  [WeaponDefNames['cortitan_armair_torpedo'].id] = true,
  [WeaponDefNames['tlltorpp_armair_torpedo'].id] = true,
  [WeaponDefNames['armseap_armseap_weapon1'].id] = true,
  [WeaponDefNames['corseap_armseap_weapon1'].id] = true,
  [WeaponDefNames['tllseab_armseap_weapon1'].id] = true,
  [WeaponDefNames['armroy_depthcharge'].id] = true,
  [WeaponDefNames['corroy_depthcharge'].id] = true,
  [WeaponDefNames['armcrus_advdepthcharge'].id] = true,
  [WeaponDefNames['corcrus_advdepthcharge'].id] = true,
  [WeaponDefNames['armsub_arm_torpedo'].id] = true, 
  [WeaponDefNames['corsub_arm_torpedo'].id] = true,
  [WeaponDefNames['tllplunger_arm_torpedo'].id] = true,
  [WeaponDefNames['armsubk_armsmart_torpedo'].id] = true,
  [WeaponDefNames['corshark_armsmart_torpedo'].id] = true,
  [WeaponDefNames['tllmanta_armsmart_torpedo'].id] = true,
  [WeaponDefNames['uppercut_armsmart_torpedo'].id] = true,
  [WeaponDefNames['tawf009_tawf009_weapon'].id] = true,
  [WeaponDefNames['uppercut_tawf009_weapon'].id] = true,
  [WeaponDefNames['corssub_corssub_weapon'].id] = true,
  [WeaponDefNames['tllorc_corssub_weapon'].id] = true,
  [WeaponDefNames['coramph_coramph_weapon1'].id] = true,
  [WeaponDefNames['tllamphibot_coramph_weapon1'].id] = true,
  [WeaponDefNames['tlltorpcop_tllair_torpedo'].id] = true,
}

function gadget:UnitPreDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, 
                            weaponID, projectileID, attackerID, attackerDefID, attackerTeam)
  if NO_LAND_DAMAGE[weaponID] then
    if select(2,GetUnitBasePosition(unitID)) > 0 then 
      return (damage * 0.2),1
    else 
      return damage,1
    end
  else
    return damage,1
  end
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
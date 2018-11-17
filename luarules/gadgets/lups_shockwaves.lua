-- $Id: lups_shockwaves.lua 3171 2008-11-06 09:06:29Z det $

function gadget:GetInfo()
  return {
    name      = "Shockwaves",
    desc      = "",
    author    = "jK",
    date      = "Jan. 2008",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true
  }
end


if (gadgetHandler:IsSyncedCode()) then

local _ = {
    --Arm
    ["armguard_armfixed_gun"] = true,
    ["armguard_armfixed_gun_high"] = true,
    ["armthund_armbomb"] = true,
    ["armcybr_arm_pidr"] = true,
    ["armpnix_armadvbomb"] = true,
    ["armsb_seaadvbomb"] = true,
    ["armblz_napalm"] = true,
    ["armshock_shocker"] = true,
    ["armshock1_shocker1"] = true,
    ["armfboy_arm_fatboy_notalaser"] = true,
    ["armfboy1_arm_fatboy_notalaser1"] = true,
    --Core

    --The Lost Legacy
    ["tllhtml_tll_gauss2"] = true,
    ["tlldemon_demonslayer_cannon"] = true,
  }

  local hasShockwave = {} -- other gadgets can do Script.SetWatchWeapon and it is a global setting

  --// find weapons which cause a shockwave
  for i=1,#WeaponDefs do
    local wd = WeaponDefs[i]
    local customParams = wd.customParams or {}
    if (SHOCK_WEAPONS[wd.name]) or (wd.type == "DGun") then
      local _ = 1
      local _ = 1
      if customParams.lups_explodespeed then
	    speed = wd.customParams.lups_explodespeed
      end
      if wd.customParams.lups_explodelife then
	    life = wd.customParams.lups_explodelife
      end
      Script.SetWatchWeapon(wd.id,true)
      hasShockwave[wd.id] = {life = life, speed = speed}
    end
  end

  function gadget:Explosion(weaponID, px, py, pz, _)
    local wd = WeaponDefs[weaponID]
    --if (wd.description=="PlasmaImplosionDumpRocket") then --// Liche
    --  SendToUnsynced("lups_shockwave", px, py, pz, 6.4, 30, 0.13, true)
    --  return true
    --else
	local shockwave = hasShockwave[weaponID]
	if shockwave then
      if (wd.type == "DGun") then
        SendToUnsynced("lups_shockwave", px, py, pz, 4.0, 18, 0.13, true)
      else
        --local growth = wd.explosionSpeed
        --local life = wd.damageAreaOfEffect / wd.explosionSpeed
        local growth = (wd.damageAreaOfEffect*1.1)/20*shockwave.speed
        local life = 23*shockwave.life
        SendToUnsynced("lups_shockwave", px, py, pz, growth, life)
      end
	end
    return false
  end

else

  local function SpawnShockwave(_,px,py,pz, growth, life, strength, desintergrator)
    local Lups = GG['Lups']
    if (desintergrator) then
      Lups.AddParticles('SphereDistortion',{pos={px,py,pz}, life=life, strength=strength, growth=growth ,priority=2})
    else
      Lups.AddParticles('ShockWave',{pos={px,py,pz}, growth=growth, life=life, priority=2})
    end
  end

  function gadget:Initialize()
    gadgetHandler:AddSyncAction("lups_shockwave", SpawnShockwave)
  end

  function gadget:Shutdown()
    gadgetHandler.RemoveSyncAction("lups_shockwave")
  end

end
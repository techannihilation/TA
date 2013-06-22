local nonexplosiveWeapons = {
     LaserCannon = true,
     BeamLaser = true,
     EmgCannon = true,
     Flame = true,
     LightningCannon = true,
     DGun = true,
}

local BlackList = {
     ["armrock_arm_kbot_rocket"] = true,
     ["armrock1_arm_kbot_rocket1"] = true,
     ["corstorm_core_kbot_rocket"] = true,
     ["corstorm1_core_kbot_rocket1"] = true,
     ["gladiator_armkbot_missile3"] = true,
     ["tllfireraiser_tll_kbot_rocket"] = true,
     
     ["armrock1_arm_kbot_rocket1"] = true,
     ["corstorm1_core_kbot_rocket1"] = true,
     
     ["armrottweiler_armrottweiler_cannon"] = true,
     
     ["armcrack_lightartmiss"] = true,
     ["corrock_lightartmiss"] = true,
     ["tlldmc_tlldmc"] = true,
     
     ["armbanth_bantha_rocket"] = true,
     ["armbanth1_bantha_rocket1"] = true,
     ["armmerl_armtruck_rocket"] = true,
     ["armorco_corkrog_rocket"] = true,
     ["armtigre2_corkrog_rocket"] = true,
     ["corhrk_corhrk_rocket"] = true,
     ["corkrog_corkrog_rocket"] = true,
     ["corkrog1_corkrog_rocket1"] = true,
     ["corvroc_cortruck_rocket"] = true,
     ["shiva_shiva_rocket"] = true,
     ["tllconvincer_armtruck_rocket"] = true,
     ["tllhrk_corhrk_rocket"] = true,
     ["tllvisitor_visitor_vpulse"] = true,
     ["tawf114_tawf_banisher"] = true,
}
   
return nonexplosiveWeapons, BlackList
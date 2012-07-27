local function CopyTable(srcTbl, dstTbl)
	assert(dstTbl ~= nil)

	for key, val in pairs(srcTbl) do
		assert(type(key) ~= type({}))

		if (type(val) == type({})) then
			dstTbl[key] = {}

			srcSubTbl = val
			dstSubTbl = dstTbl[key]

			CopyTable(srcSubTbl, dstSubTbl)
		else
			dstTbl[key] = val
		end
	end
end


local rgbSpecMults = {0.25, 0.25, 0.25} -- specular RGB scales
local copyLightDefs = {
	["TA"] = {
	  
		["corgol_cor_gol"            ] = "core_artillery",
		
		--Commander Blasts
		["commander_blast1"          ] = "commander_blast",
		["commander_blast4"          ] = "commander_blast",
		["commander_blast5"          ] = "commander_blast",
		["commander_blast6"          ] = "commander_blast",
		["commander_blast7"          ] = "commander_blast",
		["commander_blast8"          ] = "commander_blast",
		
		--t1 plamsa weapon
		["corthud_arm_ham"           ] = "t1_plasma_weapon",
		["armham_arm_ham"            ] = "t1_plasma_weapon",
		["armham1_arm_ham1"          ] = "t1_plasma_weapon",
		["corthud_arm_ham"           ] = "t1_plasma_weapon",
		["corthud1_arm_ham1"         ] = "t1_plasma_weapon",
		["tllpbot_tll_pbot"          ] = "t1_plasma_weapon",
		
		--core starbusrt launcher
		["corhrk_corhrk_rocket"      ] = "core_starburst",
		["corkrog1_corkrog_rocket1"  ] = "core_starburst",
		["corkrog_corkrog_rocket"    ] = "core_starburst",
		["cortyrnt_rocket_krog"      ] = "core_starburst",
		["cormachn_warm_rocket"      ] = "core_starburst",
		["cormh_cormh_weapon"        ] = "core_starburst",
		["cormship_cormship_rocket"  ] = "core_starburst",
		["corvroc_cortruck_rocket"   ] = "core_starburst",
		
		--tll starburst launchers
		["tllhrk_corhrk_rocket"      ] = "tll_starburst",
		                --["tllacid_acidrain_rocket"   ] = "tll_starburst", need to own light def
		["tllhoverrocket_tll_vpulse" ] = "tll_starburst",
		["tllvisitor_visitor_vpulse" ] = "tll_starburst",
		["tllwhale_whale_vpulse"     ] = "tll_starburst",
		["tlldb_dragon_breath_missile"] = "tll_starburst",

			
		--arm starburst
		["armkrmi_armkrmi_rocket"    ] = "arm_starburst",
		["armbanth_bantha_rocket"    ] = "arm_starburst",
		["armbanth1_bantha1_rocket"  ] = "arm_starburst",
		["arm_furie_arm_furie_rocket"] = "arm_starburst",
		["armgor_arm_furie_rocket"   ] = "arm_starburst",
		["armjag_armjag_miss"        ] = "arm_starburst",
		["armmh_armmh_weapon"        ] = "arm_starburst",
		["armmship_armship_missile"  ] = "arm_starburst",
		["armorco_corkrog_rocket"    ] = "arm_starburst",
		["armtigre2_corkrog_rocket"  ] = "arm_starburst",
		["armtrmph_rocket_mcv"       ] = "arm_starburst",
		["armpraet_armpraetorian_rocket"] = "arm_starburst",
		
		
		--light rockets
		["armcrack_lightartmissarm"   ] = "light_rockets",
		["corrock_lightartmiss"       ] = "light_rockets",

		--medium rockets
		["armdark_corhorg_missile"   ] = "medium_rockets",
		["cbrutus_cbrutus_missile"   ] = "medium_rockets",
		["armcrabe_armcrabe_missile" ] = "medium_rockets",
		["coreclipse_fab500"         ] = "medium_rockets",
		["tllhtml_tll_rockets2"      ] = "medium_rockets",
		
		--brthas
		["heavyimpact_cormechart"    ] = "arm_berthacannon",
		["armbrtha_arm_berthacannon2"] = "arm_berthacannon",
		
		--Dgun
		["armcom_arm_disintegrator"  ] = "arm_disintegrator",
		["armcom1_arm_disintegrator" ] = "arm_disintegrator",
		["armcom4_arm_disintegrator1"] = "arm_disintegrator",
		["armcom5_arm_disintegrator2"] = "arm_disintegrator",
		["armcom6_arm_disintegrator2"] = "arm_disintegrator",
		["armcom7_arm_disintegrator2"] = "arm_disintegrator",
		["corcom_arm_disintegrator"  ] = "arm_disintegrator",
		["corcom1_arm_disintegrator" ] = "arm_disintegrator",
		["corcom3_arm_disintegrator1"] = "arm_disintegrator",
		["corcom5_arm_disintegrator2"] = "arm_disintegrator",
		["corcom6_arm_disintegrator2"] = "arm_disintegrator",
		["corcom7_arm_disintegrator2"] = "arm_disintegrator",
		["tllcom_arm_disintegrator3" ] = "arm_disintegrator",
		["tllcom3_tll_disintegrator1"] = "arm_disintegrator",
		["tllcom5_tll_disintegrator2"] = "arm_disintegrator",
		["tllcom6_tll_disintegrator2"] = "arm_disintegrator",
		["tllcom7_tll_disintegrator2"] = "arm_disintegrator",



		
		
	--[[	["corplas_weapon"      ] = "core_artillery",
		["corkrog_fire"        ] = "core_artillery", -- FIXME? should be krogoth_artillery but corkrog_fire has plasma shell CEGs?
	--	["krogoth_artillery"   ] = "core_artillery",
		["commander_blast1"    ] = "commander_blast",
		["arm_udisintegrator"  ] = "arm_disintegrator",
		["csarm_disintegrator" ] = "arm_disintegrator",
		["core_disintegrator"  ] = "arm_disintegrator",
		["core_udisintegrator" ] = "arm_disintegrator",
		["cscore_disintegrator"] = "arm_disintegrator",
		["heavyimpact_cormechart"] = "arm_berthacannon",
		["cor_bats"            ] = "arm_bats",
		["armmine5"            ] = "crawl_blast",
		["atomic_blastpen"     ] = "atomic_blast",
		["crblmssl"            ] = "nuclear_missile",
		["cortron_weapon"      ] = "armemp_weapon",
		["corvipe_laser"       ] = "armsnipe_weapon",
		["corkrog_head"        ] = "armsnipe_weapon",
		    --]]
	},
}
local dynLightDefs = {
	["TA"] = {
		weaponLightDefs = {
			-- Core Pillager / Goliath / Immolator (main barrel) projectiles
			["core_artillery"] = {
				projectileLightDef = {
					diffuseColor    = {4.9,                   4.5,                   0.2                  },
					specularColor   = {4.9 * rgbSpecMults[1], 4.5 * rgbSpecMults[2], 0.2 * rgbSpecMults[3]},
					radius          = 275.0,
					priority        = 3 * 10,
					ttl             = 100000,
				},
				explosionLightDef = {
					diffuseColor      = {4.0,                   2.5,                   0.2                  },
					specularColor     = {4.0 * rgbSpecMults[1], 2.5 * rgbSpecMults[2], 0.2 * rgbSpecMults[3]},
					radius            = 200.0,
					priority          = 3 * 10 + 1,
					ttl               = 2.3 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 30.0,
				},
			},


			-- Arm & Core Commander (dgun) projectiles
			-- NOTE:
			--   no explosion light defs, because a dgun
			--   projectile triggers a new explosion for
			--   every frame it is alive (which consumes
			--   too many light slots)
			["arm_disintegrator"] = {
				projectileLightDef = {
					diffuseColor      = {2.8,                   1.0,                   0.1                  },
					specularColor     = {2.8 * rgbSpecMults[1], 1.0 * rgbSpecMults[2], 0.1 * rgbSpecMults[3]},
					radius            = 200.0,
					priority          = 2 * 10,
					ttl               = 100000,
				},
			},
			
			--Rockets and Missles
			["core_starburst"] = {
				projectileLightDef = {
					diffuseColor      = {0.8,                   0.1,                   0.1                  },
					specularColor     = {0.8 * rgbSpecMults[1], 0.1 * rgbSpecMults[2], 0.1 * rgbSpecMults[3]},
					radius            = 135.0,
					priority          = 2 * 10,
					ttl               = 100000,
				},
					explosionLightDef = {
					diffuseColor      = {1.0,                   0.1,                   0.1                  },
					specularColor     = {1.0 * rgbSpecMults[1], 0.1 * rgbSpecMults[2], 0.1 * rgbSpecMults[3]},
					radius            = 165.0,
					priority          = 3 * 10 + 1,
					ttl               = 1.5 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 30.0,
				},
			},
			["arm_starburst"] = {
				projectileLightDef = {
					diffuseColor      = {0.1,                   0.2,                   0.9                  },
					specularColor     = {0.1 * rgbSpecMults[1], 0.2 * rgbSpecMults[2], 0.9 * rgbSpecMults[3]},
					radius            = 135.0,
					priority          = 2 * 10,
					ttl               = 100000,
				},
					explosionLightDef = {
					diffuseColor      = {1.0,                   0.1,                   0.1                  },
					specularColor     = {1.0 * rgbSpecMults[1], 0.1 * rgbSpecMults[2], 0.1 * rgbSpecMults[3]},
					radius            = 165.0,
					priority          = 3 * 10 + 1,
					ttl               = 1.5 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 30.0,
				},
			},
			["tll_starburst"] = {
				projectileLightDef = {
					diffuseColor      = {1.0,                   0.1,                   1.0                  },
					specularColor     = {1.0 * rgbSpecMults[1], 0.1 * rgbSpecMults[2], 1.0 * rgbSpecMults[3]},
					radius            = 135.0,
					priority          = 2 * 10,
					ttl               = 100000,
				},
					explosionLightDef = {
					diffuseColor      = {1.0,                   0.1,                   0.1                  },
					specularColor     = {1.0 * rgbSpecMults[1], 0.1 * rgbSpecMults[2], 0.1 * rgbSpecMults[3]},
					radius            = 165.0,
					priority          = 3 * 10 + 1,
					ttl               = 1.5 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 30.0,
				},
			},
			["light_rockets"] = {
				projectileLightDef = {
					diffuseColor      = {0.8,                   0.1,                   0.1                  },
					specularColor     = {0.8 * rgbSpecMults[1], 0.1 * rgbSpecMults[2], 0.1 * rgbSpecMults[3]},
					radius            = 95.0,
					priority          = 1 * 10,
					ttl               = 100000,
				},
					explosionLightDef = {
					diffuseColor      = {1.0,                   0.1,                   0.1                  },
					specularColor     = {1.0 * rgbSpecMults[1], 0.1 * rgbSpecMults[2], 0.1 * rgbSpecMults[3]},
					radius            = 115.0,
					priority          = 2 * 10 + 1,
					ttl               = 1.3 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 30.0,
				},
			},
			["medium_rockets"] = {
				projectileLightDef = {
					diffuseColor      = {0.8,                   0.1,                   0.1                  },
					specularColor     = {0.8 * rgbSpecMults[1], 0.1 * rgbSpecMults[2], 0.1 * rgbSpecMults[3]},
					radius            = 135.0,
					priority          = 2 * 10,
					ttl               = 100000,
				},
					explosionLightDef = {
					diffuseColor      = {1.0,                   0.1,                   0.1                  },
					specularColor     = {1.0 * rgbSpecMults[1], 0.1 * rgbSpecMults[2], 0.1 * rgbSpecMults[3]},
					radius            = 155.0,
					priority          = 3 * 10 + 1,
					ttl               = 1.3 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 30.0,
				},
			},
			
			
			
			-- explodeas/selfdestructas lights for various large units
			["commander_blast"] = {
				explosionLightDef = {
					diffuseColor      = { 9.0,                    8.0,                    3.5                  },
					specularColor     = { 9.0 * rgbSpecMults[1],  8.0 * rgbSpecMults[2],  3.5 * rgbSpecMults[3]},
					priority          = 15 * 10,
					radius            = 1050.0,
					ttl               = 3 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 65.0,
				},
			},
			["giant_blast"] = {
				explosionLightDef = {
					diffuseColor      = { 7.0,                    6.0,                    3.5                  },
					specularColor     = { 7.0 * rgbSpecMults[1],  6.0 * rgbSpecMults[2],  3.5 * rgbSpecMults[3]},
					priority          = 14 * 10,
					radius            = 775.0,
					ttl               = 2.5 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 55.0,
				},
			},

			["crawl_blast"] = {
				explosionLightDef = {
					diffuseColor      = { 6.5,                    5.5,                    3.25                  },
					specularColor     = { 6.5 * rgbSpecMults[1],  5.5 * rgbSpecMults[2],  3.25 * rgbSpecMults[3]},
					priority          = 13 * 10,
					radius            = 725.0,
					ttl               = 2.5 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 45.0,
				},
			},
			["crawl_blastsml"] = {
				explosionLightDef = {
					diffuseColor      = { 5.5,                    4.5,                    2.25                  },
					specularColor     = { 5.5 * rgbSpecMults[1],  4.5 * rgbSpecMults[2],  2.25 * rgbSpecMults[3]},
					priority          = 12 * 10,
					radius            = 675.0,
					ttl               = 2.5 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 35.0,
				},
			},

			["atomic_blast"] = {
				explosionLightDef = {
					diffuseColor      = { 6.0,                    5.0,                    4.5                  },
					specularColor     = { 6.0 * rgbSpecMults[1],  5.0 * rgbSpecMults[2],  4.5 * rgbSpecMults[3]},
					priority          = 13 * 10,
					radius            = 575.0,
					ttl               = 2 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 25.0,
				},
			},
			["atomic_blastsml"] = {
				explosionLightDef = {
					diffuseColor      = { 5.0,                    4.0,                    3.5                  },
					specularColor     = { 5.0 * rgbSpecMults[1],  4.0 * rgbSpecMults[2],  3.5 * rgbSpecMults[3]},
					priority          = 12 * 10,
					radius            = 525.0,
					ttl               = 2 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 25.0,
				},
			},


			-- Arm Retaliator / Core Silencer (large nuke) projectiles
			-- NOTE:
			--   uses a vertical offset to simulate an
			--   airburst, since the actual projectile
			--   detonates on ground impact
			--   ttl value roughly matches CEG duration
			["nuclear_missile"] = {
				projectileLightDef = {
					diffuseColor    = {5.0,                   5.0,                   0.0                  },
					specularColor   = {5.0 * rgbSpecMults[1], 5.0 * rgbSpecMults[2], 0.0 * rgbSpecMults[3]},
					priority        = 20 * 10,
					radius          = 1000.0,
					ttl             = 100000,
				},
				explosionLightDef = {
					diffuseColor      = {45.0,                   45.0,                   30.0                  },
					specularColor     = {45.0 * rgbSpecMults[1], 45.0 * rgbSpecMults[2], 30.0 * rgbSpecMults[3]},
					priority          = 20 * 10 + 1,
					radius            = 2500.0,
					ttl               = 8.5 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 250.0,
				},
			},

			-- Arm Stunner / Core Neutron (small nuke) projectiles
			["armemp_weapon"] = {
				projectileLightDef = {
					diffuseColor    = {3.0,                   3.0,                   0.0                  },
					specularColor   = {3.0 * rgbSpecMults[1], 3.0 * rgbSpecMults[2], 0.0 * rgbSpecMults[3]},
					priority        = 8 * 10,
					radius          = 400.0,
					ttl             = 100000,
				},
				explosionLightDef = {
					diffuseColor      = {12.0,                   12.0,                   8.0                  },
					specularColor     = {12.0 * rgbSpecMults[1], 12.0 * rgbSpecMults[2], 8.0 * rgbSpecMults[3]},
					priority          = 8 * 10 + 1,
					radius            = 575.0,
					ttl               = 2 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 125.0,
				},
			},


			-- Arm Bertha / Core Intimidator (main barrel) projectiles
			-- NOTE:
			--   basically the same as core_artillery
			--   since these share their CEG, but has
			
			--   higher priority
			["arm_berthacannon"] = {
				projectileLightDef = {
					diffuseColor    = {1.9,                   1.9,                   0.2                  },
					specularColor   = {1.9 * rgbSpecMults[1], 1.9 * rgbSpecMults[2], 0.2 * rgbSpecMults[3]},
					priority        = 5 * 10,
					radius          = 75.0,
					ttl             = 1000,
				},
				explosionLightDef = {
					diffuseColor      = {4.0,                   3.0,                   1.2                  },
					specularColor     = {2.0 * rgbSpecMults[1], 2.0 * rgbSpecMults[2], 0.9 * rgbSpecMults[3]},
					priority          = 3 * 10 + 1,
					radius            = 200.0,
					ttl               = 1 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 50.0,
				},
			},

			-- Arm Millennium / Core Warlord (Bertha) projectiles
			["arm_bats"] = {
				projectileLightDef = {
					diffuseColor    = {3.9,                   3.9,                   0.2                  },
					specularColor   = {3.9 * rgbSpecMults[1], 3.9 * rgbSpecMults[2], 0.2 * rgbSpecMults[3]},
					priority        = 5 * 10,
					radius          = 475.0,
					ttl             = 100000,
				},
				explosionLightDef = {
					diffuseColor      = {4.0,                   3.0,                   1.2                  },
					specularColor     = {4.0 * rgbSpecMults[1], 3.0 * rgbSpecMults[2], 1.2 * rgbSpecMults[3]},
					priority          = 5 * 10 + 1,
					radius            = 500.0,
					ttl               = 2 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 50.0,
				},
			},

			["t1_plasma_weapon"] = {
					projectileLightDef = {
					diffuseColor    = {0.9,                   0.9,                   0.2                  },
					specularColor   = {0.9 * rgbSpecMults[1], 0.9 * rgbSpecMults[2], 0.2 * rgbSpecMults[3]},
					priority        = 3 * 10,
					radius          = 55.0,
					ttl             = 100000,
				},
					explosionLightDef = {
					diffuseColor      = {4.0,                   2.5,                   0.2                  },
					specularColor     = {1.0 * rgbSpecMults[1], 1.0 * rgbSpecMults[2], 0.2 * rgbSpecMults[3]},
					radius            = 45.0,
					priority          = 3 * 10 + 1,
					ttl               = 1.3 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 30.0,
				},
			},
		},
	},
}

local modLightDefs = dynLightDefs[Game.modShortName]
local modCopyDefs = copyLightDefs[Game.modShortName]

-- insert copy-definitions for each light that has one
if (modLightDefs ~= nil and modCopyDefs ~= nil) then
	for dstWeaponDef, srcWeaponDef in pairs(modCopyDefs) do
		modLightDefs.weaponLightDefs[dstWeaponDef] = {}

		srcLightDefTbl = modLightDefs.weaponLightDefs[srcWeaponDef]
		dstLightDefTbl = modLightDefs.weaponLightDefs[dstWeaponDef]

		CopyTable(srcLightDefTbl, dstLightDefTbl)
	end
end

return dynLightDefs


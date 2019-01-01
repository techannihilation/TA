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
		--Self-D , Explosion for large units eg corkrog and commanders etc
		["commander_blast1"          ] = "commander_blast_new",  
		["commander_blast5"          ] = "commander_blast_new",
		["commander_blast6"          ] = "commander_blast_new",
		["commander_blast7"          ] = "commander_blast_new",
		["commander_blast8"          ] = "commander_blast_new",
		["commander_selfd"           ] = "commander_blast_new",

		["commander_blast4"          ] = "commander_blast",
		["nuclear_missile"           ] = "commander_blast_small",  --1420
		["nuclear_missile1"          ] = "commander_blast_small",  --1280
		["nuclear_missile2"          ] = "commander_blast_small",
		["nuclear_missile3"          ] = "commander_blast_small",
		["nuclear_missile4"          ] = "commander_blast_small",
		["crblmssl"                  ] = "commander_blast",  --1920
		["crblmssl1"                 ] = "commander_blast_big",  --2120
		["crblmssl2"                 ] = "commander_blast_exsmall",  --920
		["crblmssl4"                 ] = "commander_blast_exbig",  --2720
		["atomic_blast"              ] = "atomic_blast",
		["atomic_blastsml"           ] = "atomic_blastsml",

		--Brthas
		["armbrtha_arm_berthacannon2"] = "berthacannon",
		["corint_core_intimidator2"  ] = "berthacannon",
		--["tlllrpt_arm_berthacannon  "] = "berthacannon",
		["heavyimpact_cormechart"    ] = "berthacannon",
		--["clb_core_intimidator2"     ] = "berthacannon_light",
		--["avtr_arm_berthacannon2"    ] = "berthacannon_light",
		--["corint1_core_intimidator1" ] = "berthacannon1",
		--["armbrtha1_arm_berthacannon1"] = "berthacannon1",
		["tlldmc_tlldmc"]              = "dark_matter",
		["corgala_ravagerbeam"  ]      = "galacannon",

		--Dgun
		--[[
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
		["tllcom1_tll_disintegrator"] = "arm_disintegrator",
		["tllcom3_tll_disintegrator1"] = "arm_disintegrator",
		["tllcom5_tll_disintegrator2"] = "arm_disintegrator",
		["tllcom6_tll_disintegrator2"] = "arm_disintegrator",
		["tllcom7_tll_disintegrator2"] = "arm_disintegrator",
		--]]

		--nukes
		--["corsilo_crblmssl"          ] = "nuke_crblmssl",
		--["corsilo1_crblmssl1"        ] = "nuke_crblmssl1",
		--["corfsilo_corfsilo_weapon"  ] = "fnuke_missile1",
		--["tllsilo_crblmssl"          ] = "nuke_missile",
		--["armsilo_nuclear_missile"   ] = "nuke_missile",
		--["armsilo1_nuclear_missile1" ] = "nuke_missile1",
		--["armfsilo_armfsilo_weapon"  ] = "fnuke_missile",
		["armcybr_arm_pidr"          ] = "mini_nuke",
		
		--Emp / Tacnuke
		["armemp_armemp_weapon"      ] = "emp_weapon",
		["cortron_cortron_weapon"    ] = "tron_weapon",
		["tllemp_armemp_weapon"      ] = "emp_weapon",

		--Juno
		["ajuno_juno_pulse"          ] = "juno",
		["cjuno_juno_pulse"          ] = "juno",
		["tlljuno_juno_pulse"          ] = "juno",
	},
}
local dynLightDefs = {
	["TA"] = {
		weaponLightDefs = {
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
		
			-- explodeas/selfdestructas lights for various large units
			["commander_blast_exbig"] = {
				explosionLightDef = {
					diffuseColor      = { 6.0,                    6.0,                    6                  },
					specularColor     = { 6.0 * rgbSpecMults[1],  6.0 * rgbSpecMults[2],  6 * rgbSpecMults[3]},
					priority          = 15 * 10,
					radius            = 2820.0,
					ttl               = 3 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 65.0,
				},
			},
			
			["commander_blast_big"] = {
				explosionLightDef = {
					diffuseColor      = { 6.0,                    6.0,                    6                  },
					specularColor     = { 6.0 * rgbSpecMults[1],  6.0 * rgbSpecMults[2],  6 * rgbSpecMults[3]},
					priority          = 15 * 10,
					radius            = 2220.0,
					ttl               = 3 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 65.0,
				},
			},
			["commander_blast"] = { 
				explosionLightDef = {
					diffuseColor      = { 6.0,                    6.0,                    6                  },
					specularColor     = { 6.0 * rgbSpecMults[1],  6.0 * rgbSpecMults[2],  6 * rgbSpecMults[3]},
					priority          = 15 * 10,
					radius            = 2020.0,
					ttl               = 3 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 65.0,
				},
			},
			["commander_blast_new"] = { 
				explosionLightDef = {
					diffuseColor      = { 7.0,                    4.0,                    4.0                  },
					specularColor     = { 7.0 * rgbSpecMults[1],  4.0 * rgbSpecMults[2],  4.0 * rgbSpecMults[3]},
					priority          = 15 * 10,
					radius            = 2000.0,
					ttl               = 4.5 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 165.0,
				},
			},
			["commander_blast_small"] = {
				explosionLightDef = {
					diffuseColor      = { 6.0,                    6.0,                    6                  },
					specularColor     = { 6.0 * rgbSpecMults[1],  6.0 * rgbSpecMults[2],  6 * rgbSpecMults[3]},
					priority          = 15 * 10,
					radius            = 1520.0,
					ttl               = 3 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 65.0,
				},
			},
			["commander_blast_exsmall"] = {
				explosionLightDef = {
					diffuseColor      = { 6.0,                    6.0,                    6                  },
					specularColor     = { 6.0 * rgbSpecMults[1],  6.0 * rgbSpecMults[2],  6 * rgbSpecMults[3]},
					priority          = 15 * 10,
					radius            = 1020.0,
					ttl               = 2 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 65.0,
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
			["nuke_missile"] = {
				projectileLightDef = {
					diffuseColor    = {3.0,                   1.0,                   0.0                  },
					specularColor   = {3.0 * rgbSpecMults[1], 1.0 * rgbSpecMults[2], 0.0 * rgbSpecMults[3]},
					priority        = 20 * 10,
					radius          = 300.0,
					ttl             = 100000,
					ignoreLOS       = false,
				},
				explosionLightDef = {
					diffuseColor      = {45.0,                   45.0,                   30.0                  },
					specularColor     = {45.0 * rgbSpecMults[1], 45.0 * rgbSpecMults[2], 30.0 * rgbSpecMults[3]},
					priority          = 20 * 10 + 1,
					radius            = 1600.0,
					ttl               = 2 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 250.0,
				},
			},

			["nuke_missile1"] = {
				projectileLightDef = {
					diffuseColor    = {3.0,                   1.0,                   0.0                  },
					specularColor   = {3.0 * rgbSpecMults[1], 1.0 * rgbSpecMults[2], 0.0 * rgbSpecMults[3]},
					priority        = 30 * 10,
					radius          = 320.0,
					ttl             = 100000,
					ignoreLOS       = false,
				},
				explosionLightDef = {
					diffuseColor      = {45.0,                   45.0,                   30.0                  },
					specularColor     = {45.0 * rgbSpecMults[1], 45.0 * rgbSpecMults[2], 30.0 * rgbSpecMults[3]},
					priority          = 30 * 10 + 1,
					radius            = 1800.0,
					ttl               = 2.0 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 250.0,
				},
			},

			["nuke_crblmssl"] = {
				projectileLightDef = {
					diffuseColor    = {3.0,                   1.0,                   0.0                  },
					specularColor   = {3.0 * rgbSpecMults[1], 1.0 * rgbSpecMults[2], 0.0 * rgbSpecMults[3]},
					priority        = 20 * 10,
					radius          = 300.0,
					ttl             = 100000,
					ignoreLOS       = false,
				},
				explosionLightDef = {
					diffuseColor      = {45.0,                   45.0,                   30.0                  },
					specularColor     = {45.0 * rgbSpecMults[1], 45.0 * rgbSpecMults[2], 30.0 * rgbSpecMults[3]},
					priority          = 20 * 10 + 1,
					radius            = 2000.0,
					ttl               = 2.0 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 250.0,
				},
			},

			["nuke_crblmssl1"] = {
				projectileLightDef = {
					diffuseColor    = {3.0,                   1.0,                   0.0                  },
					specularColor   = {3.0 * rgbSpecMults[1], 1.0 * rgbSpecMults[2], 0.0 * rgbSpecMults[3]},
					priority        = 30 * 10,
					radius          = 320.0,
					ttl             = 100000,
					ignoreLOS       = false,
				},
				explosionLightDef = {
					diffuseColor      = {45.0,                   45.0,                   30.0                  },
					specularColor     = {45.0 * rgbSpecMults[1], 45.0 * rgbSpecMults[2], 30.0 * rgbSpecMults[3]},
					priority          = 30 * 10 + 1,
					radius            = 2250.0,
					ttl               = 2.2 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 250.0,
				},
			},

			["fnuke_missile"] = {
				projectileLightDef = {
					diffuseColor    = {3.0,                   1.0,                   0.0                  },
					specularColor   = {3.0 * rgbSpecMults[1], 1.0 * rgbSpecMults[2], 0.0 * rgbSpecMults[3]},
					priority        = 20 * 10,
					radius          = 400.0,
					ttl             = 100000,
					ignoreLOS       = false,
				},
				explosionLightDef = {
					diffuseColor      = {45.0,                   45.0,                   30.0                  },
					specularColor     = {45.0 * rgbSpecMults[1], 45.0 * rgbSpecMults[2], 30.0 * rgbSpecMults[3]},
					priority          = 40 * 10 + 1,
					radius            = 2920.0,
					ttl               = 2.5 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 250.0,
				},
			},

			["fnuke_missile1"] = {
				projectileLightDef = {
					diffuseColor    = {3.0,                   1.0,                   0.0                  },
					specularColor   = {3.0 * rgbSpecMults[1], 1.0 * rgbSpecMults[2], 0.0 * rgbSpecMults[3]},
					priority        = 40 * 10,
					radius          = 400.0,
					ttl             = 100000,
					ignoreLOS       = false,
				},
				explosionLightDef = {
					diffuseColor      = {45.0,                   45.0,                   30.0                  },
					specularColor     = {45.0 * rgbSpecMults[1], 45.0 * rgbSpecMults[2], 30.0 * rgbSpecMults[3]},
					priority          = 40 * 10 + 1,
					radius            = 3120.0,
					ttl               = 2.5 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 250.0,
				},
			},

			["mini_nuke"] = {
				explosionLightDef = {
					diffuseColor      = {2.0,                   2.0,                   2.0                  },
					specularColor     = {2.0 * rgbSpecMults[1], 2.0 * rgbSpecMults[2], 2.0 * rgbSpecMults[3]},
					priority          = 20 * 10 + 1,
					radius            = 640.0,
					ttl               = 2.8 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 250.0,
				},
			},
			-- Arm Stunner / Core Neutron (small nuke) projectiles
			["emp_weapon"] = {
				projectileLightDef = {
					diffuseColor    = {3.0,                   2.0,                   2.0                  },
					specularColor   = {3.0 * rgbSpecMults[1], 2.0 * rgbSpecMults[2], 2.0 * rgbSpecMults[3]},
					priority        = 8 * 10,
					radius          = 200.0,
					ttl             = 100000,
					ignoreLOS       = false,
				},
				explosionLightDef = {
					diffuseColor      = {12.0,                   12.0,                   8.0                  },
					specularColor     = {12.0 * rgbSpecMults[1], 12.0 * rgbSpecMults[2], 8.0 * rgbSpecMults[3]},
					priority          = 8 * 10 + 1,
					radius            = 375.0,
					ttl               = 2 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 125.0,
				},
			},

			["tron_weapon"] = {
				projectileLightDef = {
					diffuseColor    = {3.0,                   2.0,                   2.0                  },
					specularColor   = {3.0 * rgbSpecMults[1], 2.0 * rgbSpecMults[2], 2.0 * rgbSpecMults[3]},
					priority        = 8 * 10,
					radius          = 200.0,
					ttl             = 100000,
					ignoreLOS       = false,
				},
				explosionLightDef = {
					diffuseColor      = {12.0,                   12.0,                   8.0                  },
					specularColor     = {12.0 * rgbSpecMults[1], 12.0 * rgbSpecMults[2], 8.0 * rgbSpecMults[3]},
					priority          = 8 * 10 + 1,
					radius            = 610.0,
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
			["berthacannon_light"] = {
				projectileLightDef = {
					diffuseColor    = {0.8,                   0.6,                   0.0                  },
					specularColor   = {1.9 * rgbSpecMults[1], 0.9 * rgbSpecMults[2], 0.0 * rgbSpecMults[3]},
					priority        = 5 * 10,
					radius          = 105.0,
					ttl             = 1000,
				},
				
			explosionLightDef = {
					diffuseColor      = {1.7,                   1.2,                   0.0                  },
					specularColor     = {1.7 * rgbSpecMults[1], 1.2 * rgbSpecMults[2], 0.0 * rgbSpecMults[3]},
					priority          = 2 * 10 + 1,
					radius            = 205.0,
					ttl               = 2 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 150.0,
				},
			},
			
			["berthacannon"] = {
				projectileLightDef = {
					diffuseColor    = {1.6,                   1.2,                   0.0                  },
					specularColor   = {1.9 * rgbSpecMults[1], 0.9 * rgbSpecMults[2], 0.0 * rgbSpecMults[3]},
					priority        = 5 * 10,
					radius          = 125.0,
					ttl             = 1000,
				},
				
				explosionLightDef = {
					diffuseColor      = {1.7,                   1.2,                   0.0                  },
					specularColor     = {1.7 * rgbSpecMults[1], 1.2 * rgbSpecMults[2], 0.0 * rgbSpecMults[3]},
					priority          = 3 * 10 + 1,
					radius            = 220.0,
					ttl               = 2 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 150.0,
				},
			},

			["berthacannon1"] = {
				projectileLightDef = {
					diffuseColor    = {2.4,                   1.8,                   0.0                  },
					specularColor   = {1.9 * rgbSpecMults[1], 0.9 * rgbSpecMults[2], 0.0 * rgbSpecMults[3]},
					priority        = 5 * 10,
					radius          = 185.0,
					ttl             = 1000,
				},
				
				explosionLightDef = {
					diffuseColor      = {1.7,                   1.2,                   0.0                  },
					specularColor     = {1.7 * rgbSpecMults[1], 1.2 * rgbSpecMults[2], 0.0 * rgbSpecMults[3]},
					priority          = 3 * 10 + 1,
					radius            = 310.0,
					ttl               = 2 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 150.0,
				},
			},

			["dark_matter"] = {
				projectileLightDef = {
					diffuseColor    = {1.4,                   0.2,                   0.2                  },
					specularColor   = {1.2 * rgbSpecMults[1], 0.2 * rgbSpecMults[2], 0.2 * rgbSpecMults[3]},
					priority        = 5 * 10,
					radius          = 155.0,
					ttl             = 100,
				},
				
				explosionLightDef = {
					diffuseColor      = {1.4,                   0.5,                   0.2                  },
					specularColor     = {1.4 * rgbSpecMults[1], 1.2 * rgbSpecMults[2], 0.2 * rgbSpecMults[3]},
					priority          = 3 * 10 + 1,
					radius            = 600.0,
					ttl               = 2 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 150.0,
				},
			},

			["galacannon"] = {
				projectileLightDef = {
					diffuseColor    = {1.6,                   1.2,                   0.0                  },
					specularColor   = {1.9 * rgbSpecMults[1], 0.9 * rgbSpecMults[2], 0.0 * rgbSpecMults[3]},
					priority        = 5 * 10,
					radius          = 400.0,
					ttl             = 1000,
				},
				
				explosionLightDef = {
					diffuseColor      = {1.7,                   1.2,                   0.0                  },
					specularColor     = {1.7 * rgbSpecMults[1], 1.2 * rgbSpecMults[2], 0.0 * rgbSpecMults[3]},
					priority          = 3 * 10 + 1,
					radius            = 700.0,
					ttl               = 2 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 150.0,
				},
			},

			-- Juno Weapon
			["juno"] = {
				projectileLightDef = {
					diffuseColor    = {2.9,                   1.9,                   0.2                  },
					specularColor   = {2.9 * rgbSpecMults[1], 1.9 * rgbSpecMults[2], 0.2 * rgbSpecMults[3]},
					priority        = 5 * 10,
					radius          = 125.0,
					ttl             = 1000,
				},
				explosionLightDef = {
					diffuseColor      = {2.0,                   2.0,                   1.2                  },
					specularColor     = {2.0 * rgbSpecMults[1], 2.0 * rgbSpecMults[2], 1.2 * rgbSpecMults[3]},
					priority          = 3 * 10 + 1,
					radius            = 1620.0,
					ttl               = 2 * Game.gameSpeed,
					decayFunctionType = {0.0, 0.0, 0.0},
					altitudeOffset    = 150.0,
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


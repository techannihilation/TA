local modConfig = {}
-- TechA
--to support other mods
--table initialized and unitList is needed!
modConfig["TA"] = {}
modConfig["TA"]["unitList"] =
							{
								--Arm
									--Ground Weapons--
								armclaw = { weapons = { 1 } },
								--amortor = { weapons = { 1 } },
								armllt = { weapons = { 1 } },
								armfllt = { weapons = { 1 } },
								--armllt1 = { weapons = { 1 } },
								armbeamer = { weapons = { 1 } },
								armgrape = { weapons = { 1 } },
								armhlt = { weapons = { 1 } },
								armvhlt = { weapons = { 1 } },
								armguard = { weapons = { 1, 1 } },
								armfguard = { weapons = { 1, 1 } },
								arm_immolator = { weapons = { 1 } },
								armamb = { weapons = { 1,1 } }, --ambusher
								armpb = { weapons = { 1 } }, --pitbull
								armanni = { weapons = { 1 } },
								armanni1 = { weapons = { 1 } },
								aspdbunk = { weapons = { 1 } },
								armdl = { weapons = { 1 } }, --depthcharge
								ajuno = { weapons = { 1 } },
								armtl = { weapons = { 1 } }, --torp launcher
								armatl = { weapons = { 1 } }, --adv torp launcher
								armfhlt = { weapons = { 1 } },  --floating hlt
								arm_immolator = { weapons = { 1 } },
								armamb = { weapons = { 1,1 } }, --ambusher
								armpb = { weapons = { 1 } }, --pitbull
								armanni = { weapons = { 1 } },
								armanni1 = { weapons = { 1 } },
								aspdbunk = { weapons = { 1 } },
								armemp = { weapons = { 1 } },
								armbrtha = { weapons = { 1 } },
								armbrtha1 = { weapons = { 1 } },
								arm_emp_lrpt = { weapons = { 1 } },
								armvulc = { weapons = { 1 } },
								armvulc1 = { weapons = { 1 } },
								armvulc2 = { weapons = { 1 } },
								armtabi = { weapons = { 1 } },
								armpcan = { weapons = { 1 } },

									--Anti-Air--
								armrl = { weapons = { 2 } }, --light aa
								--armrl1 = { weapons = { 2 } },
								armpack = { weapons = { 2 } },
								armcir = { weapons = { 2 } }, --chainsaw
								armfrt = { weapons = { 2 } },  --floating rocket laucher
								armflak = { weapons = { 2 } },
								armfflak = { weapons = { 2 } },
								armmercury = { weapons = { 2 } },
								armhys = { weapons = { 2 } },

									--Anti-Nuke--
								armamd = { weapons = { 3 } }, --antinuke
								armamd1 = { weapons = { 3 } }, --antinuke
								armamd2 = { weapons = { 3 } }, --antinuke
								armmds = { weapons = { 3 } }, --Missile Defence System
								armcarry = { weapons = { 1 } }, --antinuke
								armucar = { weapons = { 1 } }, --antinuke
								corucar = { weapons = { 1 } }, --antinuke

								--Core
									--Ground Weapons--
								cormaw = { weapons = { 1 } },
								--corexp = { weapons = { 1 } },
								cormaw = { weapons = { 1 } },
								corllt = { weapons = { 1 } },
								cofllt = { weapons = { 1 } },
								--corllt1 = { weapons = { 1 } },
								corhllt = { weapons = { 1 } },
								corhlt = { weapons = { 1 } },
								corvhlt = { weapons = { 1 } },
								corfhlt = { weapons = { 1 } },
								corpun = { weapons = { 1, 1 } },
								corfpun = { weapons = { 1, 1 } },
								cordl = { weapons = { 1 } },
								cjuno = { weapons = { 1 } },
								coranta = { weapons = { 1 } },
								corbhmth = { weapons = { 1 } },
								corboucher = { weapons = { 1 } },
								corfhlt = { weapons = { 1 } },  --floating hlt
								cortl = { weapons = { 1 } }, --torp launcher
								coratl = { weapons = { 1 } }, --adv torp launcher
								cormexp = { weapons = { 1,1 } },
								cortoast = { weapons = { 1 } },
								corvipe = { weapons = { 1 } },
								cordoom = { weapons = { 1 } },
								cordoom1 = { weapons = { 1 } },
								corint = { weapons = { 1 } },
								corint1 = { weapons = { 1 } },
								corbuzz = { weapons = { 1 } },
								corbuzz1 = { weapons = { 1 } },
								corbuzz2 = { weapons = { 1 } },
								core_immolator = { weapons = { 1 } },
								core_immolator1	 = { weapons = { 1 } },
								corhllt = { weapons = { 1 } },
								armnebraska = { weapons = { 1 } },
								core_emp_lrpt = { weapons = { 1 } },
								corpcan = { weapons = { 1 } },
								cormmds = { weapons = { 3 } }, --Missile Defence System

									--Anti-Air--
								corfrt = { weapons = { 2 } }, --floating rocket laucher
								corrl = { weapons = { 2 } },
								--corrl1 = { weapons = { 2 } },
								corsam = { weapons = { 2 } },
								corerad = { weapons = { 2 } },
								corenaa = { weapons = { 2 } },
								corflak = { weapons = { 2 } },
								corscreamer = { weapons = { 2 } },
								corpre = { weapons = { 2 } },

									--Anti-Nuke--
								corfmd = { weapons = { 3 } },
								corfmd1 = { weapons = { 3 } },
								corfmd2 = { weapons = { 3 } },
								cortron = { weapons = { 3 } },
								gok_eveningstar = { weapons = { 3 } },
								rumad_antinuke = { weapons = { 1 } },
								rumad_antinuke1 = { weapons = { 1 } },
								corarbritator = { weapons = { 3 } },
								talon_carry = { weapons = { 1 } },
								talon_ucar = { weapons = { 6 } },

								--TLL
									--Ground Weapons--
								tllatorp = { weapons = { 1 } },
								tlldcsta = { weapons = { 1 } },
								tllemp = { weapons = { 1 } },
								tllatorp = { weapons = { 1 } },
								tllhlt = { weapons = { 1 } },
								tllhltns = { weapons = { 1 } },
								tlllrpt = { weapons = { 1 } },
								tllobliterator = { weapons = { 1 } },
								tllobliterator1 = { weapons = { 1 } },
								tll_immolator = { weapons = { 1 } },
								tllarch = { weapons = { 1 } },
								tll_hydre1 = { weapons = { 1 } },
								tllfllt = { weapons = { 1 } },
								tllgeo_armored = { weapons = { 1 } },
								tlllrpt1 = { weapons = { 1 } },
								tllvhlt = { weapons = { 1 } },
								tllplasma = { weapons = { 1 } },
								tllpulaser = { weapons = { 1 } },
								tllrlrpc = { weapons = { 1 } },
								tllshoretorp = { weapons = { 1 } },
								--tllstuner = { weapons = { 1 } },
								tlltorp = { weapons = { 1 } },
								tllllt = { weapons = { 1 } },
								tlllft = { weapons = { 1 } },
								tlldmc = { weapons = { 1 } },
								tlllbt = { weapons = { 1,1 } },
								tlltrid = { weapons = { 1 } },
								tllkrak = { weapons = { 1 } },
								tlljuno = { weapons = { 1 } },
								tllpcan = { weapons = { 1 } },
								tll_hydre = { weapons = { 1 } },
								tll_hydre1 = { weapons = { 1 } },
								tll_hydre2 = { weapons = { 1 } },

								--Anti-Air--
								tlllmt = { weapons = { 2 } },
								--tlllmt1 = { weapons = { 2 } },
								tlllmtns = { weapons = { 2 } },
								tllnssam = { weapons = { 2 } },
								tllflak = { weapons = { 2 } },
								tllfflak = { weapons = { 2 } },
								tllsam = { weapons = { 2 } },
								tlldb = { weapons = { 2 } },
								tllhmt = { weapons = { 2 } },
								tlltetanos = { weapons = { 2 } },

								--Anti-Nuke--
								tllantinuke = { weapons = { 3 } },
								tllantinuke1 = { weapons = { 3 } },
								tllantinuke2 = { weapons = { 3 } },

									--TALON
									--Ground Weapons--
								talon_llt = { weapons = { 1 } },
								--talon_llt1 = { weapons = { 1 } },
								talon_kevlar = { weapons = { 1 } },
								talon_blt = { weapons = { 1 } },
								talon_blt1 = { weapons = { 1 } },
								talon_sprinkler = { weapons = { 1 } },
								talon_fsprinkler = { weapons = { 1 } },
								talon_veloute = { weapons = { 1 } },
								talon_veloute1 = { weapons = { 1 } },
								talon_veloute2 = { weapons = { 1 } },
								talon_lrpt = { weapons = { 1 } },
								talon_lrpt1 = { weapons = { 1 } },
								talon_slinger = { weapons = { 1 } },
								talon_dmc = { weapons = { 1 } },
								talon_tl = { weapons = { 1 } },
								talon_atl = { weapons = { 1 } },
								talon_hlt = { weapons = { 1 } },
								talon_juno = { weapons = { 1 } },

								gok_slesh = { weapons = { 1 } },
								gok_slesh1 = { weapons = { 1 } },
								gok_blackdawn = { weapons = { 1 } },
								gok_llt = { weapons = { 1 } },
								gok_lrpt = { weapons = { 1 } },
								gok_lrpt1 = { weapons = { 1 } },
								gok_meteor = { weapons = { 1 } },
								gok_meteor1 = { weapons = { 1 } },
								gok_meteor2 = { weapons = { 1 } },
								gok_juno = { weapons = { 1 } },

								--RUMAD
								rumad_llt = { weapons = { 1 } },
								rumad_pt = { weapons = { 1 } },
								rumad_hotshot = { weapons = { 1 } },
								rumad_orb = { weapons = { 1 } },
								rumad_triton = { weapons = { 1 } },


									-- AntiAir
								talon_popcorn = { weapons = { 2 } },
								talon_popcorn1 = { weapons = { 2 } },
								gok_flak = { weapons = { 2 } },
								gok_eflak = { weapons = { 2 } },
								talon_rl = { weapons = { 2 } },
								gok_rl = { weapons = { 2 } },
								gok_frl = { weapons = { 2 } },
								talon_frl = { weapons = { 2 } },
								talon_cir = { weapons = { 2 } },
								gok_cir = { weapons = { 2 } },
								talon_ptr = { weapons = { 2 } },
								gok_ptr = { weapons = { 2 } },
								talon_kernel = { weapons = { 2 } },
								rumad_sam = { weapons = { 2 } },
								rumad_rl = { weapons = { 2 } },
								rumad_flak = { weapons = { 2 } },
								rumad_eflak = { weapons = { 2 } },
								rumad_ptr = { weapons = { 2 } },

								talon_damascus = { weapons = { 3 } },
								talon_damascus1 = { weapons = { 3 } },
								talon_damascus2 = { weapons = { 3 } },
								talon_armistice = { weapons = { 3 } },

								gok_antinuke = { weapons = { 3 } },
								gok_antinuke1 = { weapons = { 3 } },
								gok_antinuke2 = { weapons = { 3 } },
								gok_carry = { weapons = { 1 } },

								talon_mds = { weapons = { 3 } }, --Missile Defence System
								gok_mds = { weapons = { 3 } }, --Missile Defence System
								rumad_mds = { weapons = { 3 } }, --Missile Defence System
								armmds = { weapons = { 3 } }, --Missile Defence System
							}

--implement this if you want dps-depending ring-colors
--colors will be interpolated by dps scores between min and max values. values outside range will be set to nearest value in range -> min or max
modConfig["TA"]["armorTags"] = {}
modConfig["TA"]["armorTags"]["air"] = "default"
modConfig["TA"]["armorTags"]["ground"] = "default"
modConfig["TA"]["dps"] = {}
modConfig["TA"]["dps"]["ground"] = {}
modConfig["TA"]["dps"]["air"] = {}
modConfig["TA"]["dps"]["ground"]["min"] = 50
modConfig["TA"]["dps"]["ground"]["max"] = 500
modConfig["TA"]["dps"]["air"]["min"] = 80
modConfig["TA"]["dps"]["air"]["max"] = 500
--end of dps-colors
--implement this if you want custom colors - we dont want it for BA
modConfig["TA"]["color"] = {}
modConfig["TA"]["color"]["enemy"] = {}
modConfig["TA"]["color"]["enemy"]["ground"] = {}
modConfig["TA"]["color"]["enemy"]["air"] = {}

modConfig["TA"]["color"]["enemy"]["nuke"] = {}
modConfig["TA"]["color"]["enemy"]["ground"]["min"] = { 1.0, 0.0, 0.0 }
modConfig["TA"]["color"]["enemy"]["ground"]["max"] = { 1.0, 1.0, 0.0 }
modConfig["TA"]["color"]["enemy"]["air"]["min"] = { 0.0, 1.0, 0.0 }

modConfig["TA"]["color"]["enemy"]["air"]["max"] = { 0.0, 0.0, 1.0 }
modConfig["TA"]["color"]["enemy"]["nuke"] =  { 1.0, 1.0, 1.0 }
modConfig["TA"]["color"]["ally"] = modConfig["TA"]["color"]["enemy"]
--end of custom colors
--end of TA

--DEFAULT COLOR CONFIG
--is used when no game-specfic color config is found in current game-definition
local colorConfig = {}
colorConfig["enemy"] = {}
colorConfig["enemy"]["ground"]= {}
colorConfig["enemy"]["ground"]["min"]= {}
colorConfig["enemy"]["ground"]["max"]= {}
colorConfig["enemy"]["air"]= {}
colorConfig["enemy"]["air"]["min"]= {}
colorConfig["enemy"]["air"]["max"]= {}
colorConfig["enemy"]["nuke"]= {}
colorConfig["enemy"]["ground"]["min"] = { 1.0, 0.0, 0.0 }
colorConfig["enemy"]["ground"]["max"] = { 1.0, 1.0, 0.0 }
colorConfig["enemy"]["air"]["min"] = { 0.0, 1.0, 0.0 }
colorConfig["enemy"]["air"]["max"] = { 0.0, 0.0, 1.0 }
colorConfig["enemy"]["nuke"] =  { 1.0, 1.0, 1.0 }

colorConfig["ally"] = colorConfig["enemy"]
--end of DEFAULT COLOR CONFIG
return modConfig, colorConfig

return {
	rumad_cv = {
		acceleration = 0.242,
		brakerate = 2.4816,
		buildcostenergy = 1922,
		buildcostmetal = 137,
		builddistance = 180,
		builder = true,
		buildpic = "rumad_cv.dds",
		buildtime = 4000,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canreclamate = 1,
		canstop = 1,
		category = "ALL MOBILE SMALL SURFACE UNDERWATER",
		collisionvolumeoffsets = "0 0 -1",
		collisionvolumescales = "35 22 50",
		collisionvolumetype = "Box",
		corpse = "dead",
		defaultmissiontype = "Standby",
		description = "Tech Level 1",
		energymake = 10,
		energystorage = 50,
		explodeas = "BIG_UNITEX",
		footprintx = 3,
		footprintz = 3,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		losemitheight = 24,
		maneuverleashlength = 640,
		mass = 137,
		maxdamage = 1055,
		maxslope = 16,
		maxvelocity = 1.85,
		maxwaterdepth = 18,
		metalmake = 0.1,
		metalstorage = 25,
		mobilestandorders = 1,
		movementclass = "TANK3",
		name = "Construction Vehicle",
		noautofire = false,
		objectname = "rumad/rumad_cv.s3o",
		radardistance = 50,
		radaremitheight = 24,
		reclaimspeed = 40,
		repairspeed = 40,
		script = "rumad_acv.cob",
		selfdestructas = "BIG_UNIT",
		shownanospray = false,
		sightdistance = 260,
		standingmoveorder = 1,
		steeringmode = 1,
		trackoffset = 12,
		trackstrength = 6,
		trackstretch = 1,
		tracktype = "StdTank",
		trackwidth = 35,
		turninplace = 1,
		turninplaceanglelimit = 60,
		turninplacespeedlimit = 1.2705,
		turnrate = 435,
		unitname = "rumad_cv",
		workertime = 80,
		buildoptions = {
			[1] = "rumad_solar",
			[2] = "rumad_advsolar",
			[3] = "rumad_win",
			[4] = "rumad_win1",
			[5] = "rumad_geo",
			[6] = "rumad_mex",
			[7] = "rumad_mex1",
			[8] = "rumad_metalmakerlvl1",
			--[9] = "",
			[10] = "rumad_mstor",
			[11] = "rumad_estor",
			[12] = "rumad_lab",
			[13] = "rumad_vp",
			[14] = "rumad_avp",
			[15] = "rumad_ap",
			[16] = "rumad_nanotc",
			[17] = "rumad_gate2",
			[18] = "rumad_eyes",
			[19] = "rumad_drag",
			[20] = "rumad_rad",
			[21] = "rumad_jam",
			[22] = "rumad_juno",
			[23] = "rumad_llt",
			[24] = "rumad_pt",
			[25] = "rumad_mortor",
			[26] = "rumad_rl",
			[27] = "rumad_sam",
			[28] = "rumad_cir",
		},
		customparams = {
			buildpic = "rumad_cv.dds",
			faction = "RUMAD",
			normaltex = "unittextures/rumad_normals.dds",
		},
		featuredefs = {
			dead = {
				blocking = true,
				collisionvolumeoffsets = "2.14814758301 -0.0528551147461 0.625",
				collisionvolumescales = "39.296295166 32.5338897705 48.75",
				collisionvolumetype = "Box",
				damage = 1405,
				description = "Construction Vehicle Wreckage",
				energy = 0,
				featuredead = "heap",
				footprintx = 3,
				footprintz = 3,
				metal = 102,
				object = "rumad/rumad_cv_dead.s3o",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
			heap = {
				blocking = false,
				damage = 1757,
				description = "Construction Vehicle Debris",
				energy = 0,
				footprintx = 3,
				footprintz = 3,
				metal = 54,
				object = "3x3c.s3o",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
		},
		nanocolor = {
			[1] = 0.072,
			[2] = 0.472,
			[3] = 0.072,
		},
		sfxtypes = {
			pieceexplosiongenerators = {
				[1] = "piecetrail0",
				[2] = "piecetrail1",
				[3] = "piecetrail2",
				[4] = "piecetrail3",
				[5] = "piecetrail4",
				[6] = "piecetrail6",
			},
		},
		sounds = {
			build = "nanlath1",
			canceldestruct = "cancel2",
			repair = "repair1",
			underattack = "warning1",
			working = "reclaim1",
			cant = {
				[1] = "cantdo4",
			},
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			ok = {
				[1] = "varmmove",
			},
			select = {
				[1] = "varmsel",
			},
		},
	},
}

return {
	talon_ch = {
		acceleration = 0.288,
		brakerate = 0.9,
		buildcostenergy = 3285,
		buildcostmetal = 171,
		builddistance = 180,
		builder = true,
		buildpic = "talon_ch.dds",
		buildtime = 5000,
		canguard = true,
		canhover = true,
		canmove = true,
		canpatrol = true,
		canreclamate = 1,
		canstop = 1,
		category = "ALL MOBILE SMALL SURFACE",
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "31 31 45",
		collisionvolumetype = "CylZ",
		corpse = "dead",
		defaultmissiontype = "Standby",
		description = "Tech Level 1",
		energymake = 30,
		energystorage = 30,
		explodeas = "BIG_UNITEX",
		footprintx = 3,
		footprintz = 3,
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 25,
		maneuverleashlength = 640,
		mass = 171,
		maxdamage = 975,
		maxslope = 16,
		maxvelocity = 2.3,
		maxwaterdepth = 0,
		metalmake = 0.1,
		metalstorage = 10,
		mobilestandorders = 1,
		movementclass = "HOVER3",
		name = "Construction Gravitank",
		noautofire = false,
		objectname = "talon/talon_ch.s3o",
		radaremitheight = 25,
		seismicsignature = 0,
		reclaimspeed = 50,
		repairspeed = 50,
		selfdestructas = "BIG_UNIT",
		shownanospray = false,
		sightdistance = 351,
		standingmoveorder = 1,
		steeringmode = 1,
		turninplace = 1,
		turninplaceanglelimit = 60,
		turninplacespeedlimit = 1.6698,
		turnrate = 425,
		unitname = "talon_ch",
		workertime = 100,
		buildoptions = {
			[1] = "talon_solar",
			[2] = "talon_advsolar",
			[3] = "talon_win",
			[4] = "talon_win1",
			[5] = "talon_geo",
			[6] = "talon_mstor",
			[7] = "talon_estor",
			[8] = "talon_mex",
			[9] = "talon_mex1",
			[10] = "talon_makr",
			[11] = "talon_makr1",
			[12] = "talon_clone_lab",
			[13] = "talon_vp",
			[14] = "talon_ap",
			[15] = "talon_hp",
			[16] = "talon_ahp",
			[17] = "talon_nanotc",
			[18] = "talon_eye",
			[19] = "talon_rad",
			[20] = "talon_conspiracy",
			[21] = "talon_juno",
			[22] = "talon_gate2",
			[23] = "talon_drag",
			[24] = "talon_llt",
			[25] = "talon_kevlar",
			[26] = "talon_hlt",
			[27] = "talon_dl",
			[28] = "talon_painless",
			[29] = "talon_rl",
			[30] = "talon_cir",
			[31] = "talon_tide",
			[32] = "talon_tide1",
			[33] = "talon_fmkr",
			[34] = "talon_hpns",
			[35] = "talon_ahpns",
			[36] = "talon_sy",
			[37] = "talon_asy",
			[38] = "talon_fnanotc",
			[39] = "talon_frad",
			[40] = "talon_sonar",
			[41] = "talon_fdrag",
			[42] = "talon_tl",
			[43] = "talon_fhlt",
			[44] = "talon_frl",
		},
		customparams = {
			buildpic = "talon_ch.dds",
			faction = "TALON",
			normaltex = "unittextures/talon_normals.dds",
		},
		featuredefs = {
			dead = {
				blocking = false,
				collisionvolumeoffsets = "0.0 -1.56249816895 0.0184326171875",
				collisionvolumescales = "24.4295043945 10.1600036621 29.846862793",
				collisionvolumetype = "Box",
				damage = 1453,
				description = "Construction Hovercraft Wreckage",
				energy = 0,
				featuredead = "heap",
				footprintx = 3,
				footprintz = 3,
				metal = 108,
				object = "talon/talon_ch_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				damage = 1816,
				description = "Construction Hovercraft Debris",
				energy = 0,
				footprintx = 3,
				footprintz = 3,
				metal = 58,
				object = "3x3a.s3o",
				reclaimable = true,
			},
		},
		nanocolor = {
			[1] = 0.12,
			[2] = 0.52,
			[3] = 0.12,
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
				[1] = "hovmdok1",
			},
			select = {
				[1] = "hovmdsl1",
			},
		},
	},
}

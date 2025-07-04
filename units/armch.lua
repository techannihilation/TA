return {
	armch = {
		acceleration = 0.288,
		brakerate = 0.9,
		buildcostenergy = 2891,
		buildcostmetal = 175,
		builddistance = 180,
		builder = true,
		buildpic = "armch.dds",
		buildtime = 5000,
		canguard = true,
		canhover = true,
		canmove = true,
		canpatrol = true,
		canreclamate = 1,
		canstop = 1,
		category = "ALL MOBILE SMALL SURFACE",
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "31 12 31",
		collisionvolumetype = "CylY",
		corpse = "dead",
		defaultmissiontype = "Standby",
		description = "Tech Level 1",
		energymake = 15,
		energystorage = 15,
		explodeas = "BIG_UNITEX",
		footprintx = 3,
		footprintz = 3,
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 22,
		maneuverleashlength = 640,
		mass = 216,
		maxdamage = 1095,
		maxslope = 16,
		maxvelocity = 2.5,
		maxwaterdepth = 0,
		metalmake = 0.15,
		metalstorage = 15,
		mobilestandorders = 1,
		movementclass = "HOVER3",
		name = "Construction Hovercraft",
		noautofire = false,
		objectname = "arm/armch.s3o",
		radaremitheight = 22,
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
		unitname = "armch",
		workertime = 100,
		buildoptions = {
			[1] = "armsolar",
			[2] = "armadvsol",
			[3] = "armwin",
			[4] = "armawin",
			[5] = "armgeo",
			[6] = "armmstor",
			[7] = "armestor",
			[8] = "armmex",
			[9] = "armmex1",
			[10] = "armmakr",
			[11] = "armamaker",
			[12] = "armlab",
			[13] = "armvp",
			[14] = "armap",
			[15] = "armhp",
			[16] = "aahp",
			[17] = "armnanotc",
			[18] = "armeyes",
			[19] = "armrad",
			[20] = "armjamt",
			[21] = "armjamt",
			[22] = "ajuno",
			[23] = "armgate2",
			[24] = "armdrag",
			[25] = "armclaw",
			[26] = "armllt",
			[27] = "armgrape",
			[28] = "armhlt",
			[29] = "armdl",
			[30] = "armguard",
			[31] = "armbrtha2",
			[32] = "armrl",
			[33] = "armpack",
			[34] = "armcir",
			[35] = "armtide",
			[36] = "armatidal",
			[37] = "armfmkr",
			[38] = "armfhp",
			[39] = "aahpns",
			[40] = "armsy",
			[41] = "armasy",
			[42] = "armfnanotc",
			[43] = "armfdrag",
			[44] = "armfrad",
			[45] = "armsonar",
			[46] = "armfllt",
			[47] = "armfhlt",
			[48] = "armfrt",
			[49] = "armtl",
		},
		customparams = {
			buildpic = "armch.dds",
			faction = "ARM",
			normaltex = "unittextures/arm_normals.dds",
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
				object = "arm/armch_dead.s3o",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
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
				customparams = {
					fromunit = 1,
				},
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

return {
	rumad_ecv = {
		acceleration = 0.1,
		brakerate = 1.8,
		buildcostenergy = 102100,
		buildcostmetal = 4545,
		builddistance = 400,
		builder = true,
		buildpic = "rumad_ecv.dds",
		buildtime = 150000,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canreclamate = 1,
		canstop = 1,
		category = "ALL LARGE MOBILE SURFACE UNDERWATER",
		collisionvolumeoffsets = "0 -4 0",
		collisionvolumescales = "39,30,39",
		collisionvolumetype = "CylY",
		corpse = "dead",
		defaultmissiontype = "Standby",
		description = "Tech Level 3",
		energymake = 50,
		energystorage = 100,
		explodeas = "BIG_UNITEX",
		footprintx = 4,
		footprintz = 5,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		losemitheight = 27,
		maneuverleashlength = 640,
		mass = 4545,
		maxdamage = 4980,
		maxslope = 16,
		maxvelocity = 1.75,
		maxwaterdepth = 18,
		metalmake = 0.5,
		metalstorage = 100,
		mobilestandorders = 1,
		movementclass = "TANK4",
		name = "Construction Vehicle",
		noautofire = false,
		objectname = "rumad/rumad_ecv.s3o",
		radaremitheight = 27,
		seismicsignature = 0,
		reclaimspeed = 240,
		repairspeed = 240,
		selfdestructas = "CRAWL_BLASTSML",
		shownanospray = false,
		sightdistance = 500,
		standingmoveorder = 1,
		steeringmode = 1,
		trackoffset = 0,
		trackstrength = 6,
		trackstretch = 1,
		tracktype = "StdTank",
		trackwidth = 42,
		turninplace = 0,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 1.155,
		turnrate = 400,
		unitname = "rumad_ecv",
		workertime = 480,
		buildoptions = {
			[1] = "rumad_sfusion",
			[2] = "rumad_egeo",
			[3] = "rumad_emex",
			[4] = "rumad_metalmakerlvl3",
			[5] = "rumad_eestor",
			[6] = "rumad_emstor",
			[7] = "rumad_vp",
			[8] = "rumad_avp",
			[9] = "rumad_evp",
			[10] = "rumad_ulab",
			[11] = "rumad_nanotc2",
			[12] = "rumad_edrag",
			[13] = "rumad_ejam",
			[14] = "rumad_gate4",
			[15] = "rumad_lrpt1",
			[16] = "rumad_rainfire2",
			[17] = "rumad_antinuke1",
			[18] = "rumad_silo1",
			[19] = "rumad_erl",
			[20] = "rumad_hotshot1",
			[21] = "portal",
		},
		customparams = {
			buildpic = "rumad_ecv.dds",
			faction = "RUMAD",
			normaltex = "unittextures/rumad_normals.dds",
		},
		featuredefs = {
			dead = {
				blocking = true,
				damage = 9015,
				description = "Vehicle Construction Wreckage",
				featuredead = "heap",
				footprintx = 4,
				footprintz = 4,
				object = "rumad/rumad_ecv_dead.s3o",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
			heap = {
				blocking = false,
				damage = 32237,
				description = "Vehicle Debris",
				footprintx = 4,
				footprintz = 4,
				object = "4x4a.s3o",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
		},
		nanocolor = {
			[1] = 0.24,
			[2] = 0.64,
			[3] = 0.24,
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

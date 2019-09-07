return {
	talon_cv = {
		acceleration = 0.242,
		brakerate = 2.4816,
		buildcostenergy = 1922,
		buildcostmetal = 137,
		builddistance = 172,
		builder = true,
		buildpic = "talon_cv.dds",
		buildtime = 4066,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canreclamate = 1,
		canstop = 1,
		category = "ALL CONSTR MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON SMALL SURFACE",
		corpse = "dead",
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "24 20 42",
		collisionvolumetype = "Box",
		defaultmissiontype = "Standby",
		description = "Tech Level 1",
		energystorage = 50,
		explodeas = "BIG_UNITEX",
		footprintx = 3,
		footprintz = 3,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		losemitheight = 25,
		maneuverleashlength = 640,
		mass = 206.66667,
		maxdamage = 1240,
		maxslope = 16,
		maxvelocity = 1.925,
		maxwaterdepth = 18,
		metalmake = 0.1,
		metalstorage = 50,
		mobilestandorders = 1,
		movementclass = "TANK3",
		name = "Construction Vehicle",
		noautofire = false,
		nochasecategory = "SUB VTOL",
		objectname = "talon_cv",
		radardistance = 50,
		radaremitheight = 25,
		seismicsignature = 0,
		selfdestructas = "BIG_UNIT",
		shownanospray = false,
		sightdistance = 253,
		standingmoveorder = 1,
		steeringmode = 1,
		terraformspeed = 270,
		trackoffset = 12,
		trackstrength = 6,
		trackstretch = 1,
		tracktype = "StdTank",
		trackwidth = 22,
		turninplace = 1,
		turninplaceanglelimit = 60,
		turninplacespeedlimit = 1.2705,
		turnrate = 435,
		unitname = "talon_cv",
		workertime = 90,
		buildoptions = {
			[1] = "talon_solar",
			[2] = "talon_win",
			[3] = "talon_geo",
			[4] = "talon_mstor",
			[5] = "talon_estor",
			[6] = "talon_mex",
			[7] = "talon_makr",
			[8] = "talon_clone_lab",
			[9] = "talon_vp",
			[10] = "talon_avp",
			[11] = "talon_ap",
			[12] = "talon_hp",
			[13] = "talon_nanotc",
			[14] = "talon_rad",
			[15] = "talon_conspiracy",
			[16] = "talon_juno",
			[17] = "talon_gate2",
			[18] = "talon_drag",
			[19] = "talon_llt",
			[20] = "talon_hlt",
			[21] = "talon_painless",
			[22] = "talon_rl",
			[23] = "talon_cir",
			[24] = "talon_sy",
		},
		customparams = {
			buildpic = "talon_cv.dds",
			faction = "TALON",
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
				object = "talon_cv_DEAD",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				damage = 1757,
				description = "Construction Vehicle Debris",
				energy = 0,
				footprintx = 3,
				footprintz = 3,
				metal = 54,
				object = "3X3C",
				reclaimable = true,
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
return {
	rumad_mfus = {
		acceleration = 0.1,
		brakerate = 1.8,
		buildcostenergy = 24020,
		buildcostmetal = 2865,
		buildpic = "rumad_mfus.dds",
		buildtime = 150000,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = 1,
		category = "ALL LARGE MOBILE SURFACE UNDERWATER",
		collisionvolumeoffsets = "0 -4 0",
		collisionvolumescales = "39,30,39",
		collisionvolumetype = "CylY",
		corpse = "dead",
		defaultmissiontype = "Standby",
		description = "Produces Energy",
		energymake = 750,
		energystorage = 750,
		explodeas = "CRAWL_BLAST",
		footprintx = 5,
		footprintz = 5,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		losemitheight = 27,
		maneuverleashlength = 640,
		mass = 2865,
		maxdamage = 3850,
		maxslope = 16,
		maxvelocity = 1.0,
		maxwaterdepth = 18,
		mobilestandorders = 1,
		movementclass = "TANK5",
		name = "Vehicle Fusion Reactor",
		noautofire = false,
		objectname = "rumad_mfus",
		radaremitheight = 27,
		seismicsignature = 0,
		selfdestructas = "CRAWL_BLAST",
		shownanospray = false,
		sightdistance = 200,
		standingmoveorder = 1,
		steeringmode = 1,
		trackoffset = 0,
		trackstrength = 6,
		trackstretch = 1,
		tracktype = "StdTank",
		trackwidth = 45,
		turninplace = 0,
		turninplaceanglelimit = 120,
		turninplacespeedlimit = 1.0,
		turnrate = 250,
		unitname = "rumad_mfus",
		customparams = {
			buildpic = "rumad_mfus.dds",
			faction = "RUMAD",
		},
		featuredefs = {
			dead = {
				blocking = true,
				damage = 9015,
				description = "Vehicle Construction Wreckage",
				featuredead = "heap",
				footprintx = 4,
				footprintz = 4,
				object = "rumad_mfus_DEAD",
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
				object = "4X4A",
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
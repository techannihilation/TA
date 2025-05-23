return {
	talon_jewel = {
		acceleration = 0.0132,
		brakerate = 0.4125,
		buildcostenergy = 13841,
		buildcostmetal = 1214,
		builder = false,
		buildpic = "talon_jewel.dds",
		buildtime = 25000,
		canattack = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = 1,
		category = "ALL MEDIUM MOBILE SURFACE UNDERWATER",
		collisionvolumeoffsets = "0 -5 2",
		collisionvolumescales = "39 51 39",
		collisionvolumetype = "CylY",
		corpse = "dead",
		defaultmissiontype = "Standby",
		description = "Mobile Tachyon Weapon",
		explodeas = "ESTOR_BUILDINGEX",
		firestandorders = 1,
		footprintx = 3,
		footprintz = 3,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		losemitheight = 35,
		maneuverleashlength = 640,
		mass = 1200,
		maxdamage = 2185,
		maxslope = 12,
		maxvelocity = 1.2,
		maxwaterdepth = 0,
		mobilestandorders = 1,
		movementclass = "TANK3",
		name = "Jewel",
		noautofire = false,
		objectname = "talon/talon_jewel.s3o",
		radaremitheight = 35,
		seismicsignature = 0,
		selfdestructas = "ESTOR_BUILDING",
		sightdistance = 450,
		standingfireorder = 2,
		standingmoveorder = 1,
		steeringmode = 1,
		trackoffset = 16,
		trackstrength = 10,
		trackstretch = 1,
		tracktype = "StdTank",
		trackwidth = 31,
		turninplace = 0,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 0.9,
		turnrate = 200,
		unitname = "talon_jewel",
		customparams = {
			buildpic = "talon_jewel.dds",
			faction = "TALON",
			normaltex = "unittextures/talon_normals.dds",
		},
		featuredefs = {
			dead = {
				blocking = true,
				collisionvolumeoffsets = "0.488914489746 -0.0356475219727 -0.0921630859375",
				collisionvolumescales = "42.3086700439 54.9257049561 44.5536499023",
				collisionvolumetype = "Box",
				damage = 2378,
				description = "Jewel Wreckage",
				energy = 0,
				featuredead = "heap",
				footprintx = 3,
				footprintz = 3,
				metal = 900,
				object = "talon/talon_jewel_dead.s3o",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
			heap = {
				blocking = false,
				damage = 2973,
				description = "Jewel Debris",
				energy = 0,
				footprintx = 3,
				footprintz = 3,
				metal = 480,
				object = "3x3c.s3o",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
		},
		sfxtypes = {
			pieceexplosiongenerators = {
				"piecetrail0",
				"piecetrail1",
				"piecetrail2",
				"piecetrail3",
				"piecetrail4",
				"piecetrail6",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
			underattack = "warning1",
			cant = {
				"cantdo4",
			},
			count = {
				"count6",
				"count5",
				"count4",
				"count3",
				"count2",
				"count1",
			},
			ok = {
				"tarmmove",
			},
			select = {
				"tarmsel",
			},
		},
		weapondefs = {
			blt = {
				areaofeffect = 16,
				beamtime = 0.5,
				corethickness = 0.1,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				energypershot = 750,
				explosiongenerator = "custom:BURN_WHITE",
				firestarter = 90,
				impactonly = 1,
				impulseboost = 0,
				impulsefactor = 0,
				laserflaresize = 10,
				name = "Talon Beam",
				noselfdamage = true,
				range = 965,
				reloadtime = 4,
				rgbcolor = "0.1 0.9 1.0",
				soundhitdry = "",
				soundhitwet = "sizzle",
				soundhitwetvolume = 0.5,
				soundstart = "talon_laser",
				soundtrigger = 1,
				sweepfire = false,
				targetmoveerror = 0.3,
				thickness = 2,
				turret = true,
				weapontype = "BeamLaser",
				weaponvelocity = 1000,
				damage = {
					default = 1800,
					subs = 5,
				},
				tracks = false,
			},
		},
		weapons = {
			{
				badtargetcategory = "SMALL MINOR",
				def = "BLT",
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
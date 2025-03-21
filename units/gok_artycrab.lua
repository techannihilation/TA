return {
	gok_artycrab = {
		acceleration = 0.55,
		brakerate = 0.75,
		buildcostenergy = 145016,
		buildcostmetal = 8675,
		builder = false,
		buildpic = "gok_artycrab.dds",
		buildtime = 160000,
		canattack = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = 1,
		category = "ALL LARGE MOBILE SURFACE UNDERWATER",
		collisionvolumeoffsets = "-3 -19 2",
		collisionvolumescales = "100 97 93",
		collisionvolumetype = "ellipsoid",
		corpse = "dead",
		defaultmissiontype = "Standby",
		description = "All-Terrain Artillery Quadrupod",
		explodeas = "CRAWL_BLAST",
		firestandorders = 1,
		footprintx = 4,
		footprintz = 4,
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 63,
		maneuverleashlength = 640,
		mass = 11975,
		maxdamage = 31565,
		maxslope = 20,
		maxvelocity = 1.2,
		maxwaterdepth = 12,
		mobilestandorders = 1,
		movementclass = "HTKBOT4",
		name = "Onyx",
		noautofire = false,
		objectname = "gok/gok_artycrab.s3o",
		onoffable = true,
		radardistance = 0,
		radaremitheight = 62,
		seismicsigniture = 0,
		selfdestructas = "BANTHA_BLAST",
		selfdestructcountdown = 10,
		sightdistance = 600,
		standingfireorder = 2,
		standingmoveorder = 1,
		steeringmode = 1,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 0.627,
		turnrate = 100,
		unitname = "gok_artycrab",
		customparams = {
			buildpic = "gok_artycrab.dds",
			faction = "GOK",
			normaltex = "unittextures/gok_normals.dds",
		},
		featuredefs = {
			dead = {
				blocking = true,
				damage = 21130,
				description = "Crabe Wreckage",
				featuredead = "heap",
				footprintx = 5,
				footprintz = 4,
				metal = 8962,
				object = "gok/gok_artycrab_dead.s3o",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
			heap = {
				blocking = false,
				damage = 26412,
				description = "Crabe Debris",
				footprintx = 3,
				footprintz = 3,
				metal = 4780,
				object = "3x3d.s3o",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
		},
		sfxtypes = {
			explosiongenerators = {
				"custom:GOKFLARE",
			},
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
				"kbcormov",
			},
			select = {
				"kbcorsel",
			},
		},
		weapondefs = {
			gok_gun = {
				accuracy = 400,
				areaofeffect = 256,
				avoidfeature = false,
				cegtag = "gokblaster",
				craterareaofeffect = 256,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.5,
				explosiongenerator = "custom:GOK-FLASH",
				gravityaffected = "TRUE",
				impulseboost = 0.123,
				impulsefactor = 2,
				name = "Jocond Canon",
				nogap = 1,
				noselfdamage = true,
				proximitypriority = -2,
				range = 1400,
				reloadtime = 4.5,
				rgbcolor = "0.78 0.08 0.52",
				separation = 0.45,
				size = 3.0,
				sizedecay = -0.15,
				soundhitdry = "xplomed2",
				soundhitwet = "splslrg",
				soundhitwetvolume = 0.6,
				soundstart = "cannhvy5",
				stages = 20,
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 440,
				damage = {
					commanders = 900,
					default = 1800,
					subs = 5,
				},
				tracks = false,
			},
		},
		weapons = {
			{
				badtargetcategory = "SMALL MINOR MEDIUM",
				def = "GOK_GUN",
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
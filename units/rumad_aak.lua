return {
	rumad_aak = {
		acceleration = 0.12,
		airsightdistance = 800,
		brakerate = 0.564,
		buildcostenergy = 6750,
		buildcostmetal = 535,
		buildpic = "rumad_aak.dds",
		buildtime = 12500,
		canmove = true,
		category = "ALL MEDIUM MOBILE SURFACE UNDERWATER",
		collisionvolumeoffsets = "0 -1 1",
		collisionvolumescales = "25 32 16",
		collisionvolumetype = "Box",
		corpse = "dead",
		defaultmissiontype = "Standby",
		description = "Advanced Amphibious Anti-Air Kbot",
		explodeas = "BIG_UNITEX",
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 28,
		maneuverleashlength = 640,
		mass = 535,
		maxdamage = 1290,
		maxslope = 14,
		maxvelocity = 1.35,
		movementclass = "AKBOT2",
		name = "Demos",
		objectname = "rumad_aak",
		radaremitheight = 28,
		seismicsignature = 0,
		selfdestructas = "BIG_UNIT",
		sightdistance = 400,
		steeringmode = 2,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 1.0428,
		turnrate = 1021,
		unitname = "rumad_aak",
		upright = true,
		customparams = {
			buildpic = "rumad_aak.dds",
			faction = "RUMAD",
			prioritytarget = "air",
		},
		featuredefs = {
			dead = {
				blocking = true,
				collisionvolumeoffsets = "0 0 0",
				collisionvolumescales = "30 14 32",
				collisionvolumetype = "Box",
				damage = 1214,
				description = "Demos Wreckage",
				energy = 0,
				featuredead = "heap",
				footprintx = 4,
				footprintz = 4,
				metal = 464,
				object = "rumad_aak_DEAD",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
			heap = {
				blocking = false,
				damage = 1517,
				description = "Demos Debris",
				energy = 0,
				footprintx = 4,
				footprintz = 4,
				metal = 247,
				object = "4X4A",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
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
			canceldestruct = "cancel2",
			underattack = "warning1",
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
				[1] = "kbarmmov",
			},
			select = {
				[1] = "kbarmsel",
			},
		},
		weapondefs = {
			rumad_flak_gun = {
				accuracy = 250,
				areaofeffect = 96,
				avoidfeature = false,
				burnblow = true,
				canattackground = false,
				cegtag = "rumadflak-fx",
				craterareaofeffect = 96,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.85,
				explosiongenerator = "custom:FLASH3",
				gravityaffected = true,
				impulseboost = 0,
				impulsefactor = 0,
				name = "FlakCannon",
				noselfdamage = true,
				range = 800,
				reloadtime = 0.30,
				rgbcolor = "1.0 0.5 0.0",
				size = 2,
				soundhitdry = "flakhit",
				soundhitwet = "splslrg",
				soundhitwetvolume = 0.6,
				soundstart = "flakfire",
				turret = true,
				weapontimer = 1,
				weapontype = "Cannon",
				weaponvelocity = 1800,
				damage = {
					areoship = 18.75,
					default = 5,
					air = 75,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "MINOR MAJOR", --Ground AA
				def = "RUMAD_FLAK_GUN",
				onlytargetcategory = "VTOL",
			},
			[2] = {
				badtargetcategory = "MINOR MAJOR", --Ground AA
				def = "RUMAD_FLAK_GUN",
				onlytargetcategory = "VTOL",
				slaveto = 1,
			},
		},
	},
}
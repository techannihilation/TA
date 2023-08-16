return {
	rumad_zorga = {
		acceleration = 0.12,
		brakerate = 0.75,
		buildcostenergy = 11400,
		buildcostmetal = 760,
		builder = false,
		buildpic = "rumad_zorga.dds",
		buildtime = 14000,
		canattack = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = 1,
		category = "ALL MEDIUM MOBILE SURFACE UNDERWATER",
		collisionvolumeoffsets = "0 -1 0",
		collisionvolumescales = "30 40 20",
		collisionvolumetype = "Box",
		corpse = "dead",
		defaultmissiontype = "Standby",
		description = "Heavy JetPack Assault Kbot",
		energymake = 0,
		explodeas = "BIG_UNITEX",
		firestandorders = 1,
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 46,
		maneuverleashlength = 640,
		mass = 760,
		maxdamage = 4690,
		maxslope = 15,
		maxvelocity = 1.35,
		maxwaterdepth = 23,
		mobilestandorders = 1,
		movementclass = "KBOT2",
		name = "Zorga",
		noautofire = false,
		objectname = "rumad_zorga",
		radaremitheight = 46,
		seismicsignature = 0,
		selfdestructas = "BIG_UNIT",
		sightdistance = 350,
		standingfireorder = 2,
		standingmoveorder = 1,
		steeringmode = 2,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 1.0,
		turnrate = 700,
		unitname = "rumad_zorga",
		upright = true,
		customparams = {
			buildpic = "rumad_zorga.dds",
			faction = "RUMAD",
			canjump = "1",
		},
		featuredefs = {
			dead = {
				blocking = true,
				collisionvolumeoffsets = "-4 -5 2",
				collisionvolumescales = "39 11 32",
				collisionvolumetype = "Box",
				damage = 2726,
				description = "Zorga Wreckage",
				energy = 0,
				featuredead = "heap",
				footprintx = 2,
				footprintz = 2,
				metal = 337,
				object = "rumad_zorga_DEAD",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
			heap = {
				blocking = false,
				damage = 3408,
				description = "Zorga Debris",
				energy = 0,
				footprintx = 2,
				footprintz = 2,
				metal = 180,
				object = "2X2E",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:armmuzzle",
			},
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
			rumad_gauss = {
				areaofeffect = 24,
				avoidfeature = false,
				burnblow = true,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				impulseboost = 0.123,
				impulsefactor = 2.0,
				minbarrelangle = -15,
				name = "Gauss Cannon",
				noselfdamage = true,
				projectiles = 3,
				range = 460,
				reloadtime = 2.4,
				rgbcolor = "1 0.95 0.9",
				size = 1,
				soundhitdry = "xplomed2",
				soundhitwet = "splshbig",
				soundhitwetvolume = 0.4,
				SprayAngle = 600,
				soundstart = "techa_sounds/rumad_gauss",
				targetmoveerror = 0.2,
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 500,
				damage = {
					default = 180,
					subs = 5,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "SMALL MINOR",
				def = "RUMAD_GAUSS",
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
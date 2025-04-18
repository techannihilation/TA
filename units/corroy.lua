return {
	corroy = {
		acceleration = 0.05,
		activatewhenbuilt = true,
		brakerate = 0.3,
		buildangle = 16384,
		buildcostenergy = 6306,
		buildcostmetal = 1093,
		builder = false,
		buildpic = "corroy.dds",
		buildtime = 14000,
		canattack = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = 1,
		category = "ALL LARGE MOBILE SURFACE UNDERWATER",
		collisionvolumeoffsets = "0 -5 0",
		collisionvolumescales = "34 34 80",
		collisionvolumetype = "CylZ",
		corpse = "dead",
		defaultmissiontype = "Standby",
		description = "Destroyer",
		explodeas = "BIG_UNITEX",
		firestandorders = 1,
		floater = true,
		footprintx = 4,
		footprintz = 4,
		icontype = "sea",
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 25,
		maneuverleashlength = 640,
		mass = 1093,
		maxdamage = 3095,
		maxvelocity = 2.15,
		minwaterdepth = 12,
		mobilestandorders = 1,
		movementclass = "BOAT4",
		name = "Enforcer",
		noautofire = false,
		objectname = "core/corroy.s3o",
		radaremitheight = 25,
		seismicsignature = 0,
		selfdestructas = "BIG_UNIT",
		sightdistance = 465,
		sonardistance = 400,
		standingfireorder = 2,
		standingmoveorder = 1,
		steeringmode = 1,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 1.914,
		turnrate = 193,
		unitname = "corroy",
		waterline = 1,
		customparams = {
			buildpic = "corroy.dds",
			faction = "CORE",
			normaltex = "unittextures/core_normals.dds",
		},
		featuredefs = {
			dead = {
				blocking = false,
				collisionvolumeoffsets = "0.0580749511719 -0.062504465332 -0.201034545898",
				collisionvolumescales = "33.2652587891 20.5109710693 79.4415893555",
				collisionvolumetype = "Box",
				damage = 2589,
				description = "Enforcer Wreckage",
				energy = 0,
				featuredead = "heap",
				footprintx = 5,
				footprintz = 5,
				metal = 817,
				object = "core/corroy_dead.s3o",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
			heap = {
				blocking = false,
				damage = 3236,
				description = "Enforcer Debris",
				energy = 0,
				footprintx = 2,
				footprintz = 2,
				metal = 436,
				object = "5x5d.s3o",
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
				"shcormov",
			},
			select = {
				"shcorsel",
			},
		},
		weapondefs = {
			core_roy = {
				alphadecay = 0.3,
				areaofeffect = 128,
				avoidfeature = false,
				cegtag = "Trail_cannon",
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				explosiongenerator = "custom:FLASH4",
				gravityaffected = "TRUE",
				impulseboost = 0.123,
				impulsefactor = 0.123,
				name = "HeavyCannon",
				nogap = 1,
				noselfdamage = true,
				range = 600,
				reloadtime = 2.5,
				rgbcolor = "0.86 0.62 0",
				separation = 0.45,
				size = 1.53,
				sizedecay = -0.15,
				soundhitdry = "xplomed2",
				soundhitwet = "splssml",
				soundhitwetvolume = 0.6,
				soundstart = "cannhvy1",
				stages = 20,
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 320,
				damage = {
					default = 320,
					subs = 5,
				},
				tracks = false,
			},
			depthcharge = {
				areaofeffect = 32,
				avoidfeature = false,
				avoidfriendly = false,
				burnblow = true,
				collidefriendly = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.99,
				explosiongenerator = "custom:FLASH2",
				flighttime = 1.25,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				model = "WEAPON_DEPTHCHARGE.s3o",
				name = "DepthCharge",
				noselfdamage = true,
				range = 400,
				reloadtime = 2.5,
				soundhitdry = "xplodep2",
				soundhitwet = "xplodep2",
				soundstart = "torpedo1",
				startvelocity = 140,
				tolerance = 1000,
				tracks = false,
				turnrate = 8000,
				turret = true,
				waterweapon = true,
				weaponacceleration = 25,
				weapontimer = 3,
				weapontype = "TorpedoLauncher",
				weaponvelocity = 200,
				damage = {
					default = 140,
					subs = 280,
				},
			},
		},
		weapons = {
			{
				def = "CORE_ROY",
				onlytargetcategory = "SURFACE",
			},
			{
				badtargetcategory = "SURFACE",
				def = "DEPTHCHARGE",
				onlytargetcategory = "UNDERWATER",
			},
		},
	},
}
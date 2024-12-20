return {
	talon_wolf = {
		acceleration = 0.12,
		activatewhenbuilt = false,
		brakerate = 1.125,
		buildcostenergy = 5704,
		buildcostmetal = 258,
		builder = false,
		buildpic = "talon_wolf.dds",
		buildtime = 5250,
		canattack = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = 1,
		category = "ALL MEDIUM MOBILE SURFACE UNDERWATER",
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "33 36 35",
		collisionvolumetype = "Box",
		corpse = "dead",
		defaultmissiontype = "Standby",
		description = "Skirmish Kbot",
		explodeas = "BIG_UNITEX",
		firestandorders = 1,
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 27,
		maneuverleashlength = 640,
		mass = 270,
		maxdamage = 760,
		maxslope = 14,
		maxvelocity = 2.15,
		maxwaterdepth = 12,
		mobilestandorders = 1,
		movementclass = "KBOT2",
		name = "Wolf",
		noautofire = false,
		objectname = "talon/talon_wolf.s3o",
		radaremitheight = 27,
		seismicsignature = 0,
		selfdestructas = "BIG_UNIT",
		sightdistance = 400,
		standingfireorder = 2,
		standingmoveorder = 1,
		steeringmode = 2,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 1.518,
		turnrate = 990,
		unitname = "talon_wolf",
		upright = false,
		customparams = {
			buildpic = "talon_wolf.dds",
			faction = "ARM",
			normaltex = "unittextures/talon_normals.dds",
		},
		featuredefs = {
			dead = {
				blocking = true,
				collisionvolumeoffsets = -11.6622,
				collisionvolumescales = "32.719619751 19.6731262207 35.1108398438",
				collisionvolumetype = "Box",
				damage = 1392,
				description = "Wolf Wreckage",
				energy = 0,
				featuredead = "heap",
				footprintx = 2,
				footprintz = 2,
				metal = 202,
				object = "talon/talon_wolf_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				damage = 1741,
				description = "Wolf Debris",
				energy = 0,
				footprintx = 2,
				footprintz = 2,
				metal = 108,
				object = "2x2a.s3o",
				reclaimable = true,
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
				"kbarmmov",
			},
			select = {
				"kbarmsel",
			},
		},
		weapondefs = {
			talon_laser = {
				areaofeffect = 12,
				beamtime = 0.12,
				corethickness = 0.175,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				explosiongenerator = "custom:SMALL_RED_BURN",
				firestarter = 30,
				impactonly = 1,
				impulseboost = 0,
				impulsefactor = 0,
				laserflaresize = 10,
				name = "Light Rapid Talon Gun",
				noselfdamage = true,
				range = 550,
				reloadtime = 0.3,
				rgbcolor = "1.0 0.8 0.25",
				rgbcolor2 = "1.0 1.0 1.00",
				soundhitdry = "talongunhit",
				soundhitwet = "sizzle",
				soundhitwetvolume = 0.5,
				soundstart = "talongunfirerapid",
				soundtrigger = 1,
				sweepfire = false,
				targetmoveerror = 0.1,
				thickness = 1,
				tolerance = 500,
				turret = true,
				weapontype = "LaserCannon",
				weaponvelocity = 850,
				damage = {
					default = 45,
					subs = 5,
				},
				tracks = false,
			},
		},
		weapons = {
			{
				def = "TALON_LASER",
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
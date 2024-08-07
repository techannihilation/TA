return {
	gok_sunstrike = {
		acceleration = 0.02,
		brakerate = 0.2,
		buildcostenergy = 14750,
		buildcostmetal = 930,
		builder = false,
		buildpic = "gok_sunstrike.dds",
		buildtime = 17000,
		canattack = true,
		canguard = true,
		canhover = true,
		canmove = true,
		canpatrol = true,
		canstop = 1,
		category = "ALL MEDIUM MOBILE SURFACE",
		collisionvolumeoffsets = "0 -2 0",
		collisionvolumescales = "38 32 60",
		collisionvolumetype = "Box",
		corpse = "dead",
		defaultmissiontype = "Standby",
		description = "Rocket Hover",
		downloadable = 1,
		explodeas = "BIG_UNITEX",
		firestandorders = 1,
		footprintx = 4,
		footprintz = 4,
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 25,
		maneuverleashlength = 640,
		mass = 360,
		maxdamage = 1520,
		maxslope = 16,
		maxvelocity = 1.75,
		maxwaterdepth = 0,
		mobilestandorders = 1,
		movementclass = "TANKHOVER4",
		name = "Sun Strike",
		noautofire = false,
		objectname = "gok/gok_sunstrike.s3o",
		radaremitheight = 25,
		selfdestructas = "BIG_UNIT",
		sightdistance = 350,
		standingfireorder = 2,
		standingmoveorder = 1,
		steeringmode = 1,
		turninplace = 0,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 2.244,
		turnrate = 375,
		unitname = "gok_sunstrike",
		customparams = {
			buildpic = "gok_sunstrike.dds",
			faction = "GOK",
			normaltex = "unittextures/gok_normals.dds",
		},
		featuredefs = {
			dead = {
				blocking = true,
				damage = 1035,
				description = "November Wreckage",
				featuredead = "heap",
				featurereclaimate = "smudge01",
				footprintx = 3,
				footprintz = 3,
				metal = 270,
				object = "gok/gok_sunstrike_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				damage = 1294,
				description = "November Debris",
				footprintx = 3,
				footprintz = 3,
				metal = 144,
				object = "3x3a.s3o",
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
				"hovmdok1",
			},
			select = {
				"hovmdsl1",
			},
		},
		weapondefs = {
			gok_starburst = {
				areaofeffect = 64,
				avoidfeature = false,
				cegtag = "gokstartbursttrail",
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				explosiongenerator = "custom:FLASH3",
				firestarter = 100,
				flighttime = 10,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				metalpershot = 0,
				model = "weapon_missile_gok.s3o",
				name = "RocketArtillery",
				noselfdamage = true,
				range = 1400,
				reloadtime = 20,
				smoketrail = false,
				soundhitdry = "xplomed4",
				soundhitwet = "splssml",
				soundhitwetvolume = 0.6,
				soundstart = "Rockhvy1",
				targetable = 16,
				texture1 = "null",
				texture2 = "null",
				texture3 = "null",
				texture4 = "null",
				tolerance = 4000,
				turnrate = 24384,
				weaponacceleration = 102.4,
				weapontimer = 3,
				weapontype = "StarburstLauncher",
				weaponvelocity = 600,
				damage = {
					default = 2000,
					subs = 5,
				},
				tracks = false,
			},
		},
		weapons = {
			{
				badtargetcategory = "MOBILE",
				def = "GOK_STARBURST",
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
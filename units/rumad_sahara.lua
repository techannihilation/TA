return {
	rumad_sahara = {
		acceleration = 0.0242,
		brakerate = 0.1485,
		buildcostenergy = 29800,
		buildcostmetal = 2250,
		builder = false,
		buildpic = "rumad_sahara.dds",
		buildtime = 25000,
		canattack = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = 1,
		category = "ALL MEDIUM MOBILE SURFACE UNDERWATER",
		collisionvolumeoffsets = "0 -10 -1",
		collisionvolumescales = "50 50 50",
		collisionvolumetype = "CylZ",
		corpse = "dead",
		defaultmissiontype = "Standby",
		description = "Very Heavy Assault Tank",
		explodeas = "BIG_UNIT",
		firestandorders = 1,
		footprintx = 4,
		footprintz = 4,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		losemitheight = 29,
		maneuverleashlength = 640,
		mass = 2250,
		maxdamage = 10950,
		maxslope = 12,
		maxvelocity = 1.5,
		maxwaterdepth = 12,
		mobilestandorders = 1,
		movementclass = "HTANK4",
		name = "Sahara",
		objectname = "rumad/rumad_sahara.s3o",
		radaremitheight = 29,
		seismicsignature = 0,
		selfdestructas = "CRAWL_BLASTSML",
		sightdistance = 415,
		standingfireorder = 2,
		standingmoveorder = 1,
		steeringmode = 1,
		trackoffset = 8,
		trackstrength = 10,
		trackstretch = 1,
		tracktype = "StdTank",
		trackwidth = 48,
		turninplace = 0,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 0.8,
		turnrate = 250,
		unitname = "rumad_sahara",
		customparams = {
			buildpic = "rumad_sahara.dds",
			faction = "RUMAD",
			normaltex = "unittextures/rumad_normals.dds",
		},
		featuredefs = {
			dead = {
				blocking = true,
				collisionvolumeoffsets = "0 0 0",
				collisionvolumescales = "60 16 60",
				collisionvolumetype = "Box",
				damage = 6216,
				description = "Sahara Wreckage",
				energy = 0,
				featuredead = "heap",
				footprintx = 4,
				footprintz = 4,
				metal = 1650,
				object = "rumad/rumad_sahara_dead.s3o",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
			heap = {
				blocking = false,
				damage = 7770,
				description = "Sahara Debris",
				energy = 0,
				footprintx = 4,
				footprintz = 4,
				metal = 880,
				object = "4x4c.s3o",
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
				"tcormove",
			},
			select = {
				"tcorsel",
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
				name = "Gauss Cannon",
				noselfdamage = true,
				projectiles = 3,
				range = 460,
				reloadtime = 4.4,
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
					default = 440,
					subs = 5,
				},
				tracks = false,
			},
			rumad_advmissile = {
				areaofeffect = 96,
				avoidfeature = false,
				burst = 2,
				burstrate = 0.15,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				explosiongenerator = "custom:FLASH2",
				firestarter = 70,
				flighttime = 2,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				model = "weapon_missile_rumad.s3o",
				name = "Missiles",
				noselfdamage = true,
				range = 1000,
				reloadtime = 5,
				smoketrail = true,
				soundhitdry = "xplosml2",
				soundhitwet = "splshbig",
				soundhitwetvolume = 0.6,
				soundstart = "rocklit1",
				startvelocity = 500,
				tracks = false,
				turnrate = 20000,
				turret = true,
				weaponacceleration = 100,
				weapontimer = 2,
				weapontype = "MissileLauncher",
				weaponvelocity = 600,
				damage = {
					default = 180,
					subs = 5,
				},
			},
		},
		weapons = {
			{
				badtargetcategory = "MINOR SMALL",
				def = "RUMAD_GAUSS",
				onlytargetcategory = "SURFACE",
			},
			{
				badtargetcategory = "SMALL MINOR",
				def = "RUMAD_ADVMISSILE",
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
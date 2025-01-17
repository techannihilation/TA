return {
	gok_hellbiker = {
		acceleration = 0.8,
		brakerate = 0.495,
		buildcostenergy = 1025,
		buildcostmetal = 45,
		builder = false,
		buildpic = "gok_hellbiker.dds",
		buildtime = 1000,
		canattack = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = 1,
		category = "ALL MOBILE MINOR SURFACE",
		corpse = "heap",
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "12 20 28",
		collisionvolumetype = "Box",
		defaultmissiontype = "Standby",
		description = "MINOR Infantry",
		explodeas = "SMALL_UNITEX",
		firestandorders = 1,
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		losemitheight = 25,
		maneuverleashlength = 640,
		mass = 45,
		maxdamage = 235,
		maxslope = 26,
		maxvelocity = 4.25,
		maxwaterdepth = 12,
		mobilestandorders = 1,
		movementclass = "TANK2",
		name = "Hell Biker",
		noautofire = false,
		objectname = "gok/gok_hellbiker.s3o",
		radaremitheight = 25,
		seismicsignature = 0,
		selfdestructas = "SMALL_UNIT",
		sightdistance = 250,
		standingfireorder = 2,
		standingmoveorder = 1,
		steeringmode = 1,
		trackoffset = -3,
		trackstrength = 3,
		trackstretch = 1,
		tracktype = "StdTank",
		trackwidth = 2,
		turninplace = 0,
		turninplaceanglelimit = 160,
		turninplacespeedlimit = 4.0,
		turnrate = 275,
		unitname = "gok_hellbiker",
		unitrestricted = 200,
		customparams = {
			buildpic = "gok_hellbiker.dds",
			faction = "GOK",
			normaltex = "unittextures/gok_normals.dds",
		},
		featuredefs = {
			heap = {
				blocking = false,
				damage = 224,
				description = "Biker Debris",
				energy = 0,
				footprintx = 2,
				footprintz = 2,
				metal = 12,
				object = "2x2f.s3o",
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
				"varmmove",
			},
			select = {
				"varmsel",
			},
		},
		weapondefs = {
			flame = {
				areaofeffect = 48,
				avoidfeature = false,
				burst = 10,
				burstrate = 0.12,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				firestarter = 100,
				flamegfxtime = 1.4,
				groundbounce = true,
				impulseboost = 0,
				impulsefactor = 0,
				intensity = 0.5,
				name = "FlameThrower",
				noselfdamage = true,
				range = 160,
				reloadtime = 1.2,
				rgbcolor = "1 0.95 0.9",
				rgbcolor2 = "0.9 0.85 0.8",
				sizegrowth = 1.1,
				soundhitwet = "sizzle",
				soundhitwetvolume = 0.5,
				soundstart = "Flamhvy1",
				soundtrigger = false,
				sprayangle = 600,
				tolerance = 2500,
				turret = true,
				weapontimer = 1.5,
				weapontype = "Flame",
				weaponvelocity = 265,
				damage = {
					default = 6,
					flamethrowers = 2,
					subs = 5,
				},
				tracks = false,
			},
		},
		weapons = {
			{
				def = "FLAME",
				maindir = "0 0 1",
				maxangledif = 280,
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
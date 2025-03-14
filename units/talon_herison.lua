return {
	talon_herison = {
		acceleration = 0.132,
		activatewhenbuilt = true,
		brakerate = 0.486,
		buildcostenergy = 6250,
		buildcostmetal = 55,
		builder = false,
		buildpic = "talon_herison.dds",
		buildtime = 5800,
		canattack = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = 1,
		category = "ALL MOBILE SMALL SURFACE UNDERWATER",
		collisionvolumeoffsets = "0 2 0",
		collisionvolumescales = "17 13 17",
		collisionvolumetype = "Box",
		corpse = "heap",
		defaultmissiontype = "Standby",
		description = "Crawling Bomb",
		explodeas = "CRAWL_BLASTSML",
		firestandorders = 1,
		firestate = 2,
		footprintx = 1,
		footprintz = 1,
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 25,
		maneuverleashlength = 640,
		mass = 65,
		maxdamage = 455,
		maxslope = 32,
		maxvelocity = 2.4,
		maxwaterdepth = 112,
		mobilestandorders = 1,
		movementclass = "AKBOT1",
		name = "Herison",
		noautofire = false,
		objectname = "talon/talon_herison.s3o",
		radaremitheight = 25,
		seismicsignature = 0,
		selfdestructas = "CRAWL_BLAST",
		selfdestructcountdown = 0,
		sightdistance = 273,
		standingfireorder = 0,
		standingmoveorder = 1,
		steeringmode = 1,
		turninplace = 0,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 1.518,
		turnrate = 1540,
		unitname = "talon_herison",
		customparams = {
			buildpic = "talon_herison.dds",
			faction = "TALON",
			normaltex = "unittextures/talon_normals.dds",
		},
		featuredefs = {
			heap = {
				blocking = false,
				damage = 752,
				description = "Herison Debris",
				footprintx = 1,
				footprintz = 1,
				metal = 26,
				object = "1x1b.s3o",
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
				"servsml5",
			},
			select = {
				"servsml5",
			},
		},
		weapondefs = {
			crawl_detonator = {
				areaofeffect = 5,
				avoidfeature = false,
				cegtag = "Trail_cannon",
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0,
				explosiongenerator = "",
				firesubmersed = true,
				gravityaffected = "TRUE",
				impulseboost = 0,
				impulsefactor = 0,
				name = "Mine Detonator",
				nogap = 1,
				range = 1,
				reloadtime = 0.1,
				separation = 0.45,
				sizedecay = -0.15,
				soundhitwet = "splshbig",
				soundhitwetvolume = 0.6,
				stages = 20,
				weapontype = "Cannon",
				weaponvelocity = 1000,
				damage = {
					crawlingbombs = 1000,
					default = 0,
				},
				tracks = false,
			},
			crawl_dummy = {
				areaofeffect = 0,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0,
				explosiongenerator = "",
				firesubmersed = true,
				impulseboost = 0,
				impulsefactor = 0,
				name = "Crawlingbomb Dummy Weapon",
				range = 80,
				reloadtime = 0.1,
				soundhitwet = "sizzle",
				soundhitwetvolume = 0.5,
				tolerance = 100000,
				weapontype = "Melee",
				weaponvelocity = 100000,
				damage = {
					default = 0,
				},
				tracks = false,
			},
		},
		weapons = {
			{
				def = "CRAWL_DUMMY",
				onlytargetcategory = "SURFACE",
			},
			{
				def = "CRAWL_DETONATOR",
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
return {
	gok_blackheart = {
		acceleration = 0.132,
		activatewhenbuilt = true,
		brakerate = 0.486,
		buildcostenergy = 170850,
		buildcostmetal = 1225,
		builder = false,
		buildpic = "gok_blackheart.dds",
		buildtime = 150000,
		canattack = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = 1,
		category = "ALL MOBILE SMALL SURFACE UNDERWATER",
		collisionvolumeoffsets = "0 2 0",
		collisionvolumescales = "17 13 17",
		collisionvolumetype = "Box",
		defaultmissiontype = "Standby",
		description = "Amphibious Crawling Bomb",
		explodeas = "KROG_BLAST",
		firestandorders = 1,
		firestate = 2,
		footprintx = 4,
		footprintz = 4,
		idleautoheal = 5,
		idletime = 1800,
		kamikaze = true,
		kamikazedistance = 100,
		losemitheight = 22,
		maneuverleashlength = 640,
		mass = 10000,
		maxdamage = 9495,
		maxslope = 32,
		maxvelocity = 1.65,
		maxwaterdepth = 112,
		mobilestandorders = 1,
		movementclass = "HAKBOT4",
		name = "Black Heart",
		noautofire = false,
		objectname = "gok/gok_blackheart.s3o",
		radaremitheight = 25,
		seismicsignature = 1,
		selfdestructas = "EXO_BLAST",
		selfdestructcountdown = 0,
		sightdistance = 273,
		standingfireorder = 0,
		standingmoveorder = 1,
		steeringmode = 1,
		turninplace = 0,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 1.0,
		turnrate = 500,
		unitname = "gok_blackheart",
		customparams = {
			buildpic = "gok_blackheart.dds",
			faction = "GOK",
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
				[1] = "servsml5",
			},
			select = {
				[1] = "servsml5",
			},
		},
	},
}

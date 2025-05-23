return {
	talon_bishop = {
		acceleration = 0.065,
		brakerate = 0.27,
		buildangle = 16384,
		buildcostenergy = 14250,
		buildcostmetal = 1170,
		builder = false,
		buildpic = "talon_bishop.dds",
		buildtime = 14538,
		canattack = false,
		canguard = true,
		canload = 1,
		canmove = true,
		canpatrol = true,
		canstop = 1,
		category = "ALL MEDIUM MOBILE SURFACE UNDERWATER",
		collisionvolumeoffsets = "0 -7 -4",
		collisionvolumescales = "75 75 110",
		collisionvolumetype = "CylZ",
		corpse = "dead",
		defaultmissiontype = "Standby",
		description = "Armored Transport",
		explodeas = "BIG_UNITEX",
		firestandorders = 1,
		floater = true,
		footprintx = 5,
		footprintz = 5,
		icontype = "sea",
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 74,
		maneuverleashlength = 640,
		mass = 1170,
		maxdamage = 10010,
		maxvelocity = 3,
		minwaterdepth = 12,
		mobilestandorders = 1,
		movementclass = "BOAT5",
		name = "Bishop",
		noautofire = false,
		objectname = "talon/talon_bishop.s3o",
		radaremitheight = 74,
		seismicsignature = 0,
		selfdestructas = "BIG_UNIT",
		sightdistance = 325,
		standingfireorder = 2,
		standingmoveorder = 1,
		steeringmode = 1,
		transportcapacity = 40,
		transportsize = 4,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 2.2044,
		turnrate = 361,
		unitname = "talon_bishop",
		waterline = 10,
		customparams = {
			buildpic = "talon_bishop.dds",
			faction = "TALON",
			normaltex = "unittextures/talon_normals.dds",
		},
		featuredefs = {
			dead = {
				blocking = false,
				collisionvolumeoffsets = "4.52877807617 1.04003906216e-05 -9.52276611328",
				collisionvolumescales = "68.6154174805 110.103820801 132.778900146",
				collisionvolumetype = "Box",
				damage = 7230,
				description = "Bishop Wreckage",
				energy = 0,
				featuredead = "heap",
				footprintx = 5,
				footprintz = 5,
				metal = 735,
				object = "talon/talon_bishop_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				damage = 9038,
				description = "Bishop Debris",
				energy = 0,
				footprintx = 2,
				footprintz = 2,
				metal = 392,
				object = "5x5a.s3o",
				reclaimable = true,
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
				[1] = "sharmmov",
			},
			select = {
				[1] = "sharmsel",
			},
		},
	},
}

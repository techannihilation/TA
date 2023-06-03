return {
	rumad_metalmakerlvl2 = {
		acceleration = 0.005,
		brakerate = 0.05,
		activatewhenbuilt = true,
		brakerate = 0,
		buildangle = 8192,
		buildcostenergy = 33415,
		buildcostmetal = 730,
		builder = false,
		buildpic = "rumad_metalmakerlvl2.dds",
		buildtime = 38000,
		canattack = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = 1,
		category = "ALL MOBILE SMALL SURFACE",
		collisionvolumeoffsets = "-2 0 0",
		collisionvolumescales = "50 23 50",
		collisionvolumetype = "CylY",
		description = "Converts upto 1500 Energy to Metal",
		explodeas = "CRAWL_BLAST",
		footprintx = 4,
		footprintz = 4,
		icontype = "building",
		idleautoheal = 5,
		leavetracks = true,
		idletime = 1800,
		losemitheight = 22,
		mass = 730,
		maxdamage = 1390,
		maxslope = 10,
		maxvelocity = 1.0,
		maxwaterdepth = 12,
		mobilestandorders = 1,
		movementclass = "TANK4",
		name = "T2 Metal Maker",
		noautofire = false,
		objectname = "rumad_metalmakerlvl2",
		radaremitheight = 25,
		seismicsignature = 0,
		selfdestructas = "CRAWL_BLAST",
		sightdistance = 250,
		standingfireorder = 2,
		standingmoveorder = 1,
		steeringmode = 1,
		trackoffset = 0,
		trackstrength = 6,
		trackstretch = 1,
		tracktype = "StdTank",
		trackwidth = 40,
		turninplaceanglelimit = 80,
		turninplacespeedlimit = 1,
		turnrate = 125,
		unitname = "rumad_metalmakerlvl2",
		customparams = {
			buildpic = "rumad_metalmakerlvl2.dds",
			faction = "RUMAD",
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
			activate = "metlon1",
			canceldestruct = "cancel2",
			deactivate = "metloff1",
			underattack = "warning1",
			working = "metlrun1",
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			select = {
				[1] = "metlon1",
			},
		},
	},
}
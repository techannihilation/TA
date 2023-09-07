return {
	portal = {
		acceleration = 0,
		activatewhenbuilt = true,
		brakerate = 1,
		buildangle = 1024,
		buildcostenergy = 110000,
		buildcostmetal = 10000,
		builder = false,
		buildpic = "portal.dds",
		buildtime = 200000,
		builddistance = 0.01,
		category = "ALL MOBILE SURFACE",
		collisionvolumeoffsets = "0 -1 -75",
		collisionvolumescales = "100 100 100",
		collisionvolumetype = "CylY",
		--corpse = "dead",
		description = "Unit Portal",
		energyuse = 0,
		explodeas = "CRAWL_BLAST_CORE",
		footprintx = 10,
		footprintz = 10,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 26,
		mass = 5300,
		maxdamage = 15000,
		maxslope = 20,
		maxvelocity = 0,
		maxwaterdepth = 0,
		metalstorage = 0,
		maneuverleashlength = 380,
		name = "Unit Portal",
		noautofire = false,
		canguard = true,
		canmove = false,
		canpatrol = true,
		firestandorders = 1,
		mobilestandorders = 1,
		canstop = 1,
		objectname = "portal.dae",
		onoffable = true,
		radaremitheight = 25,
		seismicsignature = 0,
		selfdestructas = "CRAWL_BLAST_CORE",
		selfdestructcountdown = 5,
		sightdistance = 273,
		steeringmode = 1,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 0,
		turnrate = 1,
		unitname = "portal",
		yardmap = "oooooooooo"..
			      "oooooooooo"..
			      "ooccccccoo"..
			      "ooccccccoo"..
			      "ooccccccoo"..
			      "ooccccccoo"..
			      "ooccccccoo"..
			      "ooccccccoo"..
			      "ooccccccoo"..
			      "ooccccccoo"
				  ,			 
		customparams = {
			buildpic = "portal.dds",
		},
		featuredefs = {

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
			activate = "radar1",
			canceldestruct = "cancel2",
			deactivate = "radarde1",
			underattack = "warning1",
			working = "radar2",
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			select = {
				[1] = "radar2",
			},
		},
	},
}

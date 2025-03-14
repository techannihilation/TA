return {
	armsy = {
		acceleration = 0,
		brakerate = 0,
		buildcostenergy = 1205,
		buildcostmetal = 551,
		builder = true,
		buildpic = "armsy.dds",
		buildtime = 6000,
		canmove = true,
		canpatrol = true,
		canstop = 1,
		category = "ALL UNDERWATER SURFACE",
		collisionvolumeoffsets = "-2 -3 -3",
		collisionvolumescales = "116 63 116",
		collisionvolumetype = "Box",
		corpse = "dead",
		description = "Produces T1 Ships",
		explodeas = "LARGE_BUILDINGEX",
		firestandorders = 1,
		footprintx = 8,
		footprintz = 8,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 55,
		mass = 651,
		maxdamage = 2990,
		minwaterdepth = 30,
		mobilestandorders = 1,
		name = "Shipyard",
		noautofire = false,
		objectname = "arm/armsy.s3o",
		radardistance = 50,
		radaremitheight = 55,
		seismicsignature = 0,
		selfdestructas = "LARGE_BUILDING",
		shownanospray = false,
		sightdistance = 275.60001,
		standingfireorder = 2,
		standingmoveorder = 0,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 0,
		turnrate = 0,
		unitname = "armsy",
		waterline = 0,
		workertime = 250,
		yardmap = "wCCCCCCwCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCwCCCCCCw",
		buildoptions = {
			[1] = "armcs",
			[2] = "armrecl",
			[3] = "armpt",
			[4] = "armdecade",
			[5] = "armsub",
			[6] = "armroy",
			[7] = "armtship",
		},
		customparams = {
			buildpic = "armsy.dds",
			faction = "ARM",
			normaltex = "unittextures/arm_normals.dds",
		},
		featuredefs = {
			dead = {
				blocking = false,
				collisionvolumeoffsets = -7,
				collisionvolumescales = "116 52 116",
				collisionvolumetype = "Box",
				damage = 2720,
				description = "Shipyard Wreckage",
				energy = 0,
				footprintx = 7,
				footprintz = 7,
				metal = 487,
				object = "arm/armsy_dead.s3o",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
		},
		nanocolor = {
			[1] = 0.2,
			[2] = 0.6,
			[3] = 0.2,
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:YellowLight",
			},
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
			build = "pshpwork",
			canceldestruct = "cancel2",
			underattack = "warning1",
			unitcomplete = "untdone",
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			select = {
				[1] = "pshpactv",
			},
		},
	},
}

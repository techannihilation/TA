return {
	gok_hp = {
		acceleration = 0,
		brakerate = 0,
		buildcostenergy = 3750,
		buildcostmetal = 970,
		builder = true,
		buildinggrounddecaldecayspeed = 30,
		buildinggrounddecalsizex = 6,
		buildinggrounddecalsizey = 5,
		buildinggrounddecaltype = "gok_aoplane.dds",
		buildpic = "gok_hp.dds",
		buildtime = 7500,
		canmove = true,
		canpatrol = true,
		canstop = 1,
		category = "ALL SURFACE",
		collisionvolumescales = "100 40 80",
		collisionvolumetype = "Box",
		corpse = "dead",
		description = "Produces T1 Hovercraft",
		energystorage = 200,
		energyuse = 0,
		explodeas = "LARGE_BUILDINGEX",
		firestandorders = 1,
		footprintx = 7,
		footprintz = 6,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 25,
		mass = 1000,
		maxdamage = 2850,
		maxslope = 15,
		maxvelocity = 0,
		maxwaterdepth = 0,
		mobilestandorders = 1,
		name = "Hovercraft Platform",
		noautofire = false,
		objectname = "gok_hp",
		radaremitheight = 25,
		seismicsignature = 0,
		selfdestructas = "LARGE_BUILDING",
		shownanospray = false,
		sightdistance = 286,
		standingfireorder = 2,
		standingmoveorder = 1,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 0,
		turnrate = 0,
		unitname = "gok_hp",
		--usebuildinggrounddecal = true,
		workertime = 250,
		yardmap = "oocccoo oocccoo oocccoo oocccoo oocccoo oocccoo",
		buildoptions = {
			[1] = "gok_ch",
			[2] = "gok_faerie",
			[3] = "gok_avatar",
			[4] = "gok_exorcist",
			[5] = "gok_seastrike",
		},
		customparams = {
			buildpic = "gok_hp.dds",
			faction = "gok",
			providetech = "T1 Factory",
		},
		featuredefs = {
			dead = {
				blocking = true,
				collisionvolumeoffsets = "0 0 0",
				collisionvolumescales = "116 20 104",
				collisionvolumetest = 1,
				collisionvolumetype = "Box",
				damage = 2730,
				description = "Hovercraft Platform Wreckage",
				energy = 0,
				featuredead = "heap",
				footprintx = 8,
				footprintz = 7,
				metal = 764,
				object = "gok_hp_DEAD",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				damage = 3412,
				description = "Hovercraft Platform Debris",
				energy = 0,
				footprintx = 8,
				footprintz = 7,
				metal = 407,
				object = "7X7A",
				reclaimable = true,
			},
		},
		nanocolor = {
			[1] = 0.16,
			[2] = 0.56,
			[3] = 0.16,
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
			build = "hoverok1",
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
				[1] = "hoversl1",
			},
		},
	},
}
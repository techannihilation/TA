return {
	armuwadvms = {
		buildangle = 5049,
		buildcostenergy = 5193,
		buildcostmetal = 752,
		builder = false,
		buildinggrounddecaldecayspeed = 30,
		buildinggrounddecalsizex = 6,
		buildinggrounddecalsizey = 6,
		buildinggrounddecaltype = "armuwadvms_aoplane.dds",
		buildpic = "armuwadvms.dds",
		buildtime = 20000,
		category = "ALL UNDERWATER SURFACE",
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "45 48 45",
		collisionvolumetype = "CylY",
		corpse = "dead",
		description = "Increases Metal Storage (10000)",
		downloadable = 1,
		energyuse = 0,
		explodeas = "LARGE_BUILDINGEX",
		footprintx = 4,
		footprintz = 4,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 44,
		mass = 752,
		maxdamage = 9300,
		maxslope = 20,
		maxwaterdepth = 9999,
		metalstorage = 10000,
		name = "T2 Storage",
		noautofire = false,
		noshadow = 1,
		objectname = "arm/armuwadvms.s3o",
		radaremitheight = 43,
		seismicsignature = 0,
		selfdestructas = "LARGE_BUILDING",
		sightdistance = 195,
		unitname = "armuwadvms",
		usebuildinggrounddecal = true,
		yardmap = "oooooooooooooooo",
		customparams = {
			buildpic = "armuwadvms.dds",
			faction = "ARM",
			normaltex = "unittextures/arm_normals.dds",
		},
		featuredefs = {
			dead = {
				blocking = true,
				collisionvolumeoffsets = "7.62939453125e-06 -3.51196289046e-05 -0.0",
				collisionvolumescales = "45.1519927979 49.1111297607 45.1520080566",
				collisionvolumetype = "Box",
				damage = 6370,
				description = "Hardened Metal Storage Wreckage",
				energy = 0,
				featuredead = "heap",
				footprintx = 4,
				footprintz = 4,
				metal = 564,
				object = "arm/armuwadvms_dead.s3o",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
			heap = {
				blocking = false,
				damage = 7963,
				description = "Hardened Metal Storage Debris",
				energy = 0,
				footprintx = 4,
				footprintz = 4,
				metal = 300,
				object = "4x4a.s3o",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
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
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			select = {
				[1] = "stormtl1",
			},
		},
	},
}

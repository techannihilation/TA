return {
	arm_emstor = {
		activatewhenbuilt = true,
		buildangle = 8192,
		buildcostenergy = 65859,
		buildcostmetal = 8225,
		builder = false,
		buildinggrounddecaldecayspeed = 30,
		buildinggrounddecalsizex = 9,
		buildinggrounddecalsizey = 9,
		buildinggrounddecaltype = "arm_emstor_aoplane.dds",
		buildpic = "arm_emstor.dds",
		buildtime = 66125,
		category = "ALL UNDERWATER SURFACE",
		corpse = "dead",
		description = "Amphibious - capacity (125000)",
		downloadable = 1,
		explodeas = "SMALL_BUILDINGEX",
		footprintx = 7,
		footprintz = 6,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 48,
		mass = 11000,
		maxdamage = 66000,
		maxslope = 10,
		maxwaterdepth = 255,
		metalstorage = 125000,
		name = "T3 Metal Storage",
		noautofire = false,		
		objectname = "arm/arm_emstor.s3o",
		radardistance = 0,
		radaremitheight = 48,
		selfdestructas = "SMALL_BUILDING",
		sightdistance = 300,
		unitname = "arm_emstor",
		upright = true,
		usebuildinggrounddecal = true,
		yardmap = "ooooooo ooooooo ooooooo ooooooo ooooooo ooooooo",
		customparams = {
			buildpic = "arm_emstor.dds",
			faction = "ARM",
			normaltex = "unittextures/core_normals.dds",
		},
		featuredefs = {
			dead = {
				blocking = true,
				damage = 27700,
				description = "T3 Metal Storage Wreckage",
				featuredead = "heap",
				footprintx = 6,
				footprintz = 4,
				metal = 7250,
				object = "arm/arm_emstor_dead.s3o",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
			heap = {
				blocking = false,
				damage = 34625,
				description = "T3 Metal Storage Debris",
				footprintx = 4,
				footprintz = 4,
				metal = 4200,
				object = "4x4b",
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
				[1] = "stormtl2",
			},
		},
	},
}
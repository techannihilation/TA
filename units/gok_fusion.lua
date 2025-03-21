return {
	gok_fusion = {
		buildangle = 4096,
		buildcostenergy = 65260,
		buildcostmetal = 5458,
		builder = false,
		buildinggrounddecaldecayspeed = 30,
		buildinggrounddecalsizex = 6,
		buildinggrounddecalsizey = 6,
		buildpic = "gok_fusion.dds",
		buildtime = 70000,
		category = "ALL SURFACE",
		collisionvolumeoffsets = "0 -5 0",
		collisionvolumescales = "90 72 90",
		collisionvolumetype = "CylY",
		corpse = "dead",
		description = "Produces Energy",
		energymake = 1500,
		energystorage = 3000,
		explodeas = "CRAWL_BLAST",
		footprintx = 6,
		footprintz = 6,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 46,
		mass = 5548,
		maxdamage = 6790,
		maxslope = 10,
		maxvelocity = 0,
		maxwaterdepth = 0,
		name = "Fusion Reactor",
		noautofire = false,
		objectname = "gok/gok_fusion.s3o",
		radaremitheight = 46,
		seismicsignature = 0,
		selfdestructas = "CRAWL_BLAST",
		sightdistance = 273,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 0,
		turnrate = 0,
		unitname = "gok_fusion",
		usebuildinggrounddecal = false,
		yardmap = "oooooo oooooo oooooo oooooo oooooo oooooo",
		customparams = {
			buildpic = "gok_fusion.dds",
			faction = "GOK",
			normaltex = "unittextures/gok_normals.dds",
		},
		featuredefs = {
			dead = {
				blocking = true,
				collisionvolumeoffsets = "-1.82577514648 0.0764762817383 -0.28246307373",
				collisionvolumescales = "83.349395752 31.1307525635 52.6837921143",
				collisionvolumetype = "Box",
				damage = 5148,
				description = "Fusion Reactor Wreckage",
				energy = 0,
				featuredead = "heap",
				footprintx = 5,
				footprintz = 4,
				metal = 3795,
				object = "gok/gok_fusion_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				damage = 6435,
				description = "Fusion Reactor Debris",
				energy = 0,
				footprintx = 4,
				footprintz = 4,
				metal = 2024,
				object = "4x4a.s3o",
				reclaimable = true,
			},
		},
		sfxtypes = {
			pieceexplosiongenerators = {
				[1] = "piecetrail5",
				[2] = "piecetrail5",
				[3] = "piecetrail4",
				[4] = "piecetrail6",
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
				[1] = "talon_gen",
			},
		},
	},
}

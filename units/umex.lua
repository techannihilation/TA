return {
	umex = {
		activatewhenbuilt = true,
		buildangle = 4096,
		buildcostenergy = 1000000,
		buildcostmetal = 80000,
		builder = false,
		buildinggrounddecaldecayspeed = 30,
		buildinggrounddecalsizex = 10,
		buildinggrounddecalsizey = 10,
		buildpic = "umex.dds",
		buildtime = 2000000,
		canattack = false,
		category = "ALL UNDERWATER SURFACE",
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "135 135 135",
		collisionvolumetype = "CylY",
		description = "Tech Level 5 (Amphibious)",
		energyuse = 5000,
		explodeas = "CRAWL_BLAST",
		extractsmetal = 0.1,
		footprintx = 8,
		footprintz = 8,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 95,
		mass = 80000,
		maxdamage = 40000,
		maxslope = 20,
		maxwaterdepth = 9999,
		metalstorage = 1000,
		name = "Circular Xmas Saw",
		noautofire = false,
		objectname = "umex",
		onoffable = true,
		radardistance = 0,
		radaremitheight = 120,
		selfdestructas = "CRAWL_BLAST",
		sightdistance = 350,
		unitname = "umex",
		yardmap = "oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo",
		customparams = {
			buildpic = "umex.dds",
			faction = "ALL",
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:DUST_CLOUD_MEX",
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
	},
}
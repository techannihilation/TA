return {
	rumad_urad = {
		activatewhenbuilt = true,
		buildangle = 8192,
		buildcostenergy = 1240000,
		buildcostmetal = 14000,
		builder = false,
		buildpic = "rumad_urad.dds",
		buildtime = 750000,
		category = "ALL SURFACE",
		collisionvolumescales = "135 150 135",
		collisionvolumetype = "CylY",
		corpse = "dead",
		description = "Tech Level 4",
		energyuse = 7500,
		explodeas = "SMALL_BUILDINGEX",
		footprintx = 6,
		footprintz = 6,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 41,
		mass = 14000,
		maxdamage = 11245,
		maxslope = 10,
		maxwaterdepth = 0,
		name = "Ultimate Radar Tower",
		noautofire = false,
		objectname = "rumad/rumad_urad.s3o",
		onoffable = true,
		radardistance = 24000,
		radaremitheight = 41,
		script = "rumad_radar.lua",
		selfdestructas = "SMALL_BUILDING",
		sightdistance = 1000,
		unitname = "rumad_urad",
		yardmap = "oooooo oooooo oooooo oooooo oooooo oooooo",
		customparams = {
			buildpic = "rumad_urad.dds",
			faction = "RUMAD",
			normaltex = "unittextures/rumad_normals.dds",
		},
		featuredefs = {
			dead = {
				blocking = true,
				damage = 637,
				description = "Ultimate Tower Wreckage",
				featuredead = "heap",
				footprintx = 3,
				footprintz = 3,
				metal = 345,
				object = "rumad/rumad_urad_dead.s3o",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
			heap = {
				blocking = false,
				damage = 796,
				description = "Advanced Radar Tower Debris",
				footprintx = 6,
				footprintz = 6,
				metal = 184,
				object = "4x4b.s3o",
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
			activate = "radadvn1",
			canceldestruct = "cancel2",
			deactivate = "radadde1",
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
				[1] = "radadvn1",
			},
		},
	},
}

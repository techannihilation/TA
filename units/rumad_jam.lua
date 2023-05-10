return {
	rumad_jam = {
		acceleration = 0.035,
		activatewhenbuilt = true,
		brakerate = 0.036,
		buildcostenergy = 5580,
		buildcostmetal = 95,
		builder = false,
		buildpic = "rumad_jam.dds",
		buildtime = 6000,
		canattack = false,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = 1,
		category = "ALL MOBILE SMALL SURFACE UNDERWATER",
		collisionvolumeoffsets = "0 -3 0",
		collisionvolumescales = "22.6 22.6 32.6",
		collisionvolumetype = "CylZ",
		corpse = "dead",
		defaultmissiontype = "Standby",
		description = "Vehicle",
		energyuse = 35,
		explodeas = "BIG_UNITEX",
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		losemitheight = 22,
		maneuverleashlength = 640,
		mass = 95,
		maxdamage = 450,
		maxslope = 16,
		maxvelocity = 1.0,
		maxwaterdepth = 0,
		mobilestandorders = 1,
		movementclass = "TANK2",
		name = "Jammer",
		noautofire = false,
		objectname = "rumad_jam",
		onoffable = true,
		radardistance = 0,
		radardistancejam = 360,
		radaremitheight = 25,
		selfdestructas = "BIG_UNIT",
		sightdistance = 300,
		standingmoveorder = 1,
		steeringmode = 1,
		trackoffset = 8,
		trackstrength = 10,
		trackstretch = 1,
		tracktype = "StdTank",
		trackwidth = 22,
		turninplace = 0,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 0.8,
		turnrate = 400,
		unitname = "rumad_jam",
		customparams = {
			buildpic = "rumad_jam.dds",
			faction = "RUMAD",
		},
		featuredefs = {
			dead = {
				blocking = true,
				collisionvolumeoffsets = "-1.99268341064 -6.74999977051 3.60781097412",
				collisionvolumescales = "23.7459869385 3.61972045898 31.9999847412",
				collisionvolumetype = "Box",
				damage = 668,
				description = "Jammer Wreckage",
				featuredead = "heap",
				footprintx = 3,
				footprintz = 3,
				metal = 80,
				object = "rumad_rad_DEAD",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
			heap = {
				blocking = false,
				damage = 835,
				description = "Jammer Debris",
				footprintx = 3,
				footprintz = 3,
				metal = 42,
				object = "3X3B",
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
				[1] = "varmmove",
			},
			select = {
				[1] = "radjam1",
			},
		},
	},
}
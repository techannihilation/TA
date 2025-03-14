return {
	rumad_bomber_lvl1 = {
		acceleration = 0.035,
		altfromsealevel = 1,
		attackrunlength = 120,
		bankscale = 1,
		blocking = false,
		brakerate = 0.05,
		buildcostenergy = 5225,
		buildcostmetal = 165,
		builder = false,
		buildpic = "rumad_bomber_lvl1.dds",
		buildtime = 5000,
		canattack = true,
		canfly = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = 1,
		category = "ALL MOBILE VTOL",
		collide = false,
		corpse = "heap",
		cruisealt = 165,
		description = "Bomber",
		explodeas = "BIG_UNITEX",
		firestandorders = 1,
		footprintx = 3,
		footprintz = 3,
		icontype = "air",
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 8,
		maneuverleashlength = 1380,
		mass = 165,
		maxdamage = 590,
		maxslope = 10,
		maxvelocity = 8.25,
		maxwaterdepth = 0,
		mobilestandorders = 1,
		name = "Desert Thunder",
		noautofire = true,
		objectname = "rumad/rumad_bomber_lvl1.s3o",
		seismicsignature = 0,
		selfdestructas = "BIG_UNIT_VTOL",
		sightdistance = 195,
		standingfireorder = 2,
		standingmoveorder = 1,
		steeringmode = 1,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 5.5,
		turnrate = 800,
		unitname = "rumad_bomber_lvl1",
		customparams = {
			buildpic = "rumad_bomber_lvl1.dds",
			faction = "RUMAD",
			normaltex = "unittextures/rumad_normals.dds",
		},
		featuredefs = {
			heap = {
				blocking = false,
				damage = 2043,
				description = "Aircraft Debris",
				footprintx = 3,
				footprintz = 3,
				metal = 64,
				object = "3x3z.s3o",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
		},
		sfxtypes = {
			pieceexplosiongenerators = {
				"piecetrail0",
				"piecetrail1",
				"piecetrail2",
				"piecetrail3",
				"piecetrail4",
				"piecetrail6",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
			underattack = "warning1",
			cant = {
				"cantdo4",
			},
			count = {
				"count6",
				"count5",
				"count4",
				"count3",
				"count2",
				"count1",
			},
			ok = {
				"vtolarmv",
			},
			select = {
				"vtolarac",
			},
		},
		weapondefs = {
			rumad_bomb = {
				accuracy = 750,
				areaofeffect = 128,
				avoidfeature = false,
				burst = 6,
				burstrate = 0.05,
				collidefriendly = false,
				craterareaofeffect = 128,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.25,
				explosiongenerator = "custom:T1ARMBOMB",
				gravityaffected = "false",
				impulseboost = 0.5,
				impulsefactor = 0.5,
				interceptedbyshieldtype = 16,
				model = "weapon_bomb.s3o",
				name = "Bombs",
				noselfdamage = true,
				range = 1200,
				reloadtime = 10,
				soundhitdry = "xplomed2",
				soundhitwet = "splslrg",
				soundhitwetvolume = 0.6,
				soundstart = "bombrel",
				sprayangle = 2000,
				weapontype = "AircraftBomb",
				damage = {
					commanders = 75,
					default = 150,
					subs = 5,
				},
				tracks = false,
			},
		},
		weapons = {
			{
				def = "RUMAD_BOMB",
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
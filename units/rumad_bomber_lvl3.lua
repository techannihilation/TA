return {
	rumad_bomber_lvl3 = {
		acceleration = 0.05,
		altfromsealevel = 1,
		attackrunlength = 250,
		bankscale = 1,
		blocking = false,
		brakerate = 0.04,
		buildcostenergy = 193555,
		buildcostmetal = 7530,
		builder = false,
		buildpic = "rumad_bomber_lvl3.dds",
		buildtime = 130000,
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
		footprintx = 4,
		footprintz = 4,
		icontype = "air",
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 8,
		maneuverleashlength = 1380,
		mass = 8130,
		maxdamage = 13590,
		maxslope = 10,
		maxvelocity = 8.0,
		maxwaterdepth = 0,
		mobilestandorders = 1,
		name = "Desert Cyclone",
		noautofire = true,
		objectname = "rumad_bomber_lvl3",
		script = "rumad_bomber_lvl1.cob",
		seismicsignature = 0,
		selfdestructas = "BIG_UNIT_VTOL",
		sightdistance = 400,
		standingfireorder = 2,
		standingmoveorder = 1,
		steeringmode = 1,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 5.5,
		turnrate = 800,
		unitname = "rumad_bomber_lvl3",
		customparams = {
			buildpic = "rumad_bomber_lvl3.dds",
			faction = "RUMAD",
			requiretech = "Advanced T3 Unit Research Centre",
		},
		featuredefs = {
			heap = {
				blocking = false,
				damage = 2043,
				description = "Aircraft Debris",
				footprintx = 3,
				footprintz = 3,
				metal = 64,
				object = "3X3Z",
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
				[1] = "vtolarmv",
			},
			select = {
				[1] = "vtolarac",
			},
		},
		weapondefs = {
			rumad_bomb = {
				accuracy = 750,
				areaofeffect = 196,
				avoidfeature = false,
				burst = 30,
				burstrate = 0.12,
				collidefriendly = false,
				craterareaofeffect = 128,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.25,
				explosiongenerator = "custom:BIGBOMB_EXPLOSION",
				gravityaffected = "false",
				impulseboost = 0.5,
				impulsefactor = 0.5,
				interceptedbyshieldtype = 16,
				model = "weapon_bomb",
				name = "Bombs",
				noselfdamage = true,
				range = 2000,
				reloadtime = 21,
				soundhitdry = "xplomed2",
				soundhitwet = "splslrg",
				soundhitwetvolume = 0.6,
				soundstart = "bombrel",
				sprayangle = 2000,
				weapontype = "AircraftBomb",
				damage = {
					commanders = 180,
					default = 360,
					subs = 5,
				},
			},
		},
		weapons = {
			[1] = {
				def = "RUMAD_BOMB",
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
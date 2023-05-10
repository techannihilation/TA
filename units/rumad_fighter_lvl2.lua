return {
	rumad_fighter_lvl2 = {
		acceleration = 0.17,
		airsightdistance = 800,
		bankscale = 1,
		blocking = false,
		brakerate = 0.112,
		buildcostenergy = 9850,
		buildcostmetal = 145,
		buildpic = "rumad_fighter_lvl2.dds",
		buildtime = 9000,
		canattack = true,
		canfly = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = 1,
		category = "ALL MOBILE VTOL",
		collide = false,
		cruisealt = 160,
		defaultmissiontype = "VTOL_standby",
		description = "Advanced Fighter",
		explodeas = "BIG_UNITEX",
		firestandorders = 1,
		footprintx = 2,
		footprintz = 2,
		icontype = "air",
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 5.5,
		maneuverleashlength = 1280,
		mass = 141,
		maxdamage = 690,
		maxslope = 10,
		maxvelocity = 12,
		maxwaterdepth = 0,
		mobilestandorders = 1,
		moverate1 = 8,
		name = "Desert Hawk",
		objectname = "rumad_fighter_lvl2",
		script = "rumad_fighter_lvl1.cob",
		seismicsignature = 0,
		selfdestructas = "BIG_UNIT_VTOL",
		sightdistance = 560,
		standingfireorder = 2,
		standingmoveorder = 1,
		steeringmode = 1,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 7.92,
		turnrate = 1425,
		unitname = "rumad_fighter_lvl2",
		customparams = {
			buildpic = "rumad_fighter_lvl2.dds",
			faction = "RUMAD",
			requiretech = "Advanced T2 Unit Research Centre",
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
			rumad_missile = {
				areaofeffect = 35,
				avoidfeature = false,
				avoidfriendly = false,
				collidefriendly = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				explosiongenerator = "custom:FLASH2",
				firestarter = 70,
				impactonly = 1,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				metalpershot = 0,
				model = "weapon_missile",
				name = "GuidedMissiles",
				noselfdamage = true,
				range = 560,
				reloadtime = 0.4,
				smoketrail = true,
				soundhitdry = "xplosml2",
				soundhitwet = "splshbig",
				soundhitwetvolume = 0.6,
				soundstart = "Rocklit3",
				startvelocity = 650,
				texture2 = "armsmoketrail",
				tolerance = 8000,
				tracks = true,
				turnrate = 36000,
				weaponacceleration = 250,
				weapontimer = 7,
				weapontype = "MissileLauncher",
				weaponvelocity = 850,
				damage = {
					areoship = 30,
					default = 5,
					air = 120,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "MINOR MAJOR",
				def = "RUMAD_MISSILE",
				onlytargetcategory = "VTOL",
			},
		},
	},
}
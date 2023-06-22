return {
	rumad_erl = {
		airsightdistance = 1600,
		brakerate = 0,
		buildcostenergy = 295000,
		buildcostmetal = 13500,
		builder = false,
		buildpic = "rumad_erl.dds",
		buildtime = 150000,
		canattack = true,
		canstop = 1,
		category = "ALL SURFACE",
		collisionvolumeoffsets = "0 1 0",
		collisionvolumescales = "90 150 90",
		collisionvolumetype = "CylY",
		corpse = "dead",
		defaultmissiontype = "GUARD_NOMOVE",
		description = "Very Heavy Anti-Air Battery",
		energyuse = 0,
		explodeas = "BIG_UNITEX",
		firestandorders = 1,
		footprintx = 4,
		footprintz = 4,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 51,
		mass = 13500,
		maxdamage = 6250,
		maxslope = 20,
		maxvelocity = 0,
		maxwaterdepth = 0,
		name = "Desert Python",
		noautofire = false,
		objectname = "rumad_erl",
		radaremitheight = 51,
		seismicsignature = 0,
		selfdestructas = "BIG_UNIT",
		sightdistance = 455,
		standingfireorder = 2,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 0,
		turnrate = 0,
		unitname = "rumad_erl",
		yardmap = "oooo oooo oooo oooo",
		customparams = {
			buildpic = "rumad_erl.dds",
			faction = "RUMAD",
			prioritytarget = "air",
		},
		featuredefs = {
			dead = {
				blocking = true,
				collisionvolumeoffsets = "-0.808319091797 0.000184020996095 2.23503112793",
				collisionvolumescales = "30.2288513184 52.705368042 33.0822753906",
				collisionvolumetype = "Box",
				damage = 484,
				description = "Pulverizer Wreckage",
				energy = 0,
				featuredead = "heap",
				footprintx = 3,
				footprintz = 3,
				metal = 60,
				object = "rumad_erl_DEAD",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
			heap = {
				blocking = false,
				damage = 606,
				description = "Pulverizer Debris",
				energy = 0,
				footprintx = 3,
				footprintz = 3,
				metal = 32,
				object = "3X3D",
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
				[1] = "kbcormov",
			},
			select = {
				[1] = "kbcorsel",
			},
		},
		weapondefs = {
			rumad_aa_missile = {
				areaofeffect = 192,
				avoidfeature = false,
				canattackground = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				explosiongenerator = "custom:FLASH2",
				firestarter = 70,
				flighttime = 1.5,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				metalpershot = 0,
				model = "weapon_missilexl_rumad_aa",
				name = "Missiles",
				noselfdamage = true,
				range = 1600,
				reloadtime = 1,
				smoketrail = true,
				soundhitdry = "xplomed2",
				soundhitwet = "splshbig",
				soundhitwetvolume = 0.6,
				soundstart = "techa_sounds/rumad_aamissile",
				startvelocity = 900,
				texture1 = "null",
				texture2 = "coresmoketrail",
				texture3 = "null",
				texture4 = "null",
				tracks = true,
				turnrate = 63000,
				turret = true,
				weaponacceleration = 300,
				weapontimer = 2,
				weapontype = "MissileLauncher",
				weaponvelocity = 1400,
				damage = {
					areoship = 750,
					default = 5,
					air = 3000,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "MINOR MAJOR", --Ground AA
				def = "RUMAD_AA_MISSILE",
				onlytargetcategory = "VTOL",
			},
			[2] = {
				badtargetcategory = "MINOR MAJOR", --Ground AA
				def = "RUMAD_AA_MISSILE",
				onlytargetcategory = "VTOL",
				slaveto = 1,
			},
		},
	},
}
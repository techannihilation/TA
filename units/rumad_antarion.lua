return {
	rumad_antarion = {
		acceleration = 0.03,
		brakerate = 0.09,
		buildcostenergy = 265660,
		buildcostmetal = 21045,
		builder = false,
		buildpic = "rumad_antarion.dds",
		buildtime = 265000,
		canattack = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = 1,
		category = "ALL HUGE MOBILE SURFACE UNDERWATER",
		collisionvolumeoffsets = "0 -3 7",
		collisionvolumescales = "95 70 90",
		collisionvolumetype = "box",
		corpse = "dead",
		defaultmissiontype = "Standby",
		description = "Experimental Siege Tank",
		explodeas = "BANTHA_BLAST",
		firestandorders = 1,
		footprintx = 7,
		footprintz = 7,
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 45,
		maneuverleashlength = 640,
		mass = 21045,
		maxdamage = 70590,
		maxslope = 12,
		maxvelocity = 1.25,
		maxwaterdepth = 20,
		mobilestandorders = 1,
		movementclass = "HTANK6",
		name = "Antarion",
		noautofire = false,
		objectname = "rumad_antarion",
		radardistance = 0,
		radaremitheight = 45,
		selfdestructas = "KROG_BLAST",
		sightdistance = 500,
		turninplace = 0,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 0.9,
		turnrate = 225,
		unitname = "rumad_antarion",
		customparams = {
			buildpic = "rumad_antarion.dds",
			faction = "RUMAD",
		},
		featuredefs = {
			dead = {
				blocking = true,
				damage = 18543,
				description = "Antarion Wreckage",
				featuredead = "heap",
				footprintx = 3,
				footprintz = 3,
				metal = 13875,
				object = "rumad_antarion_dead",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
			heap = {
				blocking = false,
				damage = 23179,
				description = "Antarion Debris",
				footprintx = 4,
				footprintz = 4,
				metal = 7400,
				object = "4x4a",
				reclamable = 1,
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
				[1] = "tcormove",
			},
			select = {
				[1] = "tcorsel",
			},
		},
		weapondefs = {
			rumad_plasma = {
				accuracy = 200,
				areaofeffect = 128,
				avoidfeature = false,
				craterareaofeffect = 64,
				craterboost = 0,
				cratermult = 0,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				name = "Plasma",
				noselfdamage = true,
				range = 1400,
				reloadtime = 5,
				rgbcolor = "0.9 0.9 0.9",
				separation = 0.45,
				size = 2,
				sizedecay = -0.15,
				soundhitdry = "xplomed2",
				soundhitwet = "splshbig",
				soundhitwetvolume = 0.5,
				soundstart = "techa_sounds/rumad_plasma",
				sprayangle = 360,
				stages = 20,
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 500,
				damage = {
					default = 1400,
					subs = 5,
				},
			},
			rumad_supermissilex2 = {
				areaofeffect = 128,
				avoidfeature = false,
				burst = 2,
				burstrate = 0.15,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				explosiongenerator = "custom:FLASH2",
				firestarter = 70,
				flighttime = 3,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				model = "weapon_missilexl_rumad",
				name = "Missiles",
				noselfdamage = true,
				range = 1800,
				reloadtime = 2,
				smoketrail = true,
				soundhitdry = "xplosml2",
				soundhitwet = "splshbig",
				soundhitwetvolume = 0.6,
				soundstart = "rocklit1",
				startvelocity = 800,
				tracks = true,
				turnrate = 20000,
				tolerance = 5000,
				weaponacceleration = 150,
				weapontimer = 2,
				weapontype = "MissileLauncher",
				weaponvelocity = 1250,
				damage = {
					default = 360,
					subs = 5,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "MEDIUM SMALL MINOR",
				def = "RUMAD_SUPERMISSILEX2",
				onlytargetcategory = "SURFACE",
			},
			[2] = {
				badtargetcategory = "MEDIUM SMALL MINOR",
				def = "RUMAD_SUPERMISSILEX2",
				onlytargetcategory = "SURFACE",
			},
			[3] = {
				badtargetcategory = "MINOR SMALL MEDIUM",
				def = "RUMAD_PLASMA",
				maindir = "1 0 0",
				maxangledif = 250,
				onlytargetcategory = "SURFACE",
			},
			[4] = {
				badtargetcategory = "MINOR SMALL MEDIUM",
				def = "RUMAD_PLASMA",
				maindir = "1 0 0",
				maxangledif = 250,
				onlytargetcategory = "SURFACE",
				slaveto = 3,
			},
			[5] = {
				badtargetcategory = "MINOR SMALL MEDIUM",
				def = "RUMAD_PLASMA",
				maindir = "1 0 0",
				maxangledif = 250,
				onlytargetcategory = "SURFACE",
				slaveto = 3,
			},
			[6] = {
				badtargetcategory = "MINOR SMALL MEDIUM",
				def = "RUMAD_PLASMA",
				maindir = "-1 0 0",
				maxangledif = 250,
				onlytargetcategory = "SURFACE",
			},
			[7] = {
				badtargetcategory = "MINOR SMALL MEDIUM",
				def = "RUMAD_PLASMA",
				maindir = "-1 0 0",
				maxangledif = 250,
				onlytargetcategory = "SURFACE",
				slaveto = 6,
			},
			[8] = {
				badtargetcategory = "MINOR SMALL MEDIUM",
				def = "RUMAD_PLASMA",
				maindir = "-1 0 0",
				maxangledif = 250,
				onlytargetcategory = "SURFACE",
				slaveto = 6,
			},
		},
	},
}
return {
	gok_earthstrike = {
		acceleration = 0.03,
		airsightdistance = 500,
		brakerate = 0.4125,
		buildcostenergy = 1550,
		buildcostmetal = 145,
		builder = false,
		buildpic = "gok_earthstrike.dds",
		buildtime = 2500,
		canattack = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = 1,
		category = "ALL MEDIUM MOBILE SURFACE UNDERWATER",
		corpse = "dead",
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "22 24 28",
		collisionvolumetype = "Box",
		defaultmissiontype = "Standby",
		description = "Anti-Air Missile Vehicle",
		energymake = 0,
		energyuse = 0,
		explodeas = "BIG_UNITEX",
		firestandorders = 1,
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		losemitheight = 30,
		maneuverleashlength = 30,
		mass = 145,
		maxdamage = 920,
		maxslope = 14,
		maxvelocity = 2.0,
		maxwaterdepth = 12,
		mobilestandorders = 1,
		movementclass = "TANK2",
		name = "Sheatiped",
		noautofire = false,
		objectname = "gok/gok_earthstrike.s3o",
		radaremitheight = 30,
		seismicsignature = 0,
		selfdestructas = "BIG_UNIT",
		sightdistance = 450,
		standingfireorder = 2,
		standingmoveorder = 0,
		steeringmode = 2,
		trackoffset = 6,
		trackstrength = 5,
		trackstretch = 1,
		tracktype = "StdTank",
		trackwidth = 22,
		turninplace = 0,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 1.3,
		turnrate = 525,
		unitname = "gok_earthstrike",
		upright = false,
		customparams = {
			buildpic = "gok_earthstrike.dds",
			faction = "GOK",
			normaltex = "unittextures/gok_normals.dds",
		},
		featuredefs = {
			dead = {
				blocking = true,
				collisionvolumeoffsets = "0 -7-06 1",
				collisionvolumescales = "32 21 34",
				collisionvolumetype = "Box",
				damage = 1621,
				description = "Sheatiped Wreckage",
				energy = 0,
				featuredead = "heap",
				footprintx = 2,
				footprintz = 2,
				metal = 210,
				object = "gok/gok_earthstrike_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				damage = 2026,
				description = "Sheatiped Debris",
				energy = 0,
				footprintx = 2,
				footprintz = 2,
				metal = 192,
				object = "2x2a.s3o",
				reclaimable = true,
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
			gok_rl = {
				areaofeffect = 48,
				beamttl = 10,
				canattackground = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				duration = 0.35,
				energypershot = 10,
				firestarter = 85,
				impulseboost = 0,
				impulsefactor = 0,
				intensity = 12,
				name = "Spray Lightning",
				noselfdamage = true,
				projectiles = 1,
				range = 775,
				reloadtime = 1.0,
				rgbcolor = "0.78 0.08 0.52",
				soundhitwet = "sizzle",
				soundhitwetvolume = 0.5,
				soundstart = "techa_sounds/gok_lightning",
				texture1 = "strike",
				thickness = 1.5,
				turret = true,
				weapontimer = 1,
				weapontype = "LightningCannon",
				weaponvelocity = 2250,
				customparams = {
					light_mult = 1.4,
					light_radius_mult = 0.9,
				},
				damage = {
					areoship = 25,
					default = 5,
					air = 100,
				},
			},
		},
		weapons = {
			[3] = {
				badtargetcategory = "MINOR MAJOR", --Ground AA
				def = "GOK_RL",
				onlytargetcategory = "VTOL",
			},
		},
	},
}

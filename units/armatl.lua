return {
	armatl = {
		acceleration = 0,
		activatewhenbuilt = true,
		brakerate = 0,
		buildangle = 16384,
		buildcostenergy = 12503,
		buildcostmetal = 1042,
		builder = false,
		buildpic = "armatl.dds",
		buildtime = 12000,
		canattack = true,
		canstop = 1,
		category = "ALL UNDERWATER SURFACE",
		corpse = "dead",
		defaultmissiontype = "GUARD_NOMOVE",
		description = "Advanced Torpedo Launcher",
		explodeas = "BIG_UNITEX",
		firestandorders = 1,
		footprintx = 4,
		footprintz = 4,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 27,
		mass = 1042,
		maxdamage = 2520,
		maxvelocity = 0,
		minwaterdepth = 25,
		name = "Moray",
		noautofire = false,
		objectname = "arm/armatl.s3o",
		radaremitheight = 27,
		seismicsignature = 0,
		selfdestructas = "BIG_UNIT",
		sightdistance = 585,
		standingfireorder = 2,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 0,
		turnrate = 0,
		unitname = "armatl",
		waterline = 30,
		yardmap = "oooooooooooooooo",
		customparams = {
			buildpic = "armatl.dds",
			faction = "ARM",
			normaltex = "unittextures/arm_normals.dds",
		},
		featuredefs = {
			dead = {
				blocking = false,
				collisionvolumeoffsets = "4.35404205322 2.4731445313e-05 -0.341720581055",
				collisionvolumescales = "38.3841400146 24.7794494629 44.2891235352",
				collisionvolumetype = "Box",
				damage = 1637,
				description = "Moray Wreckage",
				energy = 0,
				footprintx = 4,
				footprintz = 4,
				metal = 780,
				object = "arm/armatl_dead.s3o",
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
				"torpadv2",
			},
			select = {
				"torpadv2",
			},
		},
		weapondefs = {
			armatl_torpedo = {
				areaofeffect = 32,
				avoidfeature = false,
				avoidfriendly = false,
				burnblow = true,
				collidefriendly = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				explosiongenerator = "custom:FLASH3",
				impulseboost = 0.123,
				impulsefactor = 0.123,
				model = "weapon_advtorpedo.s3o",
				name = "LongRangeTorpedo",
				noselfdamage = true,
				range = 900,
				reloadtime = 2.5,
				soundhitdry = "xplodep1",
				soundhitwet = "xplodep1",
				soundstart = "torpedo1",
				startvelocity = 80,
				tolerance = 1167,
				tracks = false,
				turnrate = 99000,
				turret = true,
				waterweapon = true,
				weaponacceleration = 60,
				weapontimer = 10,
				weapontype = "TorpedoLauncher",
				weaponvelocity = 380,
				damage = {
					default = 600,
				},
			},
		},
		weapons = {
			{
				badtargetcategory = "SURFACE",
				def = "ARMATL_TORPEDO",
				onlytargetcategory = "UNDERWATER",
			},
		},
	},
}
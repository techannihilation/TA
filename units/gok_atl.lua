return {
	gok_atl = {
		acceleration = 0,
		brakerate = 0,
		buildangle = 8192,
		buildcostenergy = 13500,
		buildcostmetal = 1340,
		builder = false,
		buildpic = "gok_atl.dds",
		buildtime = 9500,
		canattack = true,
		canstop = 1,
		category = "ALL UNDERWATER",
		collisionvolumeoffsets = "0 -10 0",
		collisionvolumescales = "50 35 50",
		collisionvolumetype = "CylY",
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
		mass = 1000,
		maxangledif1 = 1,
		maxdamage = 2490,
		maxslope = 10,
		maxvelocity = 0,
		minwaterdepth = 25,
		name = "Black Spike",
		noautofire = false,
		objectname = "gok/gok_atl.s3o",
		radaremitheight = 27,
		seismicsignature = 0,
		selfdestructas = "BIG_UNIT",
		sightdistance = 360,
		standingfireorder = 2,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 0,
		turnrate = 0,
		unitname = "gok_atl",
		yardmap = "oooo oooo oooo oooo",
		waterline = 0,
		customparams = {
			buildpic = "gok_atl.dds",
			faction = "TALON",
			normaltex = "unittextures/gok_normals.dds",
		},
		featuredefs = {
			dead = {
				blocking = false,
				collisionvolumeoffsets = "4.35404205322 2.4731445313e-05 -0.341720581055",
				collisionvolumescales = "38.3841400146 24.7794494629 44.2891235352",
				collisionvolumetype = "Box",
				damage = 1637,
				description = "Black Spike Wreckage",
				energy = 0,
				footprintx = 4,
				footprintz = 4,
				metal = 780,
				object = "gok/gok_tl_dead.s3o",
				reclaimable = true,
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
			torpedo = {
				areaofeffect = 16,
				avoidfeature = false,
				avoidfriendly = false,
				burnblow = true,
				collidefriendly = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				explosiongenerator = "custom:FLASH2",
				impactonly = 1,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				model = "weapon_torpedo_gok.s3o",
				name = "Level1TorpedoLauncher",
				noselfdamage = true,
				range = 600,
				reloadtime = 1,
				soundhitdry = "xplodep2",
				soundhitwet = "xplodep2",
				soundstart = "torpedo1",
				startvelocity = 200,
				tracks = false,
				turnrate = 2500,
				turret = true,
				waterweapon = true,
				weaponacceleration = 40,
				weapontimer = 3,
				weapontype = "TorpedoLauncher",
				weaponvelocity = 320,
				damage = {
					default = 280,
				},
			},
		},
		weapons = {
			{
				badtargetcategory = "SURFACE",
				def = "TORPEDO",
				onlytargetcategory = "UNDERWATER",
			},
		},
	},
}
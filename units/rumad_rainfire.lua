return {
	rumad_rainfire = {
		buildangle = 29090,
		buildcostenergy = 340000,
		buildcostmetal = 30450,
		builder = false,
		buildpic = "rumad_rainfire.dds",
		buildtime = 1157080,
		canattack = true,
		canstop = 1,
		category = "ALL SURFACE",
		collisionvolumeoffsets = "0 -2 0",
		collisionvolumescales = "100 100 110",
		collisionvolumetype = "box",
		corpse = "dead",
		defaultmissiontype = "GUARD_NOMOVE",
		description = "Tech Level 2",
		explodeas = "crawl_blast",
		firestandorders = 1,
		footprintx = 8,
		footprintz = 8,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 136,
		mass = 30450,
		maxdamage = 13850,
		maxslope = 13,
		maxvelocity = 0,
		maxwaterdepth = 0,
		name = "Rapid Long Range Plasma Mortar",
		objectname = "rumad/rumad_rainfire.s3o",
		radaremitheight = 136,
		seismicsignature = 0,
		selfdestructas = "crawl_blast",
		sightdistance = 273,
		standingfireorder = 1,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 0,
		turnrate = 0,
		unitname = "rumad_rainfire",
		usepiececollisionvolumes = 1,
		yardmap = "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo",
		customparams = {
			buildpic = "rumad_rainfire.dds",
			faction = "RUMAD",
			normaltex = "unittextures/talon_normals.dds",
		},
		featuredefs = {
			dead = {
				blocking = true,
				collisionvolumeoffsets = "-30 -5 19",
				collisionvolumescales = "169 123 147",
				collisionvolumetype = "Box",
				damage = 8861,
				description = "Rain of Fire Wreckage",
				energy = 0,
				featuredead = "heap",
				footprintx = 7,
				footprintz = 7,
				metal = 21525,
				object = "rumad/rumad_rainfire_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				damage = 11076,
				description = "Rain of Fire Debris",
				energy = 0,
				footprintx = 7,
				footprintz = 7,
				metal = 11480,
				object = "7x7a.s3o",
				reclaimable = true,
			},
		},
		sfxtypes = {
			explosiongenerators = {
				"custom:lrpt",
			},
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
				"servlrg3",
			},
			select = {
				"servlrg3",
			},
		},
		weapondefs = {
			rumad_mortar = {
				accuracy = 700,
				areaofeffect = 128,
				collidefriendly = false,
				craterareaofeffect = 128,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.75,
				energypershot = 10000,
				explosiongenerator = "custom:flash128_fakelight",
				gravityaffected = true,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				name = "Rapidfire LRPC",
				nogap = 1,
				noselfdamage = true,
				range = 5000,
				reloadtime = 1,
				rgbcolor = "0.9 0.9 0.9",
				separation = 0.45,
				size = 2,
				sizedecay = -0.15,
				soundhitdry = "xplomed2",
				soundhitwet = "splshbig",
				soundhitwetvolume = 0.5,
				soundstart = "techa_sounds/rumad_plasma",
				stages = 20,
				trajectoryheight = 2.25,
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 750,
				damage = {
					default = 1000,
					subs = 5,
				},
			},
		},
		weapons = {
			{
				def = "RUMAD_MORTAR",
				onlytargetcategory = "SURFACE",
			},
		},
	},
}

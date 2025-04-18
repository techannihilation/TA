return {
	gok_lrpt1 = {
		buildangle = 32700,
		buildcostenergy = 346003,
		buildcostmetal = 27450,
		builder = false,
		buildinggrounddecaldecayspeed = 30,
		buildinggrounddecalsizex = 12,
		buildinggrounddecalsizey = 12,
		buildpic = "gok_lrpt1.dds",
		buildtime = 400000,
		canattack = true,
		canstop = 1,
		category = "ALL SURFACE",
		corpse = "dead",
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "90 200 90",
		collisionvolumetype = "Box",
		defaultmissiontype = "GUARD_NOMOVE",
		description = "Tech Level 3",
		explodeas = "CRAWL_BLAST",
		firestandorders = 2,
		footprintx = 8,
		footprintz = 8,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 100,
		mass = 27450,
		maxdamage = 15450,
		maxslope = 13,
		maxvelocity = 0,
		maxwaterdepth = 0,
		name = "Long Range Plasma Cannon",
		objectname = "gok/gok_lrpt1.s3o",
		radaremitheight = 100,
		seismicsignature = 0,
		selfdestructas = "BANTHA_BLAST",
		sightdistance = 300,
		standingfireorder = 2,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 0,
		turnrate = 0,
		unitname = "gok_lrpt1",
		usebuildinggrounddecal = false,
		yardmap = "oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo",
		customparams = {
			buildpic = "gok_lrpt1.dds",
			canareaattack = 1,
			faction = "gok",
			normaltex = "unittextures/gok_normals.dds",
		},
		featuredefs = {
			dead = {
				blocking = true,
				collisionvolumeoffsets = "0.0 0.0987820556641 -0.0",
				collisionvolumescales = "86.25 91.6069641113 74.6947021484",
				collisionvolumetype = "Box",
				damage = 3757,
				description = "Onyx Wreckage",
				energy = 0,
				featuredead = "heap",
				footprintx = 3,
				footprintz = 3,
				metal = 3225,
				object = "gok/gok_lrpt1_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				damage = 4696,
				description = "Onyx Debris",
				energy = 0,
				footprintx = 3,
				footprintz = 3,
				metal = 1720,
				object = "3x3c.s3o",
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
				"servlrg4",
			},
			select = {
				"servlrg4",
			},
		},
		weapondefs = {
			long_range_plasma = {
				accuracy = 500,
				areaofeffect = 292,
				avoidfeature = false,
				cegtag = "gokblaster",
				collidefriendly = false,
				craterareaofeffect = 292,
				craterboost = 0,
				cratermult = 0,
				energypershot = 50000,
				explosiongenerator = "custom:flash292_fakelight",
				gravityaffected = "TRUE",
				impulseboost = 0.123,
				impulsefactor = 0.123,
				metalpershot = 0,
				name = "LRPC Cannon",
				nogap = 1,
				noselfdamage = true,
				range = 7000,
				reloadtime = 10,
				rgbcolor = "0.78 0.08 0.52",
				separation = 0.45,
				size = 6,
				sizedecay = -0.15,
				soundhitdry = "xplonuk1",
				soundhitwet = "splslrg",
				soundhitwetvolume = 0.6,
				soundstart = "xplonuk3",
				sprayangle = 360,
				stages = 20,
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 1150,
				damage = {
					default = 4000,
					subs = 5,
				},
				tracks = false,
			},
		},
		weapons = {
			{
				def = "LONG_RANGE_PLASMA",
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
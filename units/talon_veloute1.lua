return {
	talon_veloute1 = {
		acceleration = 0,
		brakerate = 0,
		buildangle = 29096,
		buildcostenergy = 5003560,
		buildcostmetal = 438230,
		builder = false,
		buildinggrounddecaldecayspeed = 30,
		buildinggrounddecalsizex = 19,
		buildinggrounddecalsizey = 19,
		buildinggrounddecaltype = "talon_aoplane.dds",
		buildpic = "talon_veloute1.dds",
		buildtime = 9256637,
		canattack = true,
		canstop = 1,
		category = "ALL SURFACE",
		corpse = "dead",
		defaultmissiontype = "GUARD_NOMOVE",
		description = "Tech Level 4",
		explodeas = "crawl_blast",
		firestandorders = 1,
		footprintx = 15,
		footprintz = 15,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 272,
		mass = 438230,
		maxdamage = 104440,
		maxslope = 13,
		maxvelocity = 0,
		maxwaterdepth = 0,
		name = "Rapid Long Range Plasma Cannon",
		objectname = "talon/talon_veloute1.s3o",
		radaremitheight = 272,
		seismicsignature = 0,
		selfdestructas = "crawl_blast",
		sightdistance = 273,
		standingfireorder = 1,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 0,
		turnrate = 0,
		unitname = "talon_veloute1",
		usebuildinggrounddecal = true,
		usepiececollisionvolumes = true,
		usepieceselectionvolumes = true,
		yardmap = "ooooooooooooooo ooooooooooooooo ooooooooooooooo ooooooooooooooo ooooooooooooooo ooooooooooooooo ooooooooooooooo ooooooooooooooo ooooooooooooooo ooooooooooooooo ooooooooooooooo ooooooooooooooo ooooooooooooooo ooooooooooooooo ooooooooooooooo",
		customparams = {
			buildpic = "talon_veloute1.dds",
			faction = "TALON",
			normaltex = "unittextures/talon_normals.dds",
		},
		featuredefs = {
			dead = {
				blocking = true,
				damage = 39082,
				description = "Super Veloute Wreckage",
				energy = 0,
				footprintx = 14,
				footprintz = 14,
				metal = 218250,
				object = "talon/talon_veloute1_dead.s3o",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
		},
		sfxtypes = {
			explosiongenerators = {
				"custom:rapidlrpt",
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
			talon_veloute_weapon1 = {
				accuracy = 700,
				areaofeffect = 292,
				avoidfeature = false,
				avoidfriendly = false,
				avoidground = false,
				cegtag = "Trail_cannon_large",
				collidefriendly = false,
				craterareaofeffect = 292,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.75,
				energypershot = 50000,
				explosiongenerator = "custom:flashbigbuilding_buzz",
				gravityaffected = true,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				name = "Rapidfire LRPC",
				nogap = 1,
				noselfdamage = true,
				range = 7000,
				reloadtime = 0.5,
				rgbcolor = "0.85 0.6 0",
				separation = 0.45,
				size = 4.5,
				sizedecay = -0.15,
				soundhitdry = "rflrpc3",
				soundhitwet = "splslrg",
				soundhitwetvolume = 0.6,
				soundstart = "XPLONUK4",
				stages = 20,
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 1350,
				damage = {
					default = 4000,
					subs = 5,
				},
				tracks = false,
			},
		},
		weapons = {
			{
				def = "TALON_VELOUTE_WEAPON1",
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
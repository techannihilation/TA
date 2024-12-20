return {
	gok_abyss = {
		acceleration = 0.11,
		brakerate = 0.21,
		buildcostenergy = 128503,
		buildcostmetal = 6315,
		builder = false,
		buildpic = "gok_abyss.dds",
		buildtime = 100000,
		canattack = true,
		canguard = true,
		canhover = true,
		canmove = true,
		canpatrol = true,
		canstop = 1,
		category = "ALL LARGE MOBILE SURFACE",
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "59.2 69.2 59.2",
		collisionvolumetype = "ellipsoid",
		corpse = "dead",
		defaultmissiontype = "Standby",
		description = "Armored Energy Hovercraft",
		downloadable = 1,
		explodeas = "CRAWL_BLASTSML",
		firestandorders = 1,
		footprintx = 4,
		footprintz = 4,
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 49,
		maneuverleashlength = 640,
		mass = 6315,
		maxdamage = 20950,
		maxslope = 10,
		maxvelocity = 1.75,
		maxwaterdepth = 0,
		mobilestandorders = 1,
		movementclass = "TANKHOVER3",
		name = "Abyss",
		noautofire = false,
		objectname = "gok/gok_abyss.s3o",
		radaremitheight = 48,
		selfdestructas = "CRAWL_BLAST",
		sightdistance = 550,
		standingfireorder = 2,
		standingmoveorder = 1,
		steeringmode = 1,
		turninplace = 0,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 0.99,
		turnrate = 250,
		unitname = "gok_abyss",
		customparams = {
			buildpic = "gok_abyss.dds",
			faction = "GOK",
			normaltex = "unittextures/gok_normals.dds",
		},
		featuredefs = {
			dead = {
				blocking = true,
				damage = 2554,
				description = "Destruitor Wreckage",
				footprintx = 3,
				footprintz = 3,
				metal = 1087,
				object = "gok/gok_abyss_dead.s3o",
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
				"hovmdok1",
			},
			select = {
				"hovmdsl1",
			},
		},
		weapondefs = {
			gok_beam = {
				areaofeffect = 16,
				beamtime = 0.75,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				energypershot = 500,
				firestarter = 90,
				impactonly = 1,
				impulseboost = 0,
				impulsefactor = 0,
				name = "Slesh Beam",
				noselfdamage = true,
				range = 900,
				reloadtime = 3,
				rgbcolor = "0.78 0.08 0.52",
				soundhitdry = "",
				soundhitwet = "sizzle",
				soundhitwetvolume = 0.5,
				soundstart = "techa_sounds/gok_beam",
				soundtrigger = 1,
				texture1 = "gokbeam",
				texture2 = "null",
				texture3 = "null",
				texture4 = "null",
				thickness = 10,
				turret = true,
				weapontype = "BeamLaser",
				customparams = {
					light_mult = 1.8,
					light_radius_mult = 1.2,
				},
				damage = {
					commanders = 900,
					default = 1800,
					subs = 5,
				},
				tracks = false,
			},
		},
		weapons = {
			{
				badtargetcategory = "SMALL MINOR",
				def = "GOK_BEAM",
				maindir = "0 0 1",
				maxangledif = 120,
				onlytargetcategory = "SURFACE",
			},
			{
				badtargetcategory = "SMALL MINOR",
				def = "GOK_BEAM",
				maindir = "0 0 1",
				maxangledif = 120,
				onlytargetcategory = "SURFACE",
				slaveto = 1,
			},
		},
	},
}
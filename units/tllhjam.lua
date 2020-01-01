return {
	tllhjam = {
		acceleration = 0.06,
		activatewhenbuilt = true,
		brakerate = 0.18,
		buildcostenergy = 1698,
		buildcostmetal = 219,
		builder = false,
		buildpic = "tllhjam.dds",
		buildtime = 6000,
		canguard = true,
		canhover = true,
		canmove = true,
		canpatrol = true,
		canstop = 1,
		category = "ALL HOVER MEDIUM MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON SURFACE",
		corpse = "dead",
		defaultmissiontype = "Standby",
		description = "Radar-Jamming Hovercraft",
		downloadable = 1,
		energymake = 25,
		energyuse = 100,
		explodeas = "BIG_UNITEX",
		firestandorders = 1,
		footprintx = 3,
		footprintz = 3,
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 22,
		maneuverleashlength = 640,
		mass = 203,
		maxdamage = 615,
		maxslope = 16,
		maxvelocity = 2.7,
		maxwaterdepth = 0,
		mobilestandorders = 1,
		movementclass = "TANKHOVER3",
		name = "Hippie",
		noautofire = false,
		nochasecategory = "VTOL",
		objectname = "tllhjam",
		onoffable = true,
		radardistancejam = 480,
		radaremitheight = 25,
		selfdestructas = "BIG_UNIT",
		sightdistance = 290,
		standingfireorder = 2,
		standingmoveorder = 1,
		steeringmode = 1,
		turninplace = 0,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 1.782,
		turnrate = 260,
		unitname = "tllhjam",
		customparams = {
			buildpic = "tllhjam.dds",
			faction = "TLL",
		},
		featuredefs = {
			dead = {
				blocking = true,
				damage = 815,
				description = "tllhjam Wreckage",
				featuredead = "heap",
				featurereclaimate = "smudge01",
				footprintx = 3,
				footprintz = 3,
				metal = 152,
				object = "tllhjam_dead",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
			heap = {
				blocking = false,
				damage = 1019,
				description = "tllhjam Debris",
				footprintx = 3,
				footprintz = 3,
				metal = 81,
				object = "3x3a",
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
				[1] = "kbarmmov",
			},
			select = {
				[1] = "radjam1",
			},
		},
	},
}
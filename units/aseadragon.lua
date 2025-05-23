return {
	aseadragon = {
		acceleration = 0.02,
		activatewhenbuilt = true,
		airsightdistance = 775,
		brakerate = 0.063,
		buildangle = 16384,
		buildcostenergy = 386255,
		buildcostmetal = 27013,
		buildpic = "aseadragon.dds",
		buildtime = 250000,
		canattack = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = 1,
		category = "ALL HUGE MOBILE SURFACE UNDERWATER",
		collisionvolumeoffsets = "0 -10 3",
		collisionvolumescales = "85 85 200",
		collisionvolumetype = "CylZ",
		corpse = "dead",
		defaultmissiontype = "Standby",
		description = "Heavy Battleship",
		energystorage = 1000,
		explodeas = "CRAWL_BLAST",
		firestandorders = 1,
		floater = true,
		footprintx = 8,
		footprintz = 8,
		icontype = "sea",
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 54,
		maneuverleashlength = 640,
		mass = 27013,
		maxdamage = 61500,
		maxvelocity = 1.4,
		minwaterdepth = 15,
		mobilestandorders = 1,
		movementclass = "HDBOAT8",
		name = "Epoch",
		noautofire = false,
		objectname = "arm/aseadragon.s3o",
		radardistance = 1500,
		radaremitheight = 54,
		seismicsignature = 0,
		selfdestructas = "BANTHA_BLAST",
		selfdestructcountdown = 10,
		sightdistance = 689,
		standingfireorder = 2,
		standingmoveorder = 1,
		steeringmode = 1,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 2.0,
		turnrate = 200,
		unitname = "aseadragon",
		waterline = 8,
		customparams = {
			buildpic = "aseadragon.dds",
			faction = "ARM",
			prioritytarget = "air",
			normaltex = "unittextures/arm_normals.dds",
		},
		featuredefs = {
			dead = {
				blocking = false,
				collisionvolumeoffsets = "0.439918518066 -4.07348632798e-05 0.367340087891",
				collisionvolumescales = "75.0081939697 51.5621185303 178.425750732",
				collisionvolumetype = "Box",
				damage = 28327,
				description = "Epoch Wreckage",
				energy = 0,
				featuredead = "heap",
				footprintx = 6,
				footprintz = 18,
				metal = 18750,
				object = "arm/aseadragon_dead.s3o",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
			heap = {
				blocking = false,
				damage = 35409,
				description = "Epoch Debris",
				energy = 0,
				footprintx = 2,
				footprintz = 2,
				metal = 10000,
				object = "6x6a.s3o",
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
				"sharmmov",
			},
			select = {
				"sharmsel",
			},
		},
		weapondefs = {
			arm_batsaftx = {
				accuracy = 350,
				areaofeffect = 64,
				avoidfeature = false,
				cegtag = "Trail_cannon_med",
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				explosiongenerator = "custom:FLASHSMALLUNIT",
				gravityaffected = true,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				name = "BattleShipCannon",
				nogap = 1,
				noselfdamage = true,
				range = 1400,
				reloadtime = 0.75,
				rgbcolor = "0.86 0.62 0",
				separation = 0.45,
				size = 1.82,
				sizedecay = -0.15,
				soundhitdry = "xplomed2",
				soundhitwet = "splssml",
				soundhitwetvolume = 0.6,
				soundstart = "cannhvy1",
				stages = 20,
				tolerance = 5000,
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 470,
				damage = {
					commanders = 112.5,
					default = 225,
					subs = 5,
				},
				tracks = false,
			},
			seadragonflak = {
				accuracy = 1000,
				areaofeffect = 144,
				avoidfeature = false,
				burnblow = true,
				canattackground = false,
				cegtag = "armflak-fx",
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.85,
				explosiongenerator = "custom:FLASHSMALLBUILDINGEX",
				gravityaffected = true,
				impulseboost = 0,
				impulsefactor = 0,
				name = "FlakCannon",
				noselfdamage = true,
				range = 775,
				reloadtime = 0.5,
				rgbcolor = "1.0 0.5 0.0",
				size = 5,
				soundhitdry = "flakhit",
				soundhitwet = "splsmed",
				soundhitwetvolume = 0.6,
				soundstart = "flakfire",
				turret = true,
				weapontimer = 1,
				weapontype = "Cannon",
				weaponvelocity = 1550,
				damage = {
					areoship = 62.5,
					default = 5,
					air = 250,
				},
				tracks = false,
			},
			seadragprime = {
				accuracy = 350,
				areaofeffect = 64,
				avoidfeature = false,
				cegtag = "Trail_cannon",
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				energypershot = 500,
				explosiongenerator = "custom:FLASH4",
				gravityaffected = true,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				name = "Battleship Cannon",
				nogap = 1,
				noselfdamage = true,
				range = 1800,
				reloadtime = 1,
				rgbcolor = "1 0.87 0.15",
				separation = 0.45,
				size = 1.53,
				sizedecay = -0.15,
				soundhitdry = "xplomed2",
				soundhitwet = "splssml",
				soundhitwetvolume = 0.6,
				soundstart = "cannhvy1",
				stages = 20,
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 600,
				damage = {
					commanders = 250,
					default = 500,
					subs = 5,
				},
				tracks = false,
			},
		},
		weapons = {
			{
				badtargetcategory = "MINOR",
				def = "SEADRAGPRIME",
				onlytargetcategory = "SURFACE",
			},
			{
				def = "ARM_BATSAFTX",
				maindir = "0 0 1",
				maxangledif = 320,
				onlytargetcategory = "SURFACE",
			},
			{
				badtargetcategory = "MINOR",
				def = "SEADRAGPRIME",
				maindir = "0 0 1",
				maxangledif = 240,
				onlytargetcategory = "SURFACE",
			},
			{
				def = "ARM_BATSAFTX",
				maindir = "-4 0 1",
				maxangledif = 180,
				onlytargetcategory = "SURFACE",
			},
			{
				def = "ARM_BATSAFTX",
				maindir = "4 0 1",
				maxangledif = 180,
				onlytargetcategory = "SURFACE",
			},
			{
				badtargetcategory = "MINOR MAJOR",
				def = "SEADRAGONFLAK",
				maindir = "1 0 0",
				maxangledif = 200,
				onlytargetcategory = "VTOL",
			},
			{
				badtargetcategory = "MINOR MAJOR",
				def = "SEADRAGONFLAK",
				maindir = "-1 0 0",
				maxangledif = 200,
				onlytargetcategory = "VTOL",
			},
		},
	},
}
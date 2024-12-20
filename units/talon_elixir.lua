return {
	talon_elixir = {
		buildangle = 8192,
		buildcostenergy = 1200000,
		buildcostmetal = 158000,
		builder = false,
		buildinggrounddecaldecayspeed = 30,
		buildinggrounddecalsizex = 19,
		buildinggrounddecalsizey = 19,
		buildinggrounddecaltype = "talon_aoplane.dds",
		buildpic = "talon_elixir.dds",
		buildtime = 5000000,
		canattack = true,
		canstop = 1,
		category = "ALL SURFACE",
		corpse = "dead",
		description = "Tech Level 4",
		downloadable = 1,
		explodeas = "KROG_BLAST",
		firestandorders = 1,
		footprintx = 14,
		footprintz = 14,
		icontype = "building",
		idleautoheal = 6,
		idletime = 1800,
		losemitheight = 175,
		mass = 150000,
		maxdamage = 16500,
		maxslope = 10,
		maxwaterdepth = 0,
		name = "Nuclear ICBM Launcher",
		noautofire = false,
		objectname = "talon/talon_elixir.s3o",
		radardistance = 0,
		radaremitheight = 175,
		selfdestructas = "KROG_BLAST",
		sightdistance = 350,
		standingfireorder = 0,
		unitname = "talon_elixir",
		usebuildinggrounddecal = true,
		yardmap = "oooooooooooooo oooooooooooooo oooooooooooooo oooooooooooooo oooooooooooooo oooooooooooooo oooooooooooooo oooooooooooooo oooooooooooooo oooooooooooooo oooooooooooooo oooooooooooooo oooooooooooooo oooooooooooooo",
		customparams = {
			buildpic = "talon_elixir.dds",
			faction = "TALON",
			normaltex = "unittextures/talon_normals.dds",
		},
		featuredefs = {
			dead = {
				blocking = true,
				damage = 9118,
				description = "Elixir Wreckage",
				featuredead = "heap",
				footprintx = 16,
				footprintz = 16,
				metal = 123111,
				object = "talon/talon_elixir_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				damage = 11397,
				description = "Elixir Debris",
				footprintx = 6,
				footprintz = 6,
				metal = 65659,
				object = "6x6d.s3o",
				reclaimable = true,
			},
		},
		sfxtypes = {
			explosiongenerators = {
				"custom:launchnuke",
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
				"servroc1",
			},
			select = {
				"servroc1",
			},
		},
		weapondefs = {
			talon_elixir_weapon = {
				areaofeffect = 2820,
				avoidfeature = false,
				avoidfriendly = false,
				cegtag = "Trail_nuke",
				collidefriendly = false,
				commandfire = true,
				craterareaofeffect = 4230,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.5,
				energypershot = 2800000,
				firestarter = 100,
				flighttime = 450,
				metalpershot = 16000,
				model = "weapon_nuke_adv.s3o",
				name = "Ultimate Nuclear Missile",
				range = 80000,
				reloadtime = 2,
				smoketrail = true,
				soundhitdry = "xplomed4",
				soundstart = "misicbm1",
				stockpile = true,
				stockpiletime = 150,
				targetable = 4,
				texture1 = "null",
				texture2 = "null",
				texture3 = "null",
				texture4 = "null",
				tolerance = 4000,
				turnrate = 20000,
				weaponacceleration = 75,
				weapontimer = 8,
				weapontype = "StarburstLauncher",
				weaponvelocity = 1500,
				damage = {
					commanders = 8500,
					default = 36000,
					subs = 8500,
				},
				tracks = false,
			},
		},
		weapons = {
			{
				def = "talon_elixir_WEAPON",
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
return {
	tllfsilo = {
		buildangle = 1700,
		buildcostenergy = 721385,
		buildcostmetal = 192006,
		builder = false,
		buildpic = "tllfsilo.dds",
		buildtime = 2000000,
		canattack = true,
		canstop = 1,
		category = "ALL SURFACE",
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "240 170 150",
		collisionvolumetype = "Box",
		corpse = "dead",
		description = "Tech Level 4",
		energymake = 0,
		explodeas = "KROG_BLAST",
		firestandorders = 1,
		footprintx = 16,
		footprintz = 10,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 301,
		mass = 192006,
		maxdamage = 15000,
		maxslope = 12,
		maxwaterdepth = 0,
		name = "Nuclear ICBM Launcher",
		noautofire = false,
		objectname = "tllfsilo",
		radaremitheight = 300,
		selfdestructas = "KROG_BLAST",
		sightdistance = 1200,
		standingfireorder = 2,
		unitname = "tllfsilo",
		yardmap = "oooooooooooooooo oooooooooooooooo oooooooooooooooo oooooooooooooooo oooooooooooooooo oooooooooooooooo oooooooooooooooo oooooooooooooooo oooooooooooooooo oooooooooooooooo oooooooooooooooo oooooooooooooooo",
		customparams = {
			buildpic = "tllfsilo.dds",
			faction = "TLL",
		},
		featuredefs = {
			dead = {
				blocking = true,
				damage = 9118,
				description = "Command Center Wreckage",
				featuredead = "heap",
				footprintx = 5,
				footprintz = 5,
				metal = 121500,
				object = "tllfsilo_dead",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
			heap = {
				blocking = false,
				damage = 11397,
				description = "Command Center Debris",
				footprintx = 5,
				footprintz = 5,
				metal = 78800,
				object = "5x5d",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:launchnuke",
			},
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
				[1] = "servroc1",
			},
			select = {
				[1] = "servroc1",
			},
		},
		weapondefs = {
			tll_ultimate_nuke = {
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
				--energypershot = 4200000,
				firestarter = 100,
				flighttime = 450,
				metalpershot = 32000,
				model = "weapon_nuke_adv_tll",
				name = "Ultimate Nuclear Missile",
				range = 80000,
				reloadtime = 30,
				smoketrail = true,
				soundhitdry = "xplomed4",
				soundstart = "misicbm1",
				stockpile = true,
				stockpiletime = 150,
				stockpiletime = 5,
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
					default = 50000,
					subs = 5,
				},
				customparams = {
					light_color = "1 0.6 0.2",
					light_mult = 7,
					light_radius_mult = 3,
					expl_light_color = "1 0.85 0.55",
					expl_light_mult = 1.25,
					expl_light_life_mult = 2.4,
					expl_light_radius_mult = 0.9,
				},
			},
		},
		weapons = {
			[1] = {
				def = "TLL_ULTIMATE_NUKE",
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
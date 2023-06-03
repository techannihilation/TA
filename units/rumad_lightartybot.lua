return {
	rumad_lightartybot = {
		acceleration = 0.07,
		brakerate = 0.54,
		buildcostenergy = 7100,
		buildcostmetal = 490,
		builder = false,
		buildpic = "rumad_lightartybot.dds",
		buildtime = 5500,
		canattack = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = 1,
		category = "ALL SMALL MOBILE SURFACE UNDERWATER",
		collisionvolumeoffsets = "0 -3 0",
		collisionvolumescales = "30 45 30",
		collisionvolumetest = 1,
		collisionvolumetype = "ellipsoid",
		corpse = "dead",
		defaultmissiontype = "Standby",
		description = "Artillery Kbot",
		explodeas = "BIG_UNITEX",
		firestandorders = 1,
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 55,
		hightrajectory = 1,
		maneuverleashlength = 640,
		mass = 490,
		maxdamage = 1550,
		maxslope = 30,
		maxvelocity = 1.2,
		maxwaterdepth = 50,
		mobilestandorders = 1,
		movementclass = "KBOT2",
		name = "Victory",
		noautofire = false,
		nochasecategory = "SUB VTOL",
		objectname = "rumad_lightartybot",
		radardistance = 0,
		radaremitheight = 55,
		selfdestructas = "BIG_UNIT",
		sightdistance = 500,
		standingfireorder = 2,
		standingmoveorder = 1,
		steeringmode = 2,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 1,
		turnrate = 750,
		unitname = "rumad_lightartybot",
		upright = true,
		customparams = {
			buildpic = "rumad_lightartybot.dds",
			faction = "RUMAD",
			--requiretech = "Advanced T2 Unit Research Centre",
		},
		featuredefs = {
			dead = {
				blocking = true,
				damage = 18309,
				description = "Rhyno Wreckage",
				featuredead = "heap",
				footprintx = 3,
				footprintz = 3,
				metal = 5655,
				object = "rumad_lightartybot_DEAD",
				reclaimable = true,
				customparams = {
					fromunit = 1,
				},
			},
			heap = {
				blocking = false,
				damage = 22886,
				description = "Rhyno Debris",
				footprintx = 3,
				footprintz = 3,
				metal = 3016,
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
				[1] = "mavbok1",
			},
			select = {
				[1] = "mavbsel1",
			},
		},
		weapondefs = {
			rumad_plasma = {
				accuracy = 800,
				areaofeffect = 196,
				avoidfeature = false,
				craterareaofeffect = 64,
				craterboost = 0,
				cratermult = 0,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				name = "Plasma",
				noselfdamage = true,
				proximitypriority = -3,
				range = 1200,
				reloadtime = 5,
				rgbcolor = "0.9 0.9 0.9",
				separation = 0.45,
				size = 2,
				sizedecay = -0.15,
				soundhitdry = "xplomed2",
				soundhitwet = "splshbig",
				soundhitwetvolume = 0.5,
				soundstart = "techa_sounds/rumad_plasma",
				--sprayangle = 360,
				stages = 20,
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 425,
				damage = {
					default = 360,
					subs = 5,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "MINOR",
				def = "RUMAD_PLASMA",
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
return {
	talon_seth = {
		acceleration = 0.02,
		activatewhenbuilt = true,
		autoheal = 250,
		brakerate = 0.165,
		buildcostenergy = 417022,
		buildcostmetal = 29910,
		builder = false,
		buildpic = "talon_seth.dds",
		buildtime = 900000,
		canattack = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = 1,
		category = "ALL LARGE MOBILE SURFACE UNDERWATER",
		collisionvolumeoffsets = "0 -10 -5",
		collisionvolumescales = "105 35 155",
		collisionvolumetype = "CylZ",
		corpse = "dead",
		defaultmissiontype = "Standby",
		description = "Safe Plasma Deflector",
		explodeas = "BIG_UNITEX",
		firestandorders = 1,
		footprintx = 8,
		footprintz = 8,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		losemitheight = 25,
		maneuverleashlength = 640,
		mass = 29910,
		maxdamage = 181850,
		maxslope = 12,
		maxvelocity = 1.3,
		maxwaterdepth = 15,
		mobilestandorders = 1,
		movementclass = "HTANK8",
		name = "Seth",
		noautofire = false,
		objectname = "talon_seth",
		radaremitheight = 25,
		seismicsignature = 0,
		selfdestructas = "BANTHA_BLAST",
		sightdistance = 500,
		standingfireorder = 2,
		standingmoveorder = 1,
		steeringmode = 1,
		trackoffset = 8,
		trackstrength = 12,
		trackstretch = 1,
		tracktype = "StdTank",
		trackwidth = 105,
		turninplace = 0,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 0.66,
		turnrate = 175,
		unitname = "talon_seth",
		customparams = {
			buildpic = "talon_seth.dds",
			faction = "TALON",
			shield_emit_height = 75,
			shield_power = 10000,
			shield_radius = 500,
		},
		featuredefs = {
			dead = {
				blocking = true,
				damage = 4354,
				description = "Seth Wreckage",
				energy = 0,
				featuredead = "heap",
				footprintx = 3,
				footprintz = 3,
				metal = 675,
				object = "talon_seth_DEAD",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				damage = 5443,
				description = "Seth Debris",
				energy = 0,
				footprintx = 3,
				footprintz = 3,
				metal = 360,
				object = "3X3F",
				reclaimable = true,
			},
		},
		sfxtypes = {
			explosiongenerators = {
				--[1] = "custom:MEDIUMFLARE",
					[2] = "custom:PILOT",
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
				[1] = "tarmmove",
			},
			select = {
				[1] = "tarmsel",
			},
		},
		weapondefs = {
			carbuncle_rc = {
				accuracy = 500,
				areaofeffect = 64,
				avoidfeature = false,
				burnblow = true,
				cegtag = "carbuncleblaster",
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				explosiongenerator = "custom:Explosion_Light_Plasma-2",
				impulseboost = 0.123,
				impulsefactor = 0.123,
				intensity = 3,
				name = "Carbuncle Blaster",
				noselfdamage = true,
				range = 800,
				reloadtime = 0.2,
				rgbcolor = "0.05 0.9 1.0",
				size = 1.2,
				soundhitdry = "xplomed3",
				soundhitwet = "splssml",
				soundhitwetvolume = 0.6,
				soundstart = "Mavgun2",
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 600,
				damage = {
					default = 300,
					subs = 5,
				},
			},
			repulsor2 = {
				name = "Plasma Repulsor",
				shieldbadcolor = "1 0.2 0.2 0.30",
				shieldenergyuse = 2500,
				shieldforce = 8,
					shieldgoodcolor = "0.2 1 0.2 0.30",
				shieldintercepttype = 1,
				shieldpower = 30000,
				shieldpowerregen = 250,
				shieldpowerregenenergy = 2500,
				shieldradius = 500,
				shieldrepulser = true,
				smartshield = true,
				visibleshieldrepulse = true,
				weapontype = "Shield",
				damage = {
					default = 100,
					subs = 5,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "SMALL MINOR",
				def = "CARBUNCLE_RC",
				maindir = "0 0 1",
				maxangledif = 300,
				onlytargetcategory = "SURFACE",
			},
			[3] = {
				def = "REPULSOR2",
			},
		},
	},
}
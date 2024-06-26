return {
	rumad_jafa = {
		acceleration = 0.009,
		airhoverfactor = 0,
		airstrafe = false,
		airsightdistance = 850,
		bankingallowed = false,
		blocking = false,
		brakerate = 0.04,
		buildcostenergy = 2325000,
		buildcostmetal = 435700,
		builder = false,
		buildpic = "rumad_jafa.dds",
		buildtime = 4200000,
		canattack = true,
		canfly = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = 1,
		category = "ALL MOBILE MAJOR SURFACE VTOL",
		collide = false,
		collisionvolumeoffsets = "0 -30 20",
		collisionvolumescales = "180 155 325",
		collisionvolumetype = "Ell",
		corpse = "dead",
		cruisealt = 50,
		description = "Cruser AeroShip",
		dontland = 1,
		energystorage = 10000,
		explodeas = "MKL_BLAST",
		footprintx = 16,
		footprintz = 22,
		hoverattack = true,
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 75.5,
		mass = 435700,
		maxdamage = 1000000,
		maxslope = 10,
		maxvelocity = 0.9,
		maxwaterdepth = 255,
		metalstorage = 1000,
		name = "Jafa",
		objectname = "rumad/rumad_jafa.s3o",
		radardistance = 0,
		radaremitheight = 30,
		selfdestructas = "MEGA_BLAST",
		selfdestructcountdown = 10,
		sightdistance = 1000,
		turninplaceanglelimit = 360,
		turninplacespeedlimit = 0.627,
		turnrate = 86.45,
		unitname = "rumad_jafa",
		customparams = {
			buildpic = "rumad_jafa.dds",
			faction = "RUMAD",
			normaltex = "unittextures/rumad_normals.dds",
		},
		featuredefs = {
			dead = {
				blocking = true,
				damage = 212731,
				description = "Jafa Wreckage",
				footprintx = 6,
				footprintz = 8,
				object = "rumad/rumad_jafa_dead.s3o",
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
			arrived = {
				"bigstop",
			},
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
				"biggo",
			},
			select = {
				"bigsel",
			},
		},
		weapondefs = {
			rumad_plasma = {
				accuracy = 200,
				areaofeffect = 196,
				avoidfeature = false,
				craterareaofeffect = 64,
				craterboost = 0,
				cratermult = 0,
				explosiongenerator = "custom:FLASH96",
				impulseboost = 0.123,
				impulsefactor = 0.123,
				name = "Plasma",
				noselfdamage = true,
				range = 2000,
				reloadtime = 3,
				rgbcolor = "0.9 0.9 0.9",
				separation = 0.45,
				size = 2,
				sizedecay = -0.15,
				soundhitdry = "xplomed2",
				soundhitwet = "splshbig",
				soundhitwetvolume = 0.5,
				soundstart = "techa_sounds/rumad_plasma",
				sprayangle = 360,
				stages = 20,
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 600,
				damage = {
					default = 3600,
					subs = 5,
				},
				tracks = false,
			},
			rumad_flak_gun = {
				accuracy = 1000,
				areaofeffect = 96,
				avoidfeature = false,
				burnblow = true,
				canattackground = false,
				cegtag = "rumadflak-fx",
				craterareaofeffect = 96,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.85,
				explosiongenerator = "custom:FLASH3",
				gravityaffected = true,
				impulseboost = 0,
				impulsefactor = 0,
				name = "FlakCannon",
				noselfdamage = true,
				range = 850,
				reloadtime = 0.15,
				rgbcolor = "1.0 0.5 0.0",
				size = 2,
				soundhitdry = "flakhit",
				soundhitwet = "splslrg",
				soundhitwetvolume = 0.6,
				soundstart = "flakfire",
				turret = true,
				weapontimer = 1,
				weapontype = "Cannon",
				weaponvelocity = 1800,
				damage = {
					areoship = 18.75,
					default = 5,
					air = 75,
				},
				tracks = false,
			},
		},
		weapons = {
			{
				badtargetcategory = "HUGE LARGE MEDIUM SMALL MINOR",
				def = "RUMAD_PLASMA",
				maindir = "0 0 1",
				maxangledif = 270,
				onlytargetcategory = "SURFACE",
			},
			{
				badtargetcategory = "HUGE LARGE MEDIUM SMALL MINOR",
				def = "RUMAD_PLASMA",
				maindir = "0 0 1",
				maxangledif = 270,
				onlytargetcategory = "SURFACE",
				slaveto = 1,
			},
			{
				badtargetcategory = "HUGE LARGE MEDIUM SMALL MINOR",
				def = "RUMAD_PLASMA",
				maindir = "0 0 1",
				maxangledif = 270,
				onlytargetcategory = "SURFACE",
				slaveto = 1,
			},
			{
				badtargetcategory = "HUGE LARGE MEDIUM SMALL MINOR",
				def = "RUMAD_PLASMA",
				maindir = "0 0 1",
				maxangledif = 270,
				onlytargetcategory = "SURFACE",
			},
			{
				badtargetcategory = "HUGE LARGE MEDIUM SMALL MINOR",
				def = "RUMAD_PLASMA",
				maindir = "0 0 1",
				maxangledif = 270,
				onlytargetcategory = "SURFACE",
				slaveto = 4,
			},
			{
				badtargetcategory = "HUGE LARGE MEDIUM SMALL MINOR",
				def = "RUMAD_PLASMA",
				maindir = "0 0 1",
				maxangledif = 270,
				onlytargetcategory = "SURFACE",
				slaveto = 4,
			},
			{
				badtargetcategory = "HUGE LARGE MEDIUM SMALL MINOR",
				def = "RUMAD_PLASMA",
				maindir = "0 0 -1",
				maxangledif = 270,
				onlytargetcategory = "SURFACE",
			},
			{
				badtargetcategory = "HUGE LARGE MEDIUM SMALL MINOR",
				def = "RUMAD_PLASMA",
				maindir = "0 0 -1",
				maxangledif = 270,
				onlytargetcategory = "SURFACE",
				slaveto = 7,
			},
			{
				badtargetcategory = "HUGE LARGE MEDIUM SMALL MINOR",
				def = "RUMAD_PLASMA",
				maindir = "0 0 -1",
				maxangledif = 270,
				onlytargetcategory = "SURFACE",
				slaveto = 7,
			},
			{
				badtargetcategory = "HUGE LARGE MEDIUM SMALL MINOR",
				def = "RUMAD_PLASMA",
				maindir = "0 0 -1",
				maxangledif = 270,
				onlytargetcategory = "SURFACE",
			},
			{
				badtargetcategory = "HUGE LARGE MEDIUM SMALL MINOR",
				def = "RUMAD_PLASMA",
				maindir = "0 0 -1",
				maxangledif = 270,
				onlytargetcategory = "SURFACE",
				slaveto = 10,
			},
			{
				badtargetcategory = "HUGE LARGE MEDIUM SMALL MINOR",
				def = "RUMAD_PLASMA",
				maindir = "0 0 -1",
				maxangledif = 270,
				onlytargetcategory = "SURFACE",
				slaveto = 10,
			},
			{
				badtargetcategory = "MINOR MAJOR",
				def = "RUMAD_FLAK_GUN",
				maindir = "0 0 1",
				maxangledif = 270,
				onlytargetcategory = "VTOL",
			},
			{
				badtargetcategory = "MINOR MAJOR",
				def = "RUMAD_FLAK_GUN",
				maindir = "0 0 1",
				maxangledif = 270,
				onlytargetcategory = "VTOL",
				slaveto = 1,
			},
			{
				badtargetcategory = "MINOR MAJOR",
				def = "RUMAD_FLAK_GUN",
				maindir = "1 0 0",
				maxangledif = 240,
				onlytargetcategory = "VTOL",
			},
			{
				badtargetcategory = "MINOR MAJOR",
				def = "RUMAD_FLAK_GUN",
				maindir = "1 0 0",
				maxangledif = 240,
				onlytargetcategory = "VTOL",
				slaveto = 15,
			},
			{
				badtargetcategory = "MINOR MAJOR",
				def = "RUMAD_FLAK_GUN",
				maindir = "-1 0 0",
				maxangledif = 240,
				onlytargetcategory = "VTOL",
			},
			{
				badtargetcategory = "MINOR MAJOR",
				def = "RUMAD_FLAK_GUN",
				maindir = "-1 0 0",
				maxangledif = 240,
				onlytargetcategory = "VTOL",
				slaveto = 17,
			},
		},
	},
}
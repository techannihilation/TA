-- UNITDEF -- SNOWMAN --
--------------------------------------------------------------------------------

local unitName = "snowman"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.1,
	ai_limit = [[limit ARMAMPH 20]],
	ai_weight = [[weight ARMAMPH 0.5]],
	bmcode = 1,
	brakeRate = 0.15,
	buildCostEnergy = 9054,
	buildCostMetal = 1712,
	builder = false,
	buildTime = 28137,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	cloakCost = 800,
	cloakCostMoving = 1200,
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Long Range Paralyzer Kbot]],
	designation = [[BK-CD4]],
	downloadable = 1,
	energyMake = 1.9,
	energyStorage = 0,
	energyUse = 1.9,
	explodeAs = [[SMALL_UNIT]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	frenchdescription = [[Kbot paralysant à longue portée]],
	frenchname = [[Snow Man]],
	germandescription = [[Paralysier Kbot mit großer Reichweite]],
	germanname = [[Snow Man]],
	italiandescription = [[Ice Kbot]],
	italianname = [[Snowman]],
	maneuverleashlength = 640,
	maxDamage = 920,
	maxSlope = 14,
	maxVelocity = 1.3,
	maxWaterDepth = 22,
	metalStorage = 0,
	minCloakDistance = 40,
	mobilestandorders = 1,
	movementClass = [[KBOT2]],
	name = [[Snow Man]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[snowman]],
	radarDistance = 0,
	selfDestructAs = [[SMALL_UNIT]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 680,
	spanishdescription = [[Ice Kbot]],
	spanishname = [[Snowman]],
	standingfireorder = 0,
	standingmoveorder = 1,
	steeringmode = 2,
	threed = 1,
	turnRate = 1216,
	unitname = [[snowman]],
	unitnumber = 2504523,
	upright = true,
	version = 1.2,
	workerTime = 0,
	zbuffer = 1,
	featureDefs = nil,
	sounds = {
		canceldestruct = [[cancel2]],
		underattack = [[warning1]],
		cant = {
			[1] = [[cantdo4]],
		},
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		ok = {
			[1] = [[kbarmmov]],
		},
		select = {
			[1] = [[kbarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[SMALL TINY]],
			def = [[armsnowman_weapon]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	armsnowman_weapon = {
		areaOfEffect = 32,
		beamWeapon = true,
		collideFriendly = false,
		craterBoost = 0,
		craterMult = 0,
		duration = 0.0025,
		energypershot = 500,
		explosionGenerator = [[custom:FLASH1nd]],
		fireStarter = -100,
		id = 140,
		impactonly = 1,
		impulserboost = 0,
		impulserfactor = 0,
		intensity = 0.75,
		lineOfSight = true,
		name = [[Sub-Zero Weapon]],
		noradar = 1,
		noSelfDamage = true,
		paralyzer = true,
		paralyzeTime = 20,
		range = 1300,
		reloadtime = 10,
		renderType = 0,
		rgbColor = [[1 1 0]],
		soundHit = [[xplolrg2]],
		soundHitVolume = 12,
		soundStart = [[sniper2]],
		soundStartVolume = 12,
		thickness = 0.5,
		turret = true,
		weaponType = [[LaserCannon]],
		weaponVelocity = 6000,
		damage = {
			commanders = 5000,
			default = 36600,
			sniper_resistant = 12200,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[arm_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Snowman Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[snowman_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Snowman Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[2x2d]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

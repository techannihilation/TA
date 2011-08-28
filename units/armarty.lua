-- UNITDEF -- ARMARTY --
--------------------------------------------------------------------------------

local unitName = "armarty"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.016,
	bmcode = 1,
	brakeRate = 0.01,
	buildCostEnergy = 2546,
	buildCostMetal = 395,
	builder = false,
	buildTime = 5104,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Level 1 Artillery]],
	designation = [[ARM-ART5]],
	downloadable = 1,
	energyMake = 0.6,
	energyStorage = 0,
	energyUse = 0.6,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	frenchdescription = [[Artillerie de niv.1]],
	germandescription = [[L1 Artillerie]],
	maneuverleashlength = 640,
	maxDamage = 458,
	maxSlope = 10,
	maxVelocity = 1.4,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANK2]],
	name = [[Gladius]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMARTY]],
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 780,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 450,
	unitname = [[armarty]],
	unitnumber = 3524,
	upright = true,
	version = 1,
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
			[1] = [[tarmmove]],
		},
		select = {
			[1] = [[tarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[LVL1_GUN]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	LVL1_GUN = {
		accuracy = 300,
		areaOfEffect = 72,
		ballistic = true,
		craterBoost = 0,
		craterMult = 0,
		explosionart = [[explode3]],
		explosiongaf = [[fx]],
		gravityaffected = [[true]],
		id = 119,
		impulseBoost = 0,
		impulseFactor = 0,
		lavaexplosionart = [[lavasplash]],
		lavaexplosiongaf = [[fx]],
		minbarrelangle = -10,
		name = [[Light Artillery Cannon]],
		noSelfDamage = true,
		range = 1090,
		reloadtime = 3,
		renderType = 4,
		soundHit = [[xplomed4]],
		soundStart = [[cannhvy2]],
		startsmoke = 1,
		turret = true,
		waterexplosionart = [[h2o]],
		waterexplosiongaf = [[fx]],
		weaponType = [[Cannon]],
		weaponVelocity = 410,
		damage = {
			default = 112,
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
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ARMARTY_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Heap]],
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

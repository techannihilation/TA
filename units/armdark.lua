-- UNITDEF -- ARMDARK --
--------------------------------------------------------------------------------

local unitName = "armdark"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.01,
	bmcode = 1,
	brakeRate = 0.007629395,
	buildCostEnergy = 4994,
	buildCostMetal = 267,
	builder = false,
	buildTime = 14223,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Rocket Tank]],
	designation = [[ARM-H]],
	energyMake = 0.8,
	energyStorage = 0,
	energyUse = 0.8,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Char lance-roquettes]],
	frenchname = [[Dark]],
	germandescription = [[Raketenpanzer]],
	germanname = [[Dark]],
	maneuverleashlength = 640,
	maxDamage = 1600,
	maxSlope = 12,
	maxVelocity = 1.1,
	maxWaterDepth = 100,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANK3]],
	name = [[Dark]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMDARK]],
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 510,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 300,
	unitname = [[armdark]],
	unitnumber = 2541,
	version = 3,
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
			def = [[CORHORG_MISSILE]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORHORG_MISSILE = {
		areaOfEffect = 48,
		craterBoost = 0,
		craterMult = 0,
		explosionart = [[explode3]],
		explosiongaf = [[fx]],
		fireStarter = 70,
		guidance = true,
		id = 234,
		lavaexplosionart = [[lavasplash]],
		lavaexplosiongaf = [[fx]],
		lineOfSight = true,
		metalpershot = 0,
		model = [[missilehorgue]],
		name = [[Guided Missiles]],
		range = 750,
		reloadtime = 7,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHit = [[xplosml2]],
		soundStart = [[tirhorgue]],
		startsmoke = 1,
		startVelocity = 450,
		tolerance = 8000,
		tracks = true,
		turnRate = 24384,
		turret = true,
		waterexplosionart = [[h2o]],
		waterexplosiongaf = [[fx]],
		weaponAcceleration = 130,
		weaponTimer = 7,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 559,
		damage = {
			default = 315,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[core_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 4,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[armdark_dead]],
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
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3x3c]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

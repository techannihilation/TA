-- UNITDEF -- COREKATY --
--------------------------------------------------------------------------------

local unitName = "corekaty"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.027,
	bmcode = 1,
	brakeRate = 0.012,
	buildCostEnergy = 7447,
	buildCostMetal = 1020,
	builder = false,
	buildTime = 16820,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Rocket Truck]],
	designation = [[CORE-KATY]],
	downloadable = 1,
	energyMake = 0.5,
	energyStorage = 0,
	energyUse = 0.5,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Camion lance-roquettes]],
	frenchname = [[Katyushka]],
	germandescription = [[Raketen LKW]],
	germanname = [[Katyushka]],
	maneuverleashlength = 640,
	maxDamage = 425,
	maxSlope = 16,
	maxVelocity = 1.05,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANK3]],
	name = [[Katyusha]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[COREKATY]],
	radarDistance = 0,
	selfdamage = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 230,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 512,
	unitname = [[corekaty]],
	unitnumber = 4000,
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
			[1] = [[vcormove]],
		},
		select = {
			[1] = [[vcorsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[BARRAGE]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	BARRAGE = {
		areaOfEffect = 115,
		ballistic = true,
		burst = 3,
		burstrate = 0.21,
		collideFriendly = false,
		craterBoost = 0,
		craterMult = 0,
		energypershot = 0,
		explosionart = [[explode3]],
		explosiongaf = [[fx]],
		fireStarter = 10,
		flightTime = 5,
		gravityaffected = [[true]],
		id = 137,
		impulseBoost = 0,
		impulseFactor = 0,
		lavaexplosionart = [[lavasplash]],
		lavaexplosiongaf = [[fx]],
		model = [[missile]],
		name = [[Barrage Rocket]],
		noSelfDamage = true,
		range = 1600,
		reloadtime = 30,
		renderType = 1,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHit = [[xplomed2]],
		soundStart = [[rockhvy2]],
		soundTrigger = true,
		sprayAngle = 0,
		startsmoke = 1,
		tolerance = 8000,
		tracks = true,
		turnRate = 55000,
		turret = true,
		waterexplosionart = [[h2o]],
		waterexplosiongaf = [[fx]],
		weaponTimer = 5,
		weaponType = [[Cannon]],
		weaponVelocity = 464.75799560547,
		damage = {
			commanders = 250,
			default = 1000,
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
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[corekaty_dead]],
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
		object = [[3x3f]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- CORBT --
--------------------------------------------------------------------------------

local unitName = "corbt"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.03,
	bmcode = 1,
	brakeRate = 0.03029395,
	buildCostEnergy = 201900,
	buildCostMetal = 14950,
	builder = false,
	buildTime = 155530,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	cantBeTransported = true,
	category = [[ALL HUGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Heavy Weapons Platform]],
	designation = [[AC-BT]],
	energyMake = 0,
	energyStorage = 0,
	energyUse = 100,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 5,
	footprintZ = 5,
	frenchdescription = [[Char d'assaut lourd évolué]],
	frenchname = [[Sloth]],
	germandescription = [[mobile Belagerungsplattform]],
	germanname = [[Sloth]],
	maneuverleashlength = 640,
	maxDamage = 38650,
	maxSlope = 12,
	maxVelocity = 1.2,
	maxWaterDepth = 20,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[htank5]],
	name = [[Metron]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORBT]],
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 1000,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 80,
	unitname = [[corbt]],
	unitnumber = 317,
	version = 3.1,
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
			[1] = [[tcormove]],
		},
		select = {
			[1] = [[tcorsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[CORBT_CANNON]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORBT_CANNON = {
		areaOfEffect = 210,
		ballistic = true,
		craterMult = 0.02,
		edgeEffectiveness = 0.18,
		explosionart = [[rogboom1]],
		explosiongaf = [[rogboom1]],
		explosionGenerator = [[custom:BT_BOMB_explosion]],
		gravityaffected = [[true]],
		id = 239,
		impulseBoost = 0.2,
		impulseFactor = 0.2,
		lineOfSight = true,
		model = [[bomb]],
		name = [[Pepper spray]],
		noSelfDamage = false,
		projectiles = 30,
		range = 1150,
		reloadtime = 8,
		renderType = 1,
		shakeduration = 0,
		shakemagnitude = 0,
		size = 2.5,
		soundHit = [[explode3]],
		soundStart = [[mortar_snottyboy]],
		sprayAngle = 2100,
		turret = true,
		waterexplosionart = [[h2o]],
		waterexplosiongaf = [[fx]],
		weaponType = [[Cannon]],
		weaponVelocity = 500,
		damage = {
			commanders = 100,
			default = 500,
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
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[CORBT_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[allworlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		hitdensity = 4,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[4x4a]],
		reclamable = 1,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

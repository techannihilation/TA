-- UNITDEF -- CORMENA --
--------------------------------------------------------------------------------

local unitName = "cormena"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.0762939455,
	bmcode = 1,
	brakeRate = 0.0762939455,
	buildCostEnergy = 50341,
	buildCostMetal = 4328,
	builder = false,
	buildTime = 106237,
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
	description = [[All-Terrain Long Range Plasma Cannon KBot]],
	designation = [[COR-MENA]],
	downloadable = 1,
	energyMake = 10,
	energyStorage = 100,
	energyUse = 10,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Kbot à canon à plasma à longue portée]],
	frenchname = [[Menacer]],
	germandescription = [[Kbot mit weitreichender Plasmakanone]],
	germanname = [[Menacer]],
	maneuverleashlength = 640,
	maxDamage = 1950,
	maxSlope = 10,
	maxVelocity = 0.7629,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TKBOT3]],
	name = [[Menacer]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORMENA]],
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 245,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 510,
	unitname = [[cormena]],
	unitnumber = 20000,
	upright = false,
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
			[1] = [[kbcormov]],
		},
		select = {
			[1] = [[kbcorsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[MENACER]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	MENACER = {
		accuracy = 400,
		aimrate = 2500,
		areaOfEffect = 100,
		ballistic = true,
		craterBoost = 0,
		craterMult = 0,
		energypershot = 500,
		explosionart = [[NUKE1]],
		explosiongaf = [[fx]],
		fireStarter = 50,
		gravityaffected = [[true]],
		holdtime = 1,
		id = 255,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lavaexplosionart = [[lavasplashlg]],
		lavaexplosiongaf = [[fx]],
		name = [[Menacer Cannon]],
		range = 2800,
		reloadtime = 8,
		renderType = 4,
		soundHit = [[xplonuk1]],
		soundStart = [[xplonuk3]],
		startsmoke = 1,
		tolerance = 300,
		turret = true,
		waterexplosionart = [[h2oboom2]],
		waterexplosiongaf = [[fx]],
		weaponType = [[Cannon]],
		weaponVelocity = 1000,
		damage = {
			default = 700,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	corgol_heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Goliath Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 4,
		footprintZ = 4,
		height = 4,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[4X4C]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	dead = {
		blocking = true,
		category = [[core_corpses]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[corgol_heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[cormena_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

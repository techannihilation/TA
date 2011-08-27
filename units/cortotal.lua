-- UNITDEF -- CORTOTAL --
--------------------------------------------------------------------------------

local unitName = "cortotal"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.013,
	bmcode = 1,
	brakeRate = 0.02,
	buildCostEnergy = 32642,
	buildCostMetal = 3678,
	builder = false,
	buildTime = 28402,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Salvo Fire Artillery]],
	designation = [[by-cool-man]],
	energyMake = 5,
	energyStorage = 0,
	energyUse = 5,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	frenchdescription = [[Artillerie à feu nourri]],
	frenchname = [[Totalitarian]],
	germandescription = [[Salvenfeuernde Artillerie]],
	germanname = [[Totalitarian]],
	italiandescription = [[Salvo Fire Artillery]],
	italianname = [[Totalitarian]],
	maneuverleashlength = 640,
	maxDamage = 1843,
	maxVelocity = 1.1,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[hTANK4]],
	name = [[Totalitarian]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORTOTAL]],
	ovradjust = 1,
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 270,
	spanishdescription = [[Salvo Fire Artillery]],
	spanishname = [[Totalitarian]],
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 400,
	unitname = [[cortotal]],
	unitnumber = 5365,
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
			[1] = [[tcormove]],
		},
		select = {
			[1] = [[tcorsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[COR_TOTAL]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	COR_TOTAL = {
		accuracy = 10,
		areaOfEffect = 420,
		ballistic = true,
		burnblow = true,
		burst = 3,
		burstrate = 0.7,
		craterBoost = 0,
		craterMult = 0,
		explosionart = [[explode2]],
		explosiongaf = [[fx]],
		gravityaffected = [[true]],
		id = 211,
		impulseBoost = 0,
		impulseFactor = 0,
		lavaexplosionart = [[lavasplash]],
		lavaexplosiongaf = [[fx]],
		minbarrelangle = -25,
		name = [[Totalitarian Cannon]],
		range = 2340,
		reloadtime = 6,
		renderType = 4,
		soundHit = [[xplomed21]],
		soundStart = [[cannhvy1]],
		startsmoke = 1,
		turret = true,
		waterexplosionart = [[h2o]],
		waterexplosiongaf = [[fx]],
		weaponType = [[Cannon]],
		weaponVelocity = 562.0498046875,
		damage = {
			default = 140,
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
		object = [[cortotal_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

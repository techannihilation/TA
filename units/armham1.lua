-- UNITDEF -- ARMHAM1 --
--------------------------------------------------------------------------------

local unitName = "armham1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.12,
	bmcode = 1,
	brakeRate = 0.225,
	buildCostEnergy = 2131,
	buildCostMetal = 248,
	builder = false,
	buildPic = [[ARMHAM.png]],
	buildTime = 2210,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[ARMHAM_DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Light Plasma Kbot]],
	energyMake = 0.6,
	energyStorage = 0,
	energyUse = 0.6,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 1510,
	maxSlope = 14,
	maxVelocity = 1.4,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[KBOT2]],
	name = [[Heavy Hammer]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMHAM1]],
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[ARM]],
	sightDistance = 380,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	turnRate = 1094,
	unitname = [[armham1]],
	upright = true,
	workerTime = 0,
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
			def = [[ARM_HAM1]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARM_HAM1 = {
		areaOfEffect = 54,
		ballistic = true,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:LIGHTARMS]],
		gravityaffected = [[true]],
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		minbarrelangle = -35,
		name = [[PlasmaCannon]],
		noSelfDamage = true,
		predictBoost = 0.4,
		range = 385,
		reloadtime = 1.75,
		renderType = 4,
		soundHit = [[xplomed3]],
		soundStart = [[cannon1]],
		startsmoke = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 286,
		damage = {
			default = 184,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	ARMHAM_DEAD = {
		blocking = true,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[ARMHAM_HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 40,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ARMHAM_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	ARMHAM_HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[2X2E]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

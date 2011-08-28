-- UNITDEF -- ARMST --
--------------------------------------------------------------------------------

local unitName = "armst"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.0264,
	bmcode = 1,
	brakeRate = 0.055,
	buildCostEnergy = 3480,
	buildCostMetal = 212,
	builder = false,
	buildPic = [[ARMST.png]],
	buildTime = 6704,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	cloakCost = 5,
	cloakCostMoving = 20,
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Stealth Tank]],
	energyMake = 0.9,
	energyStorage = 0,
	energyUse = 0.9,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	idleAutoHeal = 5,
	idleTime = 1800,
	initCloaked = false,
	leaveTracks = true,
	maneuverleashlength = 640,
	maxDamage = 950,
	maxSlope = 12,
	maxVelocity = 2.497,
	maxWaterDepth = 0,
	metalStorage = 0,
	minCloakDistance = 65,
	mobilestandorders = 1,
	movementClass = [[TANK2]],
	name = [[Gremlin]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMST]],
	seismicSignature = 4,
	selfDestructAs = [[BIG_UNIT]],
	side = [[ARM]],
	sightDistance = 494,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	stealth = true,
	steeringmode = 1,
	trackOffset = 0,
	trackStrength = 6,
	trackStretch = 1,
	trackType = [[StdTank]],
	trackWidth = 29,
	turnRate = 701.8,
	unitname = [[armst]],
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
			[1] = [[tarmmove]],
		},
		select = {
			[1] = [[tarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ARMST_GAUSS]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMST_GAUSS = {
		areaOfEffect = 8,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH1nd]],
		impactonly = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		minbarrelangle = -15,
		name = [[Gauss]],
		noSelfDamage = true,
		range = 220,
		reloadtime = 4,
		renderType = 4,
		soundHit = [[xplomed2]],
		soundStart = [[cannhvy1]],
		startsmoke = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 450,
		damage = {
			default = 350,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = true,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 15,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ARMST_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	HEAP = {
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
		object = [[2X2B]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

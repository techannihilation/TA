-- UNITDEF -- ARMBULL --
--------------------------------------------------------------------------------

local unitName = "armbull"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.0396,
	bmcode = 1,
	brakeRate = 0.055,
	buildCostEnergy = 14593,
	buildCostMetal = 844,
	builder = false,
	buildPic = [[ARMBULL.png]],
	buildTime = 17228,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Heavy Assault Tank]],
	energyMake = 0.8,
	energyStorage = 0,
	energyUse = 0.8,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	idleAutoHeal = 5,
	idleTime = 1800,
	leaveTracks = true,
	maneuverleashlength = 640,
	maxDamage = 5400,
	maxSlope = 12,
	maxVelocity = 2.037,
	maxWaterDepth = 15,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[HTANK3]],
	name = [[Bulldog]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMBULL]],
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[ARM]],
	sightDistance = 494,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	trackOffset = 8,
	trackStrength = 10,
	trackStretch = 1,
	trackType = [[StdTank]],
	trackWidth = 40,
	turnRate = 378,
	unitname = [[armbull]],
	workerTime = 0,
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:MEDIUMFLARE]],
		},
	},
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
			def = [[ARM_BULL]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARM_BULL = {
		areaOfEffect = 140,
		ballistic = true,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH72]],
		gravityaffected = [[true]],
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		name = [[PlasmaCannon]],
		noSelfDamage = true,
		range = 460,
		reloadtime = 1.12,
		renderType = 4,
		soundHit = [[xplomed2]],
		soundStart = [[cannon3]],
		startsmoke = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 300,
		damage = {
			default = 240,
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
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ARMBULL_DEAD]],
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
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3X3F]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

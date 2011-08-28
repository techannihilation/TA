-- UNITDEF -- ARMANAC --
--------------------------------------------------------------------------------

local unitName = "armanac"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.084,
	bmcode = 1,
	brakeRate = 0.112,
	buildCostEnergy = 2444,
	buildCostMetal = 269,
	builder = false,
	buildPic = [[ARMANAC.png]],
	buildTime = 3194,
	canAttack = true,
	canGuard = true,
	canHover = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL HOVER MEDIUM MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Hovertank]],
	energyMake = 2.6,
	energyStorage = 0,
	energyUse = 2.6,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 1377,
	maxSlope = 16,
	maxVelocity = 2.53,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[HOVER3]],
	name = [[Anaconda]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[ARMANAC]],
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[ARM]],
	sightDistance = 509,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 525,
	unitname = [[armanac]],
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
			[1] = [[hovmdok1]],
		},
		select = {
			[1] = [[hovmdsl1]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ARMANAC_WEAPON]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMANAC_WEAPON = {
		areaOfEffect = 32,
		ballistic = true,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH2]],
		gravityaffected = [[true]],
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		name = [[MediumPlasmaCannon]],
		noSelfDamage = true,
		range = 320,
		reloadtime = 1.4,
		renderType = 4,
		soundHit = [[xplosml3]],
		soundStart = [[canlite3]],
		startsmoke = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 260,
		damage = {
			default = 98,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = false,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ARMANAC_DEAD]],
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
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3X3D]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

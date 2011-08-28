-- UNITDEF -- ARMASER --
--------------------------------------------------------------------------------

local unitName = "armaser"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.12,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.15,
	buildCostEnergy = 1326,
	buildCostMetal = 73,
	builder = false,
	buildPic = [[ARMASER.png]],
	buildTime = 4937,
	canAttack = false,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL SMALL WEAPON]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Radar Jammer Kbot]],
	energyMake = 0,
	energyStorage = 0,
	energyUse = 100,
	explodeAs = [[BIG_UNITEX]],
	footprintX = 2,
	footprintZ = 2,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 305,
	maxSlope = 32,
	maxVelocity = 1.61,
	maxWaterDepth = 112,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[KBOT2]],
	name = [[Eraser]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMASER]],
	onoffable = true,
	radarDistanceJam = 450,
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[ARM]],
	sightDistance = 260,
	smoothAnim = true,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 1045,
	unitname = [[armaser]],
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
			[1] = [[radjam1]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[BOGUS_GROUND_MISSILE]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	BOGUS_GROUND_MISSILE = {
		areaOfEffect = 48,
		craterBoost = 0,
		craterMult = 0,
		impulseBoost = 0,
		impulseFactor = 0,
		lineOfSight = true,
		metalpershot = 0,
		name = [[Missiles]],
		range = 800,
		reloadtime = 0.5,
		renderType = 1,
		startVelocity = 450,
		tolerance = 9000,
		turnRate = 33000,
		turret = true,
		weaponAcceleration = 101,
		weaponTimer = 0.1,
		weaponType = [[Cannon]],
		weaponVelocity = 650,
		damage = {
			default = 0,
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
		footprintX = 1,
		footprintZ = 1,
		height = 40,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ARMASER_DEAD]],
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
		footprintX = 1,
		footprintZ = 1,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[1X1A]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

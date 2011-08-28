-- UNITDEF -- ARMSPTK --
--------------------------------------------------------------------------------

local unitName = "armsptk"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.18,
	bmcode = 1,
	brakeRate = 0.188,
	buildCostEnergy = 4200,
	buildCostMetal = 375,
	builder = false,
	buildPic = [[ARMSPTK.png]],
	buildTime = 8775,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[All-Terrain Rocket Spider]],
	energyMake = 0.7,
	energyStorage = 0,
	energyUse = 0.7,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 1050,
	maxVelocity = 1.72,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TKBOT3]],
	name = [[Recluse]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMSPTK]],
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[ARM]],
	sightDistance = 440,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 1122,
	unitname = [[armsptk]],
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
			[1] = [[spider2]],
		},
		select = {
			[1] = [[spider3]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ADV_ROCKET]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ADV_ROCKET = {
		areaOfEffect = 72,
		burst = 3,
		burstrate = 0.3,
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.5,
		explosionGenerator = [[custom:FLASH2]],
		fireStarter = 70,
		flightTime = 2,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		model = [[shipmissile]],
		name = [[HeavyRocket]],
		noSelfDamage = true,
		range = 550,
		reloadtime = 3,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHit = [[xplosml1]],
		soundStart = [[rockhvy3]],
		soundTrigger = true,
		startsmoke = 1,
		startVelocity = 120,
		targetMoveError = 0.2,
		texture2 = [[armsmoketrail]],
		trajectoryHeight = 1,
		turnRate = 2000,
		turret = true,
		weaponAcceleration = 80,
		weaponTimer = 6,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 395,
		wobble = 6000,
		damage = {
			default = 120,
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
		height = 40,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ARMSPTK_DEAD]],
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
		object = [[3X3A]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

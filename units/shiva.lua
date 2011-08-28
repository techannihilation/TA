-- UNITDEF -- SHIVA --
--------------------------------------------------------------------------------

local unitName = "shiva"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.06,
	amphibious = 1,
	bmcode = 1,
	brakeRate = 0.238,
	buildCostEnergy = 80874,
	buildCostMetal = 2010,
	builder = false,
	buildPic = [[SHIVA.png]],
	buildTime = 15609,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Amphibious Siege Mech]],
	explodeAs = [[MECH_BLASTSML]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	idleAutoHeal = 5,
	idleTime = 1800,
	immunetoparalyzer = 1,
	maneuverleashlength = 640,
	mass = 200000,
	maxDamage = 15800,
	maxSlope = 36,
	maxVelocity = 2.21,
	maxWaterDepth = 32,
	mobilestandorders = 1,
	movementClass = [[HAKBOT4]],
	name = [[Shiva]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[SHIVA]],
	seismicSignature = 0,
	selfDestructAs = [[MECH_BLAST]],
	side = [[CORE]],
	sightDistance = 299,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	turnRate = 616,
	unitname = [[shiva]],
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
			[1] = [[mavbok1]],
		},
		select = {
			[1] = [[mavbsel1]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[SHIVA_GUN]],
			onlyTargetCategory = [[NOTVTOL]],
		},
		[3] = {
			def = [[SHIVA_ROCKET]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	SHIVA_GUN = {
		areaOfEffect = 176,
		ballistic = true,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH96]],
		gravityaffected = [[true]],
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		name = [[HeavyCannon]],
		noSelfDamage = true,
		range = 650,
		reloadtime = 3,
		renderType = 4,
		soundHit = [[xplomed4]],
		soundStart = [[cannhvy2]],
		startsmoke = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 310,
		damage = {
			default = 900,
			subs = 5,
		},
	},
	SHIVA_ROCKET = {
		areaOfEffect = 60,
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.5,
		explosionGenerator = [[custom:STARFIRE]],
		fireStarter = 100,
		flightTime = 10,
		guidance = true,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		metalpershot = 0,
		model = [[corkbmissl1]],
		name = [[HeavyRockets]],
		noautorange = 1,
		noSelfDamage = true,
		range = 800,
		reloadtime = 7,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHit = [[xplomed4]],
		soundStart = [[Rockhvy1]],
		startsmoke = 1,
		turnRate = 28384,
		twoPhase = true,
		vlaunch = true,
		weaponAcceleration = 100,
		weaponTimer = 2,
		weaponType = [[StarburstLauncher]],
		weaponVelocity = 800,
		damage = {
			default = 750,
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
		height = 10,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[SHIVA_DEAD]],
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

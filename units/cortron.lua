-- UNITDEF -- CORTRON --
--------------------------------------------------------------------------------

local unitName = "cortron"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	antiweapons = 1,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 8192,
	buildCostEnergy = 13067,
	buildCostMetal = 754,
	builder = false,
	buildPic = [[CORTRON.png]],
	buildTime = 58927,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[DEAD]],
	description = [[Tactical Nuke Launcher]],
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[ATOMIC_BLAST]],
	firestandorders = 1,
	firestate = 0,
	footprintX = 4,
	footprintZ = 4,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 3200,
	maxSlope = 10,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Catalyst]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CORTRON]],
	seismicSignature = 0,
	selfDestructAs = [[NUCLEAR_MISSILE]],
	side = [[CORE]],
	sightDistance = 455,
	smoothAnim = true,
	standingfireorder = 0,
	turnRate = 0,
	unitname = [[cortron]],
	workerTime = 0,
	yardMap = [[oooooooooooooooo]],
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
			[1] = [[servroc1]],
		},
		select = {
			[1] = [[servroc1]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[TINY]],
			def = [[CORTRON_WEAPON]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORTRON_WEAPON = {
		areaOfEffect = 512,
		commandfire = true,
		craterBoost = 4,
		craterMult = 1.75,
		edgeEffectiveness = 0.4,
		energypershot = 17437,
		explosionGenerator = [[custom:FLASHNUKE480]],
		fireStarter = 0,
		flightTime = 400,
		guidance = true,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		metalpershot = 550,
		model = [[empmisl]],
		name = [[TacticalNuke]],
		noautorange = 1,
		noSelfDamage = true,
		propeller = 1,
		range = 3000,
		reloadtime = 2,
		renderType = 1,
		selfprop = true,
		shakeduration = 1.5,
		shakemagnitude = 32,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHit = [[xplomed4]],
		soundStart = [[misicbm1]],
		startsmoke = 1,
		stockpile = true,
		stockpiletime = 75,
		tolerance = 4000,
		turnRate = 32768,
		twoPhase = true,
		vlaunch = true,
		weaponAcceleration = 180,
		weaponTimer = 4,
		weaponType = [[StarburstLauncher]],
		weaponVelocity = 1200,
		damage = {
			commanders = 499,
			default = 2500,
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
		object = [[CORTRON_DEAD]],
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

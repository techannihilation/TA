-- UNITDEF -- CORRL1 --
--------------------------------------------------------------------------------

local unitName = "corrl1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	bmcode = 0,
	brakeRate = 0,
	buildCostEnergy = 805,
	buildCostMetal = 155,
	builder = false,
	buildPic = [[CORRL.png]],
	buildTime = 1749,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[CORRL_DEAD]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[upgraded Anti-air Tower]],
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 800,
	maxSlope = 20,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[upg Pulverizer]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CORRL]],
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[CORE]],
	sightDistance = 455,
	smoothAnim = true,
	standingfireorder = 2,
	turnRate = 0,
	unitname = [[corrl1]],
	workerTime = 0,
	yardMap = [[ooooooooo]],
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
			def = [[CORRL_MISSILE1]],
			onlyTargetCategory = [[VTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORRL_MISSILE1 = {
		areaOfEffect = 48,
		burst = 2,
		burstrate = 0.25,
		canattackground = false,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH2]],
		fireStarter = 70,
		flightTime = 1.5,
		guidance = true,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		metalpershot = 0,
		model = [[missile]],
		name = [[Missiles]],
		noSelfDamage = true,
		range = 965,
		reloadtime = 2.3,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHit = [[xplomed2]],
		soundStart = [[rockhvy2]],
		startsmoke = 1,
		startVelocity = 400,
		texture2 = [[coresmoketrail]],
		toAirWeapon = true,
		tolerance = 10000,
		tracks = true,
		turnRate = 63000,
		turret = true,
		weaponAcceleration = 150,
		weaponTimer = 5,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 750,
		damage = {
			bombers = 190,
			default = 5,
			fighters = 190,
			flak_resistant = 190,
			unclassed_air = 190,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	CORRL_DEAD = {
		blocking = true,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Pulverizer Wreckage]],
		energy = 0,
		featureDead = [[CORRL_HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.5987 * unitDef.buildCostMetal,
		object = [[CORRL_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	CORRL_HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Pulverizer Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 100,
		metal = 0.4790 * unitDef.buildCostMetal,
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

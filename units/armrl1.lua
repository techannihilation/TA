-- UNITDEF -- ARMRL1 --
--------------------------------------------------------------------------------

local unitName = "armrl1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	bmcode = 0,
	brakeRate = 0,
	buildCostEnergy = 843,
	buildCostMetal = 165,
	builder = false,
	buildPic = [[ARMRL.png]],
	buildTime = 1843,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[ARMRL_DEAD]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[upg Anti-air Tower]],
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 795,
	maxSlope = 20,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[upg Defender]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[ARMRL]],
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[ARM]],
	sightDistance = 455,
	smoothAnim = true,
	standingfireorder = 2,
	turnRate = 0,
	unitname = [[armrl1]],
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
			[1] = [[kbarmmov]],
		},
		select = {
			[1] = [[kbarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ARMRL_MISSILE1]],
			onlyTargetCategory = [[VTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMRL_MISSILE1 = {
		areaOfEffect = 48,
		bursrate = 0.35,
		burst = 2,
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
		range = 985,
		reloadtime = 2.6,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHit = [[xplomed2]],
		soundStart = [[rockhvy2]],
		startsmoke = 1,
		startVelocity = 400,
		texture2 = [[armsmoketrail]],
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
			bombers = 230,
			default = 5,
			fighters = 230,
			flak_resistant = 230,
			unclassed_air = 230,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	ARMRL_DEAD = {
		blocking = true,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Defender Wreckage]],
		energy = 0,
		featureDead = [[ARMRL_HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.5770 * unitDef.buildCostMetal,
		object = [[ARMRL_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	ARMRL_HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Defender Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 100,
		metal = 0.4616 * unitDef.buildCostMetal,
		object = [[3X3C]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

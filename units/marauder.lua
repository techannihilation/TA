-- UNITDEF -- MARAUDER --
--------------------------------------------------------------------------------

local unitName = "marauder"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.22,
	bmcode = 1,
	brakeRate = 0.238,
	buildCostEnergy = 19534,
	buildCostMetal = 910,
	builder = false,
	buildPic = [[MARAUDER.png]],
	buildTime = 28957,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Amphibious Assault Mech]],
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	idleAutoHeal = 5,
	idleTime = 1800,
	immunetoparalyzer = 1,
	maneuverleashlength = 640,
	mass = 200000,
	maxDamage = 7000,
	maxSlope = 17,
	maxVelocity = 3,
	maxWaterDepth = 32,
	mobilestandorders = 1,
	movementClass = [[ATANK3]],
	name = [[Marauder]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[MARAUDER]],
	seismicSignature = 0,
	selfDestructAs = [[CRAWL_BLASTSML]],
	side = [[ARM]],
	sightDistance = 455,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	turnRate = 1056,
	unitname = [[marauder]],
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
			def = [[ARMMECH_CANNON]],
			onlyTargetCategory = [[NOTVTOL]],
		},
		[3] = {
			def = [[ARMAMPH_MISSILE]],
			onlyTargetCategory = [[VTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMAMPH_MISSILE = {
		areaOfEffect = 48,
		canattackground = false,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH2]],
		fireStarter = 70,
		guidance = true,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		metalpershot = 0,
		model = [[missile]],
		name = [[Missiles]],
		noSelfDamage = true,
		range = 600,
		reloadtime = 2,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHit = [[xplosml2]],
		soundStart = [[rocklit1]],
		startsmoke = 1,
		startVelocity = 650,
		texture2 = [[armsmoketrail]],
		tolerance = 9000,
		tracks = true,
		turnRate = 48000,
		turret = true,
		weaponAcceleration = 141,
		weaponTimer = 5,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 850,
		damage = {
			default = 85,
			subs = 5,
		},
	},
	ARMMECH_CANNON = {
		areaOfEffect = 12,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH211]],
		fireStarter = 5,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		name = [[MechPlasmaCannon]],
		noSelfDamage = true,
		range = 350,
		reloadtime = 0.8,
		renderType = 4,
		soundHit = [[XploMed21]],
		soundStart = [[KroGun1]],
		soundwater = [[SplsSml]],
		startsmoke = 1,
		targetMoveError = 0.15,
		turret = true,
		weaponTimer = 2,
		weaponType = [[Cannon]],
		weaponVelocity = 600,
		damage = {
			default = 185,
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
		footprintX = 4,
		footprintZ = 4,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[MARAUDER_DEAD]],
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

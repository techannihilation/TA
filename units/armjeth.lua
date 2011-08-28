-- UNITDEF -- ARMJETH --
--------------------------------------------------------------------------------

local unitName = "armjeth"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.12,
	bmcode = 1,
	brakeRate = 0.188,
	buildCostEnergy = 1097,
	buildCostMetal = 186,
	builder = false,
	buildPic = [[ARMJETH.png]],
	buildTime = 1831,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL SMALL WEAPON]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Amphibious Anti-air Kbot]],
	energyMake = 0.4,
	energyStorage = 0,
	energyUse = 0.4,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 570,
	maxSlope = 15,
	maxVelocity = 1.875,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[AKBOT2]],
	name = [[Jethro]],
	noAutoFire = false,
	noChaseCategory = [[ALL SUB]],
	objectName = [[ARMJETH]],
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[ARM]],
	sightDistance = 377,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	turnRate = 1118,
	unitname = [[armjeth]],
	upright = true,
	workerTime = 0,
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:rocketflare]],
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
			[1] = [[kbarmmov]],
		},
		select = {
			[1] = [[kbarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[BOGUS_MISSILE]],
			onlyTargetCategory = [[VTOL]],
		},
		[3] = {
			def = [[ARMKBOT_MISSILE]],
			onlyTargetCategory = [[VTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMKBOT_MISSILE = {
		areaOfEffect = 48,
		canattackground = false,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH2]],
		fireStarter = 70,
		flighttimer = 2,
		guidance = true,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		metalpershot = 0,
		model = [[missile]],
		name = [[Missiles]],
		noSelfDamage = true,
		range = 760,
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
		toAirWeapon = true,
		tolerance = 9000,
		tracks = true,
		turnRate = 63000,
		turret = true,
		weaponAcceleration = 141,
		weaponTimer = 5,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 850,
		damage = {
			bombers = 100,
			default = 5,
			fighters = 100,
			flak_resistant = 100,
			unclassed_air = 100,
		},
	},
	BOGUS_MISSILE = {
		areaOfEffect = 48,
		canattackground = false,
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
		toAirWeapon = true,
		tolerance = 9000,
		turnRate = 33000,
		turret = true,
		weaponAcceleration = 101,
		weaponTimer = 0.1,
		weaponType = [[Cannon]],
		weaponVelocity = 650,
		damage = {
			bombers = 60,
			default = 5,
			fighters = 60,
			flak_resistant = 20,
			unclassed_air = 60,
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
		height = 40,
		hitdensity = 100,
		metal = 0.4946 * unitDef.buildCostMetal,
		object = [[ARMJETH_DEAD]],
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
		metal = 0.3957 * unitDef.buildCostMetal,
		object = [[2X2C]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

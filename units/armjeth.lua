-- UNITDEF -- ARMJETH --
--------------------------------------------------------------------------------

local unitName = "armjeth"

--------------------------------------------------------------------------------

local unitDef = {
	airsightdistance = 820,
	acceleration = 0.12,
	bmcode = 1,
	brakeRate = 0.188,
	buildCostEnergy = 1200,
	buildCostMetal = 180,
	builder = false,
	buildPic = [[ARMJETH.png]],
	buildTime = 1831,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL SMALL WEAPON]],
	collisionvolumescales = [[22 33 17]],
	collisionvolumeoffsets 	= [[0 0 2]],
	collisionvolumetype = [[box]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Amphibious Anti-air Kbot]],
	energyMake = 0,
	energyStorage = 0,
	energyUse = 0,
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
		[3] = {
			def = [[ARMKBOT_MISSILE]],
			onlyTargetCategory = [[VTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMKBOT_MISSILE = {
		burst = 2,
		burstrate = 0.25,
		areaOfEffect = 48,
		canattackground = false,
		cegTag = [[Arm_Def_AA_Rocket]],
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
		range = 850,
		reloadtime = 1,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHitDry = [[xplosml2]],
		soundStart = [[rocklit1]],
		startsmoke = 1,
		startVelocity = 650,
		texture1 = [[null]],
		texture2 = [[armsmoketrail]],
		texture3 = [[null]],
		texture4 = [[null]],
		tolerance = 9000,
		tracks = true,
		turnRate = 63000,
		turret = true,
		weaponAcceleration = 141,
		weaponTimer = 5,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 850,
		damage = {
			bombers = 70,
			default = 5,
			fighters = 70,
			flak_resistant = 70,
			unclassed_air = 70,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = true,
		category = [[corpses]],
		collisionvolumeoffsets = [[5.17987060547 -4.3375112793 -4.29997253418]],
		collisionvolumescales = [[29.3736572266 14.4243774414 27.4587402344]],
		collisionvolumetype = [[Box]],
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

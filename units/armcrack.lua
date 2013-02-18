-- UNITDEF -- ARMCRACK --
--------------------------------------------------------------------------------

local unitName = "armcrack"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.108,
	bmcode = 1,
	brakeRate = 0.188,
	buildCostEnergy = 2460,
	buildCostMetal = 215,
	builder = false,
	buildPic = [[armcrack.png]],
	buildTime = 2450,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL SMALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionVolumeScales = [[39.3 49.3 39.3]],
	collisionVolumeOffsets = [[0 0 -10]],
	collisionVolumeTest = 1,
	collisionVolumeType	= [[ellipsoid]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Rocket Artillery Kbot]],
	energyMake = 0.6,
	energyStorage = 0,
	energyUse = 0.6,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	idleAutoHeal = 5,
	idleTime = 250,
	maneuverleashlength = 640,
	mass = 160,
	maxDamage = 400,
	maxSlope = 14,
	maxVelocity = 1.65,
	maxWaterDepth = 21,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[KBOT2]],
	name = [[Cracker]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[ARMCRACK]],
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[ARM]],
	sightDistance = 310,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	TEDClass = [[KBOT]],
	turnRate = 1103,
	unitname = [[armcrack]],
	upright = true,
	workerTime = 0,
	customparams = {
		RequireTech = [[Advanced T1 Unit Research Centre]],
	},
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:Arm_Rear_Muzzle]],
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
			def = [[Lightartmissarm]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	Lightartmissarm = {
		areaOfEffect = 88,
		cegTag = [[Arm_Trail_Light_Rocket]],
		collideFriendly = false,
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.4,
		explosionGenerator = [[custom:Explosion_Light_Plasma-2]],
		fireStarter = 20,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		model = [[exphvyrock]],
		name = [[Lightartmissarm]],
		noSelfDamage = true,
		range = 700,
		reloadtime = 4.5,
		renderType = 1,
		selfprop = true,
		soundHitDry = [[rockhit]],
		soundStart = [[rapidrocket3]],
		startsmoke = 1,
		startVelocity = 150,
		trajectoryHeight = 0.75,
		Texture1 = [[null]],
		Texture2 = [[null]],
		Texture3 = [[null]],
		Texture4 = [[null]],
		turnRate = 4000,
		turret = true,
		weaponAcceleration = 10,
		weaponTimer = 5,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 200,
		wobble = 9000,
		damage = {
			default = 220,
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
		damage = 0.7650 * unitDef.maxDamage,
		description = [[Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 3,
		footprintZ = 3,
		height = 40,
		hitdensity = 100,
		metal = 0.2419 * unitDef.buildCostMetal,
		object = [[ARMCRACK_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.2525 * unitDef.maxDamage,
		description = [[Wreckage]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 100,
		metal = 0.0930 * unitDef.buildCostMetal,
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

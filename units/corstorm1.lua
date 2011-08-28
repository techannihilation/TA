-- UNITDEF -- CORSTORM1 --
--------------------------------------------------------------------------------

local unitName = "corstorm1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.108,
	bmcode = 1,
	brakeRate = 0.188,
	buildCostEnergy = 1253,
	buildCostMetal = 161,
	builder = false,
	buildPic = [[CORSTORM.png]],
	buildTime = 2222,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL SMALL WEAPON]],
	corpse = [[CORSTORM_DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Rocket Kbot]],
	energyMake = 0.6,
	energyStorage = 0,
	energyUse = 0.6,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 980,
	maxSlope = 14,
	maxVelocity = 1.65,
	maxWaterDepth = 14,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[KBOT2]],
	name = [[Distant Storm]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORSTORM1]],
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[CORE]],
	sightDistance = 374.5,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	turnRate = 1103,
	unitname = [[corstorm1]],
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
			[1] = [[kbcormov]],
		},
		select = {
			[1] = [[kbcorsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[CORE_KBOT_ROCKET1]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORE_KBOT_ROCKET1 = {
		areaOfEffect = 48,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:VSMLMISSILE_EXPLOSION]],
		fireStarter = 70,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		metalpershot = 0,
		model = [[missile]],
		name = [[Rockets]],
		noSelfDamage = true,
		range = 570,
		reloadtime = 3,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHit = [[xplosml2]],
		soundStart = [[rocklit1]],
		startsmoke = 1,
		startVelocity = 200,
		texture2 = [[coresmoketrail]],
		trajectoryHeight = 0.45,
		turret = true,
		weaponAcceleration = 120,
		weaponTimer = 2,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 200,
		damage = {
			default = 137,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	CORSTORM_DEAD = {
		blocking = true,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[CORSTORM_HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CORSTORM_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	CORSTORM_HEAP = {
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
		metal = 0.6400 * unitDef.buildCostMetal,
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

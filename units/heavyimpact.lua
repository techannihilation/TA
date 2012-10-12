-- UNITDEF -- HEAVYIMPACT --
--------------------------------------------------------------------------------

local unitName = "heavyimpact"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.06,
	brakeRate = 0.1,
	buildCostEnergy = 72090,
	buildCostMetal = 7000,
	builder = false,
	buildPic = [[heavyimpact.png]],
	buildTime = 14600,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL HUGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionVolumeOffsets = [[0 -3 1]],
	collisionVolumeScales = [[82 98 62]],
	collisionVolumeTest = 1,
	collisionVolumeType = [[ellipsoid]],
	corpse = [[HEAVYIMPACT_DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Heavy Artillery Mech]],
	explodeAs = [[BIG_UNIT]],
	firestandorders = 1,
	footprintX = 5,
	footprintZ = 5,
	iconType = [[mech]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	mass = 200000,
	maxDamage = 15000,
	maxSlope = 17,
	maxVelocity = 1.1,
	maxWaterDepth = 0,
	mobilestandorders = 1,
	movementClass = [[VKBOT5]],
	name = [[Heavy Impact]],
	noAutoFire = false,
	noChaseCategory = [[VTOL SUB]],
	objectName = [[heavyimpact]],
	pieceTrailCEGRange = 4,
	pieceTrailCEGTag = [[Debree]],
	seismicSignature = 0,
	selfDestructAs = [[SMALL_BUILDING]],
	side = [[CORE]],
	sightDistance = 400,
	standingfireorder = 2,
	standingmoveorder = 0,
	steeringmode = 1,
	TEDClass = [[KBOT]],
	turnRate = 400,
	unitname = [[heavyimpact]],
	upright = true,
	customparams = {
		canareaattack = 1,
	},
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:BERTHAFLARE]],
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
			[1] = [[mavbok1]],
		},
		select = {
			[1] = [[mavbsel1]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[VTOL]],
			def = [[CORMECHART]],
			onlyTargetCategory = [[NOTVTOL]],
			weaponmaindir1 = [[0 0 1]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORMECHART = {
		accuracy = 300,
		alphadecay = 0.3,
		areaOfEffect = 256,
		ballistic = true,
		bounceExplosionGenerator = [[custom:BERTHASHOT1]],
		BounceRebound = 0.8,
		BounceSlip = 1.01,
		cegTag = [[vulcanfx]],
		color = 3,
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.6,
		explosionGenerator = [[custom:BERTHASHOT1]],
		gravityaffected = [[TRUE]],
		GroundBounce = 0,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		interceptedByShieldType = 1,
		minbarrelangle = -35,
		name = [[HeavyCannon]],
		nogap = 1,
		noSelfDamage = true,
		NumBounce = 1,
		range = 1450,
		reloadtime = 1,
		renderType = 4,
		rgbColor = [[0.67 0.31 0]],
		separation = 0.45,
		size = 2.75,
		sizedecay = -0.15,
		soundHitDry = [[xplomed2]],
		soundStart = [[cannhvy5]],
		stages = 20,
		startsmoke = 1,
		targetMoveError = 0.25,
		turret = true,
		WaterBounce = 0,
		weaponType = [[Cannon]],
		weaponVelocity = 450,
		damage = {
			default = 400,
			gunships = 100,
			hgunships = 100,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	HEAVYIMPACT_DEAD = {
		blocking = true,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Wreckage]],
		energy = 0,
		featureDead = [[HEAVYIMPACT_HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 5,
		footprintZ = 5,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[HEAVYIMPACT_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	HEAVYIMPACT_HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Wreckage]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 5,
		footprintZ = 5,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[5X5B]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

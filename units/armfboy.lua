-- UNITDEF -- ARMFBOY --
--------------------------------------------------------------------------------

local unitName = "armfboy"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.12,
	bmcode = 1,
	brakeRate = 0.125,
	buildCostEnergy = 11193,
	buildCostMetal = 1418,
	builder = false,
	buildPic = [[ARMFBOY.png]],
	buildTime = 22397,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionVolumeOffsets = [[0 0 1]],
	collisionVolumeScales = [[38.6 39.6 54.6]],
	collisionVolumeTest = 1,
	collisionVolumeType = [[ellipsoid]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Heavy Plasma Kbot]],
	energyMake = 5.1,
	energyStorage = 0,
	energyUse = 5,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 7000,
	maxHeightDif = 20,
	maxVelocity = 1,
	maxWaterDepth = 25,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[KBOT3]],
	name = [[Fatboy]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMFBOY]],
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[ARM]],
	sightDistance = 510,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	turnRate = 320,
	unitname = [[armfboy]],
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
			[1] = [[mavbot1]],
		},
		select = {
			[1] = [[capture2]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ARM_FATBOY_NOTALASER]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARM_FATBOY_NOTALASER = {
		areaOfEffect = 240,
		ballistic = true,
		cegTag = [[Trail_cannon]],
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.7,
		energypershot = 0,
		explosionGenerator = [[custom:FLASH224]],
		gravityaffected = [[TRUE]],
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		minbarrelangle = -20,
		name = [[HeavyPlasma]],
		nogap = 1,
		noSelfDamage = true,
		range = 700,
		reloadtime = 6.75,
		renderType = 4,
		rgbColor = [[0.75 0.45 0]],
		separation = 0.45,
		shakeduration = 1,
		shakemagnitude = 4,
		size = 2.68,
		sizedecay = -0.15,
		soundHitDry = [[bertha6]],
		soundStart = [[BERTHA1]],
		stages = 20,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 307.40850830078,
		damage = {
			default = 800,
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
		collisionvolumeoffsets = [[1.35855102539 -5.79698309326 2.2872467041]],
		collisionvolumescales = [[33.431427002 25.3690338135 53.5839233398]],
		collisionvolumetype = [[Box]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 9,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ARMFBOY_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[all]],
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
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[2X2A]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

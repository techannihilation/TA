-- UNITDEF -- TLLRIOT --
--------------------------------------------------------------------------------

local unitName = "tllriot"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.15,
	bmcode = 1,
	brakeRate = 0.17,
	buildCostEnergy = 1450,
	buildCostMetal = 350,
	builder = false,
	buildTime = 5840,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Medium Riot Tank]],
	energyMake = 0.8,
	energyStorage = 0,
	energyUse = 0.8,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	idleAutoHeal = 5,
	idleTime = 1800,
	iconType = [[armtank]],
	maneuverleashlength = 640,
	maxDamage = 1350,
	maxSlope = 12,
	maxVelocity = 1.3,
	maxWaterDepth = 100,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANK2]],
	name = [[Pacifier]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[tllriot]],
	ovradjust = 1,
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 260,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 210,
	unitname = [[tllriot]],
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
			[1] = [[tarmmove]],
		},
		select = {
			[1] = [[tarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[TLLRIOT_CANNON]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	TLLRIOT_CANNON = {
		areaOfEffect = 185,
		burnblow = true,
		coreThickness = 0.5,
		edgeEffectiveness = 0.25,
		energypershot = 25,
		explosionGenerator = [[custom:lightningexplo]],
		fireStarter = 0,
		impulseFactor = 0,
		intensity = 1.5,
		lineOfSight = true,
		minbarrelangle = -25,
		name = [[Riot Cannon]],
		range = 340,
		reloadtime = 1.8,
		renderType = 3,
		rgbColor = [[0.75 0.7 1]],
		size = 2.5,
		soundHitDry = [[debris4]],
		soundStart = [[sonicwv1]],
		tolerance = 2000,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 500,
		damage = {
			commanders = 20,
			default = 80,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[corpses]],
		damage = 0.2963 * unitDef.maxDamage,
		description = [[Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 20,
		hitdensity = 100,
		metal = 0.7600 * unitDef.buildCostMetal,
		object = [[tllriot_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.1481 * unitDef.maxDamage,
		description = [[Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 4,
		hitdensity = 100,
		metal = 0.5514 * unitDef.buildCostMetal,
		object = [[2x2d]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- CORSFUS --
--------------------------------------------------------------------------------

local unitName = "corsfus"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = true,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 16384,
	buildCostEnergy = 142000,
	buildCostMetal = 15000,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 12,
	buildingGroundDecalSizeY = 12,
	buildingGroundDecalType = [[corsfus_aoplane.dds]],
	buildPic = [[CORSFUS.png]],
	buildTime = 298000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	collisionvolumeoffsets = [[0 -15 0]],
	collisionvolumescales = [[45 100 45]],
	collisionvolumetest = 1,
	collisionvolumetype = [[ellipsoid]],
	corpse = [[DEAD]],
	description = [[Produces Energy / Storage]],
	energyMake = 4096,
	energyStorage = 40960,
	energyUse = 0,
	explodeAs = [[ATOMIC_BLAST]],
	footprintX = 9,
	footprintZ = 9,
	hideDamage = true,
	iconType = [[building]],
	idleAutoHeal = 20,
	idleTime = 1800,
	maxDamage = 11500,
	maxSlope = 10,
	maxVelocity = 0,
	maxWaterDepth = 1,
	metalStorage = 0,
	modelCenterOffset = [[0 -55 0]],
	name = [[Airstrike Resistant Fusion Reactor]],
	noAutoFire = false,
	objectName = [[CORSFUS]],
	onoffable = true,
	seismicSignature = 0,
	selfDestructAs = [[ATOMIC_BLAST]],
	side = [[CORE]],
	sightDistance = 273,
	smoothAnim = true,
	turnRate = 0,
	unitname = [[corsfus]],
	useBuildingGroundDecal = true,
	workerTime = 0,
	yardMap = [[ooooooooooooooooooooooooo]],
	featureDefs = nil,
	sounds = {
		canceldestruct = [[cancel2]],
		underattack = [[warning1]],
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		select = {
			[1] = [[fusion2]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[CORSFUSshield]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORSFUSshield = {
		exteriorshield = 0,
		isShield = true,
		name = [[FusionShield]],
		shieldAlpha = 0.3,
		shieldBadColor = [[1 0.2 0.2]],
		shieldEnergyUse = 512,
		shieldGoodColor = [[0.6 0.8 1]],
		shieldInterceptType = 17,
		shieldPower = 16000,
		shieldPowerRegen = 120,
		shieldPowerRegenEnergy = 2048,
		shieldRadius = 180,
		shieldRepulser = false,
		shieldStartingPower = 4000,
		visibleShield = false,
		visibleShieldHitFrames = 32,
		visibleShieldRepulse = true,
		weaponType = [[Shield]],
		damage = {
			default = 100,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = true,
		category = [[corpses]],
		damage = 2.0000 * unitDef.maxDamage,
		description = [[Fusion Reactor Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 5,
		footprintZ = 5,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CORSFUS_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Fusion Reactor Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 5,
		footprintZ = 5,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[5X5D]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

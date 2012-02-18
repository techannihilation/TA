-- UNITDEF -- ARMT4STORE --
--------------------------------------------------------------------------------

local unitName = "armt4store"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = true,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 4096,
	buildCostEnergy = 450000,
	buildCostMetal = 9500,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 11,
	buildingGroundDecalSizeY = 11,
	buildingGroundDecalType = [[armt4store_aoplane.dds]],
	buildPic = [[armt4store.png]],
	buildTime = 90000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[DEAD]],
	description = [[Increases Energy Storage (1M)]],
	energyStorage = 1000000,
	energyUse = 0,
	explodeAs = [[ESTOR_BUILDINGEX]],
	footprintX = 8,
	footprintZ = 8,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 1700,
	maxSlope = 10,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[T4 Energy Storage]],
	noAutoFire = false,
	objectName = [[armt4store]],
	seismicSignature = 0,
	selfDestructAs = [[ESTOR_BUILDING]],
	side = [[ARM]],
	sightDistance = 273,
	smoothAnim = true,
	turnRate = 0,
	unitname = [[armestor]],
	useBuildingGroundDecal = true,
	workerTime = 0,
	yardMap = [[oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo]],
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
			[1] = [[storngy1]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = true,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Energy Storage Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 4,
		footprintZ = 4,
		height = 40,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ARMT4STORE_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Energy Storage Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 4,
		footprintZ = 4,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[4X4C]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

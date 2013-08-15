-- UNITDEF -- CADVMSTO --
--------------------------------------------------------------------------------

local unitName = "cadvmsto"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 41722,
	buildCostMetal = 2195,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 9,
	buildingGroundDecalSizeY = 9,
	buildingGroundDecalType = [[cadvmsto_aoplane.dds]],
	buildTime = 66125,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[dead]],
	description = [[Increase Metal Storage (100000)]],
	designation = [[CMS-1]],
	downloadable = 1,
	energyStorage = 0,
	explodeAs = [[SMALL_BUILDINGEX]],
	footprintX = 7,
	footprintZ = 6,
	maxDamage = 66104,
	maxHeightDif = 10,
	maxWaterDepth = 0,
	metalStorage = 100000,
	name = [[T3 Metal Storage]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[cadvmsto]],
	radarDistance = 0,
	selfDestructAs = [[SMALL_BUILDING]],
	side = [[CORE]],
	sightDistance = 300,
	unitname = [[cadvmsto]],
	unitnumber = 996,
	upright = true,
	useBuildingGroundDecal = true,
	workerTime = 0,
	yardMap = [[ooooooo ooooooo ooooooo ooooooo ooooooo ooooooo]],
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
			[1] = [[stormtl2]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[core_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 6,
		footprintZ = 4,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[cadvmsto_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 5,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[4x4b]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

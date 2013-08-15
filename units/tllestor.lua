-- UNITDEF -- TLLESTOR --
--------------------------------------------------------------------------------

local unitName = "tllestor"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 4096,
	buildCostEnergy = 1470,
	buildCostMetal = 245,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 6,
	buildingGroundDecalSizeY = 6,
	buildingGroundDecalType = [[tllestor_aoplane.dds]],
	buildTime = 3710,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	collisionVolumeOffsets = [[0 -10 0]],
	collisionVolumeScales = [[96 50 59]],
	collisionVolumeTest = 1,
	collisionVolumeType = [[ellipsoid]],
	corpse = [[dead]],
	description = [[Increases Energy Storage (20000)]],
	designation = [[TL-ES]],
	energyStorage = 20000,
	energyUse = 0,
	explodeAs = [[ESTOR_BUILDINGEX]],
	footprintX = 6,
	footprintZ = 4,
	iconType = [[building]],
	maxDamage = 1900,
	maxSlope = 10,
	maxWaterDepth = 0,
	name = [[Energy Storage]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLESTOR]],
	ovradjust = 1,
	selfDestructAs = [[CRAWL_BLASTSML]],
	side = [[TLL]],
	sightDistance = 210,
	unitname = [[tllestor]],
	unitnumber = 892,
	useBuildingGroundDecal = true,
	workerTime = 0,
	yardMap = [[oooooo oooooo oooooo oooooo]],
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
	dead = {
		blocking = true,
		category = [[tll_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 12,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllestor_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Metal Shards]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		hitdensity = 4,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[4x4c]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

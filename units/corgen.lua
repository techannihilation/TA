-- UNITDEF -- CORGEN --
--------------------------------------------------------------------------------

local unitName = "corgen"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 0,
	buildCostEnergy = 4850,
	buildCostMetal = 526,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 5,
	buildingGroundDecalSizeY = 5,
	buildingGroundDecalType = [[corgen_aoplane.dds]],
	buildPic = [[CORGEN.png]],
	buildTime = 9900,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[dead]],
	description = [[Produces Energy]],
	energyMake = 128,
	energyStorage = 128,
	explodeAs = [[MEDIUM_BUILDINGEX]],
	footprintX = 3,
	footprintZ = 3,
	maxDamage = 1950,
	maxHeightDif = 10,
	maxWaterDepth = 0,
	name = [[Energy Driller]],
	noAutoFire = false,
	objectName = [[corgen]],
	selfDestructAs = [[LIGHTSHIPBLAST]],
	side = [[CORE]],
	sightDistance = 550,
	TEDClass = [[ENERGY]],
	unitname = [[corgen]],
	unitnumber = 2415,
	useBuildingGroundDecal = true,
	workerTime = 0,
	yardMap = [[ooo ooo ooo]],
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
			[1] = [[geothrm2]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[core_corpses]],
		damage = 0.0695 * unitDef.maxDamage,
		description = [[Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.3844 * unitDef.buildCostMetal,
		object = [[3x3d]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.0359 * unitDef.maxDamage,
		description = [[Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 100,
		metal = 0.1890 * unitDef.buildCostMetal,
		object = [[3x3d]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

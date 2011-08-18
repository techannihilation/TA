-- UNITDEF -- TLLUWMEX --
--------------------------------------------------------------------------------

local unitName = "tlluwmex"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 2447,
	buildCostMetal = 44,
	builder = false,
	buildTime = 3644,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Extracts Metal]],
	designation = [[TL-UM]],
	downloadable = 1,
	energyUse = 2.1,
	explodeAs = [[SMALL_BUILDINGEX]],
	extractsMetal = 0.001098,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Extracteur de métal sous-marin]],
	frenchname = [[Extracteur sous-marin]],
	germandescription = [[Unterwasser-Metallgewinnung]],
	germanname = [[Tauchschmelze]],
	iconType = [[building]],
	italiandescription = [[Estrattore di Metallo sottomarino]],
	italianname = [[Estr. Metallo subacqueo]],
	maxDamage = 348,
	maxSlope = 24,
	minWaterDepth = 20,
	name = [[Underwater Metal Extractor]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLUWMEX]],
	onoffable = true,
	selfDestructAs = [[SMALL_BUILDING]],
	side = [[TLL]],
	sightDistance = 100,
	spanishdescription = [[Extractor de metal submarino]],
	spanishname = [[Extractor de Metal]],
	threed = 1,
	unitname = [[tlluwmex]],
	unitnumber = 898,
	version = 3.1,
	workerTime = 0,
	yardMap = [[ooooooooo]],
	zbuffer = 1,
	featureDefs = nil,
	sounds = {
		activate = [[waterex1]],
		canceldestruct = [[cancel2]],
		deactivate = [[waterex1]],
		underattack = [[warning1]],
		working = [[waterex1]],
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		select = {
			[1] = [[waterex1]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[tll_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 12,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tlluwmex_dead]],
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
		footprintX = 3,
		footprintZ = 3,
		hitdensity = 4,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3x3a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- TLLUWMSTORAGE --
--------------------------------------------------------------------------------

local unitName = "tlluwmstorage"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 1388,
	buildCostMetal = 358,
	builder = false,
	buildTime = 3849,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Increases Metal Storage (4100)]],
	designation = [[TL-UWMS]],
	downloadable = 1,
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[SMALL_BUILDINGEX]],
	footprintX = 4,
	footprintZ = 4,
	frenchdescription = [[Augmente Stockage Métal]],
	frenchname = [[Dépôt de Métal Sous-Marin]],
	germandescription = [[Größere Metallvorräte]],
	germanname = [[U-Metalllager]],
	iconType = [[building]],
	italiandescription = [[Deposito di metallo sottomarino]],
	italianname = [[Deposito di metallo sub]],
	maxDamage = 1725,
	maxSlope = 20,
	metalStorage = 4100,
	minWaterDepth = 28,
	name = [[Underwater Metal Storage]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLUWMStorage]],
	radarDistance = 0,
	selfDestructAs = [[SMALL_BUILDING]],
	side = [[TLL]],
	sightDistance = 140,
	spanishdescription = [[Incrementa el almacenaje de metal]],
	spanishname = [[Almacén Metal Subacuático]],
	threed = 1,
	unitname = [[tlluwmstorage]],
	unitnumber = 856,
	version = 3.1,
	workerTime = 0,
	yardMap = [[oooooooooooooooo]],
	zbuffer = 1,
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
			[1] = [[stormtl1]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = false,
		category = [[tll_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 12,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tlluwmstorage_dead]],
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
		object = [[4x4a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

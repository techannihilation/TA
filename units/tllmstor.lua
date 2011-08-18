-- UNITDEF -- TLLMSTOR --
--------------------------------------------------------------------------------

local unitName = "tllmstor"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 4096,
	buildCostEnergy = 580,
	buildCostMetal = 215,
	builder = false,
	buildTime = 3125,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Increases Metal Storage (4000)]],
	designation = [[TL-MS]],
	energyUse = 0,
	explodeAs = [[SMALL_BUILDINGEX]],
	footprintX = 4,
	footprintZ = 4,
	frenchdescription = [[Augmente le stockage de métal]],
	frenchname = [[Dépôt de métal]],
	germandescription = [[Vergrößert Lager für Metallvorräte]],
	germanname = [[Metallspeicher]],
	iconType = [[building]],
	italiandescription = [[Aumenta l'immagazzinamento del metallo]],
	italianname = [[Deposito di Metallo]],
	maxDamage = 1811,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 4000,
	name = [[Metal Storage]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[tllMSTOR]],
	ovradjust = 1,
	selfDestructAs = [[SMALL_BUILDING]],
	side = [[TLL]],
	sightDistance = 210,
	spanishdescription = [[Incrementa capacidad de alm. metal]],
	spanishname = [[Almacén de Metal]],
	threed = 1,
	unitname = [[tllmstor]],
	unitnumber = 893,
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
		blocking = true,
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
		object = [[tllmstor_dead]],
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
		object = [[4x4b]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

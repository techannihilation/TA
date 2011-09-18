-- UNITDEF -- TLLUWESTORAGE --
--------------------------------------------------------------------------------

local unitName = "tlluwestorage"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 1050,
	buildCostMetal = 292,
	builder = false,
	buildTime = 6400,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Increases Energy Storage (21000)]],
	designation = [[TL-UWES]],
	downloadable = 1,
	energyStorage = 21000,
	energyUse = 0,
	explodeAs = [[ESTOR_BUILDINGEX]],
	footprintX = 4,
	footprintZ = 4,
	frenchdescription = [[Augmente Stockage Energie]],
	frenchname = [[Dépôt d'Energie Sous-Marin]],
	germandescription = [[Größere Energievorräte]],
	germanname = [[U-Energielager]],
	iconType = [[building]],
	italiandescription = [[Deposito di energia sottomarino]],
	italianname = [[Deposito di energia sub]],
	maxDamage = 2710,
	maxSlope = 20,
	metalStorage = 0,
	minWaterDepth = 30,
	name = [[Underwater Energy Storage]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLUWEStorage]],
	radarDistance = 0,
	selfDestructAs = [[ESTOR_BUILDING]],
	side = [[TLL]],
	sightDistance = 140,
	spanishdescription = [[Incrementa el almacenaje de energía]],
	spanishname = [[Almacén Energía Subacuát.]],
	threed = 1,
	unitname = [[tlluwestorage]],
	unitnumber = 857,
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
		description = [[Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 12,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tlluwestorage_dead]],
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

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
	buildTime = 3710,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Increases Energy Storage (20000)]],
	designation = [[TL-ES]],
	energyStorage = 20000,
	energyUse = 0,
	explodeAs = [[ESTOR_BUILDINGEX]],
	footprintX = 6,
	footprintZ = 4,
	frenchdescription = [[Augmente le stockage d'énergie]],
	frenchname = [[Dépôt d'énergie]],
	germandescription = [[Vergrößert Lager für Energievorräte]],
	germanname = [[Energiespeicher]],
	iconType = [[building]],
	italiandescription = [[Aumenta l'immagazzinamento di energia]],
	italianname = [[Deposito Energetico]],
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
	spanishdescription = [[Incrementa capacidad de alm.energía]],
	spanishname = [[Almacén de Energía]],
	threed = 1,
	unitname = [[tllestor]],
	unitnumber = 892,
	version = 3.1,
	workerTime = 0,
	yardMap = [[oooooo oooooo oooooo oooooo]],
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

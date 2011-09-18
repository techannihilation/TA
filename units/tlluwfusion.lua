-- UNITDEF -- TLLUWFUSION --
--------------------------------------------------------------------------------

local unitName = "tlluwfusion"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 14500,
	buildCostMetal = 4100,
	builder = false,
	buildTime = 120000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Produces Energy/ Storage]],
	designation = [[TL-UWF]],
	downloadable = 1,
	energyMake = 1000,
	explodeAs = [[ATOMIC_BLAST]],
	footprintX = 6,
	footprintZ = 4,
	frenchdescription = [[Produit de l'énergie]],
	frenchname = [[Centrale Atom. sous-marine]],
	germandescription = [[Liefert Energie]],
	germanname = [[Unterwasser-Fusionsreaktor]],
	iconType = [[building]],
	italiandescription = [[Impianto di Fusione sottomarino]],
	italianname = [[Impianto di Fusione]],
	maxDamage = 3311,
	maxSlope = 10,
	maxWaterDepth = 255,
	minWaterDepth = 34,
	name = [[Underwater Fusion Plant]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[tllUWFUSion]],
	selfDestructAs = [[NUCLEAR_MISSILE]],
	side = [[TLL]],
	sightDistance = 110,
	spanishdescription = [[Planta de fusión submarina]],
	spanishname = [[Planta de Fusión]],
	threed = 1,
	unitname = [[tlluwfusion]],
	unitnumber = 867,
	version = 3.1,
	workerTime = 0,
	yardMap = [[oooooooooooooooooooooooo]],
	zbuffer = 1,
	featureDefs = nil,
	sounds = {
		canceldestruct = [[cancel2]],
		underattack = [[tllwarning]],
		count = {
			[1] = [[tllcount]],
			[2] = [[tllcount]],
			[3] = [[tllcount]],
			[4] = [[tllcount]],
			[5] = [[tllcount]],
			[6] = [[tllcount]],
		},
		select = {
			[1] = [[tlluwfusion]],
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
		footprintX = 6,
		footprintZ = 4,
		height = 12,
		hitdensity = 123,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tlluwfusion_dead]],
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
		footprintX = 6,
		footprintZ = 4,
		hitdensity = 4,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[4x4d]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

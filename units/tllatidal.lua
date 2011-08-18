-- UNITDEF -- TLLATIDAL --
--------------------------------------------------------------------------------

local unitName = "tllatidal"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 1287,
	buildCostMetal = 485,
	builder = false,
	buildTime = 3255,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Produces Energy]],
	designation = [[TL-atd]],
	downloadable = 1,
	energyUse = -85,
	explodeAs = [[ESTOR_BUILDINGEX]],
	footprintX = 4,
	footprintZ = 4,
	frenchdescription = [[Produit de l'énergie]],
	frenchname = [[Centrale marémotrice sous-marine]],
	germandescription = [[Liefert Energie]],
	germanname = [[Verb. Unterwasser Gezeitenkraftwerk]],
	iconType = [[building]],
	maxDamage = 1631,
	maxSlope = 10,
	maxWaterDepth = 255,
	minWaterDepth = 15,
	name = [[Underwater Advanced Tidal Generator]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[tllatidal]],
	onoffable = true,
	radarDistance = 0,
	selfDestructAs = [[ESTOR_BUILDING]],
	side = [[TLL]],
	sightDistance = 110,
	threed = 1,
	tidalGenerator = 1,
	unitname = [[tllatidal]],
	unitnumber = 880,
	version = 3.1,
	workerTime = 0,
	yardMap = [[oooo oooo oooo oooo]],
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
			[1] = [[tidegen2]],
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
		hitdensity = 103,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllatidal_dead]],
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

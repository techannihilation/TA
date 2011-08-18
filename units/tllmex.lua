-- UNITDEF -- TLLMEX --
--------------------------------------------------------------------------------

local unitName = "tllmex"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 218,
	buildCostMetal = 60,
	builder = false,
	buildTime = 1820,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Extracts Metal]],
	designation = [[]],
	digger = 1,
	energyUse = 4,
	explodeAs = [[SMALL_BUILDINGEX]],
	extractsMetal = 0.0012,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Extrait du métal]],
	frenchname = [[Extracteur]],
	germandescription = [[Gewinnt Metall]],
	germanname = [[Metallextraktor]],
	iconType = [[building]],
	italiandescription = [[Estrae metallo]],
	italianname = [[Estrattore di Metallo]],
	maxDamage = 232,
	maxSlope = 12,
	maxWaterDepth = 0,
	metalStorage = 70,
	name = [[Metal Extractor]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLMEX]],
	onoffable = true,
	selfDestructAs = [[SMALL_BUILDING]],
	side = [[TLL]],
	sightDistance = 210,
	spanishdescription = [[Extrae metal]],
	spanishname = [[Extractor de Metal]],
	threed = 1,
	unitname = [[tllmex]],
	unitnumber = 802,
	version = 1,
	yardMap = [[ooooooooo]],
	zbuffer = 1,
	featureDefs = nil,
	sounds = {
		activate = [[mexon2]],
		canceldestruct = [[cancel2]],
		deactivate = [[mexoff2]],
		underattack = [[tllwarning]],
		working = [[mexrun2]],
		count = {
			[1] = [[tllcount]],
			[2] = [[tllcount]],
			[3] = [[tllcount]],
			[4] = [[tllcount]],
			[5] = [[tllcount]],
			[6] = [[tllcount]],
		},
		select = {
			[1] = [[mexon2]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[tll_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 21,
		hitdensity = 105,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllmex_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 2,
		hitdensity = 105,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3x3F]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

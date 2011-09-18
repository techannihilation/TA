-- UNITDEF -- TLLMM --
--------------------------------------------------------------------------------

local unitName = "tllmm"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 160,
	buildCostMetal = 16,
	builder = false,
	buildTime = 2000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	damageModifier = 0.4,
	description = [[Converts upto 100 Energy into Metal]],
	designation = [[]],
	explodeAs = [[ARMESTOR_BUILDINGEX]],
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Convertit l'énergie en métal]],
	frenchname = [[Métallo]],
	germandescription = [[Wandelt Energie in Metall um]],
	germanname = [[Metallgenerator]],
	italiandescription = [[Converte energia in metallo]],
	italianname = [[Generatore di Metallo]],
	maxDamage = 172,
	maxSlope = 10,
	maxWaterDepth = 0,
	name = [[Metal Maker]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLMM]],
	selfDestructAs = [[ARMESTOR_BUILDING]],
	side = [[TLL]],
	sightDistance = 210,
	spanishdescription = [[Transforma energía en metal]],
	spanishname = [[Productor de Metal]],
	threed = 1,
	unitname = [[tllmm]],
	unitnumber = 814,
	version = 3.1,
	yardMap = [[ooo ooo ooo]],
	zbuffer = 1,
	featureDefs = nil,
	sounds = {
		activate = [[metlon1]],
		canceldestruct = [[cancel2]],
		deactivate = [[metloff1]],
		underattack = [[warning1]],
		working = [[metlrun1]],
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		select = {
			[1] = [[metlon1]],
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
		object = [[tllmm_dead]],
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
		hitdensity = 58,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3x3A]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

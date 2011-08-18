-- UNITDEF -- TLLASONAR --
--------------------------------------------------------------------------------

local unitName = "tllasonar"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 2750,
	buildCostMetal = 181,
	builder = false,
	buildTime = 6812,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Locates Water Units]],
	designation = [[TL-ASON]],
	energyMake = 21,
	energyStorage = 0,
	energyUse = 50,
	explodeAs = [[SMALL_BUILDINGEX]],
	footprintX = 2,
	footprintZ = 2,
	frenchdescription = [[Détecte les unités navales]],
	frenchname = [[Station sonar évoluée]],
	germandescription = [[Ortet schwimmende Einheiten]],
	germanname = [[Verb. Sonarstation]],
	maxDamage = 355,
	maxSlope = 10,
	metalStorage = 0,
	minWaterDepth = 30,
	name = [[Advanced Sonar Station]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	noshadow = 1,
	objectName = [[TLLASONAR]],
	onoffable = true,
	ovradjust = 1,
	selfDestructAs = [[SMALL_BUILDING]],
	side = [[TLL]],
	sightDistance = 195,
	sonarDistance = 2680,
	threed = 1,
	unitname = [[tllasonar]],
	unitnumber = 865,
	version = 3.1,
	workerTime = 0,
	yardMap = [[oooo]],
	zbuffer = 1,
	featureDefs = nil,
	sounds = {
		activate = [[sonar1]],
		canceldestruct = [[cancel2]],
		deactivate = [[sonarde1]],
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
			[1] = [[sonar1]],
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
		footprintX = 2,
		footprintZ = 2,
		height = 12,
		hitdensity = 105,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllasonar_dead]],
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
		footprintX = 2,
		footprintZ = 2,
		hitdensity = 12,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[2x2b]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

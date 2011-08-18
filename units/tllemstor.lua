-- UNITDEF -- TLLEMSTOR --
--------------------------------------------------------------------------------

local unitName = "tllemstor"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 21230,
	buildCostMetal = 1514,
	builder = false,
	buildTime = 17710,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	cloakCost = 680,
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Increases Energy & Metal Storage [80000/15000]],
	designation = [[TL-EMS]],
	energyStorage = 80000,
	explodeAs = [[FUSIONX_BLAST]],
	footprintX = 8,
	footprintZ = 8,
	frenchdescription = [[Augmente le stockage d'énergie et de métal]],
	frenchname = [[Super Dépôt d'énergie & de métal]],
	iconType = [[building]],
	maxDamage = 16200,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 15000,
	name = [[Super Storage]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLEMSTOR]],
	ovradjust = 1,
	radarDistance = 0,
	selfDestructAs = [[ESTOR_BUILDING]],
	side = [[TLL]],
	sightDistance = 210,
	threed = 1,
	unitname = [[tllemstor]],
	unitnumber = 939,
	version = 3.1,
	workerTime = 0,
	yardMap = [[oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo]],
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
		footprintX = 8,
		footprintZ = 8,
		height = 12,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllemstor_dead]],
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
		footprintX = 8,
		footprintZ = 8,
		hitdensity = 4,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[6x6b]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

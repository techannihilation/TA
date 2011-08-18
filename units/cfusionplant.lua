-- UNITDEF -- CFUSIONPLANT --
--------------------------------------------------------------------------------

local unitName = "cfusionplant"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 90096,
	buildCostEnergy = 970000,
	buildCostMetal = 63000,
	builder = false,
	buildTime = 2200000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Produces energy]],
	energyMake = 25600,
	energyStorage = 25600,
	energyUse = 0,
	explodeAs = [[SUPERBLAST_BUILDING]],
	floater = true,
	footprintX = 9,
	footprintZ = 9,
	iconType = [[building]],
	maxDamage = 30000,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Mega Fusion Reactor]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CFusionPlant]],
	radarDistance = 0,
	seismicSignature = 0,
	selfDestructAs = [[SUPERBLAST_BUILDING]],
	side = [[CORE]],
	sightDistance = 300,
	smoothAnim = true,
	threed = 1,
	turnRate = 0,
	unitname = [[cfusionplant]],
	unitnumber = 106,
	version = 1,
	workerTime = 0,
	yardMap = [[ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo]],
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
			[1] = [[fusion2]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[core_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Mega Fusion Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 5,
		footprintZ = 5,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CFusionPlant_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Mega Fusion Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 5,
		footprintZ = 5,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[CFusionPlant_heap]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

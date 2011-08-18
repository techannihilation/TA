-- UNITDEF -- TLLMEGACOLDFUS --
--------------------------------------------------------------------------------

local unitName = "tllmegacoldfus"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 4096,
	buildCostEnergy = 290000,
	buildCostMetal = 50000,
	builder = false,
	buildTime = 1500000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Produces Energy/ Storage]],
	designation = [[TL-CF]],
	downloadable = 1,
	energyMake = 14500,
	energyStorage = 29000,
	energyUse = 0,
	explodeAs = [[SUPERBLAST_BUILDING]],
	footprintX = 7,
	footprintZ = 7,
	frenchdescription = [[Produit de l'énergie]],
	iconType = [[building]],
	maxDamage = 11380,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Mega Fusion Reactor]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLMEGACOLDFUS]],
	radarDistance = 0,
	selfDestructAs = [[SUPERBLAST_BUILDING]],
	side = [[TLL]],
	sightDistance = 210,
	threed = 1,
	unitname = [[tllmegacoldfus]],
	unitnumber = 922,
	version = 3.1,
	workerTime = 0,
	yardMap = [[ooooooo ooooooo ooooooo ooooooo ooooooo ooooooo ooooooo]],
	zbuffer = 1,
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:SmallWhiteLight]],
		},
	},
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
			[1] = [[fusion1]],
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
		footprintX = 5,
		footprintZ = 5,
		height = 12,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllmegacoldfus_dead]],
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
		footprintX = 5,
		footprintZ = 5,
		hitdensity = 5,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[5x5a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

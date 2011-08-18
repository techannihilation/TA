-- UNITDEF -- TLLCOLDFUS --
--------------------------------------------------------------------------------

local unitName = "tllcoldfus"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 4096,
	buildCostEnergy = 22000,
	buildCostMetal = 9350,
	builder = false,
	buildTime = 220000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Produces Energy/ Storage]],
	designation = [[TL-CF]],
	downloadable = 1,
	energyMake = 2500,
	energyStorage = 40000,
	energyUse = 0,
	explodeAs = [[NUCLEAR_MISSILE]],
	footprintX = 5,
	footprintZ = 5,
	frenchdescription = [[Produit de l'énergie]],
	iconType = [[building]],
	maxDamage = 11380,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Advanced Fusion Reactor]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLCOLDFUS]],
	radarDistance = 0,
	selfDestructAs = [[CRBLMSSL]],
	side = [[TLL]],
	sightDistance = 210,
	threed = 1,
	unitname = [[tllcoldfus]],
	unitnumber = 922,
	version = 3.1,
	workerTime = 0,
	yardMap = [[ooooo ooooo ooooo ooooo ooooo]],
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
		object = [[tllcoldfus_dead]],
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

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
	corpse = [[dead]],
	description = [[Produces Metal and Energy/ Storage]],
	designation = [[TL-UWF]],
	downloadable = 1,
	energyMake = 1000,
	energyUse = 400,
	explodeAs = [[ATOMIC_BLAST]],
	footprintX = 6,
	footprintZ = 4,
	iconType = [[building]],
	makesMetal = 6,
	maxDamage = 3311,
	maxHeightDif = 10,
	maxWaterDepth = 255,
	minWaterDepth = 34,
	name = [[Underwater Heavy Elemental Reactor]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[tllUWFUSion]],
	selfDestructAs = [[NUCLEAR_MISSILE]],
	side = [[TLL]],
	sightDistance = 110,
	unitname = [[tlluwfusion]],
	unitnumber = 867,
	workerTime = 0,
	yardMap = [[oooooooooooooooooooooooo]],
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

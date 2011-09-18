-- UNITDEF -- AMETALMAKERLVL2 --
--------------------------------------------------------------------------------

local unitName = "ametalmakerlvl2"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	buildCostEnergy = 1200755,
	buildCostMetal = 23119,
	builder = false,
	buildTime = 200000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[dead]],
	damageModifier = 0.25,
	description = [[Converts upto 16000 Energy to Metal]],
	designation = [[AEM-MEM]],
	energyStorage = 0,
	explodeAs = [[nuclear_missile1]],
	floater = true,
	footprintX = 4,
	footprintZ = 4,
	maxDamage = 5000,
	maxSlope = 20,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[T3 Metal Maker]],
	noChaseCategory = [[ALL]],
	objectName = [[AMetalMakerLvl2]],
	radarDistance = 0,
	script = [[armmmkr.cob]],
	selfDestructAs = [[nuclear_missile1]],
	side = [[ARM]],
	sightDistance = 210,
	unitname = [[ametalmakerlvl2]],
	workerTime = 0,
	yardMap = [[OOO OOO OOO]],
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
		category = [[core_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[T3 Metalmaker Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[AMetalMakerLvl2_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[T3 Metalmaker Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[AMetalMakerLvl2_heap]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

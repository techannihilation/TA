-- UNITDEF -- TLLMEDFUSION --
--------------------------------------------------------------------------------

local unitName = "tllmedfusion"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	buildCostEnergy = 7200,
	buildCostMetal = 3450,
	builder = false,
	buildTime = 70000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[dead]],
	description = [[Produces Energy/ Storage]],
	energyMake = 800,
	energyStorage = 2000,
	explodeAs = [[FUSIONX_BLAST]],
	floater = true,
	footprintX = 5,
	footprintZ = 5,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 2000,
	maxDamage = 4680,
	maxSlope = 20,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Fusion Reactor]],
	noChaseCategory = [[ALL]],
	objectName = [[TLLMEDFUSION]],
	radarDistance = 0,
	selfDestructAs = [[FUSIONX_BLAST]],
	side = [[TLL]],
	sightDistance = 263,
	smoothAnim = true,
	unitname = [[tllmedfusion]],
	workerTime = 0,
	yardMap = [[ooooo ooooo ooooo ooooo ooooo]],
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
		category = [[tll_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Small Fusion Wreckage]],
		featureDead = [[heap]],
		footprintX = 5,
		footprintZ = 5,
		height = 12,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllmedfusion_dead]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Small Fusion Debris]],
		footprintX = 5,
		footprintZ = 4,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[4x4c]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

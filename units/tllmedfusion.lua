-- UNITDEF -- TLLMEDFUSION --
--------------------------------------------------------------------------------

local unitName = "tllmedfusion"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	buildCostEnergy = 7200,
	buildCostMetal = 3450,
	isbuilder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 8,
	buildingGroundDecalSizeY = 8,
	buildingGroundDecalType = [[tllmedfusion_aoplane.dds]],
	buildTime = 70000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[dead]],
	description = [[Produces Metal and Energy/ Storage]],
	energyMake = 800,
	energyStorage = 2000,
	energyUse = 300,
	explodeAs = [[FUSIONX_BLAST]],
	floater = true,
	footprintX = 5,
	footprintZ = 5,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 2000,
	makesMetal = 4.2,
	maxDamage = 4680,
	maxSlope = 20,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Heavy Elemental Reactor]],
	noChaseCategory = [[ALL]],
	objectName = [[TLLMEDFUSION]],
	radarDistance = 0,
	selfDestructAs = [[FUSIONX_BLAST]],
	side = [[TLL]],
	sightDistance = 263,
	unitname = [[tllmedfusion]],
	useBuildingGroundDecal = true,
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

-- UNITDEF -- TLLRICHTER --
--------------------------------------------------------------------------------

local unitName = "tllrichter"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 4096,
	buildCostEnergy = 6363,
	buildCostMetal = 698,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 8,
	buildingGroundDecalSizeY = 8,
	buildingGroundDecalType = [[tllrichter_aoplane.dds]],
	buildTime = 10955,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[DEAD]],
	description = [[Seismic System]],
	energyUse = 125,
	explodeAs = [[LARGE_BUILDINGEX]],
	footprintX = 5,
	footprintZ = 5,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	levelGround = false,
	maxDamage = 2500,
	maxHeightDif = 36,
	maxWaterDepth = 0,
	name = [[Richter ]],
	noChaseCategory = [[ALL]],
	objectName = [[TLLRICHTER]],
	onoffable = true,
	script = [[tllrichter.lua]],
	seismicDistance = 2200,
	seismicSignature = 0,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[TLL]],
	sightDistance = 225,
	unitname = [[tllrichter]],
	useBuildingGroundDecal = true,
	yardMap = [[ooooo ooooo ooooo ooooo ooooo]],
	featureDefs = nil,
	sounds = {
		activate = [[targon2]],
		canceldestruct = [[cancel2]],
		deactivate = [[targoff2]],
		underattack = [[warning1]],
		working = [[targsel2]],
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		select = {
			[1] = [[targsel2]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = true,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 4,
		footprintZ = 4,
		height = 15,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[TLLRICHTER_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 4,
		footprintZ = 4,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[4X4A]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

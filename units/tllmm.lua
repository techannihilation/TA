-- UNITDEF -- TLLMM --
--------------------------------------------------------------------------------

local unitName = "tllmm"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 160,
	buildCostMetal = 16,
	isbuilder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 5,
	buildingGroundDecalSizeY = 5,
	buildingGroundDecalType = [[tllmm_aoplane.dds]],
	buildTime = 2000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[dead]],
	damageModifier = 0.4,
	description = [[Converts upto 100 Energy into Metal]],
	designation = [[]],
	explodeAs = [[ARMESTOR_BUILDINGEX]],
	footprintX = 3,
	footprintZ = 3,
	maxDamage = 172,
	maxHeightDif = 10,
	maxWaterDepth = 0,
	name = [[Metal Maker]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLMM]],
	selfDestructAs = [[ARMESTOR_BUILDING]],
	side = [[TLL]],
	sightDistance = 210,
	unitname = [[tllmm]],
	unitnumber = 814,
	useBuildingGroundDecal = true,
	yardMap = [[ooo ooo ooo]],
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
		category = [[tll_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 21,
		hitdensity = 105,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllmm_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 2,
		hitdensity = 58,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3x3A]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

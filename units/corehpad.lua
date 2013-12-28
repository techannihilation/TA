-- UNITDEF -- COREHPAD --
--------------------------------------------------------------------------------

local unitName = "corehpad"

--------------------------------------------------------------------------------

local unitDef = {
	ai_limit = [[limit COREHPAD 3]],
	ai_weight = [[weight COREHPAD 2]],
	bmcode = 0,
	buildCostEnergy = 65000,
	buildCostMetal = 2480,
	builder = true,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 9,
	buildingGroundDecalSizeY = 9,
	buildingGroundDecalType = [[corehpad_aoplane.dds]],
	buildTime = 19981,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	collisionVolumeScales = [[124.2 64.2 124.2]],
	collisionVolumeOffsets = [[0 -10 0]],
	collisionVolumeTest = 1,
	collisionVolumeType = [[ellipsoid]],
	corpse = [[dead]],
	description = [[Produces Helicopters]],
	designation = [[CHP-01]],
	energyStorage = 240,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 7,
	footprintZ = 6,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 1810,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 100,
	mobilestandorders = 1,
	name = [[Helipad]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[COREHPAD]],
	radarDistance = 800,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[CORE]],
	sightDistance = 225,
	standingfireorder = 2,
	standingmoveorder = 1,
	unitname = [[corehpad]],
	unitnumber = 100897,
	useBuildingGroundDecal = true,
	workerTime = 190,
	yardMap = [[ooooooo ooooooo occccco occccco occccco occccco]],
	buildoptions = {
		[1] = [[corhelo]],
		[2] = [[armtys]],
		[3] = [[chopper]],
		[4] = [[apache]],
	},
	featureDefs = nil,
	sounds = {
		build = [[pairwork]],
		canceldestruct = [[cancel2]],
		underattack = [[warning1]],
		unitcomplete = [[untdone]],
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		select = {
			[1] = [[pairactv]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[arm_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Helipad Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.4032 * unitDef.buildCostMetal,
		object = [[CoreHPAD_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Helipad Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 100,
		metal = 0.3226 * unitDef.buildCostMetal,
		object = [[6x6a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- TLLALAB --
--------------------------------------------------------------------------------

local unitName = "tllalab"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 2048,
	buildCostEnergy = 35000,
	buildCostMetal = 4015,
	builder = true,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 10,
	buildingGroundDecalSizeY = 10,
	buildingGroundDecalType = [[tllalab_aoplane.dds]],
	buildTime = 20000,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT LEVEL1]],
	corpse = [[dead]],
	description = [[Produces T2 Kbots]],
	designation = [[]],
	energyStorage = 200,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 8,
	footprintZ = 7,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 3311,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 200,
	mobilestandorders = 1,
	name = [[Advanced Kbot Lab]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLALAB]],
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[TLL]],
	sightDistance = 220,
	standingfireorder = 2,
	standingmoveorder = 2,
	unitname = [[tllalab]],
	unitnumber = 816,
	useBuildingGroundDecal = true,
	workerTime = 400,
	yardMap = [[ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo]],
	buildoptions = {
		[1] = [[tllack]],
		[2] = [[tllburner]],
		[3] = [[tllarchnano]],
		[4] = [[tllamphibot]],
		[5] = [[tllhrk]],
		[6] = [[tllbind]],
		[7] = [[tllcrawlb]],
		[8] = [[tllsniper]],
		[9] = [[tllartybot]],
		[10] = [[tllaak]],
		[11] = [[tlltraq]],
		[12] = [[tllturtle]],
		[13] = [[tllobserver]],
		[14] = [[tllconfuser]],
	},
	featureDefs = nil,
	sounds = {
		build = [[plabwork]],
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
			[1] = [[plabactv]],
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
		footprintX = 8,
		footprintZ = 8,
		height = 21,
		hitdensity = 105,
		metal = 0.5153 * unitDef.buildCostMetal,
		object = [[tllalab_dead]],
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
		footprintX = 8,
		footprintZ = 8,
		height = 2,
		hitdensity = 105,
		metal = 0.4122 * unitDef.buildCostMetal,
		object = [[7x7C]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

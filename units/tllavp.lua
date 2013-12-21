-- UNITDEF -- TLLAVP --
--------------------------------------------------------------------------------

local unitName = "tllavp"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 1024,
	buildCostEnergy = 24000,
	buildCostMetal = 4345,
	builder = true,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 10,
	buildingGroundDecalSizeY = 10,
	buildingGroundDecalType = [[tllavp_aoplane.dds]],
	buildTime = 20000,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT LEVEL1]],
	corpse = [[dead]],
	description = [[Produces T2 Vehicles]],
	designation = [[]],
	energyStorage = 200,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 8,
	footprintZ = 7,
	iconType = [[building]],
	maxDamage = 4575,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 200,
	mobilestandorders = 1,
	name = [[Advanced Vehicle Plant]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLAVP]],
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[TLL]],
	sightDistance = 218,
	standingfireorder = 2,
	standingmoveorder = 0,
	unitname = [[tllavp]],
	unitnumber = 832,
	useBuildingGroundDecal = true,
	workerTime = 420,
	yardMap = [[oooooooo oooooooo ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo]],
	buildoptions = {
		[1] = [[tllacv]],
		[2] = [[tllthumper]],
		[3] = [[tllcoyote]],
		[4] = [[tllconvincer]],
		[5] = [[tllloki]],
		[6] = [[tllroaster]],
		[7] = [[tllpuncher]],
		[8] = [[tlldivine]],
		[9] = [[tllobscurer]],
	},
	featureDefs = nil,
	sounds = {
		build = [[pvehwork]],
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
			[1] = [[pvehactv]],
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
		footprintX = 6,
		footprintZ = 6,
		height = 21,
		hitdensity = 105,
		metal = 0.4350 * unitDef.buildCostMetal,
		object = [[tllavp_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[wreckage]],
		featureDead = [[heap2]],
		featurereclamate = [[smudge01]],
		footprintX = 6,
		footprintZ = 6,
		height = 2,
		hitdensity = 105,
		metal = 0.3480 * unitDef.buildCostMetal,
		object = [[6x6B]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap2 = {
		blocking = false,
		category = [[heaps]],
		damage = 0.2160 * unitDef.maxDamage,
		description = [[wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 6,
		footprintZ = 6,
		height = 2,
		hitdensity = 105,
		metal = 0.2784 * unitDef.buildCostMetal,
		object = [[4x4B]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

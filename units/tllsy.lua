-- UNITDEF -- TLLSY --
--------------------------------------------------------------------------------

local unitName = "tllsy"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildCostEnergy = 790,
	buildCostMetal = 690,
	builder = true,
	buildTime = 6090,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	corpse = [[dead]],
	description = [[Produces T1 Ships]],
	designation = [[]],
	energyStorage = 100,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 8,
	footprintZ = 8,
	maxDamage = 2510,
	metalMake = 0.5,
	metalStorage = 100,
	minWaterDepth = 30,
	mobilestandorders = 1,
	name = [[Shipyard]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	noshadow = 1,
	objectName = [[TLLSY]],
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[TLL]],
	sightDistance = 213,
	standingfireorder = 2,
	standingmoveorder = 2,
	unitname = [[tllsy]],
	unitnumber = 849,
	waterline = 22,
	workerTime = 210,
	yardMap = [[wCCCCCCw CCCCCCCC wCCCCCCC wCCCCCCC wCCCCCCC wCCCCCCC CCCCCCCC wCCCCCCw]],
	buildoptions = {
		[1] = [[tllcs]],
		[2] = [[tllplunger]],
		[3] = [[tllotter]],
		[4] = [[tllboat2]],
		[5] = [[tllviolator]],
		[6] = [[tllambassador]],
	},
	featureDefs = nil,
	sounds = {
		build = [[pshpwork]],
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
			[1] = [[pshpactv]],
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
		metal = 0.7304 * unitDef.buildCostMetal,
		object = [[tllsy_dead]],
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
		footprintX = 8,
		footprintZ = 8,
		height = 2,
		hitdensity = 105,
		metal = 0.5843 * unitDef.buildCostMetal,
		object = [[6x6C]],
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
		footprintX = 8,
		footprintZ = 8,
		height = 2,
		hitdensity = 105,
		metal = 0.4675 * unitDef.buildCostMetal,
		object = [[4x4C]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

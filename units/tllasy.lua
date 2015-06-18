-- UNITDEF -- TLLASY --
--------------------------------------------------------------------------------

local unitName = "tllasy"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildCostEnergy = 11240,
	buildCostMetal = 4200,
	builder = true,
	buildTime = 13590,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT LEVEL1]],
	corpse = [[dead]],
	description = [[Produces T2 Ships]],
	designation = [[]],
	energyStorage = 200,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 9,
	footprintZ = 9,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 2901,
	metalMake = 1,
	metalStorage = 200,
	minWaterDepth = 30,
	mobilestandorders = 1,
	name = [[Advanced Shipyard]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	noshadow = 1,
	objectName = [[TLLASY]],
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[TLL]],
	sightDistance = 245,
	standingfireorder = 2,
	standingmoveorder = 2,
	unitname = [[tllasy]],
	unitnumber = 858,
	waterline = 22,
	workerTime = 620,
	yardMap = [[wCCCCCCCw wCCCCCCCw wCCCCCCCw wCCCCCCCw wCCCCCCCw wCCCCCCCw wCCCCCCCw wCCCCCCCw wCCCCCCCw]],
	customparams = {
		providetech = [[T2 Factory]],
	},
	buildoptions = {
		[1] = [[tllacs]],
		[2] = [[tllacsub]],
		[3] = [[tllcsub]],
		[4] = [[tllorc]],
		[5] = [[tllasship]],
		[6] = [[tllsting]],
		[7] = [[tllequalizer]],
		[8] = [[tllviking]],
		[9] = [[tllgiant]],
		[10] = [[tllvisitor]],
		[11] = [[tllmixer]],
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
		metal = 0.4992 * unitDef.buildCostMetal,
		object = [[tllasy_dead]],
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
		metal = 0.3994 * unitDef.buildCostMetal,
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
		metal = 0.3195 * unitDef.buildCostMetal,
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

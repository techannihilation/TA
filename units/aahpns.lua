-- UNITDEF -- AAHPNS --
--------------------------------------------------------------------------------

local unitName = "aahpns"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildCostEnergy = 14604,
	buildCostMetal = 4520,
	builder = true,
	buildTime = 16220,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[LEVEL1 ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	corpse = [[dead]],
	description = [[Builds T2 Hovercrafts]],
	designation = [[ARM-HNS]],
	downloadable = 1,
	energyStorage = 300,
	energyUse = 50,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 10,
	footprintZ = 8,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 5005,
	metalStorage = 300,
	minWaterDepth = 30,
	mobilestandorders = 1,
	name = [[Advanced Hovercraft Platform - NS]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	noshadow = 1,
	objectName = [[AAHPNS]],
	radarDistance = 50,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[ARM]],
	sightDistance = 220,
	standingfireorder = 2,
	standingmoveorder = 1,
	unitname = [[aahpns]],
	unitnumber = 11002,
	waterline = 15,
	workerTime = 400,
	yardMap = [[wCCCCCCCCw CCCCCCCCCC CCCCCCCCCC CCCCCCCCCC CCCCCCCCCC CCCCCCCCCC CCCCCCCCCC wCCCCCCCCw]],
	buildoptions = {
		[1] = [[aach]],
		[2] = [[r75-v]],
		[3] = [[concealer]],
		[4] = [[armhplasma]],
		[5] = [[armvisit]],
		[6] = [[armlashover]],
		[7] = [[nsaatorph]],
		[8] = [[devastator]],
		[9] = [[armiguana]],
		[10] = [[speeder]],
		[11] = [[armtem]],
	},
	featureDefs = nil,
	sounds = {
		build = [[hoverok1]],
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
			[1] = [[hoversl1]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[arm_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Advanced Hovercraft Plataform NS Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 10,
		footprintZ = 8,
		height = 20,
		hitdensity = 100,
		metal = 0.5322 * unitDef.buildCostMetal,
		object = [[Aahpns_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Advanced Hovercraft Plataform NS Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 8,
		footprintZ = 7,
		height = 4,
		hitdensity = 100,
		metal = 0.4258 * unitDef.buildCostMetal,
		object = [[7x7a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

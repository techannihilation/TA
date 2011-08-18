-- UNITDEF -- CORESY --
--------------------------------------------------------------------------------

local unitName = "coresy"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildCostEnergy = 73053,
	buildCostMetal = 19704,
	builder = true,
	buildTime = 43240,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	collisionvolumescales = [[227 64 227]],
	collisionvolumetype = [[Box]],
	corpse = [[dead]],
	description = [[Produces Level 3 Ships, water depth 89 or more required]],
	designation = [[COR-SCF]],
	energyStorage = 400,
	energyUse = 0,
	explodeAs = [[ATOMIC_BLASTSML]],
	firestandorders = 1,
	footprintX = 15,
	footprintZ = 15,
	iconType = [[building]],
	maxDamage = 10598,
	metalMake = 2,
	metalStorage = 400,
	minWaterDepth = 89,
	mobilestandorders = 1,
	name = [[Capital Shipyard]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CORESY]],
	radarDistance = 100,
	selfDestructAs = [[ATOMIC_BLAST]],
	side = [[CORE]],
	sightDistance = 324,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	unitname = [[coresy]],
	waterline = 65,
	workerTime = 400,
	yardMap = [[wCCCCCCCCCCCCCw	cCCCCCCCCCCCCCccCCCCCCCCCCCCCccCCCCCCCCCCCCCccCCCCCCCCCCCCCccCCCCCCCCCCCCCccCCCCCCCCCCCCCccCCCCCCCCCCCCCccCCCCCCCCCCCCCccCCCCCCCCCCCCCccCCCCCCCCCCCCCccCCCCCCCCCCCCCccCCCCCCCCCCCCCccCCCCCCCCCCCCCccCCCCCCCCCCCCCc]],
	buildoptions = {
		[1] = [[cortyrnt]],
		[2] = [[corhcar]],
		[3] = [[uppercut]],
		[4] = [[corblackhy]],
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
		category = [[corpses]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 15,
		footprintZ = 15,
		height = 40,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[CORESY_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 7,
		footprintZ = 7,
		height = 6,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[7X7B]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- TLLHTCP --
--------------------------------------------------------------------------------

local unitName = "tllhtcp"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 1024,
	buildCostEnergy = 9550,
	buildCostMetal = 6148,
	builder = true,
	buildTime = 66120,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	damageModifier = 0.75,
	description = [[Produces High Tech Units]],
	designation = [[]],
	energyStorage = 1000,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 10,
	footprintZ = 10,
	iconType = [[building]],
	maxDamage = 12575,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 1000,
	mobilestandorders = 1,
	name = [[High Tech Construction Plant]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLHTCP]],
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[TLL]],
	sightDistance = 320,
	standingfireorder = 2,
	standingmoveorder = 0,
	threed = 1,
	unitname = [[tllhtcp]],
	unitnumber = 934,
	version = 3.1,
	workerTime = 980,
	yardMap = [[oooccccooo oooccccooo oooccccooo cccccccccc cccccccccc cccccccccc oooccccooo oooccccooo oooccccooo oooccccooo ]],
	zbuffer = 1,
	buildoptions = {
		[1] = [[tllhtcb]],
		[2] = [[tllhtml]],
		[3] = [[tllblind]],
		[4] = [[tllgrim]],
		[5] = [[tllmlrpc]],
	},
	featureDefs = nil,
	sounds = {
		activate = [[gantok2]],
		build = [[gantok2]],
		canceldestruct = [[cancel2]],
		deactivate = [[gantok2]],
		repair = [[lathelrg]],
		underattack = [[warning1]],
		unitcomplete = [[gantok1]],
		working = [[build]],
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		select = {
			[1] = [[gantsel1]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[tll_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 8,
		footprintZ = 8,
		height = 12,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllhtcp_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Metal Shards]],
		featureDead = [[tllhtcp_heap2]],
		featurereclamate = [[smudge01]],
		footprintX = 8,
		footprintZ = 8,
		hitdensity = 5,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[7x7d]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
	heap2 = {
		blocking = false,
		category = [[heaps]],
		damage = 0.2160 * unitDef.maxDamage,
		description = [[Metal Shards]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 11,
		footprintZ = 11,
		hitdensity = 5,
		metal = 0.5120 * unitDef.buildCostMetal,
		object = [[4x4d]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

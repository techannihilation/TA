-- UNITDEF -- COREHPAD --
--------------------------------------------------------------------------------

local unitName = "corehpad"

--------------------------------------------------------------------------------

local unitDef = {
	ai_limit = [[limit COREHPAD 3]],
	ai_weight = [[weight COREHPAD 2]],
	bmcode = 0,
	buildCostEnergy = 17570,
	buildCostMetal = 1250,
	builder = true,
	buildTime = 19981,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Produces Helicopters]],
	designation = [[CHP-01]],
	energyStorage = 240,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 7,
	footprintZ = 6,
	frenchdescription = [[Niveau Tech 1]],
	frenchname = [[Usine aéronautique]],
	germandescription = [[Tech Level 1]],
	germanname = [[Flugzeugfabrik]],
	maxDamage = 1810,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 100,
	mobilestandorders = 1,
	name = [[Helipad (CORE)]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[COREHPAD]],
	radarDistance = 800,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[CORE]],
	sightDistance = 225,
	standingfireorder = 2,
	standingmoveorder = 1,
	threed = 1,
	unitname = [[corehpad]],
	unitnumber = 100897,
	version = 1,
	workerTime = 190,
	yardMap = [[ooooooo ooooooo occccco occccco occccco occccco]],
	zbuffer = 1,
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
		description = [[Helipad (CORE) Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CoreHPAD_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Helipad (CORE) Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
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

-- UNITDEF -- SPIDERLAB --
--------------------------------------------------------------------------------

local unitName = "spiderlab"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 1950,
	buildCostEnergy = 4989,
	buildCostMetal = 1238,
	builder = true,
	buildTime = 15930,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Produces All-terrain Kbots]],
	designation = [[ARM-SL1]],
	energyStorage = 200,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 6,
	footprintZ = 7,
	maxDamage = 2120,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 200,
	mobilestandorders = 1,
	name = [[Spider Lab [ARM]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[spiderlab]],
	ovradjust = 1,
	radarDistance = 50,
	selfDestructAs = [[LARGE_BUILDING]],
	shootme = 0,
	side = [[ARM]],
	sightDistance = 220,
	spanishdescription = [[Produce Kbots Todoterreno]],
	spanishname = [[Laboratorio Arácnido]],
	standingfireorder = 2,
	standingmoveorder = 1,
	threed = 1,
	unitname = [[spiderlab]],
	unitnumber = 7765,
	version = 1.2,
	workerTime = 200,
	yardMap = [[000000 0CCCC0 0CCCC0 0CCCC0 0CCCC0 0CCCC0 0CCCC0]],
	zbuffer = 1,
	buildoptions = {
		[1] = [[armmlspd]],
		[2] = [[armtick]],
		[3] = [[armtspd]],
		[4] = [[armjaspd]],
		[5] = [[armlaspd]],
		[6] = [[armaaspd]],
		[7] = [[armsptk]],
		[8] = [[armspid]],
		[9] = [[armvader]],
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
		category = [[arm_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Spider lab Wreckage]],
		featureDead = [[heap]],
		featurereclaimate = [[smudge01]],
		footprintX = 6,
		footprintZ = 7,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[spiderlab_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Spider lab Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 5,
		footprintZ = 5,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[5x5a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

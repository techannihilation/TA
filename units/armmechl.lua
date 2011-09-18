-- UNITDEF -- ARMMECHL --
--------------------------------------------------------------------------------

local unitName = "armmechl"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildCostEnergy = 33782,
	buildCostMetal = 7493,
	builder = true,
	buildTime = 69536,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Produces Assault Level 3 units]],
	designation = [[ARM-BLT]],
	downloadable = 1,
	energyStorage = 1250,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 8,
	footprintZ = 8,
	frenchdescription = [[Builds L3 Technology]],
	frenchname = [[Mech Lab]],
	germandescription = [[Builds L3 Technology]],
	germanname = [[Mech Lab]],
	italiandescription = [[Builds L3 Technology]],
	italianname = [[Mech Lab]],
	maxDamage = 12385,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 650,
	mobilestandorders = 1,
	name = [[Assault Gantry]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[ARMMECHL]],
	radarDistance = 0,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[ARM]],
	sightDistance = 210,
	spanishdescription = [[Builds L3 Technology]],
	spanishname = [[Mech Lab]],
	standingfireorder = 2,
	standingmoveorder = 1,
	threed = 1,
	unitname = [[armmechl]],
	unitnumber = 609,
	version = 3.1,
	workerTime = 1025,
	yardMap = [[oooooooo oooooooo ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo ]],
	zbuffer = 1,
	buildoptions = {
		[1] = [[cordem]],
		[2] = [[corkarg]],
		[3] = [[shiva]],
		[4] = [[armraven]],
		[5] = [[corjurgen]],
		[6] = [[troman]],
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
	corgant_heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Experimental Gantry Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 9,
		footprintZ = 9,
		height = 4,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[7X7B]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	dead = {
		blocking = true,
		category = [[core_corpses]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[corgant_heap]],
		featurereclamate = [[smudge01]],
		footprintX = 8,
		footprintZ = 8,
		height = 23,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[corgant_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

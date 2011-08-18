-- UNITDEF -- ARMGANT --
--------------------------------------------------------------------------------

local unitName = "armgant"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildCostEnergy = 29374,
	buildCostMetal = 7887,
	builder = true,
	buildTime = 60937,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Produces Assault Level 3 units]],
	designation = [[GKA-BIG]],
	downloadable = 1,
	energyStorage = 1400,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 9,
	footprintZ = 9,
	frenchdescription = [[Usine de Kbot expérimentaux]],
	frenchname = [[Gorilla Gantry]],
	germandescription = [[Experimentelle Kbot Fabrik]],
	germanname = [[Gorilla Gantry]],
	italiandescription = [[Costruzione Gorilla]],
	italianname = [[Gorilla Krogoth]],
	maxDamage = 13100,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 800,
	mobilestandorders = 1,
	name = [[Assault Gantry]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[ARMGANT]],
	radarDistance = 0,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[ARM]],
	sightDistance = 210,
	spanishdescription = [[Construye Gorilla]],
	spanishname = [[Gorilla Gantry]],
	standingfireorder = 2,
	standingmoveorder = 1,
	threed = 1,
	unitname = [[armgant]],
	unitnumber = 253,
	version = 1.2,
	workerTime = 925,
	yardMap = [[ooooooooo ooooooooo oocccccoo oocccccoo oocccccoo oocccccoo oocccccoo oocccccoo oocccccoo ]],
	zbuffer = 1,
	buildoptions = {
		[1] = [[armjugg]],
		[2] = [[armraz]],
		[3] = [[marauder]],
		[4] = [[armshock]],
		[5] = [[armcrabe]],
		[6] = [[armpod]],
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
		category = [[arm_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 9,
		footprintZ = 9,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[armgant_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 9,
		footprintZ = 8,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[7x7b]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

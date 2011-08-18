-- UNITDEF -- COREVP --
--------------------------------------------------------------------------------

local unitName = "corevp"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 1024,
	buildCostEnergy = 21713,
	buildCostMetal = 7268,
	builder = true,
	buildingGroundDecalDecaySpeed = 3000,
	buildingGroundDecalSizeX = 10,
	buildingGroundDecalSizeY = 9,
	buildingGroundDecalType = [[asphalt512.dds]],
	buildTime = 70500,
	canMove = false,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Produces T3 Vehicles]],
	designation = [[COREVP]],
	energyStorage = 500,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 8,
	footprintZ = 8,
	frenchdescription = [[Produit des véhicules]],
	frenchname = [[Usine de véhicules extrême]],
	germandescription = [[Baut Fahrzeuge]],
	germanname = [[Extreme Fahrzeugfabrik]],
	maxDamage = 13910,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 500,
	mobilestandorders = 1,
	name = [[Experimental Vehicle Plant]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[COREVP]],
	radarDistance = 0,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[CORE]],
	sightDistance = 230,
	sortbias = 0,
	standingfireorder = 2,
	standingmoveorder = 1,
	threed = 1,
	unitname = [[corevp]],
	unitnumber = 8444,
	useBuildingGroundDecal = true,
	version = 1,
	workerTime = 250,
	yardMap = [[cccccccc cccccccc cccccccc cccccccc cccccccc cccccccc cccccccc cccccccc]],
	zbuffer = 1,
	buildoptions = {
		[1] = [[clb]],
		[2] = [[armtigre2]],
		[3] = [[armmcv]],
		[4] = [[rockblack]],
		[5] = [[corbt]],
		[6] = [[cormachn]],
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
		category = [[arm_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 8,
		footprintZ = 8,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[corevp_dead]],
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
		footprintX = 8,
		footprintZ = 7,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[6x6d]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- TLLRADAR --
--------------------------------------------------------------------------------

local unitName = "tllradar"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 150,
	buildCostMetal = 95,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 4,
	buildingGroundDecalSizeY = 4,
	buildingGroundDecalType = [[tllradar_aoplane.dds]],
	buildTime = 1372,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Early Warning System]],
	designation = [[]],
	energyMake = 5,
	energyUse = 8,
	explodeAs = [[SMALL_BUILDINGEX]],
	footprintX = 2,
	footprintZ = 2,
	frenchdescription = [[Niveau Tech 1]],
	frenchname = [[Tour radar  ]],
	germandescription = [[Tech Level 1]],
	germanname = [[Radarturm]],
	iconType = [[building]],
	italiandescription = [[Torretta radar]],
	italianname = [[Torre Radar]],
	maxDamage = 93,
	maxSlope = 10,
	maxWaterDepth = 0,
	name = [[Radar Tower]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLRADAR]],
	onoffable = true,
	radarDistance = 1940,
	script = [[tllradar.lua]],
	selfDestructAs = [[SMALL_BUILDING]],
	side = [[TLL]],
	sightDistance = 350,
	spanishdescription = [[Torre de Radar ]],
	spanishname = [[Torre de Radar ]],
	threed = 1,
	unitname = [[tllradar]],
	unitnumber = 809,
	useBuildingGroundDecal = true,
	version = 1,
	yardMap = [[oooo]],
	zbuffer = 1,
	featureDefs = nil,
	sounds = {
		activate = [[radar1]],
		canceldestruct = [[cancel2]],
		deactivate = [[radarde1]],
		underattack = [[warning1]],
		working = [[radar1]],
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		select = {
			[1] = [[radar1]],
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
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllradar_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[2x2b]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

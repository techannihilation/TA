-- UNITDEF -- ARMBLAB --
--------------------------------------------------------------------------------

local unitName = "armblab"

--------------------------------------------------------------------------------

local unitDef = {
	ai_limit = [[limit ARMBLAB 1]],
	ai_weight = [[weight ARMBLAB 6]],
	bmcode = 0,
	buildAngle = 4096,
	buildCostEnergy = 4756,
	buildCostMetal = 1270,
	builder = true,
	buildTime = 14004,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[DEAD]],
	description = [[Produces All-Terrain Kbots]],
	designation = [[sWs-ABL]],
	downloadable = 1,
	energyStorage = 80,
	energyUse = 0,
	explodeAs = [[MEDIUM_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 5,
	footprintZ = 5,
	frenchdescription = [[Produit des clones]],
	frenchname = [[Bio Lab]],
	germandescription = [[Produziert Klone]],
	germanname = [[Bio Lab]],
	maxDamage = 2234,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 80,
	mobilestandorders = 1,
	name = [[Spider Lab [CORE]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[ARMBLAB]],
	ovradjust = 1,
	radarDistance = 0,
	selfDestructAs = [[MEDIUM_BUILDING]],
	side = [[ARM]],
	sightDistance = 202,
	standingmoveorder = 1,
	stealth = true,
	threed = 1,
	unitname = [[armblab]],
	unitnumber = 2003,
	version = 3,
	workerTime = 200,
	yardMap = [[00000 0CCC0 0CCC0 0CCC0 0CCC0]],
	zbuffer = 1,
	buildoptions = {
		[1] = [[armcspid]],
		[2] = [[armrezspd]],
		[3] = [[armflspd]],
		[4] = [[armpaspd]],
		[5] = [[armamspd]],
		[6] = [[cortermite]],
		[7] = [[cormena]],
		[8] = [[corroach]],
		[9] = [[corsktl]],
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
	DEAD = {
		blocking = true,
		category = [[arm_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Spider lab Wreckage]],
		featureDead = [[HEAP]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 40,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[armBlab_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Spider lab Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[4x4a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

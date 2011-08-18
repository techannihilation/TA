-- UNITDEF -- ARMCP --
--------------------------------------------------------------------------------

local unitName = "armcp"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = false,
	ai_limit = [[limit ARMCP 4]],
	ai_weight = [[weight ARMCP 2]],
	bmcode = 0,
	buildCostEnergy = 12370,
	buildCostMetal = 1450,
	builder = true,
	buildTime = 19240,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Produces Helicopters]],
	designation = [[HP-17]],
	energyStorage = 100,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 7,
	footprintZ = 6,
	frenchdescription = [[Produit des Hélicoptères]],
	frenchname = [[Helipad]],
	germandescription = [[Baut Hubschrauber]],
	germanname = [[Helipad]],
	maxDamage = 1850,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 100,
	mobilestandorders = 1,
	name = [[Helipad (ARM)]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[ARMCP]],
	radarDistance = 500,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[ARM]],
	sightDistance = 225,
	standingfireorder = 2,
	standingmoveorder = 1,
	threed = 1,
	unitname = [[armcp]],
	unitnumber = 8,
	version = 1,
	workerTime = 100,
	yardMap = [[ooooooo ooooooo occccco occccco occccco occccco]],
	zbuffer = 1,
	buildoptions = {
		[1] = [[armsh175]],
		[2] = [[ferret]],
		[3] = [[armah256]],
		[4] = [[smasher]],
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
		description = [[Helipad (ARM) Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[armcp_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

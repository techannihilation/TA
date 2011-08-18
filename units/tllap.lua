-- UNITDEF -- TLLAP --
--------------------------------------------------------------------------------

local unitName = "tllap"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = false,
	bmcode = 0,
	buildCostEnergy = 1450,
	buildCostMetal = 880,
	builder = true,
	buildTime = 7450,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	damageModifier = 0.7,
	description = [[Produces Aircraft]],
	designation = [[TLL-AP]],
	energyStorage = 100,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 7,
	footprintZ = 7,
	frenchdescription = [[Niveau Tech 1]],
	frenchname = [[Usine aéronautique]],
	germandescription = [[Tech Level 1]],
	germanname = [[Flugzeugfabrik]],
	iconType = [[building]],
	italiandescription = [[Produce velivoli]],
	italianname = [[Fabbrica Aerei]],
	maxDamage = 1920,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 100,
	mobilestandorders = 1,
	name = [[Aircraft Plant]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLAP]],
	ovradjust = 1,
	radarDistance = 550,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[TLL]],
	sightDistance = 200,
	spanishdescription = [[Produce aviones]],
	spanishname = [[Planta Constr. Aeronaves ]],
	standingfireorder = 2,
	standingmoveorder = 1,
	threed = 1,
	unitname = [[tllap]],
	unitnumber = 915,
	version = 3.1,
	workerTime = 210,
	yardMap = [[cccooco	cccccco occccco	occccco	occccco occccco	ocoooco]],
	zbuffer = 1,
	buildoptions = {
		[1] = [[tllca]],
		[2] = [[tllprob]],
		[3] = [[tllfight]],
		[4] = [[tllbomber]],
		[5] = [[tlltplane]],
		[6] = [[tllcop1]],
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
		category = [[tll_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 7,
		footprintZ = 7,
		height = 12,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllap_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Metal Shards]],
		featurereclamate = [[smudge01]],
		footprintX = 7,
		footprintZ = 7,
		hitdensity = 4,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[6x6b]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

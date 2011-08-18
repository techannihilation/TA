-- UNITDEF -- TLLHPNS --
--------------------------------------------------------------------------------

local unitName = "tllhpns"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildCostEnergy = 588,
	buildCostMetal = 1033,
	builder = true,
	buildTime = 11007,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Builds Hovercraft]],
	designation = [[TLL-HP]],
	downloadable = 1,
	energyStorage = 200,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 8,
	footprintZ = 7,
	frenchdescription = [[Construit des Hovercrafts]],
	frenchname = [[Plate-forme de construction Navy]],
	germandescription = [[Baut Hovercrafts]],
	germanname = [[Hovercraft-Plattform]],
	italiandescription = [[Costruisce Hovercraft]],
	italianname = [[Piattaforma Hovercraft]],
	maxDamage = 3888,
	maxWaterDepth = 0,
	metalStorage = 200,
	minWaterDepth = 30,
	mobilestandorders = 1,
	name = [[Hovercraft Platform - NS]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	noshadow = 1,
	objectName = [[tllHPNS]],
	radarDistance = 0,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[tll]],
	sightDistance = 220,
	spanishdescription = [[Construye hovercrafts]],
	spanishname = [[Plataforma Hovercraft]],
	standingfireorder = 2,
	standingmoveorder = 1,
	threed = 1,
	unitname = [[tllhpns]],
	unitnumber = 26003,
	version = 1.2,
	waterline = 9,
	workerTime = 500,
	yardMap = [[wwCCCCww wwCCCCww wwCCCCww wwCCCCww wwCCCCww wwCCCCww wwCCCCww wwCCCCww]],
	zbuffer = 1,
	buildoptions = {
		[1] = [[tllchover]],
		[2] = [[tllhoverlight]],
		[3] = [[tllhplasma]],
		[4] = [[tllhoverrocket]],
		[5] = [[tllhovermissile]],
		[6] = [[tllhovergauss]],
		[7] = [[tllsalamander]],
	},
	featureDefs = nil,
	sounds = {
		build = [[hoverok1]],
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
			[1] = [[hoversl1]],
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
		footprintZ = 7,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllhpns_dead]],
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
		footprintX = 8,
		footprintZ = 7,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[7x7d]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

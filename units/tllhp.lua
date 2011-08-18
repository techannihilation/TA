-- UNITDEF -- TLLHP --
--------------------------------------------------------------------------------

local unitName = "tllhp"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildCostEnergy = 1531,
	buildCostMetal = 1155,
	builder = true,
	buildTime = 14105,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Builds Hovercraft]],
	designation = [[TLL-HP2]],
	downloadable = 1,
	energyStorage = 200,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 8,
	footprintZ = 7,
	frenchdescription = [[Construit des Hovercrafts]],
	frenchname = [[Plate-forme de construction]],
	germandescription = [[Baut Hovercrafts]],
	germanname = [[Hovercraft-Plattform]],
	italiandescription = [[Costruisce Hovercraft]],
	italianname = [[Piattaforma Hovercraft]],
	maxDamage = 3102,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 200,
	mobilestandorders = 1,
	name = [[Hovercraft Platform]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLHP]],
	radarDistance = 0,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[TLL]],
	sightDistance = 240,
	spanishdescription = [[Construye hovercrafts]],
	spanishname = [[Plataforma Hovercraft]],
	standingfireorder = 2,
	standingmoveorder = 1,
	threed = 1,
	unitname = [[tllhp]],
	unitnumber = 19103,
	version = 1.2,
	workerTime = 400,
	yardMap = [[ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo]],
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
		build = [[hoverok2]],
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
			[1] = [[hoversl2]],
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
		object = [[tllhp_dead]],
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

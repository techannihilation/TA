-- UNITDEF -- CAHP --
--------------------------------------------------------------------------------

local unitName = "cahp"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildCostEnergy = 16527,
	buildCostMetal = 3457,
	builder = true,
	buildTime = 34521,
	canMove = false,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	collisionvolumescales = [[178 30 136]],
	collisionvolumetype = [[Box]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Builds T2 Hovercraft]],
	designation = [[COR-H]],
	downloadable = 1,
	energyStorage = 300,
	energyUse = 50,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 12,
	footprintZ = 9,
	frenchdescription = [[Construit des Hovercrafts]],
	frenchname = [[Plate-forme de constr. évoluée]],
	germandescription = [[Baut Hovercrafts]],
	germanname = [[Verb. Hovercraft-Plattform]],
	italiandescription = [[Costruisce Hovercraft]],
	italianname = [[Piattaforma Hovercraft Spec.]],
	maxDamage = 5205,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 300,
	mobilestandorders = 1,
	name = [[Advanced Hovercraft Platform]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CAHP]],
	radarDistance = 0,
	radarDistanceJam = 20,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[CORE]],
	sightDistance = 220,
	spanishdescription = [[Construye hovercrafts]],
	spanishname = [[Plataforma Av. Hovercraft]],
	standingfireorder = 2,
	standingmoveorder = 1,
	threed = 1,
	unitname = [[cahp]],
	unitnumber = 11005,
	version = 1.2,
	workerTime = 400,
	yardMap = [[ooccccccccoo ooccccccccoo ooccccccccoo ooccccccccoo ooccccccccoo ooccccccccoo ooccccccccoo ooccccccccoo ooccccccccoo]],
	zbuffer = 1,
	buildoptions = {
		[1] = [[cach]],
		[2] = [[watcher]],
		[3] = [[blotter]],
		[4] = [[nsacbehe]],
		[5] = [[cormatch]],
		[6] = [[corhover3g]],
		[7] = [[nsacanglr]],
		[8] = [[corfrog]],
		[9] = [[coradon]],
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
		category = [[arm_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Advanced Hovercraft Plataform Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 10,
		footprintZ = 8,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[Cahp_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Advanced Hovercraft Plataform Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 8,
		footprintZ = 7,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[7x7a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

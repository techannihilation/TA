-- UNITDEF -- AAHP --
--------------------------------------------------------------------------------

local unitName = "aahp"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildCostEnergy = 13277,
	buildCostMetal = 3507,
	builder = true,
	buildTime = 34521,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	collisionvolumescales = [[150 42 120]],
	collisionvolumetype = [[Box]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Builds T2 Hovercraft]],
	designation = [[ARM-H]],
	downloadable = 1,
	energyStorage = 300,
	energyUse = 50,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 10,
	footprintZ = 8,
	frenchdescription = [[Construit des Hovercrafts]],
	frenchname = [[Plate-forme de constr. évoluée]],
	germandescription = [[Baut Hovercrafts]],
	germanname = [[Verb. Hovercraft-Plattform]],
	italiandescription = [[Costruisce Hovercraft]],
	italianname = [[Piattaforma Hovercraft Spec.]],
	maxDamage = 5005,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 300,
	mobilestandorders = 1,
	name = [[Advanced Hovercraft Platform]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[AAHP]],
	radarDistance = 0,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[ARM]],
	sightDistance = 220,
	spanishdescription = [[Construye hovercrafts]],
	spanishname = [[Plataforma Av. Hovercraft]],
	standingfireorder = 2,
	standingmoveorder = 1,
	stealth = true,
	threed = 1,
	unitname = [[aahp]],
	unitnumber = 11001,
	version = 1.2,
	workerTime = 400,
	yardMap = [[ooccccccoo ooccccccoo ooccccccoo ooccccccoo ooccccccoo ooccccccoo ooccccccoo ooccccccoo ooccccccoo]],
	zbuffer = 1,
	buildoptions = {
		[1] = [[aach]],
		[2] = [[r75-v]],
		[3] = [[concealer]],
		[4] = [[armhplasma]],
		[5] = [[armvisit]],
		[6] = [[armlashover]],
		[7] = [[nsaatorph]],
		[8] = [[devastator]],
		[9] = [[armiguana]],
		[10] = [[speeder]],
		[11] = [[armtem]],
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
		object = [[Aahp_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Advanced Hovercraft Plataform heap]],
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

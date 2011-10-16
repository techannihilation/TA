-- UNITDEF -- TLLPLAT --
--------------------------------------------------------------------------------

local unitName = "tllplat"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildCostEnergy = 5967,
	buildCostMetal = 2431,
	builder = true,
	buildTime = 21483,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	damageModifier = 0.6,
	description = [[Builds Seaplanes]],
	designation = [[TLL-SPP]],
	downloadable = 1,
	energyStorage = 250,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 7,
	footprintZ = 7,
	frenchdescription = [[Construit Hydravions]],
	frenchname = [[Plate-Forme Hydravion]],
	germandescription = [[Baut Wasserflugzeuge]],
	germanname = [[Wasserflugzeug-Plattform]],
	italiandescription = [[Costruzione idrovolanti]],
	italianname = [[Piattaforma idrovolanti]],
	maxDamage = 2121,
	maxWaterDepth = 0,
	metalMake = 1,
	metalStorage = 850,
	minWaterDepth = 30,
	mobilestandorders = 1,
	name = [[Seaplane Platform]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	noshadow = 1,
	objectName = [[TLLPLAT]],
	ovradjust = 1,
	radarDistance = 0,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[TLL]],
	sightDistance = 130,
	spanishdescription = [[Construye Hidroaviones]],
	spanishname = [[Plataforma de Hidroaviones]],
	standingfireorder = 2,
	standingmoveorder = 1,
	threed = 1,
	unitname = [[tllplat]],
	unitnumber = 875,
	version = 3.1,
	waterline = 37,
	workerTime = 420,
	yardMap = [[wwwwwww wCCCCCw wCCCCCw wCCCCCw wCCCCCw wCCCCCw wwwwwww]],
	zbuffer = 1,
	buildoptions = {
		[1] = [[tllcsa]],
		[2] = [[tllseaf]],
		[3] = [[tllsonpl]],
		[4] = [[tllseab]],
		[5] = [[tlltorpcop]],
	},
	featureDefs = nil,
	sounds = {
		build = [[seaplok1]],
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
			[1] = [[seaplsl1]],
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
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllplat_dead]],
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
		footprintX = 7,
		footprintZ = 7,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[6x6b]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- TLLTARG --
--------------------------------------------------------------------------------

local unitName = "tlltarg"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 58851,
	buildCostMetal = 7305,
	builder = false,
	buildTime = 78250,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	damageModifier = 0.75,
	description = [[Automatic Targeting, Very Long Range Radar/Sonar]],
	designation = [[TL-TG]],
	downloadable = 1,
	energyStorage = 0,
	energyUse = 1500,
	explodeAs = [[LARGE_BUILDINGEX]],
	footprintX = 5,
	footprintZ = 5,
	frenchdescription = [[Ciblage Radar Automatique]],
	frenchname = [[Installation de Ciblage]],
	germandescription = [[Automatische Radar-Zielerfassung]],
	germanname = [[Peilstation]],
	isTargetingUpgrade = true,
	italiandescription = [[Radar per puntamento automatico]],
	italianname = [[Dispositivo di puntamento]],
	maxDamage = 3455,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Center Station]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLTARG]],
	onoffable = true,
	radarDistance = 7250,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[TLL]],
	sightDistance = 110,
	sonarDistance = 6000,
	spanishdescription = [[Radar de puntería automático]],
	spanishname = [[Complejo Búsqueda Blancos]],
	threed = 1,
	unitname = [[tlltarg]],
	unitnumber = 921,
	version = 3.1,
	workerTime = 0,
	yardMap = [[ooooo ooooo ooooo ooooo ooooo ]],
	zbuffer = 1,
	featureDefs = nil,
	sounds = {
		activate = [[targon1]],
		canceldestruct = [[cancel2]],
		deactivate = [[targoff1]],
		underattack = [[warning1]],
		working = [[targsel1]],
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		select = {
			[1] = [[targsel1]],
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
		footprintX = 6,
		footprintZ = 6,
		height = 12,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tlltarg_dead]],
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
		footprintX = 6,
		footprintZ = 6,
		hitdensity = 5,
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

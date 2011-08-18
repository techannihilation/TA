-- UNITDEF -- TLLMOHOGEO --
--------------------------------------------------------------------------------

local unitName = "tllmohogeo"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 12000,
	buildCostMetal = 6800,
	builder = false,
	buildTime = 170000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[tllgeo_dead]],
	description = [[Hazardous Geothermal Foundry Produces Energy/Metal]],
	designation = [[]],
	energyMake = 3500,
	energyStorage = 3500,
	energyUse = 3000,
	explodeAs = [[NUCLEAR_MISSILE]],
	footprintX = 4,
	footprintZ = 4,
	frenchdescription = [[Produit de l'énergie/Metal]],
	frenchname = [[Centrale géothermique]],
	germandescription = [[Liefert Energie/Metal]],
	germanname = [[Geotherm. Kraftwerk]],
	iconType = [[building]],
	italiandescription = [[Produce energia/Metal]],
	italianname = [[Stabilimento Geotermico]],
	makesMetal = 42,
	maxDamage = 5320,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 600,
	name = [[Moho Geothermal Foundry]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLMOHOGEO]],
	onoffable = false,
	selfDestructAs = [[NUCLEAR_MISSILE]],
	side = [[TLL]],
	sightDistance = 210,
	spanishdescription = [[Genera energía/Metal]],
	spanishname = [[Planta Geotérmica]],
	threed = 1,
	unitname = [[tllmohogeo]],
	unitnumber = 803,
	version = 1,
	yardMap = [[GGGGGGGGGGGGGGGG]],
	zbuffer = 1,
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:PILOT]],
		},
	},
	sounds = {
		activate = [[tllgeo]],
		canceldestruct = [[cancel2]],
		deactivate = [[tllgeooff]],
		underattack = [[tllwarning]],
		count = {
			[1] = [[tllcount]],
			[2] = [[tllcount]],
			[3] = [[tllcount]],
			[4] = [[tllcount]],
			[5] = [[tllcount]],
			[6] = [[tllcount]],
		},
		select = {
			[1] = [[tllgeosel]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	tllgeo_dead = {
		blocking = true,
		category = [[tll_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[wreckage]],
		featureDead = [[tllgeo_heap]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 21,
		hitdensity = 105,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllmex_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	tllgeo_heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 2,
		hitdensity = 105,
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

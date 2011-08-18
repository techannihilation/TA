-- UNITDEF -- TLLWINDTRAP --
--------------------------------------------------------------------------------

local unitName = "tllwindtrap"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 208,
	buildCostMetal = 37,
	builder = false,
	buildTime = 1961,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	damageModifier = 0.9,
	description = [[Produces Energy]],
	designation = [[TL-WT]],
	digger = 1,
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[SMALL_BUILDINGEX]],
	footprintX = 4,
	footprintZ = 4,
	frenchdescription = [[Produit de l'énergie]],
	frenchname = [[Piège à vent]],
	germandescription = [[Gewinnt Energie]],
	germanname = [[Windgenerator]],
	iconType = [[building]],
	italiandescription = [[Produce energia]],
	italianname = [[Generatore a Vento]],
	maxDamage = 224,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Wind Trap]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[Tllwindtrap]],
	onoffable = true,
	ovradjust = 1,
	radarDistance = 0,
	selfDestructAs = [[SMALL_BUILDING]],
	side = [[TLL]],
	sightDistance = 210,
	spanishdescription = [[Produce energía]],
	spanishname = [[Generador Eólico]],
	threed = 1,
	unitname = [[tllwindtrap]],
	unitnumber = 851,
	version = 3.1,
	windGenerator = 120,
	workerTime = 0,
	yardMap = [[oooo oooo oooo oooo]],
	zbuffer = 1,
	featureDefs = nil,
	sounds = {
		canceldestruct = [[cancel2]],
		deactivate = [[tllwindstop]],
		underattack = [[tllwarning]],
		working = [[tllwind2]],
		count = {
			[1] = [[tllcount]],
			[2] = [[tllcount]],
			[3] = [[tllcount]],
			[4] = [[tllcount]],
			[5] = [[tllcount]],
			[6] = [[tllcount]],
		},
		select = {
			[1] = [[tllwindsel]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[tll_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 12,
		hitdensity = 53,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllwindtrap_dead]],
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
		footprintX = 4,
		footprintZ = 4,
		hitdensity = 4,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[4x4f]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

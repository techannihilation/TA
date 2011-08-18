-- UNITDEF -- TLLSOLARNS --
--------------------------------------------------------------------------------

local unitName = "tllsolarns"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 1350,
	buildCostMetal = 180,
	builder = false,
	buildTime = 3750,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	damageModifier = 0.5,
	description = [[Produce Energy]],
	designation = [[SOL-NS]],
	energyMake = 25,
	energyStorage = 40,
	explodeAs = [[SMALL_BUILDINGEX]],
	footprintX = 4,
	footprintZ = 4,
	frenchdescription = [[Produit de l'�nergie]],
	frenchname = [[Capteur solaire NAVY]],
	germandescription = [[Gewinnt Energie]],
	germanname = [[Solarkollektor]],
	iconType = [[building]],
	maxDamage = 485,
	metalStorage = 0,
	minWaterDepth = 20,
	name = [[Hybrid Solar Collector/Tidal Generator]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	noshadow = 1,
	objectName = [[tllsolarNS]],
	onoffable = true,
	ovradjust = 1,
	radarDistance = 0,
	selfDestructAs = [[SMALL_BUILDING]],
	side = [[TLL]],
	sightDistance = 250,
	threed = 1,
	tidalGenerator = 1,
	unitname = [[tllsolarns]],
	unitnumber = 868,
	version = 3.1,
	waterline = 8,
	workerTime = 0,
	yardMap = [[wwww wwww wwww wwww]],
	zbuffer = 1,
	featureDefs = nil,
	sounds = {
		activate = [[solar2]],
		canceldestruct = [[cancel2]],
		deactivate = [[solar2]],
		underattack = [[warning1]],
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		select = {
			[1] = [[solar2]],
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
		footprintX = 4,
		footprintZ = 4,
		height = 12,
		hitdensity = 103,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllsolarNS_dead]],
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
		object = [[4x4b]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- TLLEMSTOR --
--------------------------------------------------------------------------------

local unitName = "tllemstor"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 21230,
	buildCostMetal = 7560,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 11,
	buildingGroundDecalSizeY = 11,
	buildingGroundDecalType = [[tllemstor_aoplane.dds]],
	buildTime = 57710,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	cloakCost = 680,
	corpse = [[dead]],
	description = [[Increases Energy & Metal Storage [250000/50000]],
	designation = [[TL-EMS]],
	energyStorage = 250000,
	explodeAs = [[TWILIGHT_BIG]],
	footprintX = 8,
	footprintZ = 8,
	iconType = [[building]],
	maxDamage = 12200,
	maxHeightDif = 10,
	maxWaterDepth = 0,
	metalStorage = 50000,
	name = [[Super Storage]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLEMSTOR]],
	ovradjust = 1,
	radarDistance = 0,
	selfDestructAs = [[TWILIGHT_BIG]],
	side = [[TLL]],
	sightDistance = 210,
	unitname = [[tllemstor]],
	unitnumber = 939,
	useBuildingGroundDecal = true,
	workerTime = 0,
	yardMap = [[oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo]],
	featureDefs = nil,
	sounds = {
		canceldestruct = [[cancel2]],
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
			[1] = [[storngy1]],
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
		footprintZ = 8,
		height = 12,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllemstor_dead]],
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
		footprintX = 8,
		footprintZ = 8,
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

-- UNITDEF -- ARMLIGHTFUS --
--------------------------------------------------------------------------------

local unitName = "armlightfus"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 65535,
	buildCostEnergy = 10000,
	buildCostMetal = 1700,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 9,
	buildingGroundDecalSizeY = 9,
	buildingGroundDecalType = [[armlightfus_aoplane.dds]],
	buildPic = [[armlightfus.png]],
	buildTime = 22000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	collisionVolumeScales = [[68.6 69.6 74.6]],
	collisionVolumeOffsets = [[0 0 1]],
	collisionVolumeTest = 1,
	collisionVolumeType = [[box]],
	corpse = [[DEAD]],
	description = [[Produces Energy / Storage]],
	designation = [[Brzapp-66]],
	downloadable = 1,
	energyMake = 400,
	energyStorage = 1000,
	energyUse = 0,
	explodeAs = [[CRAWL_BLASTSML]],
	footprintX = 6,
	footprintZ = 6,
	iconType = [[building]],
	maxDamage = 2500,
	maxSlope = 10,
	maxWaterDepth = 1,
	metalStorage = 0,
	name = [[Light Fusion Power Plant]],
	noAutoFire = false,
	objectName = [[armlightfus]],
	radarDistance = 0,
	selfDestructAs = [[CRAWL_BLAST]],
	side = [[ARM]],
	sightDistance = 367.5,
	threed = 1,
	unitname = [[armlightfus]],
	unitnumber = 106,
	useBuildingGroundDecal = true,
	version = 1.2,
	workerTime = 0,
	yardMap = [[oooooo oooooo oooooo oooooo oooooo oooooo]],
	zbuffer = 1,
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:ReactorSequence]],
		},
	},
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
			[1] = [[fusion1]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = true,
		category = [[corpses]],
		damage = 0.3176 * unitDef.maxDamage,
		description = [[Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 6,
		footprintZ = 6,
		height = 20,
		hitdensity = 100,
		metal = 0.3441 * unitDef.buildCostMetal,
		object = [[armlightfus_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3176 * unitDef.maxDamage,
		description = [[Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 6,
		footprintZ = 6,
		height = 4,
		hitdensity = 100,
		metal = 0.1376 * unitDef.buildCostMetal,
		object = [[6x6d]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- CORLIGHTFUS --
--------------------------------------------------------------------------------

local unitName = "corlightfus"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 65535,
	buildCostEnergy = 11000,
	buildCostMetal = 2180,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 9,
	buildingGroundDecalSizeY = 9,
	buildingGroundDecalType = [[corlightfus_aoplane.dds]],
	buildPic = [[corlightfus.png]],
	buildTime = 24000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[DEAD]],
	description = [[Produces Energy / Storage]],
	designation = [[Brzapp-66]],
	downloadable = 1,
	energyMake = 500,
	energyStorage = 1000,
	energyUse = 0,
	explodeAs = [[CRAWL_BLASTSML]],
	footprintX = 6,
	footprintZ = 6,
	iconType = [[building]],
	maxDamage = 2550,
	maxSlope = 10,
	maxWaterDepth = 1,
	metalStorage = 0,
	name = [[Light Fusion Power Plant]],
	noAutoFire = false,
	objectName = [[corlightfus]],
	radarDistance = 0,
	selfDestructAs = [[CRAWL_BLAST]],
	side = [[Core]],
	sightDistance = 367.5,
	threed = 1,
	unitname = [[corlightfus]],
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
			[1] = [[fusion2]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = true,
		category = [[core_corpses]],
		damage = 0.3114 * unitDef.maxDamage,
		description = [[Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 6,
		footprintZ = 6,
		height = 20,
		hitdensity = 100,
		metal = 0.2683 * unitDef.buildCostMetal,
		object = [[corlightfus_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3114 * unitDef.maxDamage,
		description = [[Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 6,
		footprintZ = 6,
		height = 4,
		hitdensity = 100,
		metal = 0.1073 * unitDef.buildCostMetal,
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

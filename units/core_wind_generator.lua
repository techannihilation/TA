-- UNITDEF -- CORE_WIND_GENERATOR --
--------------------------------------------------------------------------------

local unitName = "core_wind_generator"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 523,
	buildCostMetal = 45,
	builder = false,
	buildPic = [[core_wind_generator.png]],
	buildTime = 1687,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[dead]],
	description = [[- Produces Energy]],
	designation = [[EW-14]],
	downloadable = 1,
	energyMake = 9,
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[MEDIUM_BUILDINGEX]],
	footprintX = 4,
	footprintZ = 4,
	iconType = [[building]],
	maxDamage = 309,
	maxSlope = 10,
	maxWaterDepth = 36,
	metalStorage = 0,
	name = [[UPG Wind Generator]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[core_wind_generator]],
	radarDistance = 0,
	selfDestructAs = [[SMALL_BUILDING]],
	side = [[Core]],
	sightDistance = 367.5,
	threed = 1,
	unitname = [[core_wind_generator]],
	unitnumber = 153,
	version = 1.2,
	windGenerator = 185,
	workerTime = 0,
	yardMap = [[oooooooooooooooo]],
	zbuffer = 1,
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
			[1] = [[windgen2]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[core_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Upgraded Wind Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[core_wind_generator_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Upgraded Wind Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 4,
		hitdensity = 100,
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

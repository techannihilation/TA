-- UNITDEF -- TLLATIDAL --
--------------------------------------------------------------------------------

local unitName = "tllatidal"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 1455,
	buildCostMetal = 199.5,
	builder = false,
	buildTime = 4580,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[dead]],
	description = [[Produces Energy]],
	designation = [[TL-atd]],
	downloadable = 1,
	explodeAs = [[ESTOR_BUILDINGEX]],
	footprintX = 4,
	footprintZ = 4,
	iconType = [[building]],
	maxDamage = 1050,
	maxSlope = 10,
	maxWaterDepth = 255,
	minWaterDepth = 17,
	name = [[Underwater Advanced Tidal Generator]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[tllatidal]],
	onoffable = true,
	radarDistance = 0,
	selfDestructAs = [[ESTOR_BUILDING]],
	side = [[TLL]],
	sightDistance = 110,
	tidalGenerator = 1,
	unitname = [[tllatidal]],
	unitnumber = 880,
	workerTime = 0,
	yardMap = [[oooo oooo oooo oooo]],
	customParams = {
		energyMultiplier = 2.5,
	},
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
			[1] = [[tidegen2]],
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
		object = [[tllatidal_dead]],
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
		object = [[4x4a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

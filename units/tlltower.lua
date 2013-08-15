-- UNITDEF -- TLLTOWER --
--------------------------------------------------------------------------------

local unitName = "tlltower"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 950,
	buildCostMetal = 41,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 4,
	buildingGroundDecalSizeY = 4,
	buildingGroundDecalType = [[tlltower_aoplane.dds]],
	buildTime = 5372,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	collisionvolumeoffsets = [[0 -20 0]],
	collisionvolumescales = [[22 110 22]],
	collisionvolumetype = [[box]],
	corpse = [[dead]],
	description = [[Watch Tower]],
	designation = [[TL-TWT]],
	energyMake = 0,
	energyUse = 12,
	explodeAs = [[SMALL_BUILDINGEX]],
	footprintX = 2,
	footprintZ = 2,
	maxDamage = 283,
	maxSlope = 10,
	maxWaterDepth = 0,
	name = [[Hasseloff]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLtower]],
	selfDestructAs = [[SMALL_BUILDING]],
	side = [[TLL]],
	sightDistance = 1300,
	unitname = [[tlltower]],
	unitnumber = 1809,
	useBuildingGroundDecal = true,
	yardMap = [[oooo]],
	featureDefs = nil,
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
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tlltower_dead]],
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
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[2x2a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

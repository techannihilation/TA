-- UNITDEF -- ARMDRAG --
--------------------------------------------------------------------------------

local unitName = "armdrag"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	brakeRate = 0,
	buildCostEnergy = 150,
	buildCostMetal = 10,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 4,
	buildingGroundDecalSizeY = 4,
	buildingGroundDecalType = [[armdrag_aoplane.dds]],
	buildPic = [[ARMDRAG.png]],
	buildTime = 255,
	canAttack = false,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[DRAGONSTEETH]],
	description = [[Perimeter Defense]],
	energyMake = 0,
	energyStorage = 0,
	energyUse = 0,
	footprintX = 2,
	footprintZ = 2,
	idleAutoHeal = 5,
	idleTime = 1800,
	isFeature = true,
	levelGround = false,
	maxDamage = 100,
	maxSlope = 64,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Dragon's Teeth]],
	noChaseCategory = [[ALL]],
	objectName = [[ARMDRAG]],
	seismicSignature = 0,
	side = [[ARM]],
	sightDistance = 1,
	turnRate = 0,
	unitname = [[armdrag]],
	upright = false,
	useBuildingGroundDecal = true,
	workerTime = 0,
	yardMap = [[ffff]],
	featureDefs = nil,
}

--------------------------------------------------------------------------------

local featureDefs = {
	DRAGONSTEETH = {
		autoreclaimable = 0,
		blocking = true,
		category = [[dragonteeth]],
		collisionvolumeoffsets = [[0 0 0]],
		collisionvolumescales = [[32 22 32]],
		collisionvolumetest = 1,
		collisionvolumetype = [[Box]],
		damage = 2500,
		description = [[Dragon's Teeth]],
		featureDead = [[RockTeeth]],
		featurereclamate = [[smudge01]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 7,
		nodrawundergray = true,
		object = [[armdrag]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[allworld]],
	},
	RockTeeth = {
		animating = 0,
		animtrans = 0,
		blocking = false,
		category = [[rocks]],
		damage = 500,
		description = [[Rubble]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 3,
		object = [[2X2A]],
		reclaimable = true,
		shadtrans = 1,
		world = [[greenworld]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

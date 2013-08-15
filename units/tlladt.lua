-- UNITDEF -- TLLADT --
--------------------------------------------------------------------------------

local unitName = "tlladt"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 0,
	buildCostEnergy = 695,
	buildCostMetal = 29,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 4,
	buildingGroundDecalSizeY = 4,
	buildingGroundDecalType = [[tlladt_aoplane.dds]],
	buildTime = 995,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[TLLfortification]],
	description = [[Perimeter Defense]],
	designation = [[TL-ADT]],
	downloadable = 1,
	energyMake = 0,
	energyStorage = 0,
	energyUse = 0,
	footprintX = 2,
	footprintZ = 2,
	isFeature = true,
	maxDamage = 100,
	maxSlope = 24,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Fortification Wall]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLADT]],
	radarDistance = 0,
	side = [[TLL]],
	sightDistance = 1,
	unitname = [[tlladt]],
	unitnumber = 937,
	useBuildingGroundDecal = true,
	workerTime = 0,
	yardMap = [[ff ff]],
	featureDefs = nil,
}

--------------------------------------------------------------------------------

local featureDefs = {
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
		metal = 8,
		object = [[2X2A]],
		reclaimable = true,
		shadtrans = 1,
		world = [[greenworld]],
	},
	TLLfortification = {
		autoreclaimable = 0,
		blocking = true,
		category = [[dragonteeth]],
		collisionvolumeoffsets = [[0 0 0]],
		collisionvolumescales = [[31 68 31]],
		collisionvolumetest = 1,
		collisionvolumetype = [[Box]],
		damage = 16800,
		description = [[Fortification Wall]],
		featureDead = [[RockTeeth]],
		footprintX = 2,
		footprintZ = 2,
		height = 55,
		hitdensity = 97,
		metal = 19,
		nodrawundergray = true,
		object = [[TLLADT]],
		reclaimable = true,
		reclaimTime = 800,
		seqnamereclamate = [[tree1reclamate]],
		world = [[allworld]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

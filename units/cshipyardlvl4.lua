-- UNITDEF -- CSHIPYARDLVL4 --
--------------------------------------------------------------------------------

local unitName = "cshipyardlvl4"

--------------------------------------------------------------------------------

local unitDef = {
	buildCostEnergy = 94000,
	buildCostMetal = 20000,
	isbuilder = true,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 33,
	buildingGroundDecalSizeY = 33,
	buildingGroundDecalType = [[cshipyardlvl4_aoplane.dds]],
	buildTime = 500000.5,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	collisionvolumeoffsets = [[0 -13 0]],
	collisionvolumescales = [[240 240 519]],
	collisionvolumetype = [[CylZ]],
	corpse = [[dead]],
	description = [[Builds AeroShips]],
	energyStorage = 1000,
	energyUse = 0,
	explodeAs = [[SUPERBLAST]],
	floatOnWater = false,
	footprintX = 16,
	footprintZ = 30,
	iconType = [[building]],
	maxDamage = 60000,
	maxHeightDif = 10,
	maxWaterDepth = 255,
	metalStorage = 600,
	name = [[Shipyard]],
	noChaseCategory = [[ALL]],
	objectName = [[CShipyardLvl4]],
	radarDistance = 0,
	selfDestructAs = [[SUPERBLAST]],
	side = [[CORE]],
	sightDistance = 220,
	unitname = [[cshipyardlvl4]],
	useBuildingGroundDecal = true,
	workerTime = 240,
	yardMap = string.rep([[ooccccccccccccoo]],30),
	buildoptions = {
		[1] = [[cdevastator]],
	},
	featureDefs = nil,
	sounds = {
		build = [[hoverok21]],
		canceldestruct = [[cancel2]],
		underattack = [[warning1]],
		unitcomplete = [[intro]],
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		select = {
			[1] = [[corplant1]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[core_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[Aero Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 13,
		footprintZ = 30,
		height = 30,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CShipyardLvl4_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

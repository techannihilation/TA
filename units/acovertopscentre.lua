-- UNITDEF -- ACOVERTOPSCENTRE --
--------------------------------------------------------------------------------

local unitName = "acovertopscentre"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	buildCostEnergy = 10000000,
	buildCostMetal = 75000,
	isbuilder = true,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 15,
	buildingGroundDecalSizeY = 15,
	buildingGroundDecalType = [[acovertopscentre_aoplane.dds]],
	buildTime = 250000,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[LEVEL3 ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	collisionVolumeScales = [[199 129 199]],
	collisionVolumeOffsets = [[0 0 0]],
	collisionVolumeTest = 1,
	collisionVolumeType = [[ellipsoid]],
	corpse = [[dead]],
	description = [[Builds T4 Con]],
	designation = [[COC-2]],
	energyStorage = 250,
	energyUse = 180,
	explodeAs = [[SHIPBLAST]],
	floater = true,
	footprintX = 13,
	footprintZ = 12,
	maxDamage = 36000,
	maxSlope = 10,
	maxWaterDepth = 255,
	metalStorage = 250,
	name = [[OPS Center T4]],
	noChaseCategory = [[ALL]],
	objectName = [[ACovertOpsCentre]],
	onoffable = true,
	radarDistance = 0,
	selfDestructAs = [[SHIPBLAST]],
	side = [[ARM]],
	sightDistance = 220,
	stealth = true,
	unitname = [[acovertopscentre]],
	useBuildingGroundDecal = true,
	workerTime = 160,
	yardMap = [[OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO]],
	buildoptions = {
		[1] = [[abuilderlvl3]],
	},
	customParams = {
		providetech = [[Advanced T1 Unit Research Centre,Advanced T2 Unit Research Centre,Advanced T3 Unit Research Centre,Advanced T4 Unit Research Centre]],
	},
	featureDefs = nil,
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = false,
		category = [[arm_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[OPS ARM Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 12,
		footprintZ = 12,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ACovertOpsCentre_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

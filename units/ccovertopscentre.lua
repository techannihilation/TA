-- UNITDEF -- CCOVERTOPSCENTRE --
--------------------------------------------------------------------------------

local unitName = "ccovertopscentre"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	buildCostEnergy = 10500000,
	buildCostMetal = 76000,
	builder = true,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 15,
	buildingGroundDecalSizeY = 15,
	buildingGroundDecalType = [[ccovertopscentre_aoplane.dds]],
	buildTime = 240000,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[LEVEL3 ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	collisionVolumeScales = [[186.4 106.4 186.4 ]],
	collisionVolumeOffsets = [[0 0 0]],
	collisionVolumeTest = 1,
	collisionVolumeType = [[ellipsoid]],
	corpse = [[dead]],
	description = [[Produces T4 Con]],
	designation = [[COC-1]],
	energyStorage = 250,
	energyUse = 180,
	explodeAs = [[SHIPBLAST]],
	floatOnWater = true,
	footprintX = 13,
	footprintZ = 12,
	maxDamage = 40000,
	maxHeightDif = 10,
	maxWaterDepth = 255,
	metalStorage = 250,
	name = [[OPS Center T4]],
	noChaseCategory = [[ALL]],
	objectName = [[CCovertOpsCentre]],
	onoffable = true,
	radarDistance = 0,
	selfDestructAs = [[SHIPBLAST]],
	side = [[CORE]],
	sightDistance = 220,
	stealth = true,
	unitname = [[ccovertopscentre]],
	useBuildingGroundDecal = true,
	workerTime = 160,
	yardMap = [[OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO]],
	buildoptions = {
		[1] = [[cbuilderlvl3]],
	},
	customParams = {
		providetech = [[Advanced T1 Unit Research Centre,Advanced T2 Unit Research Centre,Advanced T3 Unit Research Centre,Advanced T4 Unit Research Centre]],
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
		blocking = false,
		category = [[core_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[OPS CORE Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 12,
		footprintZ = 12,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CCovertOpsCentre_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- ARMCP --
--------------------------------------------------------------------------------

local unitName = "armcp"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = false,
	bmcode = 0,
	buildCostEnergy = 17318,
	buildCostMetal = 1920,
	builder = true,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 9,
	buildingGroundDecalSizeY = 9,
	buildingGroundDecalType = [[armcp_aoplane.dds]],
	buildTime = 17240,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	collisionVolumeScales = [[125.3 55.3 125.3]],
	collisionVolumeOffsets = [[0 -10 0]],
	collisionVolumeTest = 1,
	collisionVolumeType = [[ellipsoid]],
	corpse = [[dead]],
	description = [[Produces Helicopters]],
	designation = [[HP-17]],
	energyStorage = 100,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 8,
	footprintZ = 8,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 1850,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 100,
	mobilestandorders = 1,
	name = [[Helipad]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[ARMCP]],
	radarDistance = 500,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[ARM]],
	sightDistance = 225,
	standingfireorder = 2,
	standingmoveorder = 1,
	unitname = [[armcp]],
	unitnumber = 8,
	useBuildingGroundDecal = true,
	workerTime = 100,
	yardMap = [[oooooooo oooooooo ooccccoo ooccccoo ooccccoo ooccccoo oooooooo oooooooo]],
	buildoptions = {
		[1] = [[armsh175]],
		[2] = [[ferret]],
		[3] = [[armah256]],
		[4] = [[smasher]],
		[5] = [[armkamo]],
	},
	featureDefs = nil,
	sounds = {
		build = [[pairwork]],
		canceldestruct = [[cancel2]],
		underattack = [[warning1]],
		unitcomplete = [[untdone]],
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		select = {
			[1] = [[pairactv]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[arm_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Helipad (ARM) Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.4603 * unitDef.buildCostMetal,
		object = [[armcp_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

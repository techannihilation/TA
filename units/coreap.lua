-- UNITDEF -- COREAP --
--------------------------------------------------------------------------------

local unitName = "coreap"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildCostEnergy = 100000,
	buildCostMetal = 7500,
	builder = true,
	buildingGroundDecalDecaySpeed = 0.01,
	buildingGroundDecalSizeX = 11,
	buildingGroundDecalSizeY = 11,
	buildingGroundDecalType = [[asphalt512c.dds]],
	buildPic = [[COREAP.PNG]],
	buildTime = 96525,
	canBeAssisted = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[LEVEL2 ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	corpse = [[DEAD]],
	description = [[Produces T3 Aircraft]],
	energyStorage = 300,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 10,
	footprintZ = 10,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 12000,
	maxSlope = 15,
	maxWaterDepth = 0,
	metalStorage = 300,
	mobilestandorders = 1,
	name = [[Experimental Aircraft Plant]],
	noAutoFire = false,
	objectName = [[COREAP]],
	seismicSignature = 0,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[CORE]],
	sightDistance = 305.5,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	TEDClass = [[PLANT]],
	turnRate = 0,
	unitname = [[coreap]],
	useBuildingGroundDecal = true,
	workerTime = 600,
	yardMap = [[oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo]],
	buildoptions = {
		[1] = [[shrike]],
		[2] = [[blackdawn]],
		[3] = [[corsbomb]],
		[4] = [[coreclipse]],
		[5] = [[corbtrans]],
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
	DEAD = {
		blocking = false,
		category = [[corpses]],
		damage = 0.2256 * unitDef.maxDamage,
		description = [[Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		footprintX = 10,
		footprintZ = 10,
		height = 4,
		hitdensity = 100,
		metal = 0.3527 * unitDef.buildCostMetal,
		object = [[COREAP_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.4000 * unitDef.maxDamage,
		description = [[Wreckage]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 9,
		footprintZ = 9,
		height = 4,
		hitdensity = 100,
		metal = 0.1411 * unitDef.buildCostMetal,
		object = [[7X7B]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

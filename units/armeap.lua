-- UNITDEF -- ARMEAP --
--------------------------------------------------------------------------------

local unitName = "armeap"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildCostEnergy = 145000,
	buildCostMetal = 19200,
	builder = true,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 13,
	buildingGroundDecalSizeY = 13,
	buildingGroundDecalType = [[armeap_aoplane.dds]],
	buildPic = [[ARMEAP.png]],
	buildTime = 91400,
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
	objectName = [[ARMEAP]],
	seismicSignature = 0,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[ARM]],
	sightDistance = 300,
	standingfireorder = 2,
	standingmoveorder = 1,
	TEDClass = [[PLANT]],
	turnRate = 0,
	unitname = [[armeap]],
	useBuildingGroundDecal = true,
	workerTime = 600,
	yardMap = [[oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo]],
	buildoptions = {
		[1] = [[airwolf3g]],
		[2] = [[armpers]],
		[3] = [[armor]],
		[4] = [[armorion]],
		[5] = [[armcyclone]],
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
		metal = 0.1378 * unitDef.buildCostMetal,
		object = [[ARMEAP_DEAD]],
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
		metal = 0.0551 * unitDef.buildCostMetal,
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

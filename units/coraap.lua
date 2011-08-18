-- UNITDEF -- CORAAP --
--------------------------------------------------------------------------------

local unitName = "coraap"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	bmcode = 0,
	brakeRate = 0,
	buildCostEnergy = 63571,
	buildCostMetal = 4679,
	builder = true,
	buildingGroundDecalDecaySpeed = 3000,
	buildingGroundDecalSizeX = 9,
	buildingGroundDecalSizeY = 7,
	buildingGroundDecalType = [[asphalt512c.dds]],
	buildPic = [[CORAAP.png]],
	buildTime = 40678,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	corpse = [[DEAD1]],
	description = [[Produces T2 Aircraft]],
	energyStorage = 200,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 8,
	footprintZ = 6,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 3520,
	maxSlope = 15,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 200,
	mobilestandorders = 1,
	name = [[Advanced Aircraft Plant]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CORAAP]],
	seismicSignature = 0,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[CORE]],
	sightDistance = 305.5,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	turnRate = 0,
	unitname = [[coraap]],
	useBuildingGroundDecal = true,
	workerTime = 400,
	yardMap = [[oooooooooooooooooooooooooooooooooooooooooooooooo]],
	buildoptions = {
		[1] = [[coraca]],
		[2] = [[cbuilderlvl1]],
		[3] = [[corape]],
		[4] = [[corhurc]],
		[5] = [[cortitan]],
		[6] = [[corvamp]],
		[7] = [[corawac]],
		[8] = [[armsl]],
		[9] = [[corcrw]],
		[10] = [[blackdawn]],
		[11] = [[shrike]],
		[12] = [[tu95-a]],
	},
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:WhiteLight]],
		},
	},
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
	DEAD1 = {
		blocking = true,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Aircraft Plant Wreckage]],
		energy = 800,
		featureDead = [[HEAP1]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 7,
		footprintZ = 6,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CORAAP_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	HEAP1 = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Aircraft Plant Heap]],
		energy = 400,
		featurereclamate = [[SMUDGE01]],
		footprintX = 6,
		footprintZ = 6,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[6X6A]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

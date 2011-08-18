-- UNITDEF -- ARMAAP --
--------------------------------------------------------------------------------

local unitName = "armaap"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	bmcode = 0,
	brakeRate = 0,
	buildCostEnergy = 64986,
	buildCostMetal = 4606,
	builder = true,
	buildingGroundDecalDecaySpeed = 3000,
	buildingGroundDecalSizeX = 9,
	buildingGroundDecalSizeY = 7,
	buildingGroundDecalType = [[armaap_aoplane.dds]],
	buildPic = [[ARMAAP.png]],
	buildTime = 40851,
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
	maxDamage = 3360,
	maxSlope = 15,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 200,
	mobilestandorders = 1,
	name = [[Advanced Aircraft Plant]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[ARMAAP]],
	seismicSignature = 0,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[ARM]],
	sightDistance = 312,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	turnRate = 0,
	unitname = [[armaap]],
	useBuildingGroundDecal = true,
	workerTime = 400,
	yardMap = [[oooooooooooooooooooooooooooooooooooooooooooooooo]],
	buildoptions = {
		[1] = [[armaca]],
		[2] = [[abuilderlvl1]],
		[3] = [[armbrawl]],
		[4] = [[armpnix]],
		[5] = [[armlance]],
		[6] = [[armhawk]],
		[7] = [[armawac]],
		[8] = [[armdfly]],
		[9] = [[blade]],
		[10] = [[corgripn]],
		[11] = [[armcybr]],
		[12] = [[b52g]],
		[13] = [[armpers]],
		[14] = [[airwolf3g]],
	},
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:YellowLight]],
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
		energy = 10000,
		featureDead = [[HEAP1]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 7,
		footprintZ = 6,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ARMAAP_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	HEAP1 = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Aircraft Plant Heap]],
		energy = 4000,
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

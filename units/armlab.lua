-- UNITDEF -- ARMLAB --
--------------------------------------------------------------------------------

local unitName = "armlab"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 1024,
	buildCostEnergy = 1130,
	buildCostMetal = 605,
	builder = true,
	buildingGroundDecalDecaySpeed = 3000,
	buildingGroundDecalSizeX = 7,
	buildingGroundDecalSizeY = 7,
	buildingGroundDecalType = [[asphalt512.dds]],
	buildPic = [[ARMLAB.png]],
	buildTime = 5260,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	corpse = [[DEAD]],
	description = [[Produces Level 1 Kbots]],
	energyStorage = 100,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 6,
	footprintZ = 6,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 2690,
	maxSlope = 15,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 100,
	mobilestandorders = 1,
	name = [[Kbot Lab]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[ARMLAB]],
	radarDistance = 50,
	seismicSignature = 0,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[ARM]],
	sightDistance = 289,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	turnRate = 0,
	unitname = [[armlab]],
	useBuildingGroundDecal = true,
	workerTime = 250,
	yardMap = [[occccooccccooccccooccccooccccoocccco]],
	buildoptions = {
		[1] = [[armck]],
		[2] = [[armpw]],
		[3] = [[armrectr]],
		[4] = [[armrock]],
		[5] = [[armham]],
		[6] = [[armjeth]],
		[7] = [[armwar]],
		[8] = [[armflea]],
		[9] = [[aexxec]],
	},
	featureDefs = nil,
	sounds = {
		build = [[plabwork]],
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
			[1] = [[plabactv]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = true,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 5,
		footprintZ = 6,
		height = 40,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ARMLAB_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 5,
		footprintZ = 5,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[5X5B]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

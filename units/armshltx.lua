-- UNITDEF -- ARMSHLTX --
--------------------------------------------------------------------------------

local unitName = "armshltx"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	bmcode = 0,
	brakeRate = 0,
	buildCostEnergy = 198000,
	buildCostMetal = 16800,
	builder = true,
	buildingGroundDecalDecaySpeed = 0.01,
	buildingGroundDecalSizeX = 10,
	buildingGroundDecalSizeY = 10,
	buildingGroundDecalType = [[armshltx_aoplane.dds]],
	buildPic = [[ARMSHLTX.png]],
	buildTime = 69000,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[LEVEL2 ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	collisionVolumeScales = [[150 43 150]],
	collisionVolumeOffsets = [[0 -5 8]],
	collisionVolumeType = [[CylY]],
	corpse = [[ARMSHLT_DEAD]],
	description = [[Produces Heavy T3 Units]],
	energyStorage = 1400,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 9,
	footprintZ = 9,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 14400,
	maxSlope = 18,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 800,
	mobilestandorders = 1,
	name = [[Experimental Gantry]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[ARMSHLTX]],
	seismicSignature = 0,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[ARM]],
	sightDistance = 273,
	standingfireorder = 2,
	standingmoveorder = 1,
	turnRate = 0,
	unitname = [[armshltx]],
	useBuildingGroundDecal = true,
	workerTime = 600,
	yardMap = [[oooooooooooooooooooocccccoooocccccoooocccccoooocccccoooocccccoooocccccoooocccccoo]],
	customparams = {
		providetech = [[T3 Factory]],
	},
	buildoptions = {
		[1] = [[armbanth]],
		[2] = [[marauder]],
		[3] = [[armshock]],
		[4] = [[armorco]],
		[5] = [[armraz]],
		[6] = [[arm_furie]],
		[7] = [[armjag]],
		[8] = [[armjugg]],
		[9] = [[armcrabe]],
	},
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:YellowLight]],
		},
	},
	sounds = {
		activate = [[gantok2]],
		build = [[gantok2]],
		canceldestruct = [[cancel2]],
		deactivate = [[gantok2]],
		repair = [[lathelrg]],
		underattack = [[warning1]],
		unitcomplete = [[gantok1]],
		working = [[build]],
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		select = {
			[1] = [[gantsel1]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	ARMSHLT_DEAD = {
		blocking = true,
		category = [[corpses]],
		collisionvolumeoffsets = [[0 -14 0]],
		collisionvolumescales = [[125 57 145]],
		collisionvolumetest = 0,
		collisionvolumetype = [[Ell]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[ARMSHLT_HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 9,
		footprintZ = 9,
		height = 20,
		hitdensity = 100,
		metal = 0.6379 * unitDef.buildCostMetal,
		object = [[ARMSHLT_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	ARMSHLT_HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 9,
		footprintZ = 9,
		height = 4,
		hitdensity = 100,
		metal = 0.5103 * unitDef.buildCostMetal,
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

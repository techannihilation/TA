-- UNITDEF -- ASUBPEN --
--------------------------------------------------------------------------------

local unitName = "asubpen"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	bmcode = 0,
	brakeRate = 0,
	buildCostEnergy = 5144,
	buildCostMetal = 860,
	builder = true,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 11,
	buildingGroundDecalSizeY = 11,
	buildingGroundDecalType = [[asubpen_aoplane.dds]],
	buildPic = [[ASUBPEN.png]],
	buildTime = 11112,
	canMove = true,
	canPatrol = true,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	corpse = [[DEAD]],
	description = [[Produces Amphibious/Underwater Units]],
	energyStorage = 150,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 8,
	footprintZ = 8,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 2400,
	maxHeightDif = 10,
	maxVelocity = 0,
	metalMake = 1,
	metalStorage = 150,
	minWaterDepth = 25,
	mobilestandorders = 1,
	name = [[Amphibious Complex]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[ASUBPEN]],
	seismicSignature = 0,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[ARM]],
	sightDistance = 234,
	standingfireorder = 2,
	standingmoveorder = 1,
	turnRate = 0,
	unitname = [[asubpen]],
	useBuildingGroundDecal = true,
	workerTime = 150,
	yardMap = [[oooooooooCCCCCCooCCCCCCooCCCCCCooCCCCCCooCCCCCCooCCCCCCooCCCCCCo]],
	buildoptions = {
		[1] = [[armbeaver]],
		[2] = [[armmarv]],
		[3] = [[armpincer]],
		[4] = [[armcroc]],
		[5] = [[armjeth]],
		[6] = [[armaak]],
		[7] = [[armsub]],
	},
	featureDefs = nil,
	sounds = {
		build = [[pvehwork]],
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
			[1] = [[pvehactv]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = false,
		category = [[corpses]],
		collisionvolumeoffsets = [[0 0 2]],
		collisionvolumescales = [[118 35 107]],
		collisionvolumetest = 1,
		collisionvolumetype = [[Box]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 7,
		footprintZ = 7,
		height = 5,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ASUBPEN_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

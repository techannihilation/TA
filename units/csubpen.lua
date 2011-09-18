-- UNITDEF -- CSUBPEN --
--------------------------------------------------------------------------------

local unitName = "csubpen"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	bmcode = 0,
	brakeRate = 0,
	buildCostEnergy = 5285,
	buildCostMetal = 917,
	builder = true,
	buildPic = [[CSUBPEN.png]],
	buildTime = 11402,
	canPatrol = true,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	corpse = [[DEAD]],
	description = [[Produces Amphibious/Underwater Units]],
	energyStorage = 160,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 8,
	footprintZ = 8,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 2500,
	maxSlope = 10,
	maxVelocity = 0,
	metalMake = 1,
	metalStorage = 160,
	minWaterDepth = 25,
	mobilestandorders = 1,
	name = [[Amphibious Complex]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CSUBPEN]],
	seismicSignature = 0,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[CORE]],
	sightDistance = 240,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	turnRate = 0,
	unitname = [[csubpen]],
	workerTime = 150,
	yardMap = [[oooooooooCCCCCCooCCCCCCooCCCCCCooCCCCCCooCCCCCCooCCCCCCooCCCCCCo]],
	buildoptions = {
		[1] = [[cormuskrat]],
		[2] = [[corgarp]],
		[3] = [[corseal]],
		[4] = [[corparrow]],
		[5] = [[corcrash]],
		[6] = [[coraak]],
		[7] = [[intruder]],
		[8] = [[corsub]],
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
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 7,
		footprintZ = 7,
		height = 5,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CSUBPEN_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

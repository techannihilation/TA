-- UNITDEF -- CORGANT1 --
--------------------------------------------------------------------------------

local unitName = "corgant1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	bmcode = 0,
	brakeRate = 0,
	buildCostEnergy = 258524,
	buildCostMetal = 17848,
	builder = true,
	buildingGroundDecalDecaySpeed = 0.01,
	buildingGroundDecalSizeX = 20,
	buildingGroundDecalSizeY = 20,
	buildingGroundDecalType = [[asphalt512c.dds]],
	buildPic = [[CORGANT.png]],
	buildTime = 267321,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	corpse = [[DEAD]],
	description = [[Produces Level 4 Units]],
	energyStorage = 1400,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 18,
	footprintZ = 18,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 106000,
	maxSlope = 18,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 800,
	mobilestandorders = 1,
	name = [[Prototype Gantry]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CORGANT1]],
	radarDistance = 50,
	seismicSignature = 0,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[CORE]],
	sightDistance = 273,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	turnRate = 0,
	unitname = [[corgant1]],
	useBuildingGroundDecal = true,
	workerTime = 600,
	yardMap = [[oooooooooooooooooo oooooooooooooooooo oooooooooooooooooo oooooooooooooooooo oooccccccccccccooo oooccccccccccccooo oooccccccccccccooo oooccccccccccccooo oooccccccccccccooo oooccccccccccccooo oooccccccccccccooo oooccccccccccccooo oooccccccccccccooo oooccccccccccccooo oooccccccccccccooo oooccccccccccccooo oooccccccccccccooo oooccccccccccccooo]],
	buildoptions = {
		[1] = [[corkrog1]],
		[2] = [[corkarg1]],
		[3] = [[corgala]],
	},
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:GantWhiteLight]],
			[2] = [[custom:YellowLight]],
			[3] = [[custom:WhiteLight]],
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
	DEAD = {
		blocking = true,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Advanced Experimental Gantry Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 18,
		footprintZ = 18,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[corgant1_dead]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Advanced Experimental Gantry Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 18,
		footprintZ = 18,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[7X7C]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

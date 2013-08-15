-- UNITDEF -- CBUILDERLVL3 --
--------------------------------------------------------------------------------

local unitName = "cbuilderlvl3"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.02527,
	airHoverFactor = 0,
	brakeRate = 1.9305,
	buildCostEnergy = 584031.1675,
	buildCostMetal = 24061.53,
	buildDistance = 190,
	builder = true,
	buildTime = 360000.3975,
	canFly = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canReclaim = true,
	canstop = 1,
	category = [[ALL CONSTR MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTWEAPON VTOL]],
	collide = false,
	corpse = [[dead]],
	collisionVolumeScales = [[77 60 140]],
	collisionVolumeOffsets = [[0 -6 0]],
	collisionVolumeTest = 1,
	collisionVolumeType = [[ellipsoid]],
	cruiseAlt = 180,
	description = [[Cruiser]],
	designation = [[COR-SS-SUP]],
	dontland = 0,
	energyMake = 60,
	energyStorage = 750,
	energyUse = 30,
	explodeAs = [[SHIPBLAST]],
	footprintX = 3,
	footprintZ = 5,
	iconType = [[air]],
	maxDamage = 8000,
	maxSlope = 10,
	maxVelocity = 3.591,
	maxWaterDepth = 0,
	metalMake = 3.75,
	metalStorage = 100,
	name = [[Builder Level 3]],
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CBuilderLvl3]],
	radarDistance = 0,
	selfDestructAs = [[SHIPBLAST]],
	side = [[CORE]],
	sightDistance = 400,
	turnRate = 199.5,
	unitname = [[cbuilderlvl3]],
	workerTime = 2000,
	buildoptions = {
		[1] = [[cfusionplant]],
		[2] = [[cmetalmakerlvl2]],
		[3] = [[cornanotc3]],
		[4] = [[corgate1]],
		[5] = [[cshipyardlvl4]],
		[6] = [[corint1]],
		[7] = [[corbuzz1]],
		[8] = [[corgant1]],
		[9] = [[corflu]],
		[10] = [[cordoom1]],
		[11] = [[corfsilo]],
		[12] = [[corfmd2]],
		[13] = [[corses]],
		[14] = [[cormas]],
		[15] = [[corpre]],
		[16] = [[cadvmsto]],
	},
	featureDefs = nil,
	sounds = {
		canceldestruct = [[cancel2]],
		underattack = [[warning1]],
		arrived = {
			[1] = [[bigstop]],
		},
		cant = {
			[1] = [[cantdo4]],
		},
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		ok = {
			[1] = [[biggo]],
		},
		select = {
			[1] = [[bigsel]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = false,
		category = [[core_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Fulcrum Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 8,
		height = 40,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CBuilderLvl3_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

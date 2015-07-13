-- UNITDEF -- CBUILDERLVL3 --
--------------------------------------------------------------------------------

local unitName = "cbuilderlvl3"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.013,
	airHoverFactor = 0,
	brakeRate = 3.5,
	buildCostEnergy = 584000,
	buildCostMetal = 24000,
	buildDistance = 190,
	builder = true,
	buildTime = 360000,
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
	hoverattack = true, 
	iconType = [[air]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 8000,
	maxSlope = 10,
	maxVelocity = 3.2,
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
		[2] = [[cormas]],
		[3] = [[cmetalmakerlvl2]],
		[4] = [[corses]],
		[5] = [[cadvmsto]],
		[6] = [[cornanotc3]],
		[7] = [[corgate1]],
		[8] = [[corfmd2]],
		[9] = [[cordoom1]],
		[10] = [[corpre]],
		[11] = [[corint1]],
		[12] = [[corbuzz1]],
		[13] = [[corfsilo]],
		[14] = [[corflu]],
		[15] = [[corgant1]],
		[16] = [[cshipyardlvl4]],
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

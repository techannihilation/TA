-- UNITDEF -- TLLSHAM --
--------------------------------------------------------------------------------

local unitName = "tllsham"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.5,
	bmcode = 1,
	brakeRate = 0.5,
	buildCostEnergy = 1500,
	buildCostMetal = 120,
	buildDistance = 102,
	builder = true,
	buildTime = 2416,
	canAssist = false,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canreclamate = 1,
	canResurrect = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON SMALL]],
	cloakCost = 25,
	cloakCostMoving = 95,
	collisionVolumeOffsets = [[0 -3 0]],
	collisionVolumeScales = [[23 42 23]],
	collisionVolumeType = [[CylY]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Resurrection Kbot]],
	designation = [[COR-RES]],
	energyMake = 0,
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[BIG_UNITEX]],
	footprintX = 2,
	footprintZ = 2,
	healtime = 5,
	maneuverleashlength = 640,
	maxDamage = 250,
	maxHeightDif = 14,
	maxVelocity = 2.2,
	maxWaterDepth = 255,
	metalStorage = 0,
	minCloakDistance = 10,
	mobilestandorders = 1,
	movementClass = [[KBOT2]],
	name = [[Shaman]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[TLLSHAM]],
	resurrect = 1,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 500,
	standingmoveorder = 2,
	steeringmode = 2,
	turnRate = 1000,
	unitname = [[tllsham]],
	unitnumber = 256,
	upright = true,
	workerTime = 218,
	featureDefs = nil,
	sounds = {
		canceldestruct = [[cancel2]],
		underattack = [[warning1]],
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
			[1] = [[necrok2]],
		},
		select = {
			[1] = [[necrsel2]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[tll_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[Dead ]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[TLLSHAM_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[Extra Dead ]],
		featurereclamate = [[smudge01]],
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[2x2d]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- INTRUDER --
--------------------------------------------------------------------------------

local unitName = "intruder"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.33,
	bmcode = 1,
	brakeRate = 0.165,
	buildAngle = 16384,
	buildCostEnergy = 15010,
	buildCostMetal = 1264,
	builder = false,
	buildPic = [[INTRUDER.png]],
	buildTime = 14177,
	canGuard = true,
	canload = 1,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	cantBeTransported = true,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Amphibious Heavy Assault Transport]],
	energyMake = 2.6,
	energyStorage = 0,
	energyUse = 2.9,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	idleAutoHeal = 5,
	idleTime = 1800,
	leaveTracks = true,
	maneuverleashlength = 640,
	mass = 200000000,
	maxDamage = 12500,
	maxVelocity = 1.892,
	maxWaterDepth = 255,
	metalMake = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[ATANK4]],
	name = [[Intruder]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[INTRUDER]],
	releaseHeld = true,
	scale = 0.5,
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[CORE]],
	sightDistance = 292,
	smoothAnim = true,
	standingfireorder = 1,
	standingmoveorder = 1,
	steeringmode = 1,
	trackOffset = -14,
	trackStrength = 10,
	trackStretch = 1,
	trackType = [[StdTank]],
	trackWidth = 42,
	transportCapacity = 20,
	transportSize = 4,
	turnRate = 215.6,
	unitname = [[intruder]],
	unloadSpread = 4,
	workerTime = 0,
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
			[1] = [[tcormove]],
		},
		select = {
			[1] = [[tcorsel]],
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
		footprintX = 4,
		footprintZ = 4,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[INTRUDER_DEAD]],
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
		footprintX = 4,
		footprintZ = 4,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[4X4C]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

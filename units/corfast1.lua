-- UNITDEF -- CORFAST1 --
--------------------------------------------------------------------------------

local unitName = "corfast1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.12,
	bmcode = 1,
	brakeRate = 0.25,
	buildCostEnergy = 3583,
	buildCostMetal = 392,
	buildDistance = 80,
	builder = true,
	buildPic = [[CORFAST.png]],
	buildTime = 6488,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canReclaim = false,
	canstop = 1,
	category = [[ALL CONSTR MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[fast assist engineer]],
	energyMake = 15,
	energyStorage = 100,
	energyUse = 15,
	explodeAs = [[BIG_UNITEX]],
	footprintX = 2,
	footprintZ = 2,
	healtime = 8,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 1150,
	maxSlope = 17,
	maxVelocity = 3,
	maxWaterDepth = 22,
	metalMake = 0.15,
	metalStorage = 100,
	mobilestandorders = 1,
	movementClass = [[KBOT2]],
	name = [[helper]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORFAST]],
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[CORE]],
	sightDistance = 520,
	smoothAnim = true,
	standingmoveorder = 1,
	steeringmode = 2,
	turnRate = 1210,
	unitname = [[corfast1]],
	upright = true,
	workerTime = 300,
	buildoptions = {
		[1] = [[arm_guardian]],
		[2] = [[core_immolator]],
		[3] = [[armarch]],
		[4] = [[corgate2]],
		[5] = [[corerad1]],
		[6] = [[corllt1]],
		[7] = [[corrad1]],
		[8] = [[corrl1]],
		[9] = [[commando]],
		[10] = [[armraven1]],
	},
	featureDefs = nil,
	sounds = {
		build = [[nanlath2]],
		canceldestruct = [[cancel2]],
		capture = [[capture2]],
		repair = [[repair2]],
		underattack = [[warning1]],
		working = [[reclaim1]],
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
			[1] = [[kbcormov]],
		},
		select = {
			[1] = [[kbcorsel]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = true,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Helper Wreckage]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CORFAST_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

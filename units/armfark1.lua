-- UNITDEF -- ARMFARK1 --
--------------------------------------------------------------------------------

local unitName = "armfark1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.216,
	bmcode = 1,
	brakeRate = 0.75,
	buildCostEnergy = 2793,
	buildCostMetal = 401,
	buildDistance = 100,
	builder = true,
	buildPic = [[ARMFARK.png]],
	buildTime = 4302,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canReclaim = false,
	canstop = 1,
	category = [[ALL CONSTR MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[fast assist engineer]],
	energyMake = 12,
	energyStorage = 25,
	energyUse = 12,
	explodeAs = [[BIG_UNITEX]],
	footprintX = 2,
	footprintZ = 2,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 1200,
	maxSlope = 14,
	maxVelocity = 2.64,
	maxWaterDepth = 22,
	metalMake = 0.12,
	metalStorage = 25,
	mobilestandorders = 1,
	movementClass = [[KBOT2]],
	name = [[helper]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMFARK]],
	radarDistance = 50,
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[ARM]],
	sightDistance = 377,
	smoothAnim = true,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 1100,
	unitname = [[armfark1]],
	upright = true,
	workerTime = 300,
	buildoptions = {
		[1] = [[arm_guardian]],
		[2] = [[arm_immolator]],
		[3] = [[armarch]],
		[4] = [[armgate2]],
		[5] = [[armcir1]],
		[6] = [[armllt1]],
		[7] = [[armrad1]],
		[8] = [[armrl1]],
		[9] = [[commando]],
		[10] = [[armshock1]],
	},
	featureDefs = nil,
	sounds = {
		build = [[nanlath1]],
		canceldestruct = [[cancel2]],
		capture = [[capture1]],
		repair = [[repair1]],
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
			[1] = [[kbarmmov]],
		},
		select = {
			[1] = [[kbarmsel]],
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
		object = [[ARMFARK_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

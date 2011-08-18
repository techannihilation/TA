-- UNITDEF -- ARMACSUB --
--------------------------------------------------------------------------------

local unitName = "armacsub"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.038,
	bmcode = 1,
	brakeRate = 0.25,
	buildCostEnergy = 37568,
	buildCostMetal = 3195,
	buildDistance = 300,
	builder = true,
	buildPic = [[ARMACSUB.png]],
	buildTime = 56565,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canreclamate = 1,
	canstop = 1,
	category = [[ALL CONSTR LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTVTOL NOTWEAPON SUB]],
	collisionvolumeoffsets = [[0 0 0]],
	collisionvolumescales = [[49 19 69]],
	collisionvolumetest = 0,
	collisionvolumetype = [[Ell]],
	corpse = [[1_DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Tech Level 2]],
	energyMake = 30,
	energyStorage = 150,
	energyUse = 30,
	explodeAs = [[SMALL_UNITEX]],
	footprintX = 3,
	footprintZ = 3,
	iconType = [[sea]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 3600,
	maxVelocity = 2.3,
	metalMake = 0.3,
	metalStorage = 150,
	minWaterDepth = 20,
	mobilestandorders = 1,
	movementClass = [[UBOAT3]],
	name = [[Advanced Construction Sub]],
	noAutoFire = false,
	noChaseCategory = [[NOTSUBNOTSHIP]],
	objectName = [[ARMACSUB]],
	radarDistance = 50,
	seismicSignature = 0,
	selfDestructAs = [[SMALL_UNIT]],
	side = [[arm]],
	sightDistance = 156,
	smoothAnim = true,
	standingmoveorder = 1,
	steeringmode = 1,
	terraformSpeed = 900,
	turnRate = 382,
	unitname = [[armacsub]],
	waterline = 30,
	workerTime = 1300,
	buildoptions = {
		[1] = [[armuwfus]],
		[2] = [[armuwfus1]],
		[3] = [[armfus]],
		[4] = [[armuwmme]],
		[5] = [[armuwmmm]],
		[6] = [[armuwadvms]],
		[7] = [[armfatf]],
		[8] = [[armplat]],
		[9] = [[armsy]],
		[10] = [[armasy]],
		[11] = [[asubpen]],
		[12] = [[armason]],
		[13] = [[armfflak]],
		[14] = [[armatl]],
		[15] = [[armflosh]],
		[16] = [[armesy]],
		[17] = [[armrech18]],
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
			[1] = [[suarmmov]],
		},
		select = {
			[1] = [[suarmsel]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	['1_DEAD'] = {
		blocking = false,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		footprintX = 4,
		footprintZ = 4,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ARMACSUB_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

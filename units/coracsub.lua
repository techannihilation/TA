-- UNITDEF -- CORACSUB --
--------------------------------------------------------------------------------

local unitName = "coracsub"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.035,
	bmcode = 1,
	brakeRate = 0.212,
	buildCostEnergy = 37911,
	buildCostMetal = 3190,
	buildDistance = 300,
	builder = true,
	buildPic = [[CORACSUB.png]],
	buildTime = 57228,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canreclamate = 1,
	canstop = 1,
	category = [[ALL CONSTR LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTVTOL NOTWEAPON SUB]],
	collisionvolumeoffsets = [[0 0 0]],
	collisionvolumescales = [[33 13 83]],
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
	maxDamage = 3700,
	maxVelocity = 2.07,
	metalMake = 0.3,
	metalStorage = 150,
	minWaterDepth = 20,
	mobilestandorders = 1,
	movementClass = [[UBOAT3]],
	name = [[Advanced Construction Sub]],
	noAutoFire = false,
	noChaseCategory = [[NOTSUBNOTSHIP]],
	objectName = [[CORACSUB]],
	radarDistance = 50,
	seismicSignature = 0,
	selfDestructAs = [[SMALL_UNIT]],
	side = [[core]],
	sightDistance = 156,
	smoothAnim = true,
	standingmoveorder = 1,
	steeringmode = 1,
	terraformSpeed = 900,
	turnRate = 364,
	unitname = [[coracsub]],
	waterline = 30,
	workerTime = 1300,
	buildoptions = {
		[1] = [[coruwfus]],
		[2] = [[crnns]],
		[3] = [[coruwmme]],
		[4] = [[coruwmmm]],
		[5] = [[coruwadves]],
		[6] = [[coruwadvms]],
		[7] = [[corfatf]],
		[8] = [[corplat]],
		[9] = [[corasy]],
		[10] = [[csubpen]],
		[11] = [[corason]],
		[12] = [[corenaa]],
		[13] = [[coratl]],
		[14] = [[corflshd]],
		[15] = [[coresy]],
		[16] = [[corech18]],
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
			[1] = [[sucormov]],
		},
		select = {
			[1] = [[sucorsel]],
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
		object = [[CORACSUB_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

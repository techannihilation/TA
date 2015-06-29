-- UNITDEF -- CORACK --
--------------------------------------------------------------------------------

local unitName = "corack"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.2,
	bmcode = 1,
	brakeRate = 0.425,
	buildCostEnergy = 30340,
	buildCostMetal = 2510,
	buildDistance = 142,
	builder = true,
	buildPic = [[CORACK.png]],
	buildTime = 20709,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canreclamate = 1,
	canstop = 1,
	category = [[ALL CONSTR LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[1_DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Tech Level 2]],
	energyMake = 14,
	energyStorage = 100,
	energyUse = 14,
	explodeAs = [[BIG_UNITEX]],
	footprintX = 2,
	footprintZ = 2,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 3000,
	maxSlope = 20,
	maxVelocity = 1.1,
	maxWaterDepth = 25,
	metalMake = 0.14,
	metalStorage = 100,
	mobilestandorders = 1,
	movementClass = [[KBOT2]],
	name = [[Advanced Construction Kbot]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORACK]],
	radarDistance = 50,
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[core]],
	sightDistance = 318.5,
	standingmoveorder = 1,
	steeringmode = 1,
	terraformSpeed = 1240,
	turnRate = 935,
	unitname = [[corack]],
	upright = true,
	workerTime = 290,
	buildoptions = {
		[1] = [[cormoho]],
		[2] = [[cormexp]],
		[3] = [[corfus]],
		[4] = [[corsfus]],
		[5] = [[cmgeo]],
		[6] = [[corbhmth]],
		[7] = [[cormmkr]],
		[8] = [[corhmakr]],
		[9] = [[coruwadves]],
		[10] = [[coruwadvms]],
		[11] = [[cortarg]],
		[12] = [[corsd]],
		[13] = [[corech18]],
		[14] = [[corgate]],
		[15] = [[cortron]],
		[16] = [[corfmd]],
		[17] = [[corsilo]],
		[18] = [[core_intimidator]],
		[19] = [[corint]],
		[20] = [[corbuzz]],
		[21] = [[corlab]],
		[22] = [[coralab]],
		[23] = [[corgant]],
		[24] = [[corboucher]],
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
	['1_DEAD'] = {
		blocking = true,
		category = [[corpses]],
		collisionvolumeoffsets = [[0.0 -1.11450195313e-05 -6.82949829102]],
		collisionvolumescales = [[22.0 23.11277771 24.3265991211]],
		collisionvolumetype = [[Box]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CORACK_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

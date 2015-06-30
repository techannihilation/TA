-- UNITDEF -- CORSPEC --
--------------------------------------------------------------------------------

local unitName = "corspec"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.1,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.12,
	buildCostEnergy = 1453,
	buildCostMetal = 70,
	builder = false,
	buildPic = [[corspec.png]],
	buildTime = 5439,
	canAttack = false,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL SMALL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Radar Jammer Kbot]],
	energyMake = 8,
	energyStorage = 0,
	energyUse = 100,
	explodeAs = [[BIG_UNITEX]],
	footprintX = 2,
	footprintZ = 2,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 310,
	maxSlope = 32,
	maxVelocity = 1.3,
	maxWaterDepth = 112,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[KBOT2]],
	name = [[Spectre]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORSPEC]],
	onoffable = true,
	radarDistance = 0,
	radarDistanceJam = 450,
	selfDestructAs = [[BIG_UNIT]],
	side = [[CORE]],
	sightDistance = 250,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 945,
	unitname = [[corspec]],
	upright = true,
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
			[1] = [[kbcormov]],
		},
		select = {
			[1] = [[radjam2]],
		},
	},
}
--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[corpses]],
		collisionvolumeoffsets = [[-0.340003967285 0.0 -2.33979034424]],
		collisionvolumescales = [[23.679977417 24.5 24.0577850342]],
		collisionvolumetype = [[Box]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[CORSPEC_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Heap]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[2X2B]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- ARMSJAM --
--------------------------------------------------------------------------------

local unitName = "armsjam"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.09,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.02,
	buildCostEnergy = 1928,
	buildCostMetal = 131,
	builder = false,
	buildPic = [[ARMSJAM.png]],
	buildTime = 6708,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTVTOL SMALL WEAPON]],
	collisionVolumeScales = [[22 22 64]],
	collisionVolumeOffsets = [[0 -2 0]],
	collisionVolumeType = [[CylZ]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Radar Jammer Ship]],
	energyMake = 18,
	energyStorage = 0,
	energyUse = 18,
	explodeAs = [[SMALL_UNITEX]],
	floater = true,
	footprintX = 4,
	footprintZ = 4,
	iconType = [[sea]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 510,
	maxVelocity = 3.1,
	metalStorage = 0,
	minWaterDepth = 6,
	mobilestandorders = 1,
	movementClass = [[BOAT4]],
	name = [[Escort]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[ARMSJAM]],
	onoffable = true,
	radarDistanceJam = 980,
	seismicSignature = 0,
	selfDestructAs = [[SMALL_UNIT]],
	side = [[ARM]],
	sightDistance = 390,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 540,
	unitname = [[armsjam]],
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
			[1] = [[sharmmov]],
		},
		select = {
			[1] = [[radjam1]],
		},
	},
}
--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = false,
		category = [[corpses]],
		collisionvolumeoffsets = -0.3042,
		collisionvolumescales = [[28.1084594727 19.4736785889 64.0]],
		collisionvolumetype = [[Box]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		footprintX = 4,
		footprintZ = 4,
		height = 40,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ARMSJAM_DEAD]],
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
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[4X4A]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

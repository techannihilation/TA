-- UNITDEF -- CORETER --
--------------------------------------------------------------------------------

local unitName = "coreter"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.0407,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.0198,
	buildCostEnergy = 1757,
	buildCostMetal = 100,
	builder = false,
	buildPic = [[CORETER.png]],
	buildTime = 6404,
	canAttack = false,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL SMALL WEAPON]],
	collisionvolumeoffsets = [[0 -3 0]], 
        collisionvolumescales = [[26.5 26.5 47.5]], 
        collisionvolumetype = "CylZ", 
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Radar Jammer Vehicle]],
	energyMake = 0,
	energyStorage = 0,
	energyUse = 100,
	explodeAs = [[SMALL_UNITEX]],
	footprintX = 3,
	footprintZ = 3,
	idleAutoHeal = 5,
	idleTime = 1800,
	leaveTracks = true,
	maneuverleashlength = 640,
	maxDamage = 520,
	maxSlope = 16,
	maxVelocity = 1.452,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANK3]],
	name = [[Deleter]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORETER]],
	onoffable = true,
	radarDistanceJam = 450,
	seismicSignature = 0,
	selfDestructAs = [[SMALL_UNIT]],
	side = [[CORE]],
	sightDistance = 299,
	standingmoveorder = 1,
	steeringmode = 1,
	trackOffset = 3,
	trackStrength = 6,
	trackStretch = 1,
	trackType = [[StdTank]],
	trackWidth = 27,
	turnRate = 619.3,
	unitname = [[coreter]],
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
			[1] = [[vcormove]],
		},
		select = {
			[1] = [[radjam2]],
		},
	},
}
--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = true,
		category = [[corpses]],
		collisionvolumeoffsets = [[1.41645812988 -2.61718749996e-05 1.27348327637]],
		collisionvolumescales = [[29.8956298828 22.6313476563 49.5100708008]],
		collisionvolumetype = [[Box]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CORETER_DEAD]],
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
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3X3F]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

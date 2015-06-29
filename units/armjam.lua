-- UNITDEF -- ARMJAM --
--------------------------------------------------------------------------------

local unitName = "armjam"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.035,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.012,
	buildCostEnergy = 1621,
	buildCostMetal = 97,
	builder = false,
	buildPic = [[armjam.png]],
	buildTime = 5933,
	canAttack = false,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL SMALL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Radar Jammer Vehicle]],
	designation = [[ARM-MRJ]],
	energyMake = 16,
	energyStorage = 0,
	energyUse = 100,
	explodeAs = [[BIG_UNITEX]],
	footprintX = 3,
	footprintZ = 3,
	idleAutoHeal = 5,
	idleTime = 1800,
	leaveTracks = true,
	maneuverleashlength = 640,
	maxDamage = 460,
	maxSlope = 16,
	maxVelocity = 1.2,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANK3]],
	name = [[Jammer]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMJAM]],
	onoffable = true,
	ovradjust = 1,
	radarDistance = 0,
	radarDistanceJam = 450,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 300,
	standingmoveorder = 1,
	steeringmode = 1,
	trackOffset = 8,
	trackStrength = 10,
	trackStretch = 1,
	trackType = [[StdTank]],
	trackWidth = 22,
	turnRate = 505,
	unitname = [[armjam]],
	unitnumber = 40,
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
			[1] = [[varmmove]],
		},
		select = {
			[1] = [[radjam1]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[corpses]],
		collisionvolumeoffsets = [[-1.99268341064 -6.74999977051 3.60781097412]],
		collisionvolumescales = [[23.7459869385 3.61972045898 31.9999847412]],
		collisionvolumetype = [[Box]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[ARMJAM_DEAD]],
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
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[3X3B]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- CORVRAD --
--------------------------------------------------------------------------------

local unitName = "corvrad"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.03,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.012,
	buildCostEnergy = 1209,
	buildCostMetal = 86,
	builder = false,
	buildPic = [[corvrad.png]],
	buildTime = 4223,
	canAttack = false,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON SMALL]],
	collisionvolumeoffsets = [[0 -9 -2]],
	collisionvolumescales = [[34 34 34]],
	collisionvolumetype = [[ellipsoid]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Radar Vehicle]],
	energyMake = 8,
	energyStorage = 0,
	energyUse = 20,
	explodeAs = [[BIG_UNITEX]],
	footprintX = 3,
	footprintZ = 3,
	leaveTracks = true,
	maneuverleashlength = 640,
	maxDamage = 510,
	maxSlope = 16,
	maxVelocity = 1.25,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANK3]],
	name = [[Informer]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORVRAD]],
	onoffable = true,
	ovradjust = 1,
	radarDistance = 2200,
	script = [[corvrad.lua]],
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 900,
	sonarDistance = 0,
	standingmoveorder = 1,
	steeringmode = 1,
	trackOffset = 0,
	trackStrength = 10,
	trackStretch = 1,
	trackType = [[StdTank]],
	trackWidth = 23,
	turnRate = 210,
	unitname = [[corvrad]],
	unitnumber = 151,
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
			[1] = [[cvradsel]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[corpses]],
		collisionvolumeoffsets = -1.0733,
		collisionvolumescales = [[23.1105194092 8.20951843262 32.5806274414]],
		collisionvolumetype = [[Box]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[CORVRAD_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[2X2F]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

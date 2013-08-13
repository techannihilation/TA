-- UNITDEF -- ARMMARK --
--------------------------------------------------------------------------------

local unitName = "armmark"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.045,
	activateWhenBuilt = true,
	ai_limit = [[limit ARMMARK 0]],
	bmcode = 1,
	brakeRate = 0.018,
	buildCostEnergy = 1152,
	buildCostMetal = 95,
	isbuilder = false,
	buildPic = [[armmark.png]],
	buildTime = 3800,
	canAttack = false,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON SMALL]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Radar Kbot]],
	designation = [[ARM-MRB]],
	downloadable = 1,
	energyMake = 8,
	energyStorage = 0,
	energyUse = 20,
	explodeAs = [[BIG_UNITEX]],
	footprintX = 2,
	footprintZ = 2,
	maneuverleashlength = 640,
	maxDamage = 320,
	maxHeightDif = 16,
	maxVelocity = 1.35,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[KBOT2]],
	name = [[Marky]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMMARK]],
	onoffable = true,
	radarDistance = 2200,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	script = [[armmark.lua]],
	side = [[ARM]],
	sightDistance = 900,
	sonarDistance = 0,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 505,
	unitname = [[armmark]],
	unitnumber = 168,
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
			[1] = [[kbarmmov]],
		},
		select = {
			[1] = [[akradsel]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[corpses]],
		collisionvolumeoffsets = [[-2.9700012207 0.0 2.42810058594]],
		collisionvolumescales = [[23.0599975586 13.375 26.6004943848]],
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
		object = [[ARMMARK_DEAD]],
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
		object = [[2X2A]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

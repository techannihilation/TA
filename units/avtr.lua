-- UNITDEF -- AVTR --
--------------------------------------------------------------------------------

local unitName = "avtr"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.036,
	bmcode = 1,
	brakeRate = 0.05,
	buildCostEnergy = 84140,
	buildCostMetal = 4864,
	builder = false,
	buildPic = [[avtr.png]],
	buildTime = 68231,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL HUGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Mobile LRPC]],
	energyMake = 0.4,
	energyStorage = 0,
	energyUse = 0.4,
	explodeAs = [[ATOMIC_BLAST]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	leaveTracks = true,
	maneuverleashlength = 640,
	maxDamage = 6200,
	maxSlope = 12,
	maxVelocity = 1.2,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[HTANK4]],
	name = [[Avatar]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[AVTR]],
	radarDistance = 0,
	selfDestructAs = [[ATOMIC_BLAST]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 260,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	trackOffset = 22,
	trackStrength = 10,
	trackStretch = 1,
	trackType = [[StdTank]],
	trackWidth = 35,
	turnRate = 176,
	unitname = [[avtr]],
	unitnumber = 999,
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
			[1] = [[tarmmove]],
		},
		select = {
			[1] = [[tarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[SMALL TINY]],
			def = [[ARM_BERTHACANNON2]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARM_BERTHACANNON2 = {
		accuracy = 500,
		aimrate = 2200,
		areaOfEffect = 192,
		ballistic = true,
		collideFriendly = false,
		craterBoost = 0.15,
		craterMult = 0.15,
		energypershot = 5000,
		explosionGenerator = [[custom:FLASHBIGBUILDING]],
		gravityaffected = [[true]],
		holdtime = 1,
		impulseBoost = 0.5,
		impulseFactor = 0.5,
		metalpershot = 10,
		name = [[BerthaCannon]],
		noSelfDamage = true,
		range = 6800,
		reloadtime = 7,
		renderType = 4,
		soundHit = [[xplonuk1]],
		soundStart = [[xplonuk4]],
		startsmoke = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 1000,
		damage = {
			default = 1225,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[core_corpses]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[HEAP]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 8,
		hitdensity = 621,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[AVTR_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 2,
		footprintZ = 2,
		height = 2,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[4x4b]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

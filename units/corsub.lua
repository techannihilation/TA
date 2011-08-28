-- UNITDEF -- CORSUB --
--------------------------------------------------------------------------------

local unitName = "corsub"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.03,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.25,
	buildCostEnergy = 3902,
	buildCostMetal = 679,
	builder = false,
	buildPic = [[CORSUB.png]],
	buildTime = 9729,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTVTOL SUB WEAPON]],
	collisionvolumeoffsets = [[0 0 0]],
	collisionvolumescales = [[30 10 60]],
	collisionvolumetest = 0,
	collisionvolumetype = [[Ell]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Submarine]],
	energyMake = 0.4,
	energyStorage = 0,
	energyUse = 0.4,
	explodeAs = [[SMALL_UNITEX]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	iconType = [[sea]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 835,
	maxVelocity = 2.7,
	metalStorage = 0,
	minWaterDepth = 20,
	mobilestandorders = 1,
	movementClass = [[UBOAT4]],
	name = [[Snake]],
	noAutoFire = false,
	noChaseCategory = [[NOTSUBNOTSHIP]],
	objectName = [[CORSUB]],
	seismicSignature = 0,
	selfDestructAs = [[SMALL_UNIT]],
	side = [[CORE]],
	sightDistance = 364,
	smoothAnim = true,
	sonarDistance = 450,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 246,
	unitname = [[corsub]],
	upright = true,
	waterline = 30,
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
			[1] = [[sucormov]],
		},
		select = {
			[1] = [[sucorsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ARM_TORPEDO]],
			mainDir = [[0 0 1]],
			maxAngleDif = 90,
			onlyTargetCategory = [[NOTHOVERNOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARM_TORPEDO = {
		areaOfEffect = 16,
		avoidFriendly = false,
		burnblow = true,
		collideFriendly = false,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH2]],
		flightTime = 2.3,
		guidance = true,
		impactonly = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		model = [[torpedo]],
		name = [[Torpedo]],
		noSelfDamage = true,
		propeller = 1,
		range = 500,
		reloadtime = 2.5,
		renderType = 1,
		selfprop = true,
		soundHit = [[xplodep1]],
		soundStart = [[torpedo1]],
		startVelocity = 100,
		tolerance = 32767,
		turnRate = 8000,
		turret = false,
		waterWeapon = true,
		weaponAcceleration = 15,
		weaponTimer = 3,
		weaponType = [[TorpedoLauncher]],
		weaponVelocity = 160,
		damage = {
			default = 300,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = false,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		footprintX = 4,
		footprintZ = 4,
		height = 4,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CORSUB_DEAD]],
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
		object = [[4X4B]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

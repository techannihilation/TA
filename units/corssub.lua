-- UNITDEF -- CORSSUB --
--------------------------------------------------------------------------------

local unitName = "corssub"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.028,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.188,
	buildCostEnergy = 11940,
	buildCostMetal = 1757,
	builder = false,
	buildPic = [[CORSSUB.png]],
	buildTime = 23007,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTVTOL SUB WEAPON]],
	collisionvolumeoffsets = [[0 0 0]],
	collisionvolumescales = [[62 21 72]],
	collisionvolumetest = 0,
	collisionvolumetype = [[Ell]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Battle Submarine]],
	energyMake = 15,
	energyStorage = 0,
	energyUse = 15,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	iconType = [[sea]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 2320,
	maxVelocity = 2.59,
	metalStorage = 0,
	minWaterDepth = 20,
	mobilestandorders = 1,
	movementClass = [[UBOAT4]],
	name = [[Leviathan]],
	noAutoFire = false,
	noChaseCategory = [[NOTSUBNOTSHIP]],
	objectName = [[CORSSUB]],
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[CORE]],
	sightDistance = 520,
	smoothAnim = true,
	sonarDistance = 550,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 395,
	unitname = [[corssub]],
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
			def = [[CORSSUB_WEAPON]],
			mainDir = [[0 0 1]],
			maxAngleDif = 75,
			onlyTargetCategory = [[NOTHOVERNOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORSSUB_WEAPON = {
		areaOfEffect = 16,
		avoidFriendly = false,
		burnblow = true,
		collideFriendly = false,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH3]],
		guidance = true,
		impactonly = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		model = [[advtorpedo]],
		name = [[advTorpedo]],
		noSelfDamage = true,
		propeller = 1,
		range = 690,
		reloadtime = 1.5,
		renderType = 1,
		selfprop = true,
		soundHit = [[xplodep1]],
		soundStart = [[torpedo1]],
		startVelocity = 150,
		tolerance = 32767,
		tracks = true,
		turnRate = 1500,
		turret = true,
		waterWeapon = true,
		weaponAcceleration = 25,
		weaponTimer = 4,
		weaponType = [[TorpedoLauncher]],
		weaponVelocity = 220,
		damage = {
			default = 650,
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
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CORSSUB_DEAD]],
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

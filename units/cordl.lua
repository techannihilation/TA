-- UNITDEF -- CORDL --
--------------------------------------------------------------------------------

local unitName = "cordl"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = true,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 16384,
	buildCostEnergy = 2340,
	buildCostMetal = 280,
	builder = false,
	buildPic = [[CORDL.png]],
	buildTime = 4280,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[DEAD]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Depthcharge Launcher]],
	energyMake = 0.1,
	energyStorage = 0,
	energyUse = 0.1,
	explodeAs = [[SMALL_UNITEX]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 1075,
	maxSlope = 15,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Jellyfish]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CORDL]],
	seismicSignature = 0,
	selfDestructAs = [[SMALL_UNIT]],
	side = [[CORE]],
	sightDistance = 611,
	smoothAnim = true,
	sonarDistance = 525,
	standingfireorder = 2,
	turnRate = 0,
	unitname = [[cordl]],
	workerTime = 0,
	yardMap = [[oooo]],
	featureDefs = nil,
	sounds = {
		canceldestruct = [[cancel2]],
		cloak = [[kloak1]],
		uncloak = [[kloak1un]],
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
			[1] = [[servmed2]],
		},
		select = {
			[1] = [[servmed2]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[COAX_DEPTHCHARGE]],
			onlyTargetCategory = [[NOTHOVERNOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	COAX_DEPTHCHARGE = {
		avoidFriendly = false,
		bouncerebound = 0.6,
		bounceslip = 0.6,
		burnblow = true,
		collideFriendly = false,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH2]],
		groundbounce = true,
		guidance = true,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		model = [[depthcharge]],
		name = [[DepthCharge]],
		noSelfDamage = true,
		numbounce = 1,
		propeller = 1,
		range = 580,
		reloadtime = 1.8,
		renderType = 1,
		selfprop = true,
		soundHit = [[xplodep2]],
		soundStart = [[torpedo1]],
		startVelocity = 250,
		tracks = true,
		turnRate = 18000,
		turret = true,
		waterWeapon = true,
		weaponAcceleration = 25,
		weaponTimer = 6,
		weaponType = [[TorpedoLauncher]],
		weaponVelocity = 350,
		damage = {
			commanders = 500,
			default = 200,
			subs = 400,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = true,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 3,
		footprintZ = 3,
		height = 30,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CORDL_DEAD]],
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

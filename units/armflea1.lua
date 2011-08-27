-- UNITDEF -- ARMFLEA1 --
--------------------------------------------------------------------------------

local unitName = "armflea1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.5,
	bmcode = 1,
	brakeRate = 0.5,
	buildCostEnergy = 322,
	buildCostMetal = 14,
	builder = false,
	buildPic = [[ARMFLEA.png]],
	buildTime = 789,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL TINY WEAPON]],
	corpse = [[ARMFLEA_DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Fast Scout Kbot]],
	energyMake = 0.4,
	energyStorage = 0,
	energyUse = 0.4,
	explodeAs = [[FLEA_EX]],
	firestandorders = 1,
	footprintX = 1,
	footprintZ = 1,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	mass = 1000,
	maxDamage = 50,
	maxSlope = 255,
	maxVelocity = 4.4,
	maxWaterDepth = 16,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[KBOT1]],
	name = [[Pulcina]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMFLEA1]],
	seismicSignature = 0,
	selfDestructAs = [[FLEA_EX]],
	side = [[ARM]],
	sightDistance = 550,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	turnRate = 1672,
	unitname = [[armflea1]],
	unitRestricted = 150,
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
			[1] = [[servtny2]],
		},
		select = {
			[1] = [[servtny2]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[FLEA_LASER]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	FLEA_LASER = {
		areaOfEffect = 8,
		beamlaser = 1,
		beamTime = 0.1,
		burstrate = 0.2,
		coreThickness = 0.1,
		craterBoost = 0,
		craterMult = 0,
		energypershot = 2,
		explosionGenerator = [[custom:SMALL_YELLOW_BURN]],
		fireStarter = 50,
		impactonly = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		laserFlareSize = 2,
		lineOfSight = true,
		name = [[Laser]],
		noSelfDamage = true,
		range = 140,
		reloadtime = 0.6,
		renderType = 0,
		rgbColor = [[1 1 0]],
		soundHit = [[lasrhit2]],
		soundStart = [[lasrfir1]],
		soundTrigger = true,
		targetMoveError = 0.1,
		thickness = 0.75,
		tolerance = 10000,
		turret = true,
		weaponType = [[BeamLaser]],
		weaponVelocity = 600,
		damage = {
			default = 24,
			raider_resistant = 12,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	ARMFLEA_DEAD = {
		blocking = false,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Flea Wreckage]],
		energy = 0,
		featureDead = [[ARMFLEA_HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 1,
		footprintZ = 1,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ARMFLEA_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	ARMFLEA_HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Flea Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 1,
		footprintZ = 1,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[1X1A]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

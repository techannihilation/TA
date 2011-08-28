-- UNITDEF -- ARMFAV --
--------------------------------------------------------------------------------

local unitName = "armfav"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.12,
	bmcode = 1,
	brakeRate = 0.165,
	buildCostEnergy = 342,
	buildCostMetal = 29,
	builder = false,
	buildPic = [[ARMFAV.png]],
	buildTime = 912,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL TINY WEAPON]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Light Scout Vehicle]],
	energyMake = 0.2,
	energyStorage = 0,
	energyUse = 0.2,
	explodeAs = [[SMALL_UNITEX]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	idleAutoHeal = 5,
	idleTime = 1800,
	leaveTracks = true,
	maneuverleashlength = 640,
	maxDamage = 80,
	maxSlope = 26,
	maxVelocity = 6.4,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANK2]],
	name = [[Jeffy]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMFAV]],
	seismicSignature = 0,
	selfDestructAs = [[SMALL_UNIT]],
	side = [[ARM]],
	sightDistance = 585,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	trackOffset = -3,
	trackStrength = 3,
	trackStretch = 1,
	trackType = [[StdTank]],
	trackWidth = 25,
	turnRate = 1144,
	unitname = [[armfav]],
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
			[1] = [[varmmove]],
		},
		select = {
			[1] = [[varmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ARM_LASER]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARM_LASER = {
		areaOfEffect = 8,
		beamlaser = 1,
		beamTime = 0.18,
		burstrate = 0.2,
		coreThickness = 0.3,
		craterBoost = 0,
		craterMult = 0,
		duration = 0.02,
		energypershot = 2,
		explosionGenerator = [[custom:SMALL_YELLOW_BURN]],
		fireStarter = 50,
		hardstop = true,
		impactonly = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		laserFlareSize = 5,
		lineOfSight = true,
		name = [[Laser]],
		noSelfDamage = true,
		range = 180,
		reloadtime = 0.95,
		renderType = 0,
		rgbColor = [[1 1 0.4]],
		soundHit = [[lasrhit2]],
		soundStart = [[lasrfir1]],
		soundTrigger = true,
		targetMoveError = 0.2,
		thickness = 0.75,
		tolerance = 10000,
		turret = true,
		weaponType = [[BeamLaser]],
		weaponVelocity = 800,
		damage = {
			default = 35,
			raider_resistant = 17.5,
			subs = 5,
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
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ARMFAV_DEAD]],
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
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
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

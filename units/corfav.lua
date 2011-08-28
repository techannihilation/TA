-- UNITDEF -- CORFAV --
--------------------------------------------------------------------------------

local unitName = "corfav"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.11,
	bmcode = 1,
	brakeRate = 0.145,
	buildCostEnergy = 256,
	buildCostMetal = 24,
	builder = false,
	buildPic = [[CORFAV.png]],
	buildTime = 1104,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL TINY WEAPON]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Light Scout Vehicle]],
	energyMake = 0.3,
	energyStorage = 0,
	energyUse = 0.3,
	explodeAs = [[SMALL_UNITEX]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	idleAutoHeal = 5,
	idleTime = 1800,
	leaveTracks = true,
	maneuverleashlength = 640,
	maxDamage = 95,
	maxSlope = 26,
	maxVelocity = 4.89,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANK2]],
	name = [[Weasel]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORFAV]],
	seismicSignature = 0,
	selfDestructAs = [[SMALL_UNIT]],
	side = [[CORE]],
	sightDistance = 535,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	trackOffset = -3,
	trackStrength = 3,
	trackStretch = 1,
	trackType = [[StdTank]],
	trackWidth = 27,
	turnRate = 1097,
	unitname = [[corfav]],
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
			[1] = [[vcormove]],
		},
		select = {
			[1] = [[vcorsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[CORE_LASER]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORE_LASER = {
		areaOfEffect = 8,
		beamlaser = 1,
		beamTime = 0.18,
		burstrate = 0.2,
		coreThickness = 0.1,
		craterBoost = 0,
		craterMult = 0,
		duration = 0.02,
		energypershot = 5,
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
		reloadtime = 1,
		renderType = 0,
		rgbColor = [[1 1 0]],
		soundHit = [[lasrhit2]],
		soundStart = [[lasrfir1]],
		soundTrigger = true,
		targetMoveError = 0.2,
		thickness = 1,
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
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CORFAV_DEAD]],
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
		object = [[2X2B]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

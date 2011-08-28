-- UNITDEF -- CORGATOR --
--------------------------------------------------------------------------------

local unitName = "corgator"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.055,
	bmcode = 1,
	brakeRate = 0.055,
	buildCostEnergy = 1042,
	buildCostMetal = 118,
	builder = false,
	buildPic = [[CORGATOR.png]],
	buildTime = 1761,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL SMALL WEAPON]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Light Tank]],
	energyMake = 0.5,
	energyStorage = 0,
	energyUse = 0.5,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	idleAutoHeal = 5,
	idleTime = 1800,
	leaveTracks = true,
	maneuverleashlength = 640,
	maxDamage = 693,
	maxSlope = 10,
	maxVelocity = 3,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANK2]],
	name = [[Instigator]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORGATOR]],
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[CORE]],
	sightDistance = 273,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	trackOffset = 5,
	trackStrength = 5,
	trackStretch = 1,
	trackType = [[StdTank]],
	trackWidth = 21,
	turnRate = 484,
	unitname = [[corgator]],
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
			[1] = [[tcormove]],
		},
		select = {
			[1] = [[tcorsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[GATOR_LASERX]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	GATOR_LASERX = {
		areaOfEffect = 8,
		beamlaser = 1,
		beamTime = 0.1,
		coreThickness = 0.175,
		craterBoost = 0,
		craterMult = 0,
		energypershot = 0,
		explosionGenerator = [[custom:SMALL_RED_BURN]],
		fireStarter = 50,
		impactonly = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		laserFlareSize = 6,
		lineOfSight = true,
		name = [[Laser]],
		noSelfDamage = true,
		range = 230,
		reloadtime = 0.77,
		renderType = 0,
		rgbColor = [[1 0 0]],
		soundHit = [[lasrhit2]],
		soundStart = [[lasrlit3]],
		soundTrigger = true,
		targetMoveError = 0.15,
		thickness = 2.5,
		tolerance = 10000,
		turret = true,
		weaponType = [[BeamLaser]],
		weaponVelocity = 1000,
		damage = {
			default = 75,
			raider_resistant = 37.5,
			subs = 5,
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
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CORGATOR_DEAD]],
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

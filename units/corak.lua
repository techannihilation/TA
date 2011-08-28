-- UNITDEF -- CORAK --
--------------------------------------------------------------------------------

local unitName = "corak"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.384,
	bmcode = 1,
	brakeRate = 0.25,
	buildCostEnergy = 826,
	buildCostMetal = 34,
	builder = false,
	buildPic = [[CORAK.png]],
	buildTime = 1279,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL TINY WEAPON]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Infantry Kbot]],
	energyMake = 0.3,
	energyStorage = 0,
	energyUse = 0.3,
	explodeAs = [[SMALL_UNITEX]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 260,
	maxSlope = 17,
	maxVelocity = 2.8,
	maxWaterDepth = 25,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[KBOT2]],
	name = [[A.K.]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORAK]],
	seismicSignature = 0,
	selfDestructAs = [[SMALL_UNIT]],
	side = [[CORE]],
	sightDistance = 500,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	turnRate = 1210,
	unitname = [[corak]],
	unitRestricted = 125,
	upright = true,
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
			[1] = [[servtny1]],
		},
		select = {
			[1] = [[servtny1]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[GATOR_LASER]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	GATOR_LASER = {
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
		range = 240,
		reloadtime = 0.5,
		renderType = 0,
		rgbColor = [[1 0 0]],
		soundHit = [[lasrhit2]],
		soundStart = [[lasrlit3]],
		soundTrigger = true,
		targetMoveError = 0.15,
		thickness = 2,
		tolerance = 10000,
		turret = true,
		weaponType = [[BeamLaser]],
		weaponVelocity = 1000,
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
		object = [[CORAK_DEAD]],
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
		object = [[2X2C]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

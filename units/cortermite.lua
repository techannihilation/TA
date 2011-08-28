-- UNITDEF -- CORTERMITE --
--------------------------------------------------------------------------------

local unitName = "cortermite"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.171,
	bmcode = 1,
	brakeRate = 0.175,
	buildCostEnergy = 12605,
	buildCostMetal = 805,
	builder = false,
	buildPic = [[CORTERMITE.png]],
	buildTime = 18834,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[All-terrain Assault Vehicle]],
	energyMake = 0.7,
	energyStorage = 0,
	energyUse = 0.7,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 2800,
	maxSlope = 50,
	maxVelocity = 1.61,
	maxWaterDepth = 30,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TKBOT3]],
	name = [[Termite]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORTERMITE]],
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[CORE]],
	sightDistance = 380,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 1056,
	unitname = [[cortermite]],
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
			[1] = [[spider2]],
		},
		select = {
			[1] = [[spider]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[CORE_TERMITE_LASER]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORE_TERMITE_LASER = {
		areaOfEffect = 42,
		beamlaser = 1,
		beamTime = 0.55,
		coreThickness = 0.3,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:IGNITE]],
		fireStarter = 90,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		laserFlareSize = 12,
		lineOfSight = true,
		name = [[HeatRay]],
		noSelfDamage = true,
		range = 340,
		reloadtime = 1.65,
		renderType = 0,
		rgbColor = [[1 0.8 0]],
		rgbColor2 = [[0.8 0 0]],
		soundStart = [[heatray1]],
		targetMoveError = 0.1,
		thickness = 2,
		tolerance = 10000,
		turret = true,
		weaponType = [[BeamLaser]],
		weaponVelocity = 700,
		damage = {
			default = 532,
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
		footprintX = 3,
		footprintZ = 3,
		height = 10,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CORTERMITE_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[all]],
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
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3X3A]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- CORSUMO --
--------------------------------------------------------------------------------

local unitName = "corsumo"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.048,
	bmcode = 1,
	brakeRate = 0.125,
	buildCostEnergy = 33562,
	buildCostMetal = 2020,
	builder = false,
	buildPic = [[CORSUMO.png]],
	buildTime = 50975,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Heavily Armored Assault Kbot]],
	energyMake = 17.5,
	energyStorage = 100,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 14000,
	maxSlope = 15,
	maxVelocity = 0.75,
	maxWaterDepth = 23,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[HKBOT4]],
	name = [[Sumo]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORSUMO]],
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[CORE]],
	sightDistance = 510,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	turnRate = 320,
	unitname = [[corsumo]],
	upright = false,
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
			[1] = [[kbcormov]],
		},
		select = {
			[1] = [[kbcorsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[CORSUMO_WEAPON]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORSUMO_WEAPON = {
		areaOfEffect = 12,
		beamlaser = 1,
		beamTime = 0.15,
		coreThickness = 0.3,
		craterBoost = 0,
		craterMult = 0,
		energypershot = 75,
		explosionGenerator = [[custom:LARGE_GREEN_LASER_BURN]],
		fireStarter = 90,
		impactonly = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		laserFlareSize = 10,
		lineOfSight = true,
		name = [[HighEnergyLaser]],
		noSelfDamage = true,
		range = 650,
		reloadtime = 0.55,
		renderType = 0,
		rgbColor = [[0 1 0]],
		soundHit = [[lasrhit1]],
		soundStart = [[lasrhvy3]],
		targetMoveError = 0.25,
		thickness = 3,
		tolerance = 10000,
		turret = true,
		weaponType = [[BeamLaser]],
		weaponVelocity = 800,
		damage = {
			default = 275,
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
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CORSUMO_DEAD]],
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
		object = [[3X3A]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- CBRUTUS --
--------------------------------------------------------------------------------

local unitName = "cbrutus"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.019,
	bmcode = 1,
	brakeRate = 0.018,
	buildCostEnergy = 10960,
	buildCostMetal = 570,
	builder = false,
	buildTime = 18456,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Rocket Battle Tank]],
	designation = [[CORE_Brutus]],
	energyMake = 12,
	energyStorage = 0,
	energyUse = 5,
	explodeAs = [[BIG_UNIT]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Char de combat lourd]],
	frenchname = [[M1735 Brutus]],
	germandescription = [[Schwerer Kampfpanzer]],
	germanname = [[M1735 Brutus]],
	maneuverleashlength = 640,
	maxDamage = 1950,
	maxSlope = 15,
	maxVelocity = 1.4,
	maxWaterDepth = 30,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANK3]],
	name = [[Brutus]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CBRUTUS]],
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 600,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 343,
	unitname = [[cbrutus]],
	unitnumber = 8887656747,
	version = 1,
	workerTime = 0,
	zbuffer = 1,
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
			def = [[CORVIPE_LASER]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORVIPE_LASER = {
		areaOfEffect = 32,
		burnblow = true,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH2]],
		fireStarter = 80,
		flightTime = 1.2,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		model = [[shipmissile]],
		name = [[HeavyRockets]],
		noSelfDamage = true,
		range = 650,
		reloadtime = 1.6,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHit = [[xplosml2]],
		soundStart = [[rockhvy3]],
		startVelocity = 550,
		targetMoveError = 0.2,
		tolerance = 8000,
		tracks = true,
		turnRate = 2500,
		turret = true,
		weaponTimer = 1.2,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 550,
		damage = {
			commanders = 380,
			default = 250,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[core_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CBRUTUS_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3x3b]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

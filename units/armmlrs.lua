-- UNITDEF -- ARMMLRS --
--------------------------------------------------------------------------------

local unitName = "armmlrs"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.34,
	bmcode = 1,
	brakeRate = 0.009765625,
	buildCostEnergy = 89460,
	buildCostMetal = 6240,
	builder = false,
	buildTime = 53231,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL HUGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	defaultmissiontype = [[Standby]],
	description = [[Multi Launch Rocket System]],
	designation = [[MLRS]],
	downloadable = 1,
	energyMake = 5.5,
	energyStorage = 0,
	energyUse = 4.5,
	explodeAs = [[ATOMIC_BLAST]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	frenchdescription = [[Système lance-roquettes multiple]],
	frenchname = [[M270 MLRS.]],
	germandescription = [[Mehrfach Raketenwerfer]],
	germanname = [[M270 MLRS.]],
	maneuverleashlength = 640,
	mass = 200000,
	maxDamage = 4512,
	maxSlope = 10,
	maxVelocity = 1.06,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[htank4]],
	name = [[M270 MLRS]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMMLRS]],
	radarDistance = 0,
	selfDestructAs = [[ATOMIC_BLAST]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 2100,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 250,
	unitname = [[armmlrs]],
	unitnumber = 1876,
	version = 1,
	workerTime = 0,
	zbuffer = 1,
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
			[1] = [[tarmmove]],
		},
		select = {
			[1] = [[tarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[SMALL TINY]],
			def = [[227mm_rockets3]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	['227mm_rockets3'] = {
		areaOfEffect = 326,
		burnblow = true,
		burst = 2,
		burstrate = 0.5,
		cruisealt = 120,
		explosionart = [[explode3]],
		explosiongaf = [[fx]],
		fireStarter = 80,
		flightTime = 15,
		guidance = true,
		lavaexplosionart = [[lavasplash]],
		lavaexplosiongaf = [[fx]],
		lineOfSight = true,
		metalpershot = 0,
		model = [[227mmrock]],
		name = [[227mm rockets3]],
		proximityPriority = -1,
		range = 2000,
		reloadtime = 30,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.02,
		smokeTrail = true,
		soundHit = [[mlrsboom]],
		soundStart = [[mlrsfireshort]],
		soundTrigger = true,
		sprayAngle = 1024,
		startsmoke = 1,
		startVelocity = 150,
		tolerance = 1000,
		tracks = false,
		trajectoryHeight = 2,
		turnRate = 5000,
		turret = true,
		waterexplosionart = [[h2o]],
		waterexplosiongaf = [[fx]],
		weaponAcceleration = 120,
		weaponTimer = 15,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 900,
		damage = {
			default = 3000,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

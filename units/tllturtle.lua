-- UNITDEF -- TLLTURTLE --
--------------------------------------------------------------------------------

local unitName = "tllturtle"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.015,
	amphibious = 1,
	antiweapons = 1,
	bmcode = 1,
	brakeRate = 0.027,
	buildCostEnergy = 44500,
	buildCostMetal = 2185,
	builder = false,
	buildTime = 68025,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	cantBeTransported = true,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	damageModifier = 0.5,
	defaultmissiontype = [[Standby]],
	description = [[Mobile Anti-Missile Defense]],
	designation = [[TLL-AMD1]],
	downloadable = 1,
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[ATOMIC_BLAST]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Défense mobile antimissile]],
	frenchname = [[Tortue]],
	germandescription = [[Mobile Raketenabwehr]],
	italiandescription = [[Difesa mobile missilistica]],
	maneuverleashlength = 640,
	maxDamage = 3795,
	maxSlope = 10,
	maxVelocity = 0.32,
	maxWaterDepth = 200,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[kbot3]],
	name = [[Turtle]],
	noAutoFire = true,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[tllturtle]],
	ovradjust = 1,
	radarDistance = 0,
	selfDestructAs = [[CRAWL_BLASTSML]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 155,
	smoothAnim = true,
	spanishdescription = [[Defensa de Misiles Móvil]],
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 430,
	unitname = [[tllturtle]],
	unitnumber = 31903,
	version = 3.1,
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
			[1] = [[kbarmmov]],
		},
		select = {
			[1] = [[kbarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ARMSCAB_WEAPON]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMSCAB_WEAPON = {
		areaOfEffect = 420,
		avoidFriendly = false,
		collideFriendly = false,
		coverage = 2000,
		craterBoost = 0,
		craterMult = 0,
		energypershot = 7500,
		explosionGenerator = [[custom:FLASH4]],
		fireStarter = 100,
		flightTime = 120,
		guidance = true,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		interceptor = 1,
		lineOfSight = true,
		metalpershot = 150,
		model = [[amdrocket]],
		name = [[Rocket]],
		noautorange = 1,
		noSelfDamage = true,
		range = 72000,
		reloadtime = 2,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHit = [[xplomed4]],
		soundStart = [[Rockhvy1]],
		startsmoke = 1,
		stockpile = true,
		stockpiletime = 90,
		tolerance = 4000,
		tracks = true,
		turnRate = 99000,
		twoPhase = true,
		vlaunch = true,
		weaponAcceleration = 75,
		weaponTimer = 5,
		weaponType = [[StarburstLauncher]],
		weaponVelocity = 3000,
		damage = {
			default = 500,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[tll_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 120,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllturtle_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 80,
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

-- UNITDEF -- CORJEAG --
--------------------------------------------------------------------------------

local unitName = "corjeag"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.028,
	bmcode = 1,
	brakeRate = 0.012,
	buildCostEnergy = 2150,
	buildCostMetal = 122,
	builder = false,
	buildTime = 5145,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL SMALL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Anti-Air Vehicle]],
	designation = [[COR-AAAV]],
	energyMake = 0.6,
	energyStorage = 10,
	energyUse = 0.6,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Advanced Anti-Air Vehicle]],
	frenchname = [[Jeager]],
	germandescription = [[Advanced Anti-Air Vehicle]],
	germanname = [[Jeager]],
	italiandescription = [[Advanced Anti-Air Vehicle]],
	italianname = [[Jeager]],
	maneuverleashlength = 640,
	maxDamage = 1412,
	maxSlope = 16,
	maxVelocity = 2.22,
	maxWaterDepth = 12,
	metalStorage = 5,
	mobilestandorders = 1,
	movementClass = [[TANK3]],
	name = [[Jeager]],
	noAutoFire = false,
	noChaseCategory = [[ALL SUB]],
	objectName = [[CORJEAG]],
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 810,
	spanishdescription = [[Advanced Anti-Air Vehicle]],
	spanishname = [[Jeager]],
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 536,
	unitname = [[corjeag]],
	unitnumber = 707,
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
			[1] = [[vcormove]],
		},
		select = {
			[1] = [[vcorsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[CORJEAG_MISSILE]],
			onlyTargetCategory = [[VTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORJEAG_MISSILE = {
		areaOfEffect = 64,
		canattackground = false,
		craterBoost = 0,
		craterMult = 0,
		explosionart = [[explode3]],
		explosiongaf = [[fx]],
		fireStarter = 60,
		guidance = true,
		id = 248,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lavaexplosionart = [[lavasplash]],
		lavaexplosiongaf = [[fx]],
		lineOfSight = true,
		metalpershot = 0,
		model = [[corjeag_missile]],
		name = [[Jeager-Missile]],
		noSelfDamage = true,
		range = 950,
		reloadtime = 0.9,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHit = [[xplomed2]],
		soundStart = [[JeagerAAMissiles]],
		startsmoke = 1,
		startVelocity = 820,
		toAirWeapon = true,
		tolerance = 7000,
		tracks = true,
		turnRate = 68000,
		turret = true,
		waterexplosionart = [[h2o]],
		waterexplosiongaf = [[fx]],
		weaponAcceleration = 360,
		weaponTimer = 5,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 1220,
		damage = {
			bombers = 120,
			default = 5,
			fighters = 120,
			flak_resistant = 120,
			unclassed_air = 120,
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
		featurereclamate = [[smudge01]],
		footprintX = 2,
		footprintZ = 2,
		height = 40,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[corjeag_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

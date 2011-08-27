-- UNITDEF -- TAWF014 --
--------------------------------------------------------------------------------

local unitName = "tawf014"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.017,
	bmcode = 1,
	brakeRate = 0.015,
	buildCostEnergy = 24945,
	buildCostMetal = 1167,
	builder = false,
	buildTime = 25956,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Very Heavy Missile Tank]],
	designation = [[TAWF-26]],
	energyMake = 1,
	energyStorage = 20,
	energyUse = 1,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Very Heavy Missile Tank]],
	frenchname = [[Terroriser]],
	germandescription = [[Very Heavy Missile Tank]],
	germanname = [[Terroriser]],
	maneuverleashlength = 640,
	maxDamage = 3050,
	maxSlope = 18,
	maxVelocity = 1.6,
	maxWaterDepth = 19,
	metalStorage = 3,
	mobilestandorders = 1,
	movementClass = [[HTANK3]],
	name = [[Terroriser]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[TAWF014]],
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 300,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 450,
	unitname = [[tawf014]],
	unitnumber = 66,
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
			[1] = [[varmmove]],
		},
		select = {
			[1] = [[varmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[SMALL TINY]],
			def = [[TAWF014_weapon]],
			mainDir = [[0 0 1]],
			maxAngleDif = 270,
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	TAWF014_weapon = {
		areaOfEffect = 97,
		craterBoost = 0,
		craterMult = 0,
		energypershot = 0,
		explosionart = [[smallboom]],
		explosiongaf = [[towers]],
		fireStarter = 20,
		guidance = true,
		id = 228,
		impulseBoost = 0,
		impulseFactor = 0,
		lavaexplosionart = [[lavasplashlg]],
		lavaexplosiongaf = [[fx]],
		lineOfSight = true,
		metalpershot = 0,
		model = [[TAWF114a]],
		name = [[Banisher]],
		range = 840,
		reloadtime = 7.5,
		renderType = 1,
		selfprop = true,
		shakeduration = 1,
		shakemagnitude = 10,
		smokedelay = 0.0091,
		smokeTrail = true,
		soundHit = [[TAWF114b]],
		soundStart = [[TAWF114a]],
		startsmoke = 1,
		startVelocity = 250,
		tolerance = 9000,
		tracks = true,
		trajectoryHeight = 1.45,
		turnRate = 33000,
		turret = true,
		waterexplosionart = [[h2oboom2]],
		waterexplosiongaf = [[fx]],
		weaponAcceleration = 70,
		weaponTimer = 5,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 310,
		damage = {
			default = 1250,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[arm_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 29,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[TAWF014_dead]],
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
		object = [[3x3a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

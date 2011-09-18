-- UNITDEF -- TLLWHALE --
--------------------------------------------------------------------------------

local unitName = "tllwhale"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.02,
	bmcode = 1,
	brakeRate = 0.01,
	buildCostEnergy = 24574,
	buildCostMetal = 4350,
	builder = false,
	buildTime = 37565,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	cantBeTransported = true,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTVTOL SUB WEAPON]],
	cloakCost = 100,
	cloakCostMoving = 180,
	collisionvolumeoffsets = [[0 -20 0]],
	collisionvolumescales = [[57 37 107]],
	collisionvolumetest = 0,
	collisionvolumetype = [[Ell]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Missile Sub]],
	designation = [[]],
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	floater = true,
	footprintX = 6,
	footprintZ = 6,
	initCloaked = true,
	maneuverleashlength = 640,
	maxDamage = 3150,
	maxVelocity = 0.85,
	minicloakdistance = 130,
	minWaterDepth = 35,
	mobilestandorders = 1,
	movementClass = [[UBOAT4]],
	name = [[Whale]],
	noAutoFire = false,
	noChaseCategory = [[NOTSUBNOTSHIP]],
	objectName = [[TLLWHALE]],
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 290,
	sonarDistance = 720,
	sonarDistanceJam = 100,
	standingfireorder = 0,
	standingmoveorder = 1,
	stealth = true,
	steeringmode = 1,
	threed = 1,
	turnRate = 75,
	unitname = [[tllwhale]],
	unitnumber = 9201,
	version = 3.1,
	waterline = 30,
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
			[1] = [[sucormov]],
		},
		select = {
			[1] = [[sucorsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[WHALE_VPULSE]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	WHALE_VPULSE = {
		areaOfEffect = 126,
		explosionart = [[lrptexplo]],
		explosiongaf = [[lrptexplo]],
		fireStarter = 100,
		flightTime = 10,
		guidance = true,
		id = 243,
		lavaexplosionart = [[lavasplashlg]],
		lavaexplosiongaf = [[fx]],
		lineOfSight = true,
		metalpershot = 0,
		model = [[vpulse]],
		name = [[Vpulse2]],
		noautorange = 1,
		range = 1300,
		reloadtime = 12,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.5,
		smokeTrail = true,
		soundHit = [[vpulsehit]],
		soundStart = [[vpulsefire]],
		startsmoke = 1,
		tolerance = 4000,
		turnRate = 24384,
		twoPhase = true,
		vlaunch = true,
		waterexplosionart = [[h2oboom2]],
		waterexplosiongaf = [[fx]],
		weaponAcceleration = 40,
		weaponTimer = 5,
		weaponType = [[StarburstLauncher]],
		weaponVelocity = 400,
		damage = {
			default = 550,
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
		footprintX = 6,
		footprintZ = 6,
		height = 10,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllwhale_dead]],
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
		footprintX = 6,
		footprintZ = 6,
		height = 4,
		hitdensity = 20,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3x3e]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

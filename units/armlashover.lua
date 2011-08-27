-- UNITDEF -- ARMLASHOVER --
--------------------------------------------------------------------------------

local unitName = "armlashover"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.15,
	ai_limit = [[limit ARMLASHOVER 8]],
	ai_weight = [[weight ARMLASHOVER 2]],
	bmcode = 1,
	brakeRate = 0.08,
	buildCostEnergy = 3550,
	buildCostMetal = 330,
	builder = false,
	buildTime = 7250,
	canAttack = true,
	canGuard = true,
	canHover = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL HOVER MEDIUM MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Lightning Hovercraft]],
	designation = [[ARM-LASHOVER]],
	downloadable = 1,
	energyMake = 10,
	energyStorage = 0,
	energyUse = 10,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Hovercraft foudroyant]],
	frenchname = [[Python]],
	germandescription = [[Blitz Hovercraft]],
	germanname = [[Python]],
	italiandescription = [[Lightning Hovercraft]],
	italianname = [[Python]],
	maneuverleashlength = 640,
	maxDamage = 1000,
	maxSlope = 16,
	maxVelocity = 3.2,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANKHOVER3]],
	name = [[Python]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[ARMLASHOVER]],
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 270,
	spanishdescription = [[Lightning Hovercraft]],
	spanishname = [[Python]],
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 520,
	unitname = [[armlashover]],
	unitnumber = 8812,
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
			[1] = [[hovmdok1]],
		},
		select = {
			[1] = [[hovmdsl1]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[armlatnk_weapon]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	armlatnk_weapon = {
		areaOfEffect = 8,
		beamWeapon = true,
		color = 128,
		color2 = 130,
		craterBoost = 0,
		craterMult = 0,
		duration = 10,
		energypershot = 5,
		explosionGenerator = [[custom:LIGHTNING_FLASH]],
		fireStarter = 50,
		impactonly = 1,
		impulseBoost = 0.234,
		impulseFactor = 0.234,
		lineOfSight = true,
		name = [[LightningGun]],
		noSelfDamage = true,
		range = 320,
		reloadtime = 1.4,
		renderType = 7,
		soundHit = [[lashit]],
		soundStart = [[lghthvy1]],
		soundTrigger = true,
		startsmoke = 1,
		turret = true,
		weaponType = [[LightningCannon]],
		weaponVelocity = 400,
		damage = {
			default = 227,
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
		description = [[phyton Wreckage]],
		featureDead = [[heap]],
		featurereclaimate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 60,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ARMLASHOVER_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[python Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		hitdensity = 5,
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

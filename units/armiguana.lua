-- UNITDEF -- ARMIGUANA --
--------------------------------------------------------------------------------

local unitName = "armiguana"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.04,
	bmcode = 1,
	brakeRate = 0.1,
	buildCostEnergy = 14007,
	buildCostMetal = 1500,
	builder = false,
	buildTime = 25575,
	canAttack = true,
	canGuard = true,
	canHover = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL HOVER LARGE MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[corsent_dead]],
	defaultmissiontype = [[Standby]],
	description = [[Heavy Flak Hovercraft]],
	designation = [[AAAH-4]],
	downloadable = 1,
	energyMake = 0.3,
	energyStorage = 100,
	energyUse = 0.8,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Hovercraft antiaérien]],
	frenchname = [[Iguana]],
	germandescription = [[Flak-Hovercraft]],
	germanname = [[Iguana]],
	italiandescription = [[Veicolo d'artiglieria mobile]],
	italianname = [[Iguana]],
	maneuverleashlength = 30,
	maxDamage = 4500,
	maxSlope = 12,
	maxVelocity = 1.61,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANKHOVER3]],
	name = [[Iguana]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[ARMIGUANA]],
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 260,
	spanishdescription = [[Vehículo Móvil Antiaéreo]],
	spanishname = [[Iguana]],
	standingfireorder = 2,
	standingmoveorder = 0,
	steeringmode = 2,
	threed = 1,
	turnRate = 489,
	unitname = [[armiguana]],
	unitnumber = 176,
	upright = true,
	version = 1.2,
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
			def = [[ARMFLAK_GUN]],
			onlyTargetCategory = [[VTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMFLAK_GUN = {
		accuracy = 1000,
		areaOfEffect = 192,
		ballistic = true,
		burnblow = true,
		canattackground = false,
		color = 1,
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.85,
		explosionGenerator = [[custom:FLASH3]],
		gravityaffected = [[true]],
		impulseBoost = 0,
		impulseFactor = 0,
		minbarrelangle = -24,
		name = [[FlakCannon]],
		noSelfDamage = true,
		range = 975,
		reloadtime = 0.4,
		renderType = 4,
		size = 5,
		soundHit = [[flakhit]],
		soundStart = [[flakfire]],
		startsmoke = 1,
		toAirWeapon = true,
		turret = true,
		unitsonly = 1,
		weaponTimer = 1,
		weaponType = [[Cannon]],
		weaponVelocity = 1550,
		damage = {
			bombers = 690,
			default = 5,
			fighters = 690,
			flak_resistant = 230,
			unclassed_air = 690,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	corsent_dead = {
		blocking = true,
		category = [[corpses]],
		damage = 0.2080 * unitDef.maxDamage,
		description = [[Copperhead Wreckage]],
		energy = 0,
		featureDead = [[CORSENT_HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.9327 * unitDef.buildCostMetal,
		object = [[CORSENT_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	CORSENT_HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3467 * unitDef.maxDamage,
		description = [[Copperhead Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 1.1659 * unitDef.buildCostMetal,
		object = [[2X2A]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

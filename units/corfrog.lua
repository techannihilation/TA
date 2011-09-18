-- UNITDEF -- CORFROG --
--------------------------------------------------------------------------------

local unitName = "corfrog"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.04,
	bmcode = 1,
	brakeRate = 0.1,
	buildCostEnergy = 16447,
	buildCostMetal = 1600,
	builder = false,
	buildTime = 30005,
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
	designation = [[CAAH-5]],
	downloadable = 1,
	energyMake = 0.3,
	energyStorage = 100,
	energyUse = 0.8,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Hovercraft antiaérien]],
	frenchname = [[F.R.O.G.]],
	germandescription = [[Flak-Hovercraft]],
	germanname = [[F.R.O.G.]],
	italiandescription = [[Veicolo d'artiglieria mobile]],
	italianname = [[F.R.O.G.]],
	maneuverleashlength = 30,
	maxDamage = 3600,
	maxSlope = 14,
	maxVelocity = 1.81,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANKHOVER3]],
	name = [[F.R.O.G.]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CORFROG]],
	ovradjust = 1,
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 260,
	spanishdescription = [[Vehículo Móvil Antiaéreo]],
	spanishname = [[F.R.O.G.]],
	standingfireorder = 2,
	standingmoveorder = 0,
	steeringmode = 2,
	threed = 1,
	turnRate = 489,
	unitname = [[corfrog]],
	unitnumber = 165,
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
			[1] = [[hovmdok2]],
		},
		select = {
			[1] = [[hovmdsl2]],
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
			bombers = 750,
			default = 5,
			fighters = 750,
			flak_resistant = 250,
			unclassed_air = 750,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	corsent_dead = {
		blocking = true,
		category = [[corpses]],
		damage = 0.2460 * unitDef.maxDamage,
		description = [[Copperhead Wreckage]],
		energy = 0,
		featureDead = [[CORSENT_HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8024 * unitDef.buildCostMetal,
		object = [[CORSENT_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	CORSENT_HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.4100 * unitDef.maxDamage,
		description = [[Copperhead Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 1.0030 * unitDef.buildCostMetal,
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

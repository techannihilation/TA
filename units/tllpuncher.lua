-- UNITDEF -- TLLPUNCHER --
--------------------------------------------------------------------------------

local unitName = "tllpuncher"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.055,
	bmcode = 1,
	brakeRate = 0.21,
	buildCostEnergy = 22131,
	buildCostMetal = 468,
	builder = false,
	buildTime = 12158,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Mobile Flak Vehicle]],
	designation = [[]],
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Véhicule antiaérien]],
	germandescription = [[Mobile Flak-Einheit]],
	italiandescription = [[Veicolo d'artiglieria mobile]],
	maneuverleashlength = 300,
	maxDamage = 2363,
	maxSlope = 15,
	maxVelocity = 1.99,
	maxWaterDepth = 12,
	mobilestandorders = 1,
	movementClass = [[TANK3]],
	name = [[Puncher]],
	noAutoFire = false,
	noChaseCategory = [[ALL SUB]],
	objectName = [[TLLPUNCHER]],
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 610,
	spanishdescription = [[Vehículo Móvil Antiaéreo]],
	standingfireorder = 2,
	standingmoveorder = 0,
	steeringmode = 1,
	threed = 1,
	turnRate = 550,
	unitname = [[tllpuncher]],
	unitnumber = 840,
	version = 3.1,
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
			[1] = [[tarmmove]],
		},
		select = {
			[1] = [[tarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[TLLFLAK_SPIDER]],
			onlyTargetCategory = [[VTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	TLLFLAK_SPIDER = {
		accuracy = 1000,
		areaOfEffect = 116,
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
		range = 775,
		reloadtime = 0.7,
		renderType = 4,
		size = 4,
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
			bombers = 570,
			default = 5,
			fighters = 570,
			flak_resistant = 190,
			unclassed_air = 570,
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
		object = [[tllpuncher_dead]],
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

-- UNITDEF -- TLLBURNER --
--------------------------------------------------------------------------------

local unitName = "tllburner"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.35,
	bmcode = 1,
	brakeRate = 0.183105469,
	buildCostEnergy = 2400,
	buildCostMetal = 285,
	builder = false,
	buildTime = 4020,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL ANTIFLAME MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Assault Kbot]],
	designation = [[]],
	energyMake = 1.1,
	energyUse = 1.2,
	explodeAs = [[CORPYRO_BLAST]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	frenchdescription = [[Kbot d'assaut]],
	germandescription = [[Gefechts-Kbot]],
	italiandescription = [[Kbot d'assalto]],
	maneuverleashlength = 640,
	maxDamage = 1125,
	maxSlope = 17,
	maxVelocity = 1.85,
	maxWaterDepth = 25,
	mobilestandorders = 1,
	movementClass = [[KBOT2]],
	name = [[Burner]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[TLLBURNER]],
	selfDestructAs = [[MEDIUM_BUILDING]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 289,
	spanishdescription = [[Kbot lanzallamas]],
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	threed = 1,
	turnRate = 1150,
	unitname = [[tllburner]],
	unitnumber = 830,
	upright = true,
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
			[1] = [[kbcormov]],
		},
		select = {
			[1] = [[kbcorsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[ANTIFLAME]],
			def = [[TLL_FLAME]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	TLL_FLAME = {
		accuracy = 500,
		areaOfEffect = 64,
		burnblow = true,
		burst = 20,
		burstrate = 0.01,
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.5,
		endsmoke = 0,
		fireStarter = 95,
		flameGfxTime = 1.9,
		groundbounce = true,
		id = 157,
		impulseBoost = 0.11,
		impulseFactor = 0.11,
		intensity = 0.6,
		lineOfSight = true,
		name = [[FlameThrower]],
		noExplode = true,
		noradar = 1,
		range = 285,
		reloadtime = 0.9,
		renderType = 5,
		rgbColor = [[1 0.95 0.9]],
		rgbColor2 = [[0.9 0.85 0.8]],
		sizeGrowth = 1.1,
		smokedelay = 1,
		soundStart = [[flamhvy1]],
		sprayAngle = 1200,
		startsmoke = 0,
		tolerance = 4500,
		turret = true,
		unitsonly = 1,
		weaponTimer = 1.225,
		weaponType = [[Flame]],
		weaponVelocity = 300,
		damage = {
			default = 10,
			flamethrowers = 3.3333,
			raider_resistant = 5,
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
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllburner_dead]],
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
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[2x2c]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

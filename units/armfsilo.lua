-- UNITDEF -- ARMFSILO --
--------------------------------------------------------------------------------

local unitName = "armfsilo"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 989475,
	buildCostMetal = 153890,
	builder = false,
	buildTime = 539899,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Ultimate Nuclear Missile Launcher]],
	designation = [[ARMFSILO]],
	downloadable = 1,
	energyMake = 0,
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[NUCLEAR_DISASTER]],
	firestandorders = 1,
	footprintX = 16,
	footprintZ = 16,
	frenchdescription = [[Lance-missiles nucléaires ultime]],
	frenchname = [[Armageddon]],
	germandescription = [[Ultimativer Nuklearraketenwerfer]],
	germanname = [[Armageddon]],
	maxDamage = 15000,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Armageddon]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[ARMFSILO]],
	radarDistance = 0,
	selfDestructAs = [[NUCLEAR_DISASTER]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 350,
	standingfireorder = 0,
	threed = 1,
	unitname = [[armfsilo]],
	unitnumber = 3362,
	version = 1,
	workerTime = 0,
	yardMap = [[oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo]],
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
			[1] = [[servroc1]],
		},
		select = {
			[1] = [[servroc1]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ARMFSILO_WEAPON]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMFSILO_WEAPON = {
		areaOfEffect = 2820,
		commandfire = true,
		cruise = 1,
		edgeEffectiveness = 0.5,
		energypershot = 2800000,
		explosionart = [[commboom]],
		explosiongaf = [[commboom]],
		fireStarter = 100,
		flightTime = 450,
		guidance = true,
		id = 222,
		lavaexplosionart = [[commboom]],
		lavaexplosiongaf = [[commboom]],
		lineOfSight = true,
		metalpershot = 16000,
		model = [[fnuke]],
		name = [[Ultimate Nuclear Missile]],
		noautorange = 1,
		propeller = 1,
		range = 80000,
		reloadtime = 2,
		renderType = 1,
		selfprop = true,
		shakeduration = 2.5,
		shakemagnitude = 48,
		smokedelay = 0.02,
		smokeTrail = true,
		soundHit = [[xplomed4]],
		soundStart = [[misicbm1]],
		startsmoke = 1,
		stockpile = true,
		stockpiletime = 150,
		targetable = 2,
		tolerance = 4000,
		turnRate = 2000,
		twoPhase = true,
		vlaunch = true,
		waterexplosionart = [[commboom]],
		waterexplosiongaf = [[commboom]],
		weaponAcceleration = 21,
		weaponTimer = 30,
		weaponType = [[StarburstLauncher]],
		weaponVelocity = 150,
		damage = {
			bomb_resistant = 9000,
			default = 27000,
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
		footprintX = 16,
		footprintZ = 16,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[armfsilo_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ heap]],
		featurereclamate = [[smudge01]],
		footprintX = 6,
		footprintZ = 6,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[6x6d]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

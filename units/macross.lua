-- UNITDEF -- MACROSS --
--------------------------------------------------------------------------------

local unitName = "macross"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.3,
	bmcode = 1,
	brakeRate = 0.32,
	buildCostEnergy = 142500,
	buildCostMetal = 11400,
	builder = false,
	buildTime = 102487,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	cantBeTransported = true,
	category = [[ALL HUGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Krogoth Class All-Terrain Kbot]],
	designation = [[GPB-1S]],
	energyMake = 22.5,
	energyStorage = 100,
	energyUse = 10.75,
	explodeAs = [[CRAWL_BLAST]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	idleAutoHeal = 6,
	idleTime = 1800,
	immunetoparalyzer = 1,
	maneuverleashlength = 640,
	maxDamage = 40950,
	maxSlope = 20,
	maxVelocity = 1.7,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[HTKBOT4]],
	name = [[Macross]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[macross5]],
	radarDistance = 0,
	selfDestructAs = [[NUCLEAR_MISSILE]],
	selfDestructCountdown = 10,
	shootme = 1,
	side = [[CORE]],
	sightDistance = 600,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	turnRate = 205,
	unitname = [[macross]],
	unitnumber = 29675,
	upright = true,
	workerTime = 0,
	customparams = {
		RequireTech = [[Advanced T3 Unit Research Centre]],
	},
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
			[1] = [[krogok1]],
		},
		select = {
			[1] = [[krogsel1]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[MACROSS_FIRE]],
			onlyTargetCategory = [[NOTVTOL]],
		},
--		[2] = {
--			def = [[MACROSS_ARM_GUN]],
--			onlyTargetCategory = [[NOTVTOL]],
--		},
		[3] = {
			def = [[MACROSS_MISSILE]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	MACROSS_ARM_GUN = {
		areaOfEffect = 75,
		id = 142,
		lineOfSight = true,
		minbarrelangle = -15,
		model = [[macrossbullets]],
		name = [[Macross Arm Canon]],
		range = 500,
		reloadtime = 3,
		renderType = 1,
		rgbColor = [[1 0.95 0.9]],
		size = 1.63,
		soundHitDry = [[macrossmhit]],
		soundStart = [[macrossmissile]],
		startsmoke = 1,
		tolerance = 1000,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 500,
		damage = {
			default = 1500,
			subs = 5,
		},
	},

	MACROSS_MISSILE = {
		areaOfEffect = 148,
		fireStarter = 70,
		guidance = true,
		id = 170,
		lineOfSight = true,
		metalpershot = 0,
		model = [[macrossmissile]],
		name = [[Macross Missiles]],
		range = 950,
		reloadtime = 1,
		renderType = 1,
		rgbColor = [[1.000 0.000 0.000]],
		selfprop = true,
		smokedelay = 0.25,
		smokeTrail = true,
		soundHitDry = [[macrossmhit]],
		soundStart = [[macrossmissile]],
		startsmoke = 1,
		startVelocity = 150,
		tolerance = 8000,
		tracks = true,
		turnRate = 30000,
		turret = true,
		weaponAcceleration = 150,
		weaponTimer = 30,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 440,
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
		category = [[core_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 31,
		hitdensity = 105,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[macross_dead]],
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
		height = 2,
		hitdensity = 105,
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

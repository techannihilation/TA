-- UNITDEF -- ARMCRABE --
--------------------------------------------------------------------------------

local unitName = "armcrabe"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.552587891,
	bmcode = 1,
	brakeRate = 0.252587891,
	buildCostEnergy = 131242,
	buildCostMetal = 12000,
	builder = false,
	buildPic = [[ARMCRABE.png]],
	buildTime = 198800,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	cantBeTransported = true,
	category = [[ALL HUGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionVolumeOffsets = [[-3 -19 2]],
	collisionVolumeScales = [[100 97 93]],
	collisionVolumeTest = 1,
	collisionVolumeType = [[ellipsoid]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[All-Terrain Kbot Biomechanics]],
	designation = [[ARM-CRABE]],
	energyMake = 0.7,
	energyStorage = 0,
	energyUse = 1,
	explodeAs = [[ARM_BERTHACANNONEMP1]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 45000,
	maxSlope = 20,
	maxVelocity = 0.9,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[HTKBOT4]],
	name = [[Crabe]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMCRABE]],
	onoffable = true,
	radarDistance = 0,
	seismicsigniture = 2500,
	selfDestructAs = [[NUCLEAR_MISSILE]],
	selfDestructCountdown = 10,
	shootme = 1,
	side = [[ARM]],
	sightDistance = 950,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 100,
	unitname = [[armcrabe]],
	unitnumber = 100003,
	workerTime = 0,
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
			def = [[ARMCRABE_GAUSS]],
			onlyTargetCategory = [[NOTVTOL]],
		},
		[2] = {
			badTargetCategory = [[VTOL]],
			def = [[ARMCRABE_MISSILES]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMCRABE_GAUSS = {
		areaOfEffect = 110,
		explosionGenerator = [[custom:Explosion_Medium_Rocket]],
		lineOfSight = true,
		minbarrelangle = -15,
		name = [[Crabe Cannon]],
		range = 1200,
		reloadtime = 3.2,
		renderType = 4,
		rgbColor = [[0.76 0.46 0]],
		size = 3.04,
		soundHitDry = [[XPLOSML1]],
		soundStart = [[AMATIR]],
		startsmoke = 1,
		tolerance = 500,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 385,
		damage = {
			default = 1450,
			subs = 5,
		},
	},
	ARMCRABE_MISSILES = {
		areaOfEffect = 120,
		burst = 3,
		burstrate = 0.3,
		cegTag = [[Trail_Large_Rocket]],
		explosionGenerator = [[custom:Explosion_Light_Plasma-2]],
		fireStarter = 20,
		guidance = true,
		id = 233,
		lineOfSight = true,
		model = [[missileH2]],
		name = [[Heavy Rocket]],
		range = 1000,
		reloadtime = 12,
		renderType = 1,
		selfprop = true,
		shakeduration = 1,
		shakemagnitude = 3,
		smokedelay = 0.0091,
		smokeTrail = true,
		soundHitDry = [[tankahit]],
		soundStart = [[tankafire]],
		startsmoke = 1,
		startVelocity = 640,
		tolerance = 12000,
		tracks = true,
		turnRate = 33000,
		turret = true,
		weaponAcceleration = 460,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 1500,
		damage = {
			commanders = 650,
			default = 1650,
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
		footprintX = 5,
		footprintZ = 4,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[armcrabe_dead]],
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
		object = [[3x3d]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

 -- UNITDEF -- ARMANTAR --
--------------------------------------------------------------------------------

local unitName = "armantar"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.01,
	bmcode = 1,
	brakeRate = 0.05629395,
	buildCostEnergy = 141550,
	buildCostMetal = 15550,
	builder = false,
	buildTime = 120000,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	cantBeTransported = true,
	category = [[ALL HUGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionVolumeScales = [[75 75 75]],
	collisionVolumeOffsets = [[0 -10 0]],
	collisionVolumeType = [[CylZ]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Heavy Assault Tank]],
	designation = [[ARM-TER]],
	energyMake = 1,
	energyStorage = 0,
	energyUse = 25,
	explodeAs = [[ESTOR_BUILDING]],
	firestandorders = 1,
	footprintX = 5,
	footprintZ = 5,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 56000,
	maxSlope = 12,
	maxVelocity = 1.6,
	maxWaterDepth = 100,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[VHTANK5]],
	name = [[Antarion]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMANTAR]],
	onoffable = true,
	selfDestructAs = [[NUCLEAR_MISSILE]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 855,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 280,
	unitname = [[armantar]],
	unitnumber = 954568,
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
			[1] = [[tarmmove]],
		},
		select = {
			[1] = [[tarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ARMANTAR_LASER]],
			onlyTargetCategory = [[NOTVTOL]],
		},
		[2] = {
			def = [[ARMANTAR_LASER]],
			onlyTargetCategory = [[NOTVTOL]],
		},
		[3] = {
			def = [[ARMANTAR_MISSILE]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMANTAR_LASER = {
		areaOfEffect = 8,
		beamWeapon = true,
		craterBoost = 0,
		craterMult = 0,
		energypershot = 300,
		fireStarter = 90,
		id = 252,
		impulseBoost = 0,
		impulseFactor = 0,
		lineOfSight = true,
		name = [[Antarion Laser]],
		range = 600,
		reloadtime = 0.6,
		renderType = 0,
		rgbColor = [[0.1875 0.109375 0.65625]],
		soundHitDry = [[xplosml3]],
		soundStart = [[Lasrhvy2]],
		tolerance = 500,
		turret = true,
		weaponType = [[LaserCannon]],
		weaponVelocity = 1200,
		damage = {
			commanders = 150,
			default = 375,
			subs = 5,
		},
	},
	ARMANTAR_MISSILE = {
		areaOfEffect = 120,
		burst = 6,
		burstrate = 0.3,
		cegTag = [[Trail_Large_Rocket]],
		explosionGenerator = [[custom:Explosion_Light_Plasma-2]],
		fireStarter = 20,
		guidance = true,
		id = 233,
		lineOfSight = true,
		model = [[missileH2]],
		name = [[Heavy Rocket]],
		range = 1200,
		reloadtime = 15,
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
		turret = false,
		weaponAcceleration = 460,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 1500,
		damage = {
			commanders = 650,
			default = 1300,
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
		footprintZ = 4,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[armantar_dead]],
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
		object = [[3x3c]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

 -- UNITDEF -- ARMANTAR --
--------------------------------------------------------------------------------

local unitName = "armantar"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.01,
	bmcode = 1,
	brakeRate = 0.05629395,
	buildCostEnergy = 63547,
	buildCostMetal = 9215,
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
	maxDamage = 52000,
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
	radarDistance = 1200,
	radarDistanceJam = 10,
	selfDestructAs = [[NUCLEAR_MISSILE]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 460,
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
		energypershot = 150,
		fireStarter = 90,
		id = 232,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		name = [[High Energy Laser]],
		noSelfDamage = true,
		range = 800,
		reloadtime = 0.9,
		renderType = 0,
		rgbColor = [[1.000 0.282 0.000]],
		soundHitDry = [[lasrhit1]],
		soundStart = [[lasrhit1]],
		tolerance = 8000,
		turret = true,
		weaponType = [[LaserCannon]],
		weaponVelocity = 1500,
		damage = {
			default = 500,
			subs = 5,
		},
	},
	ARMANTAR_MISSILE = {
		areaOfEffect = 120,
		craterBoost = 0,
		craterMult = 0,
		fireStarter = 70,
		guidance = true,
		id = 168,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		metalpershot = 0,
		model = [[missileantarion]],
		name = [[Missiles]],
		noSelfDamage = true,
		range = 900,
		reloadtime = 0.7,
		renderType = 1,
		rgbColor = [[1.000 0.000 0.000]],
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHitDry = [[xplomed2]],
		soundStart = [[xplomed2]],
		startsmoke = 1,
		startVelocity = 470,
		tolerance = 10000,
		tracks = true,
		turnRate = 50000,
		turret = true,
		weaponAcceleration = 300,
		weaponTimer = 5,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 660,
		damage = {
			default = 200,
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

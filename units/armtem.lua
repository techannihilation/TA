-- UNITDEF -- ARMTEM --
--------------------------------------------------------------------------------

local unitName = "armtem"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.035,
	bmcode = 1,
	brakeRate = 0.05,
	buildCostEnergy = 27500,
	buildCostMetal = 5425,
	builder = false,
	buildTime = 63500,
	canAttack = true,
	canGuard = true,
	canHover = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	cantBeTransported = true,
	category = [[ALL HOVER HUGE MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Heavy Battle Hovertank]],
	designation = [[ARM-HGSS]],
	energyMake = 2.6,
	energyStorage = 0,
	energyUse = 2.6,
	explodeAs = [[BIG_UNIT]],
	firestandorders = 1,
	firestate = 2,
	footprintX = 4,
	footprintZ = 4,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 15650,
	maxSlope = 16,
	maxVelocity = 1.6,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANKHOVER4]],
	name = [[Tempest]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[ARMTEM]],
	radarDistance = 0,
	selfDestructAs = [[ESTOR_BUILDINGEX]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 620,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 250,
	unitname = [[armtem]],
	unitnumber = 500,
	workerTime = 0,
	featureDefs = nil,
	customparams = {
		RequireTech = [[Advanced T2 Unit Research Centre]],
	},
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
			[1] = [[hovlgok1]],
		},
		select = {
			[1] = [[hovlgsl1]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ARMTEM_WEAPON]],
			onlyTargetCategory = [[NOTVTOL]],
		},
		[2] = {
			def = [[ARMTEM_ROCKET]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMTEM_ROCKET = {
		areaOfEffect = 130,
		cegTag = [[ARMRAVENTRAIL]],
   		craterBoost = 0,
		craterMult = 0,
		fireStarter = 70,
		flightTime = 6,
		guidance = true,
		id = 235,
		impulseBoost = 0,
		impulseFactor = 0,
		lineOfSight = true,
		model = [[temrocket]],
		name = [[Guided Rockets]],
		range = 800,
		reloadtime = 3,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = false,
		soundHitDry = [[xplomed4]],
		soundStart = [[temrocket_launch]],
		startsmoke = 1,
		startVelocity = 150,
		Texture1 = [[null]],
		Texture2 = [[null]],
		Texture3 = [[null]],
		Texture4 = [[null]],
		tolerance = 5000,
		tracks = true,
		turnRate = 50000,
		twoPhase = true,
		vlaunch = true,
		weaponAcceleration = 75,
		weaponTimer = 2,
		weaponType = [[StarburstLauncher]],
		weaponVelocity = 650,
		damage = {
			default = 950,
			subs = 5,
		},
	},
	ARMTEM_WEAPON = {
		areaOfEffect = 170,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH1]],
		impactonly = 1,
		impulseBoost = 0,
		impulseFactor = 0,
		lineOfSight = true,
		minbarrelangle = -15,
		name = [[GaussCannon]],
		noSelfDamage = true,
		range = 800,
		reloadtime = 1.8,
		renderType = 4,
		soundHitDry = [[xplomed2]],
		soundStart = [[Mavgun2]],
		startsmoke = 1,
		tolerance = 4000,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 500,
		damage = {
			default = 790,
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
		footprintX = 4,
		footprintZ = 4,
		height = 15,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[armtem_dead]],
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
		footprintX = 4,
		footprintZ = 4,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[4x4d]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

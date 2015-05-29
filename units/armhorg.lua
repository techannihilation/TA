-- UNITDEF -- ARMHORG --
--------------------------------------------------------------------------------

local unitName = "armhorg"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.017,
	bmcode = 1,
	brakeRate = 0.015,
	buildCostEnergy = 16945,
	buildCostMetal = 1020,
	builder = false,
	buildTime = 18956,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Very Heavy Missile Tank]],
	energyMake = 1,
	energyStorage = 20,
	energyUse = 1,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 2350,
	maxSlope = 18,
	maxVelocity = 1.6,
	maxWaterDepth = 19,
	metalStorage = 3,
	mobilestandorders = 1,
	movementClass = [[TANK3]],
	name = [[Horgue]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[armhorg]],
	radarDistance = 960,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 680,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 450,
	unitname = [[armhorg]],
	unitnumber = 66,
	workerTime = 0,
	featureDefs = nil,
	customparams = {
		RequireTech = [[Advanced T2 Unit Research Centre]],
	},
	sfxtypes = {
		explosiongenerators = {
			[1] = "custom:muzzle_flare_rocket",
		},
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
			[1] = [[varmmove]],
		},
		select = {
			[1] = [[varmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[armhorg_weapon]],
			mainDir = [[0 0 1]],
			maxAngleDif = 270,
			badTargetCategory = [[VTOL]],
			onlyTargetCategory = [[ALL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	armhorg_weapon = {
		accuracy = 200,
		areaOfEffect = 140,
		avoidFeature = false,
		burst = 8,
		burstrate = 0.22,
		cegTag = [[Core_Def_AA_Rocket]],
		craterBoost = 0,
		craterMult = 0,
		energypershot = 0,
		explosionGenerator = [[custom:Explosion_Medium_Rocket]],
		fireStarter = 20,
		flightTime = 6,
		impulseBoost = 0,
		impulseFactor = 0,
		lineOfSight = true,
		metalpershot = 0,
		model = [[horguemiss]],
		movingAccuracy = 600,
		name = [[Banisher]],
		proximityPriority = -1,
		range = 1555,
		reloadtime = 8,
		renderType = 1,
		selfprop = true,
		shakeduration = 1,
		shakemagnitude = 10,
		smokedelay = 0.0091,
		smokeTrail = true,
		soundHitDry = [[TAWF114b]],
		soundStart = [[TAWF114a]],
		sprayAngle = 250,
		startsmoke = 1,
		startVelocity = 250,
		texture1 = [[null]],
		texture2 = [[null]],
		texture3 = [[null]],
		texture4 = [[null]],
		tolerance = 9000,
		tracks = true,
		trajectoryHeight = 1.45,
		turnRate = 0,
		turret = true,
		weaponAcceleration = 70,
		weaponTimer = 5,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 310,
		wobble = 1800,
		damage = {
			default = 150,
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
		footprintZ = 3,
		height = 29,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[armhorg_dead]],
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

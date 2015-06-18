-- UNITDEF -- TAIPAN --
--------------------------------------------------------------------------------

local unitName = "taipan"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.06,
	bmcode = 1,
	brakeRate = 0.21,
	buildCostEnergy = 20234,
	buildCostMetal = 464,
	builder = false,
	buildTime = 23659,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	cloakCost = 50,
	cloakCostMoving = 100,
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Cloakable Assault KBot]],
	designation = [[ARM-K-74]],
	downloadable = 1,
	energyMake = 51,
	energyStorage = 500,
	energyUse = 5,
	explodeAs = [[SMALL_UNIT]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	idleAutoHeal = 5,
	idleTime = 1800,
	initCloaked = false,
	maneuverleashlength = 640,
	maxDamage = 1798,
	maxSlope = 19,
	maxVelocity = 1.9,
	maxWaterDepth = 14,
	metalStorage = 0,
	minCloakDistance = 40,
	mobilestandorders = 1,
	movementClass = [[KBOT2]],
	name = [[K-74 Taipan]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[TAIPAN]],
	onoffable = true,
	radarDistance = 450,
	selfDestructAs = [[BIG_UNITEX]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 250,
	standingfireorder = 2,
	standingmoveorder = 1,
	stealth = true,
	steeringmode = 2,
	turnRate = 1005,
	unitname = [[taipan]],
	unitnumber = 345665,
	upright = true,
	workerTime = 0,
	customparams = {
		RequireTech = [[Advanced T2 Unit Research Centre]],
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
			[1] = [[kbarmmov]],
		},
		select = {
			[1] = [[kbarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ARM_FAST7]],
			onlyTargetCategory = [[NOTVTOL]],
		},
		[2] = {
			def = [[arm_FAST7]],
			onlyTargetCategory = [[NOTVTOL]],
		},
--		[3] = {
--			def = [[CORKBOT_ROCKET7]],
--			onlyTargetCategory = [[NOTVTOL]],
--		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	arm_FAST7 = {
		areaOfEffect = 8,
		beamWeapon = true,
		burstrate = 0.2,
		duration = 0.02,
		explosionGenerator = [[custom:LASER]],
		fireStarter = 50,
		id = 83,
		lineOfSight = true,
		name = [[Laser]],
		range = 210,
		reloadtime = 0.8,
		renderType = 0,
		rgbColor = [[0.765 0.000 1.000]],
		soundHitDry = [[lashit]],
		soundStart = [[lasrfast]],
		soundTrigger = true,
		turret = true,
		weaponType = [[LaserCannon]],
		weaponVelocity = 400,
		damage = {
			default = 160,
			subs = 5,
		},
	},
	CORKBOT_ROCKET7 = {
		areaOfEffect = 48,
		explosionGenerator = [[custom:GDLIGHTROCKET]],
		fireStarter = 70,
		id = 121,
		lineOfSight = true,
		metalpershot = 0,
		model = [[missile10]],
		name = [[Rockets]],
		range = 400,
		reloadtime = 3.7,
		renderType = 1,
		rgbColor = [[1.000 0.000 0.000]],
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHitDry = [[xplosml2]],
		soundStart = [[rocklit1]],
		startsmoke = 1,
		startVelocity = 250,
		turret = true,
		weaponAcceleration = 120,
		weaponTimer = 2,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 250,
		damage = {
			default = 300,
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
		description = [[Taipan Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[taipan_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Taipan Debris]],
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

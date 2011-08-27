-- UNITDEF -- CORGFBT --
--------------------------------------------------------------------------------

local unitName = "corgfbt"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.025,
	activateWhenBuilt = true,
	ai_limit = [[limit corGFBT 12]],
	ai_weight = [[weight corGFBT 1.6]],
	bmcode = 1,
	brakeRate = 0.02,
	buildCostEnergy = 9982,
	buildCostMetal = 651,
	builder = false,
	buildTime = 9523,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Magnesium FireBall Tank (anti spam)]],
	designation = [[sWsGFBT]],
	downloadable = 1,
	energyMake = 0.7,
	energyStorage = 100,
	energyUse = 0.8,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	maneuverleashlength = 640,
	mass = 5000,
	maxDamage = 4528,
	maxSlope = 14,
	maxVelocity = 1.22,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANK2]],
	name = [[Grimani]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[corGFBT]],
	ovradjust = 1,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 300,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	threed = 1,
	turnRate = 400,
	unitname = [[corgfbt]],
	unitnumber = 397,
	version = 2.5,
	workerTime = 0,
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
			[1] = [[tcormove]],
		},
		select = {
			[1] = [[tcorsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[FIREBALL]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	FIREBALL = {
		areaOfEffect = 168,
		beamWeapon = true,
		color = 3,
		craterBoost = 0,
		craterMult = 0,
		energypershot = 210,
		explosionart = [[LavaSplash]],
		explosiongaf = [[FX]],
		fireStarter = 100,
		id = 41,
		impulseBoost = 0,
		impulseFactor = 0,
		lavaexplosionart = [[LavaSplash]],
		lavaexplosiongaf = [[FX]],
		lineOfSight = true,
		name = [[Grimani's Magnesium Fireball]],
		range = 300,
		reloadtime = 2.1,
		renderType = 4,
		smokeTrail = true,
		soundHit = [[Burn02]],
		soundStart = [[Mavgun1]],
		soundTrigger = true,
		soundwater = [[SplsSml]],
		sprayAngle = 1024,
		startsmoke = 1,
		turret = true,
		waterexplosionart = [[H2O]],
		waterexplosiongaf = [[FX]],
		weaponTimer = 4,
		weaponType = [[LaserCannon]],
		weaponVelocity = 360,
		damage = {
			default = 600,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = true,
		category = [[core_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Fireball Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[corGFBT_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Fireball Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[2x2a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

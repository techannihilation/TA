-- UNITDEF -- CORPROT --
--------------------------------------------------------------------------------

local unitName = "corprot"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.5,
	ai_limit = [[limit CORPROT 6]],
	ai_weight = [[weight CORPROT 0.4]],
	bmcode = 1,
	brakeRate = 0.15,
	buildCostEnergy = 16641,
	buildCostMetal = 2334,
	builder = false,
	buildTime = 39523,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	cloakCost = 500,
	cloakCostMoving = 1500,
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Heavy Sniper Support Kbot]],
	designation = [[CR-PT]],
	downloadable = 1,
	energyMake = 0.4,
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	frenchdescription = [[Kbot de soutien]],
	frenchname = [[Protos]],
	germandescription = [[Unterstützungs-Kbot]],
	germanname = [[Protos]],
	maneuverleashlength = 300,
	maxDamage = 1900,
	maxSlope = 14,
	maxVelocity = 1.9,
	metalStorage = 0,
	minCloakDistance = 170,
	mobilestandorders = 1,
	movementClass = [[HKBOT4]],
	name = [[Protos]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORPROT]],
	ovradjust = 1,
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 700,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	threed = 1,
	turnRate = 1019,
	unitname = [[corprot]],
	unitnumber = 25003,
	upright = true,
	version = 1.2,
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
			[1] = [[kbcormov]],
		},
		select = {
			[1] = [[kbcorsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[SMALL TINY]],
			def = [[CORPROT_WEAPON]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORPROT_WEAPON = {
		areaOfEffect = 16,
		beamWeapon = true,
		collideFriendly = false,
		craterBoost = 0,
		craterMult = 0,
		duration = 0.0025,
		energypershot = 1500,
		explosionGenerator = [[custom:FLASH1nd]],
		impactonly = 1,
		impulseBoost = 0.234,
		impulseFactor = 0.234,
		intensity = 0.75,
		lineOfSight = true,
		name = [[Ball]],
		noradar = 1,
		noSelfDamage = true,
		range = 1200,
		reloadtime = 10.6,
		renderType = 0,
		rgbColor = [[1 1 0]],
		soundHit = [[xplomed21]],
		soundHitVolume = 4,
		soundStart = [[Rocklit3]],
		soundStartVolume = 4,
		thickness = 0.5,
		turret = true,
		weaponType = [[LaserCannon]],
		weaponVelocity = 9000,
		damage = {
			commanders = 1600,
			default = 4995,
			sniper_resistant = 1665,
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
		footprintZ = 4,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[corprot_dead]],
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
		footprintZ = 4,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[corprot_heap]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

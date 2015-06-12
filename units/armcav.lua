-- UNITDEF -- ARMCAV --
--------------------------------------------------------------------------------

local unitName = "armcav"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.65,
	activateWhenBuilt = false,
	ai_limit = [[limit armcav 3]],
	ai_weight = [[weight armcav 3.6]],
	bmcode = 1,
	brakeRate = 0.5,
	buildCostEnergy = 14100,
	buildCostMetal = 1650,
	builder = false,
	buildTime = 16520,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[All-Terrain - Multipurpose Assault Kbot]],
	designation = [[ARM-K47]],
	downloadable = 1,
	energyMake = 30,
	energyStorage = 0,
	energyUse = 20,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 6150,
	maxSlope = 35,
	maxVelocity = 1,
	maxWaterDepth = 30,
	metalMake = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[AMPHKBOT]],
	name = [[Cavalier]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMCAV]],
	onoffable = true,
	radarDistance = 640,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 300,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	turnRate = 550,
	unitname = [[armcav]],
	unitnumber = 800,
	upright = true,
	workerTime = 0,
	customparams = {
		RequireTech = [[Advanced T2 Unit Research Centre]],
	},
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:armzeus_muzzle_glow]],
		},
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
			def = [[CAV_LIGHTING]],
			onlyTargetCategory = [[NOTVTOL]],
		},
		[2] = {
			def = [[LIGHTNING]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
		LIGHTNING = {
		areaOfEffect = 8,
		avoidfeature = false,
		beamttl = 10,
		beamWeapon = true,
		craterBoost = 0,
		craterMult = 0,
		duration = 10,
		energypershot = 35,
		explosionGenerator = [[custom:ZEUS_FLASH]],
		fireStarter = 50,
		impactonly = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		intensity = 12,
		lineOfSight = true,
		name = [[LightningGun]],
		noSelfDamage = true,
		range = 280,
		reloadtime = 1,
		renderType = 7,
		rgbColor = [[0.5 0.5 1]],
		soundHitDry = [[xplomed3]],
		soundStart = [[lghthvy1]],
		soundTrigger = true,
		startsmoke = 1,
		targetMoveError = 0.3,
		texture1 = [[lightning]],
		thickness = 10,
		turret = true,
		weaponType = [[LightningCannon]],
		weaponVelocity = 400,
		damage = {
			commanders = 110
			default = 220,
			subs = 5,
		},
	},
	CAV_LIGHTING = {
		areaOfEffect = 8,
		beamWeapon = true,
		craterBoost = 0,
		craterMult = 0,
		duration = 10,
		energypershot = 350,
		explosionGenerator = [[custom:zeus_explosion]],
		fireStarter = 85,
		id = 93,
		impulseBoost = 0,
		impulseFactor = 0,
		lineOfSight = true,
		name = [[High Energy Laser]],
		range = 750,
		reloadtime = 3,
		renderType = 7,
		rgbColor = [[0.5 0.5 1]],
		soundHitDry = [[xplomed3]],
		soundStart = [[lghthvy1]],
		startsmoke = 1,
		texture1 = [[lightning]],
		thickness = 12,
		tolerance = 600,
		turret = true,
		weaponTimer = 1,
		weaponType = [[LightningCannon]],
		weaponVelocity = 667,
		damage = {
			commanders = 300,
			default = 600,
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
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[armcav_dead]],
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

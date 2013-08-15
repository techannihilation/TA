-- UNITDEF -- ARMKRMI --
--------------------------------------------------------------------------------

local unitName = "armkrmi"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.2,
	bmcode = 1,
	brakeRate = 0.19,
	buildCostEnergy = 42560,
	buildCostMetal = 1967,
	builder = false,
	buildTime = 67214,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Fast Assault Experimental Kbot]],
	designation = [[ARM-KRMI]],
	downloadable = 1,
	energyMake = 1.1,
	energyStorage = 0,
	energyUse = 1.1,
	explodeAs = [[ATOMIC_BLASTSML]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	healtime = 27,
	maneuverleashlength = 640,
	maxDamage = 7024,
	maxHeightDif = 17,
	maxVelocity = 3,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[HKBOT3]],
	name = [[Krally]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMKRMI]],
	radarDistance = 1500,
	selfDestructAs = [[ATOMIC_BLAST]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 255,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	turnRate = 960,
	unitname = [[armkrmi]],
	unitnumber = 9521,
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
			[1] = [[kbcormov]],
		},
		select = {
			[1] = [[kbcorsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ARMKRMI_ROCKET]],
			onlyTargetCategory = [[NOTVTOL]],
		},
		[2] = {
			def = [[ARMKRMI_LIGHT]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMKRMI_LIGHT = {
		areaOfEffect = 8,
		beamWeapon = true,
		duration = 10,
		fireStarter = 50,
		id = 163,
		lineOfSight = true,
		name = [[Lightning Gun]],
		range = 350,
		reloadtime = 1.2,
		renderType = 7,
		rgbColor = [[0.000 0.012 1.000]],
		soundHitDry = [[lashit]],
		soundStart = [[lghthvy1]],
		soundTrigger = true,
		startsmoke = 1,
		turret = true,
		weaponType = [[LightningCannon]],
		weaponVelocity = 400,
		damage = {
			default = 400,
			subs = 5,
		},
	},
	ARMKRMI_ROCKET = {
		areaOfEffect = 96,
		cegTag = [[ARMRAVENTRAIL]],
		fireStarter = 100,
		flightTime = 10,
		guidance = true,
		id = 165,
		lineOfSight = true,
		metalpershot = 0,
		model = [[krmirck]],
		name = [[Rocket]],
		noautorange = 1,
		range = 1000,
		reloadtime = 16,
		renderType = 1,
		rgbColor = [[1.000 0.000 0.000]],
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = false,
		soundHitDry = [[xplomed4]],
		soundStart = [[Rockhvy1]],
		startsmoke = 1,
		Texture1 = [[null]],
		Texture2 = [[null]],
		Texture3 = [[null]],
		Texture4 = [[null]],
		tolerance = 4000,
		turnRate = 24384,
		twoPhase = true,
		vlaunch = true,
		weaponAcceleration = 440,
		weaponTimer = 5,
		weaponType = [[StarburstLauncher]],
		weaponVelocity = 400,
		damage = {
			default = 2000,
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
		description = [[Krypto Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[armkrmi_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Krypto Heap]],
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

-- UNITDEF -- CORMONSTA --
--------------------------------------------------------------------------------

local unitName = "cormonsta"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.652587891,
	bmcode = 1,
	brakeRate = 0.352587891,
	buildCostEnergy = 27415,
	buildCostMetal = 2574,
	builder = false,
	buildTime = 80561,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Defiler Assault]],
	designation = [[ATAS]],
	energyMake = 0.7,
	energyStorage = 0,
	energyUse = 0.7,
	explodeAs = [[MINE_MEDIUM]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 18158,
	maxSlope = 40,
	maxVelocity = 0.85,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[HTKBOT4]],
	name = [[Defiler]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORMONSTA]],
	onoffable = true,
	selfDestructAs = [[MINE_MEDIUM]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 550,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 340,
	unitname = [[cormonsta]],
	unitnumber = 852741,
	workerTime = 0,
	customparams = {
		RequireTech = [[Advanced T2 Unit Research Centre]],
	},
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:akmech_muzzle]],
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
			[1] = [[krogok1]],
		},
		select = {
			[1] = [[krogsel1]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[CORMONSTA_GUN]],
			onlyTargetCategory = [[NOTVTOL]],
		},
		[2] = {
			def = [[SAM2_MISSILE]],
			onlyTargetCategory = [[VTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORMONSTA_GUN = {
		areaOfEffect = 75,
		explosionGenerator = [[custom:Explosion_Light_Plasma-2-Orange]],
		lineOfSight = true,
		minbarrelangle = -15,
		--model = [[dragothflame]],
		name = [[Tanker Canon]],
		range = 480,
		reloadtime = 0.37,
		renderType = 1,
		rgbColor = [[0.74 0.43 0]],
		size = 1.63,
		soundHitDry = [[xplomed21]],
		soundStart = [[DEFILER2]],
		startsmoke = 1,
		tolerance = 500,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 950,
		damage = {
			default = 105,
			subs = 5,
		},
	},
	SAM2_MISSILE = {
		areaOfEffect = 16,
		burnblow = true,
		burst = 2,
		burstrate = 0.2,
		canattackground = false,
		cegTag = [[Core_Def_AA_Rocket]],
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH2]],
		fireStarter = 72,
		flightTime = 2,
		guidance = true,
		impactonly = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		model = [[missile]],
		name = [[AA2Missile]],
		noSelfDamage = true,
		proximityPriority = 1,
		range = 900,
		reloadtime = 2.55,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHitDry = [[packohit]],
		soundStart = [[packolau]],
		soundTrigger = true,
		startsmoke = 1,
		startVelocity = 520,
		texture1 = [[null]],
		texture2 = [[coresmoketrail]],
		texture3 = [[null]],
		texture4 = [[null]],
		tolerance = 9950,
		tracks = true,
		turnRate = 68000,
		turret = true,
		weaponAcceleration = 160,
		weaponTimer = 2,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 700,
		damage = {
			bombers = 240,
			default = 5,
			fighters = 360,
			flak_resistant = 240,
			unclassed_air = 240,
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
		footprintX = 9,
		footprintZ = 9,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[cormonsta_dead]],
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
		object = [[2x2f]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

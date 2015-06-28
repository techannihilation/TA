-- UNITDEF -- CORFROG --
--------------------------------------------------------------------------------

local unitName = "corfrog"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.04,
	airsightdistance = 1000,
	bmcode = 1,
	brakeRate = 0.1,
	buildCostEnergy = 16000,
	buildCostMetal = 900,
	builder = false,
	buildTime = 30005,
	canAttack = true,
	canGuard = true,
	canHover = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL HOVER LARGE MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[corsent_dead]],
	defaultmissiontype = [[Standby]],
	description = [[Heavy Flak Hovercraft]],
	designation = [[CAAH-5]],
	downloadable = 1,
	energyMake = 0,
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 30,
	maxDamage = 1800,
	maxSlope = 14,
	maxVelocity = 1.81,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANKHOVER3]],
	name = [[F.R.O.G.]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CORFROG]],
	ovradjust = 1,
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 550,
	standingfireorder = 2,
	standingmoveorder = 0,
	steeringmode = 2,
	turnRate = 489,
	unitname = [[corfrog]],
	unitnumber = 165,
	upright = true,
	workerTime = 0,
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
			[1] = [[hovmdok2]],
		},
		select = {
			[1] = [[hovmdsl2]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ARMFLAK_GUN]],
			onlyTargetCategory = [[VTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMFLAK_GUN = {
		accuracy = 1000,
		areaOfEffect = 192,
		ballistic = true,
		burnblow = true,
		canattackground = false,
		cegTag = [[corflak-fx]],
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.85,
		explosionGenerator = [[custom:FLASH3]],
		gravityaffected = true,
		impulseBoost = 0,
		impulseFactor = 0,
		minbarrelangle = -24,
		name = [[FlakCannon]],
		nogap = 1,
		noSelfDamage = true,
		range = 975,
		reloadtime = 0.3,
		renderType = 4,
		rgbColor = [[1.0 0.5 0.0]],
		size = 5,
		soundHitDry = [[flakhit]],
		soundStart = [[flakfire]],
		startsmoke = 1,
		turret = true,
		unitsonly = 1,
		weaponTimer = 1,
		weaponType = [[Cannon]],
		weaponVelocity = 1550,
		damage = {
			bombers = 450,
			default = 5,
			fighters = 450,
			flak_resistant = 150,
			unclassed_air = 450,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	corsent_dead = {
		blocking = true,
		category = [[corpses]],
		damage = 0.2460 * unitDef.maxDamage,
		description = [[Copperhead Wreckage]],
		energy = 0,
		featureDead = [[CORSENT_HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8024 * unitDef.buildCostMetal,
		object = [[CORSENT_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	CORSENT_HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.4100 * unitDef.maxDamage,
		description = [[Copperhead Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 1.0030 * unitDef.buildCostMetal,
		object = [[2X2A]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- TLLFIRESTARTER --
--------------------------------------------------------------------------------

local unitName = "tllfirestarter"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.21,
	airsightdistance = 675,
	bmcode = 1,
	brakeRate = 0.25,
	buildCostEnergy = 759,
	buildCostMetal = 112,
	builder = false,
	buildTime = 2793,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL SMALL WEAPON]],
	collisionVolumeOffsets = [[0 -6 1]],
	collisionVolumeScales = [[37 37 37]],
	collisionVolumeTest = 1,
	collisionVolumeType = [[ellipsoid]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Amphibious Anti-Air Kbot]],
	designation = [[]],
	energyMake = 0.4,
	energyUse = 0.4,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	maneuverleashlength = 640,
	maxDamage = 600,
	maxSlope = 14,
	maxVelocity = 1.9,
	maxWaterDepth = 12,
	mobilestandorders = 1,
	movementClass = [[AKBOT2]],
	name = [[Firestarter]],
	noAutoFire = false,
	noChaseCategory = [[ALL SUB]],
	objectName = [[TLLFIRESTARTER]],
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 500,
	standingfireorder = 2,
	standingmoveorder = 2,
	steeringmode = 2,
	turnRate = 1016,
	unitname = [[tllfirestarter]],
	unitnumber = 822,
	upright = true,
	featureDefs = nil,
	sounds = {
		canceldestruct = [[cancel2]],
		underattack = [[tllwarning]],
		cant = {
			[1] = [[wearoff]],
		},
		count = {
			[1] = [[tllcount]],
			[2] = [[tllcount]],
			[3] = [[tllcount]],
			[4] = [[tllcount]],
			[5] = [[tllcount]],
			[6] = [[tllcount]],
		},
		ok = {
			[1] = [[tllkbotmove]],
		},
		select = {
			[1] = [[tllunitok]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ARMKBOT_MISSILE]],
			onlyTargetCategory = [[VTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMKBOT_MISSILE = {
		areaOfEffect = 48,
		cegTag = [[Tll_Def_AA_Rocket]],
		canattackground = false,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH2]],
		fireStarter = 70,
		flighttimer = 2,
		guidance = true,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		metalpershot = 0,
		model = [[missile]],
		name = [[Missiles]],
		noSelfDamage = true,
		range = 760,
		reloadtime = 1.8,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHitDry = [[xplosml2]],
		soundStart = [[rocklit1]],
		startsmoke = 1,
		startVelocity = 650,
		texture1 = [[null]],
		texture2 = [[armsmoketrail]],
		texture3 = [[null]],
		texture4 = [[null]],
		tolerance = 9000,
		tracks = true,
		turnRate = 63000,
		turret = true,
		weaponAcceleration = 141,
		weaponTimer = 5,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 850,
		damage = {
			bombers = 190,
			default = 5,
			fighters = 190,
			flak_resistant = 190,
			unclassed_air = 190,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[tll_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllfirestarter_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[2x2b]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

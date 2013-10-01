-- UNITDEF -- ARMAASPD --
--------------------------------------------------------------------------------

local unitName = "armaaspd"

--------------------------------------------------------------------------------

local unitDef = {
	airsightdistance = 720,
	acceleration = 0.165,
	bmcode = 1,
	brakeRate = 0.165,
	buildCostEnergy = 1189,
	buildCostMetal = 107,
	builder = false,
	buildTime = 2207,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL SMALL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[All-terrain Anti-Air Kbot]],
	designation = [[ARM-AKML]],
	downloadable = 1,
	energyMake = 1.3,
	energyStorage = 0,
	energyUse = 0.3,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	maneuverleashlength = 640,
	maxDamage = 632,
	maxSlope = 16,
	maxVelocity = 1.4687,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TKBOT3]],
	name = [[Ra]],
	noAutoFire = false,
	noChaseCategory = [[ALL SUB]],
	objectName = [[ARMAASPD]],
	ovradjust = 1,
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 235,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 1020,
	unitname = [[armaaspd]],
	unitnumber = 6981,
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
			[1] = [[spider2]],
		},
		select = {
			[1] = [[spider3]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ARMRL_MISSILE]],
			onlyTargetCategory = [[VTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMRL_MISSILE = {
		areaOfEffect = 48,
		canattackground = false,
		cegTag = [[Arm_Def_AA_Rocket]],
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH2]],
		fireStarter = 70,
		flightTime = 1.5,
		guidance = true,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		metalpershot = 0,
		model = [[missile]],
		name = [[Missiles]],
		noSelfDamage = true,
		range = 765,
		reloadtime = 1.7,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHitDry = [[xplomed2]],
		soundStart = [[rockhvy2]],
		startsmoke = 1,
		startVelocity = 400,
		texture2 = [[armsmoketrail]],
		tolerance = 10000,
		tracks = true,
		turnRate = 63000,
		turret = true,
		weaponAcceleration = 150,
		weaponTimer = 5,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 750,
		damage = {
			bombers = 180,
			default = 5,
			fighters = 180,
			flak_resistant = 180,
			unclassed_air = 180,
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
		description = [[RA Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 40,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[armaaspd_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[RA Heap]],
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

-- UNITDEF -- ARM_GUARDIAN --
--------------------------------------------------------------------------------

local unitName = "arm_guardian"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 53811,
	buildCostMetal = 2169,
	builder = false,
	buildPic = [[arm_guardian.png]],
	buildTime = 36357,
	canAttack = true,
	canGuard = true,
	canstop = 1,
	category = [[ARM LEVEL2 WEAPON NOTAIR NOTSUB]],
	corpse = [[dead]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[-Heavy Plasma Battery]],
	designation = [[ARM-GUARD]],
	downloadable = 1,
	energyStorage = 200,
	energyUse = 0,
	explodeAs = [[MEDIUM_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	healtime = 11,
	highTrajectory = 2,
	iconType = [[building]],
	maxDamage = 8000,
	maxSlope = 10,
	maxWaterDepth = 22,
	metalStorage = 0,
	name = [[Resistant Guardian]],
	noAutoFire = false,
	objectName = [[arm_guardian]],
	radarDistance = 0,
	selfDestructAs = [[MEDIUM_BUILDING]],
	shootme = 1,
	side = [[Arm]],
	sightDistance = 612.5,
	standingfireorder = 2,
	threed = 1,
	unitname = [[arm_guardian]],
	unitnumber = 36,
	version = 1.2,
	workerTime = 0,
	yardMap = [[oooo]],
	zbuffer = 1,
	customparams = {
		canareaattack = 1,
	},
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:dgunflare]],
		},
	},
	sounds = {
		canceldestruct = [[cancel2]],
		cloak = [[kloak1]],
		uncloak = [[kloak1un]],
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
			[1] = [[twrturn3]],
		},
		select = {
			[1] = [[twrturn3]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[VTOL]],
			def = [[ARMFIXED_GUN1]],
			onlyTargetCategory = [[NOTAIR]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMFIXED_GUN1 = {
		accuracy = 75,
		areaOfEffect = 198,
		ballistic = true,
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.25,
		explosionGenerator = [[custom:FLASH96]],
		gravityaffected = [[true]],
		impulseBoost = 0.123,
		impulseFactor = 1.123,
		name = [[PlasmaCannon]],
		noSelfDamage = true,
		range = 1000,
		reloadtime = 2,
		renderType = 4,
		soundHit = [[xplomed2]],
		soundStart = [[cannhvy5]],
		startsmoke = 1,
		targetMoveError = 0.2,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 450,
		damage = {
			blackhydra = 526,
			commanders = 526,
			default = 700,
			flakboats = 526,
			gunships = 90,
			hgunships = 90,
			jammerboats = 526,
			l1bombers = 90,
			l1fighters = 90,
			l1subs = 5,
			l2bombers = 90,
			l2fighters = 90,
			l2subs = 5,
			l3subs = 5,
			otherboats = 526,
			seadragon = 526,
			vradar = 90,
			vtol = 90,
			vtrans = 90,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	core_immolator_heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Immolator Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[3x3d]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	dead = {
		blocking = true,
		category = [[core_corpses]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[core_immolator_heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[core_immolator_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

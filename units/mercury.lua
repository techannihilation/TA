-- UNITDEF -- MERCURY --
--------------------------------------------------------------------------------

local unitName = "mercury"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	airsightdistance = 1200,
	bmcode = 0,
	brakeRate = 0,
	buildCostEnergy = 46860,
	buildCostMetal = 1572,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 6,
	buildingGroundDecalSizeY = 6,
	buildingGroundDecalType = [[mercury_aoplane.dds]],
	buildPic = [[MERCURY.png]],
	buildTime = 38843,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[DEAD]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Long-Range Missile Tower]],
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 4250,
	maxSlope = 20,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Mercury]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[MERCURY]],
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[ARM]],
	sightDistance = 700,
	standingfireorder = 2,
	turnRate = 0,
	unitname = [[mercury]],
	useBuildingGroundDecal = true,
	workerTime = 0,
	yardMap = [[oooooooooooooooo]],
	featureDefs = nil,
	sounds = {
		activate = [[targon1]],
		canceldestruct = [[cancel2]],
		deactivate = [[targoff1]],
		underattack = [[warning1]],
		working = [[targsel1]],
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		select = {
			[1] = [[targsel1]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[MEDIUMVTOL SMALLVTOL TINYVTOL]],
			def = [[CORE_ADVSAM]],
			onlyTargetCategory = [[VTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORE_ADVSAM = {
		areaOfEffect = 800,
		canattackground = false,
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.25,
		explosionGenerator = [[custom:FLASHSMALLBUILDINGEX]],
		fireStarter = 90,
		flightTime = 3,
		guidance = true,
		impulseBoost = 0,
		impulseFactor = 0,
		lineOfSight = true,
		model = [[ADVSAM]],
		name = [[ADVSAM]],
		noSelfDamage = true,
		proximityPriority = -1.5,
		range = 3000,
		reloadtime = 10,
		renderType = 1,
		selfprop = true,
		smokedelay = 0,
		smokeTrail = true,
		soundHitDry = [[impact]],
		soundStart = [[launch]],
		startsmoke = 1,
		startVelocity = 1000,
		texture2 = [[coresmoketrail]],
		tolerance = 10000,
		tracks = true,
		trajectoryHeight = 0.55,
		turnRate = 99000,
		turret = true,
		weaponAcceleration = 300,
		weaponTimer = 8,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 1600,
		damage = {
			bombers = 2000,
			default = 5,
			fighters = 2000,
			flak_resistant = 2000,
			unclassed_air = 2000,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = true,
		category = [[corpses]],
		collisionvolumeoffsets = [[5.46072387695 -4.67773437478e-05 -1.26287078857]],
		collisionvolumescales = [[51.8714294434 86.3341064453 50.9362335205]],
		collisionvolumetype = [[Box]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[MERCURY_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 3,
		footprintZ = 3,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3X3A]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

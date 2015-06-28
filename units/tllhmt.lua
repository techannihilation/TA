-- UNITDEF -- TLLHMT --
--------------------------------------------------------------------------------

local unitName = "tllhmt"

--------------------------------------------------------------------------------

local unitDef = {
	airsightdistance = 1000,
	bmcode = 0,
	buildAngle = 16384,
	buildCostEnergy = 55200,
	buildCostMetal = 1850,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 5,
	buildingGroundDecalSizeY = 5,
	buildingGroundDecalType = [[tllhmt_aoplane.dds]],
	buildTime = 13341,
	canAttack = true,
	canGuard = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Long-Range Anti-Air Tower]],
	designation = [[]],
	energyUse = 0,
	explodeAs = [[MEDIUM_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 4725,
	maxSlope = 10,
	maxWaterDepth = 0,
	name = [[H.M.T.]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLHMT]],
	selfDestructAs = [[MEDIUM_BUILDING]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 750,
	standingfireorder = 2,
	unitname = [[tllhmt]],
	unitnumber = 817,
	useBuildingGroundDecal = true,
	workerTime = 0,
	yardMap = [[ooooooooo]],
	featureDefs = nil,
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
			badTargetCategory = [[MEDIUMVTOL SMALLVTOL TINYVTOL]],
			def = [[ARM_ADVSAM]],
			onlyTargetCategory = [[VTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARM_ADVSAM = {
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
		texture2 = [[armsmoketrail]],
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
			bombers = 2400,
			default = 5,
			fighters = 2400,
			flak_resistant = 2400,
			unclassed_air = 2400,
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
		description = [[wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 21,
		hitdensity = 105,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllhmt_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 2,
		hitdensity = 105,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3x3A]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

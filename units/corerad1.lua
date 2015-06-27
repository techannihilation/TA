-- UNITDEF -- CORERAD1 --
--------------------------------------------------------------------------------

local unitName = "corerad1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	airsightdistance = 1250,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 65536,
	buildCostEnergy = 8145,
	buildCostMetal = 1790,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 6,
	buildingGroundDecalSizeY = 6,
	buildingGroundDecalType = [[corerad1_aoplane.dds]],
	buildPic = [[CORERAD.png]],
	buildTime = 19958,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[CORERAD_DEAD]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Rapid-Fire Bomb-Resistant Medium-Range Missile Battery]],
	energyMake = 0,
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 4600,
	maxSlope = 10,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Rapid Eradicator]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CORERAD]],
	seismicSignature = 0,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[CORE]],
	sightDistance = 700,
	standingfireorder = 2,
	turnRate = 0,
	unitname = [[corerad1]],
	useBuildingGroundDecal = true,
	workerTime = 0,
	yardMap = [[oooooooooooooooo]],
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
			badTargetCategory = [[SMALLVTOL TINYVTOL]],
			def = [[COR_ERAD2]],
			onlyTargetCategory = [[VTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	COR_ERAD2 = {
		areaOfEffect = 144,
		burnblow = true,
		burst = 4,
		burstrate = 0.2,
		canattackground = false,
		cegTag = [[Core_Def_AA_Rocket]],
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:CORE_FIRE_SMALL]],
		fireStarter = 20,
		flightTime = 3,
		guidance = true,
		impulseBoost = 0,
		impulseFactor = 0,
		lineOfSight = true,
		model = [[missile]],
		name = [[ExplosiveRockets]],
		noSelfDamage = true,
		proximityPriority = -4,
		range = 1700,
		reloadtime = 0.8,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHitDry = [[xplosml2]],
		soundStart = [[rocklit1]],
		soundTrigger = true,
		startsmoke = 1,
		startVelocity = 750,
		texture1 = [[null]],
		texture2 = [[coresmoketrail]],
		texture3 = [[null]],
		texture4 = [[null]],	
		tolerance = 10000,
		tracks = true,
		turnRate = 25000,
		turret = true,
		weaponAcceleration = 200,
		weaponTimer = 3,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 1500,
		damage = {
			bombers = 160,
			default = 5,
			fighters = 140,
			flak_resistant = 120,
			unclassed_air = 140,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	CORERAD_DEAD = {
		blocking = true,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Eradicator Wreckage]],
		energy = 0,
		featureDead = [[CORERAD_HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 4,
		footprintZ = 4,
		height = 20,
		hitdensity = 100,
		metal = 0.5531 * unitDef.buildCostMetal,
		object = [[CORERAD_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	CORERAD_HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Eradicator Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 100,
		metal = 0.4425 * unitDef.buildCostMetal,
		object = [[3X3B]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

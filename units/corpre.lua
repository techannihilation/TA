-- UNITDEF -- CORPRE --
--------------------------------------------------------------------------------

local unitName = "corpre"

--------------------------------------------------------------------------------

local unitDef = {
	airsightdistance = 1000,
	bmcode = 0,
	buildAngle = 2000,
	buildCostEnergy = 1231120,
	buildCostMetal = 17760,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 8,
	buildingGroundDecalSizeY = 8,
	buildingGroundDecalType = [[corpre_aoplane.dds]],
	buildTime = 220000,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Very Heavy Anti-Air Flak Gun]],
	designation = [[oMgtehfLakZZzZ]],
	downloadable = 1,
	energyStorage = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 5,
	footprintZ = 5,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 8500,
	maxSlope = 20,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Precipitator]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CORPRE]],
	radarDistance = 1000,
	selfDestructAs = [[MEDIUM_BUILDING]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 800,
	standingfireorder = 2,
	unitname = [[corpre]],
	unitnumber = 161,
	useBuildingGroundDecal = true,
	workerTime = 0,
	yardMap = [[ooooo ooooo ooooo ooooo ooooo]],
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
			def = [[ADVFLAK]],
			onlyTargetCategory = [[VTOL SUPERSHIP]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ADVFLAK = {
		accuracy = 750,
		areaOfEffect = 192,
		ballistic = true,
		burnblow = true,
		cegTag = [[corflak-fx]],
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.5,
		energypershot = 2500,
		explosionGenerator = [[custom:FLASH3]],
		gravityaffected = [[TRUE]],
		impulseBoost = 0,
		impulseFactor = 0,
		minbarrelangle = -24,
		name = [[AdvancedFlakCannon]],
		noSelfDamage = true,
		range = 900,
		reloadtime = 0.25,
		renderType = 4,
		rgbColor = [[1 0.3 0.2]],
		soundHitDry = [[flakhit]],
		soundStart = [[flakfire]],
		startsmoke = 1,
		turret = true,
		unitsonly = 1,
		weaponTimer = 1,
		weaponType = [[Cannon]],
		weaponVelocity = 1550,
		damage = {
			bombers = 2100,
			default = 5,
			fighters = 2100,
			flak_resistant = 700,
			unclassed_air = 2100,
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
		footprintX = 5,
		footprintZ = 5,
		height = 25,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[corpre_dead]],
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
		footprintX = 5,
		footprintZ = 5,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[5x5a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

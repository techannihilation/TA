-- UNITDEF -- ARMHYS --
--------------------------------------------------------------------------------

local unitName = "armhys"

--------------------------------------------------------------------------------

local unitDef = {
	airsightdistance = 1000,
	bmcode = 0,
	buildAngle = 10000,
	buildCostEnergy = 1301120,
	buildCostMetal = 16200,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 8,
	buildingGroundDecalSizeY = 8,
	buildingGroundDecalType = [[armhys_aoplane.dds]],
	buildPic = [[ARMHYS.png]],
	buildTime = 210000,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Very Heavy Anti-Air Flak Gun]],
	energyStorage = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 5,
	footprintZ = 5,
	healtime = -1,
	maxDamage = 6500,
	maxSlope = 20,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Hysteric]],
	noAutoFire = false,
	objectName = [[ARMHYS]],
	radarDistance = 1000,
	selfDestructAs = [[MEDIUM_BUILDING]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 800,
	standingfireorder = 2,
	unitname = [[armhys]],
	useBuildingGroundDecal = true,
	workerTime = 0,
	yardMap = [[ooooooooooooooooooooooooo]],
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
		areaOfEffect = 256,
		ballistic = true,
		burnblow = true,
		cegTag = [[armflak-fx]],
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.75,
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
		rgbColor = [[0.2 0.3 0.9]],
		soundHitDry = [[flakhit]],
		soundStart = [[flakfire]],
		startsmoke = 1,
		turret = true,
		unitsonly = 1,
		weaponTimer = 1,
		weaponType = [[Cannon]],
		weaponVelocity = 1550,
		damage = {
			bombers = 1600,
			default = 5,
			fighters = 1600,
			flak_resistant = 550,
			unclassed_air = 1600,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[arm_corpses]],
		damage = 0.5000 * unitDef.maxDamage,
		description = [[Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 5,
		footprintZ = 5,
		height = 25,
		hitdensity = 100,
		metal = 0.6500 * unitDef.buildCostMetal,
		object = [[armhys_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.1667 * unitDef.maxDamage,
		description = [[Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 5,
		footprintZ = 5,
		height = 4,
		hitdensity = 100,
		metal = 0.2600 * unitDef.buildCostMetal,
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

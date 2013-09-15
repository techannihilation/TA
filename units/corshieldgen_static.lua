-- UNITDEF -- CORESHEILDGEN_STATIC --
--------------------------------------------------------------------------------

local unitName = "corshieldgen_static"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = true,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 2048,
	buildCostEnergy = 9300,
	buildCostMetal = 2370,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 8,
	buildingGroundDecalSizeY = 8,
	buildingGroundDecalType = [[corshieldgen_static_aoplane.dds]],
	buildPic = [[corshieldgen_static.png]],
	buildTime = 77166,
	canattack = false,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[DEAD]],
	description = [[Small Plasma Deflector]],
	energyStorage = 1500,
	energyUse = 0,
	explodeAs = [[CRAWL_BLAST]],
	footprintX = 5,
	footprintZ = 5,
	iconType = [[shield]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 2905,
	maxSlope = 10,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Oust Static]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	norestrict = 1,
	objectName = [[corshieldgen_static.3do]],
	onoffable = true,
	script = [[corshieldgen.cob]],
	seismicSignature = 0,
	selfDestructAs = [[MINE_NUKE]],
	side = [[CORE]],
	sightDistance = 273,
	turnRate = 0,
	unitname = [[corshieldgen_static]],
	--useBuildingGroundDecal = true,
	workerTime = 0,
	yardMap = [[ooooo ooooo ooooo ooooo ooooo]],
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
			[1] = [[drone1]],
		},
		select = {
			[1] = [[drone1]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[REPULSOR2]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	REPULSOR2 = {
		name = [[PlasmaRepulsor]],
		shieldAlpha = 0.3,
		shieldBadColor = [[1 0.2 0.2]],
		shieldEnergyUse = 450,
		shieldForce = 8,
		shieldGoodColor = [[0.2 1 0.2]],
		shieldInterceptType = 1,
		shieldMaxSpeed = 200,
		shieldPower = 3200,
		shieldPowerRegen = 29,
		shieldPowerRegenEnergy = 240.5,
		shieldRadius = 300,
		shieldRepulser = true,
		smartShield = true,
		visibleShield = true,
		visibleShieldRepulse = true,
		weaponType = [[Shield]],
		damage = {
			default = 100,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = true,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CORESHEILDGEN_STATIC_DEAD]],
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
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[2X2E]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

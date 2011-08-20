-- UNITDEF -- ARMGATE2 --
--------------------------------------------------------------------------------

local unitName = "armgate2"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = true,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 2048,
	buildCostEnergy = 8000,
	buildCostMetal = 1400,
	builder = false,
	buildPic = [[ARMGATE.png]],
	buildTime = 54139,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[DEAD]],
	description = [[Small plasma deflector]],
	energyStorage = 1500,
	energyUse = 0,
	explodeAs = [[CRAWL_BLAST]],
	footprintX = 3,
	footprintZ = 3,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 1000,
	maxSlope = 10,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Small Shield]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	norestrict = 1,
	objectName = [[ARMGATE2]],
	onoffable = true,
	script = [[armgate.cob]],
	seismicSignature = 0,
	selfDestructAs = [[MINE_NUKE]],
	side = [[ARM]],
	sightDistance = 273,
	smoothAnim = true,
	turnRate = 0,
	unitname = [[armgate2]],
	workerTime = 0,
	yardMap = [[oooooooooooooooo]],
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
		isShield = true,
		name = [[PlasmaRepulsor]],
		range = 340,
		shieldAlpha = 0.3,
		shieldBadColor = [[1 0.2 0.2]],
		shieldEnergyUse = 300,
		shieldForce = 8,
		shieldGoodColor = [[0.2 1 0.2]],
		shieldInterceptType = 1,
		shieldMaxSpeed = 200,
		shieldPower = 2900,
		shieldPowerRegen = 29,
		shieldPowerRegenEnergy = 240.5,
		shieldRadius = 340,
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
	ARMGATE1_HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Super Shield Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 4,
		footprintZ = 4,
		height = 4,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[4X4D]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	DEAD = {
		blocking = true,
		category = [[corpses]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[ARMGATE1_HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[ARMGATE1_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

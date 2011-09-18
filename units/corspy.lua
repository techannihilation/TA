-- UNITDEF -- CORSPY --
--------------------------------------------------------------------------------

local unitName = "corspy"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.24,
	activateWhenBuilt = true,
	amphibious = 1,
	bmcode = 1,
	brakeRate = 0.175,
	buildCostEnergy = 11452,
	buildCostMetal = 156,
	builder = false,
	buildPic = [[CORSPY.png]],
	buildTime = 22247,
	canGuard = false,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	cloakCost = 50,
	cloakCostMoving = 100,
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Radar-Invisible Spy Kbot]],
	energyMake = 8,
	energyStorage = 0,
	energyUse = 8,
	footprintX = 2,
	footprintZ = 2,
	idleAutoHeal = 5,
	idleTime = 1800,
	immunetoparalyzer = 1,
	maneuverleashlength = 640,
	maxDamage = 340,
	maxSlope = 32,
	maxVelocity = 2.07,
	maxWaterDepth = 112,
	metalStorage = 0,
	minCloakDistance = 75,
	mobilestandorders = 1,
	movementClass = [[KBOT2]],
	name = [[Parasite]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORSPY]],
	onoffable = true,
	seismicSignature = 2,
	selfDestructAs = [[SPYBOMBX]],
	selfDestructCountdown = 1,
	side = [[CORE]],
	sightDistance = 550,
	smoothAnim = true,
	standingmoveorder = 1,
	stealth = true,
	steeringmode = 2,
	turnRate = 1320,
	unitname = [[corspy]],
	upright = true,
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
			[1] = [[kbcormov]],
		},
		select = {
			[1] = [[kbcorsel]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = true,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CORSPY_DEAD]],
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
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[1X1A]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

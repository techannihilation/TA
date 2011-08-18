-- UNITDEF -- ARMSONAR --
--------------------------------------------------------------------------------

local unitName = "armsonar"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = true,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 8192,
	buildCostEnergy = 403,
	buildCostMetal = 20,
	builder = false,
	buildPic = [[ARMSONAR.png]],
	buildTime = 912,
	canAttack = false,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[DEAD]],
	description = [[Locates Water Units]],
	energyMake = 1,
	energyStorage = 0,
	energyUse = 1,
	explodeAs = [[SMALL_BUILDINGEX]],
	footprintX = 2,
	footprintZ = 2,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxangledif1 = 1,
	maxDamage = 50,
	maxSlope = 10,
	maxVelocity = 0,
	metalStorage = 0,
	minWaterDepth = 10,
	name = [[Sonar Station]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[ARMSONAR]],
	onoffable = true,
	seismicSignature = 0,
	selfDestructAs = [[SMALL_BUILDING]],
	side = [[ARM]],
	sightDistance = 515,
	smoothAnim = true,
	sonarDistance = 1200,
	turnRate = 0,
	unitname = [[armsonar]],
	workerTime = 0,
	yardMap = [[oooo]],
	featureDefs = nil,
	sounds = {
		activate = [[sonar1]],
		canceldestruct = [[cancel2]],
		deactivate = [[sonarde1]],
		underattack = [[warning1]],
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		select = {
			[1] = [[sonar1]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = false,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ARMSONAR_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

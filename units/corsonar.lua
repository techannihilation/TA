-- UNITDEF -- CORSONAR --
--------------------------------------------------------------------------------

local unitName = "corsonar"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = true,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 8192,
	buildCostEnergy = 399,
	buildCostMetal = 20,
	builder = false,
	buildPic = [[CORSONAR.png]],
	buildTime = 900,
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
	maxDamage = 52,
	maxSlope = 10,
	maxVelocity = 0,
	metalStorage = 0,
	minWaterDepth = 10,
	name = [[Sonar Station]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CORSONAR]],
	onoffable = true,
	seismicSignature = 0,
	selfDestructAs = [[SMALL_BUILDING]],
	side = [[CORE]],
	sightDistance = 485,
	smoothAnim = true,
	sonarDistance = 1200,
	turnRate = 0,
	unitname = [[corsonar]],
	workerTime = 0,
	yardMap = [[oooo]],
	featureDefs = nil,
	sounds = {
		activate = [[radar1]],
		canceldestruct = [[cancel2]],
		deactivate = [[sonarde2]],
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
			[1] = [[sonar2]],
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
		object = [[CORSONAR_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- ABUILDERLVL2 --
--------------------------------------------------------------------------------

local unitName = "abuilderlvl2"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.0266,
	activateWhenBuilt = true,
	airHoverFactor = 0,
	brakeRate = 1.596,
	buildCostEnergy = 3619,
	buildCostMetal = 668,
	buildDistance = 100,
	builder = true,
	buildTime = 3992.6475,
	canFly = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canReclaim = true,
	canstop = 1,
	category = [[ALL CONSTR MEDIUMVTOL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTWEAPON VTOL]],
	collide = false,
	corpse = [[dead]],
	cruiseAlt = 130,
	description = [[Makes Upgraded t1 Economy]],
	designation = [[ARN-MCA]],
	dontland = 1,
	energyMake = 20,
	energyStorage = 500,
	energyUse = 10.1,
	explodeAs = [[BIG_UNITEX]],
	footprintX = 4,
	footprintZ = 4,
	iconType = [[air]],
	maxDamage = 235,
	maxSlope = 10,
	maxVelocity = 8.379,
	maxWaterDepth = 0,
	metalMake = 0.5,
	metalStorage = 100,
	name = [[ditawn]],
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ABuilderLvl2]],
	radarDistance = 0,
	selfDestructAs = [[SMALLSHIP]],
	side = [[ARM]],
	sightDistance = 400,
	turnRate = 380.38,
	unitname = [[abuilderlvl2]],
	workerTime = 100,
	buildoptions = {
		[1] = [[ametalmakerlvl1]],
		[2] = [[arm_wind_generator]],
		[3] = [[armmex1]],
	},
	featureDefs = nil,
	sounds = {
		canceldestruct = [[cancel2]],
		underattack = [[warning1]],
		arrived = {
			[1] = [[armshipstop]],
		},
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
			[1] = [[armshipgo]],
		},
		select = {
			[1] = [[armselect]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = false,
		category = [[arm_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Ditawn Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 40,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ABuilderLvl2_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

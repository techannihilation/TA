-- UNITDEF -- CBUILDERLVL2 --
--------------------------------------------------------------------------------

local unitName = "cbuilderlvl2"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.0266,
	activateWhenBuilt = true,
	airHoverFactor = 0,
	brakeRate = 1.5295,
	buildCostEnergy = 3358,
	buildCostMetal = 654,
	buildDistance = 100,
	builder = true,
	buildTime = 4241.25,
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
	designation = [[GZ-MCA]],
	dontland = 1,
	energyMake = 20,
	energyStorage = 400,
	energyUse = 12.1,
	explodeAs = [[BIG_UNITEX]],
	footprintX = 4,
	footprintZ = 4,
	iconType = [[air]],
	maxDamage = 231,
	maxSlope = 10,
	maxVelocity = 7.182,
	maxWaterDepth = 0,
	metalMake = 0.5,
	metalStorage = 100,
	name = [[Constructer]],
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CBuilderLvl2.s3o]],
	radarDistance = 0,
	selfDestructAs = [[SMALLSHIP]],
	side = [[CORE]],
	sightDistance = 270,
	turnRate = 353.78,
	unitname = [[cbuilderlvl2]],
	workerTime = 100,
	buildoptions = {
		[1] = [[cmetalmakerlvl1]],
		[2] = [[core_wind_generator]],
		[3] = [[cormex1]],
	},
	featureDefs = nil,
	sounds = {
		canceldestruct = [[cancel2]],
		underattack = [[warning1]],
		arrived = {
			[1] = [[bigstop]],
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
			[1] = [[biggo]],
		},
		select = {
			[1] = [[bigsel]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = false,
		category = [[core_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 40,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CBuilderLvl2_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

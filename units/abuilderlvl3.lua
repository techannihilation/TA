-- UNITDEF -- ABUILDERLVL3 --
--------------------------------------------------------------------------------

local unitName = "abuilderlvl3"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.0133,
	airHoverFactor = 0,
	brakeRate = 1.997,
	buildCostEnergy = 500000.235,
	buildCostMetal = 24500.7225,
	buildDistance = 180,
	builder = true,
	buildTime = 340000,
	canFly = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canReclaim = true,
	canstop = 1,
	category = [[ALL CONSTR MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTWEAPON VTOL]],
	collide = false,
	corpse = [[dead]],
	cruiseAlt = 180,
	description = [[cruiser]],
	designation = [[ARM-SS-SUP]],
	dontland = 0,
	energyMake = 50,
	energyStorage = 750,
	energyUse = 30,
	explodeAs = [[SHIPBLAST]],
	footprintX = 3,
	footprintZ = 5,
	iconType = [[air]],
	maxDamage = 7000,
	maxSlope = 10,
	maxVelocity = 4.256,
	maxWaterDepth = 0,
	metalMake = 3.75,
	metalStorage = 100,
	name = [[Builder Level 3]],
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ABuilderLvl3]],
	radarDistance = 0,
	selfDestructAs = [[SHIPBLAST]],
	side = [[ARM]],
	sightDistance = 400,
	turnRate = 199.5,
	unitname = [[abuilderlvl3]],
	workerTime = 2000,
	buildoptions = {
		[1] = [[afusionplant]],
		[2] = [[ametalmakerlvl2]],
		[3] = [[ananotower]],
		[4] = [[ashipyardlvl3]],
		[5] = [[armgate1]],
		[6] = [[armbrtha1]],
		[7] = [[armvulc1]],
		[8] = [[armshltx1]],
		[9] = [[armtabi]],
		[10] = [[armanni1]],
		[11] = [[armfsilo]],
		[12] = [[armamd2]],
		[13] = [[armmas]],
		[14] = [[armt4store]],
		[15] = [[corpre]],
		[16] = [[cadvmsto]],
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
		description = [[Reliance Wreck]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 8,
		height = 40,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ABuilderLvl3_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

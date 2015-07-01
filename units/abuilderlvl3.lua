-- UNITDEF -- ABUILDERLVL3 --
--------------------------------------------------------------------------------

local unitName = "abuilderlvl3"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.015,
	airHoverFactor = 0,
	brakeRate = 3.5,
	buildCostEnergy = 500000,
	buildCostMetal = 24500,
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
	description = [[Cruiser]],
	designation = [[ARM-SS-SUP]],
	dontland = 0,
	energyMake = 50,
	energyStorage = 750,
	energyUse = 30,
	explodeAs = [[SHIPBLAST]],
	footprintX = 3,
	footprintZ = 5,
	hoverattack = true,
	iconType = [[air]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 7000,
	maxSlope = 10,
	maxVelocity = 3.2,
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
		[1] = [[armmas]],
		[2] = [[afusionplant]],
		[3] = [[ametalmakerlvl2]],
		[4] = [[armses]],
		[5] = [[cadvmsto]],
		[6] = [[armnanotc3]],
		[7] = [[armgate1]],
		[8] = [[armamd2]],
		[9] = [[armanni1]],
		[10] = [[armhys]],
		[11] = [[armbrtha1]],
		[12] = [[armvulc1]],
		[13] = [[armfsilo]],
		[14] = [[armtabi]],
		[15] = [[armshltx1]],
		[16] = [[ashipyardlvl3]],	
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

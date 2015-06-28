-- UNITDEF -- ANANOTOWER --
--------------------------------------------------------------------------------

local unitName = "ananotower"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.2394,
	bmcode = 1,
	brakeRate = 0.798,
	buildCostEnergy = 305000,
	buildCostMetal = 14500,
	buildDistance = 900,
	builder = true,
	canReclaim = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 4,
	buildingGroundDecalSizeY = 4,
	buildingGroundDecalType = [[ananotower_aoplane.dds]],
	buildTime = 85000,
	canAssist = true,
	canGuard = true,
	canMove = false,
	canPatrol = true,
	canreclamate = 0,
	canstop = 1,
	cantBeTransported = false,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[patrol]],
	description = [[Experimental Nanotower]],
	designation = [[A-MT1]],
	energyUse = 100,
	explodeAs = [[NANOBOOM3A]],
	floater = true,
	footprintX = 2,
	footprintZ = 2,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 0,
	mass = 1000000,
	maxDamage = 7500,
	maxSlope = 20,
	maxVelocity = 0,
	maxWaterDepth = 25,
	metalMake = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	name = [[Hardened Nanotower]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[ANanotower]],
	ovradjust = 1,
	radarDistance = 0,
	selfDestructAs = [[NANOBOOM2A]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 900,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 1.33,
	unitname = [[ananotower]],
	useBuildingGroundDecal = true,
	workerTime = 1200,
	buildoptions = {
			[1] = [[armpraet]],
			[2] = [[armgate1]],
			[3] = [[armanni1]],
			[4] = [[armsilo1]],
			[5] = [[armbrtha1]],
			[6] = [[armvulc2]],
		},
	featureDefs = nil,
	sounds = {
		build = [[nanlath1]],
		canceldestruct = [[cancel2]],
		repair = [[repair1]],
		underattack = [[warning1]],
		working = [[reclaim1]],
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
			[1] = [[varmmove]],
		},
		select = {
			[1] = [[varmsel]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[arm_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Arm Nanotower Remains]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ANanotower_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

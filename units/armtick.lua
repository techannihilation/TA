-- UNITDEF -- ARMTICK --
--------------------------------------------------------------------------------

local unitName = "armtick"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.18,
	ai_limit = [[limit ARMTICK 0]],
	ai_weight = [[weight ARMTICK 0]],
	bmcode = 1,
	brakeRate = 0.6,
	buildCostEnergy = 1419,
	buildCostMetal = 102,
	buildDistance = 60,
	builder = true,
	buildTime = 9254,
	canAttack = false,
	canCapture = false,
	canGuard = true,
	canMove = true,
	canreclamate = 1,
	canResurrect = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON SMALL]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[All-terrain Resurrection Kbot]],
	designation = [[ARM-PASPD2]],
	downloadable = 1,
	energyStorage = 0,
	energyUse = 0.4,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	maneuverleashlength = 640,
	maxDamage = 472,
	maxSlope = 14,
	maxVelocity = 1.8,
	maxWaterDepth = 22,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TKBOT3]],
	name = [[Tick]],
	noAutoFire = true,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMTICK]],
	ovradjust = 1,
	radarDistance = 50,
	resurrect = 1,
	selfDestructAs = [[BIG_UNITEX]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 140,
	spanishdescription = [[Kbot Todo-terreno de Captura]],
	spanishname = [[Garrapata]],
	standingfireorder = 2,
	standingmoveorder = 1,
	stealth = true,
	steeringmode = 1,
	threed = 1,
	turnRate = 925,
	unitname = [[armtick]],
	unitnumber = 4244,
	version = 1.2,
	workerTime = 200,
	zbuffer = 1,
	featureDefs = nil,
	sounds = {
		build = [[nanlath1]],
		canceldestruct = [[cancel2]],
		capture = [[capture1]],
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
			[1] = [[spider2]],
		},
		select = {
			[1] = [[spiderse]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[arm_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[armtick_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[2x2d]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

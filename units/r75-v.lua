-- UNITDEF -- R75-V --
--------------------------------------------------------------------------------

local unitName = "r75-v"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.1,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.05,
	buildCostEnergy = 1350,
	buildCostMetal = 90,
	builder = false,
	buildTime = 6747,
	canAttack = false,
	canGuard = true,
	canHover = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL HOVER MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON SMALL]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[armhplasma_dead]],
	defaultmissiontype = [[Standby]],
	description = [[Battlefield Intelligence Hover Radar and Sonar]],
	designation = [[ARM-BINTEL]],
	downloadable = 1,
	energyMake = 14,
	energyStorage = 0,
	energyUse = 42,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 0,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Hovercraft Reconnaissance]],
	frenchname = [[R75-V]],
	germandescription = [[Radar und SONAR-Hovercraft]],
	germanname = [[R75-V]],
	italiandescription = [[Hovercraft di ricognizione]],
	italianname = [[R75-V]],
	maneuverleashlength = 640,
	maxDamage = 490,
	maxSlope = 12,
	maxVelocity = 3.5,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANKHOVER3]],
	name = [[Detector]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[R75-V]],
	onoffable = true,
	radarDistance = 1490,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 290,
	sonarDistance = 1100,
	spanishdescription = [[Hovercraft de exploración]],
	spanishname = [[R75-V]],
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 310,
	unitname = [[r75-v]],
	unitnumber = 162,
	upright = true,
	version = 1.2,
	workerTime = 0,
	zbuffer = 1,
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
			[1] = [[hovsmok2]],
		},
		select = {
			[1] = [[hovsmsl2]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	armhplasma_dead = {
		blocking = true,
		category = [[arm_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Mamba Wreckage]],
		featureDead = [[armhplasma_heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[armhplasma_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	armhplasma_heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Mamba Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 80,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3x3c]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

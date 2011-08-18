-- UNITDEF -- WATCHER --
--------------------------------------------------------------------------------

local unitName = "watcher"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.05,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.08,
	buildCostEnergy = 629,
	buildCostMetal = 90,
	builder = false,
	buildTime = 6443,
	canGuard = true,
	canHover = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL HOVER MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON SMALL]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Batlefield Radar and Sonar Hovercraft]],
	designation = [[CORE-HOVERRADAR]],
	downloadable = 1,
	energyMake = 15,
	energyStorage = 0,
	energyUse = 50,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Hovercraft radar]],
	frenchname = [[Watcher]],
	germandescription = [[Radar Hovercraft]],
	germanname = [[Watcher]],
	italiandescription = [[Radar Hovercraft]],
	italianname = [[Watcher]],
	maneuverleashlength = 640,
	maxDamage = 510,
	maxSlope = 16,
	maxVelocity = 2.6,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANKHOVER3]],
	name = [[Watcher]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[WATCHER]],
	onoffable = true,
	radarDistance = 1600,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 250,
	sonarDistance = 1240,
	spanishdescription = [[Radar Hovercraft]],
	spanishname = [[Watcher]],
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 240,
	unitname = [[watcher]],
	unitnumber = 401,
	version = 1,
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
			[1] = [[hovmdok2]],
		},
		select = {
			[1] = [[hovmdsl2]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[core_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[heap]],
		featurereclaimate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 60,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[watcher_dead]],
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
		footprintX = 3,
		footprintZ = 3,
		hitdensity = 5,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3x3a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- TLLHTCB --
--------------------------------------------------------------------------------

local unitName = "tllhtcb"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.018,
	bmcode = 1,
	brakeRate = 0.036,
	buildCostEnergy = 29448,
	buildCostMetal = 5436,
	buildDistance = 185,
	builder = true,
	buildTime = 67242,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canreclamate = 1,
	canstop = 1,
	category = [[ALL CONSTR HUGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Tech Level 3]],
	designation = [[]],
	energyMake = 25,
	energyStorage = 100,
	energyUse = 0.1,
	explodeAs = [[BIG_UNITEX]],
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Niveau Tech 3]],
	frenchname = [[Véhicule de constr. évolué]],
	germandescription = [[Tech Level 3]],
	germanname = [[Verb. Konstr.-Fahrzeug]],
	maneuverleashlength = 320,
	maxDamage = 2124,
	maxSlope = 16,
	maxVelocity = 1.65,
	maxWaterDepth = 18,
	metalMake = 0.55,
	metalStorage = 100,
	mobilestandorders = 1,
	movementClass = [[HTANK3]],
	name = [[High Tech Construction Vehicle]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[TLLHTCB]],
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 230,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 250,
	unitname = [[tllhtcb]],
	unitnumber = 835,
	version = 3.1,
	workerTime = 320,
	zbuffer = 1,
	buildoptions = {
		[1] = [[tllmegacoldfus]],
		[2] = [[tllgate1]],
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
		category = [[tll_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllhtcb_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3x3b]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- TLLARCHNANO --
--------------------------------------------------------------------------------

local unitName = "tllarchnano"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.36,
	bmcode = 1,
	brakeRate = 0.07,
	buildCostEnergy = 2636,
	buildCostMetal = 357,
	buildDistance = 200,
	builder = true,
	buildTime = 13917,
	cainrepair = 1,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canreclamate = 1,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Ampibious Repair K-bot]],
	designation = [[]],
	energyMake = 11,
	energyUse = 3,
	explodeAs = [[BIG_UNITEX]],
	footprintX = 2,
	footprintZ = 2,
	frenchdescription = [[KBot de reparation amphibie]],
	germandescription = [[Amphibischer Reparatur KBot]],
	maneuverleashlength = 320,
	maxDamage = 1705,
	maxSlope = 255,
	maxVelocity = 3,
	maxWaterDepth = 255,
	metalMake = 0.4,
	mobilestandorders = 1,
	movementClass = [[AKBOT2]],
	name = [[Archnano]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[TLLARCHNANO]],
	ovradjust = 1,
	radarDistance = 100,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 305,
	smoothAnim = true,
	sonarDistance = 100,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 1020,
	unitname = [[tllarchnano]],
	unitnumber = 877,
	version = 3.1,
	workerTime = 280,
	zbuffer = 1,
	featureDefs = nil,
	sounds = {
		canceldestruct = [[cancel2]],
		underattack = [[tllwarning]],
		arrived = {
			[1] = [[spider]],
		},
		cant = {
			[1] = [[tllspidcant]],
		},
		count = {
			[1] = [[tllcount]],
			[2] = [[tllcount]],
			[3] = [[tllcount]],
			[4] = [[tllcount]],
			[5] = [[tllcount]],
			[6] = [[tllcount]],
		},
		ok = {
			[1] = [[spider]],
		},
		select = {
			[1] = [[tllspidsel]],
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
		height = 21,
		hitdensity = 105,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[TLLARCHNANO_dead]],
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
		height = 2,
		hitdensity = 105,
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

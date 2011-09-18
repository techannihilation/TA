-- UNITDEF -- TLLCONFUSER --
--------------------------------------------------------------------------------

local unitName = "tllconfuser"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.11,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.2,
	buildCostEnergy = 527,
	buildCostMetal = 177,
	builder = false,
	buildTime = 5775,
	canAttack = false,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON SMALL]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	damageModifier = 0.75,
	defaultmissiontype = [[Standby]],
	description = [[Radar Jammer Kbot]],
	designation = [[]],
	energyMake = 10,
	energyUse = 80,
	explodeAs = [[BIG_UNITEX]],
	footprintX = 2,
	footprintZ = 2,
	frenchdescription = [[Brouilleur de radar]],
	germandescription = [[Radarst�rer]],
	maneuverleashlength = 320,
	maxDamage = 611,
	maxSlope = 32,
	maxVelocity = 1.02,
	maxWaterDepth = 112,
	mobilestandorders = 1,
	movementClass = [[KBOT2]],
	name = [[Confuser]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[TLLCONFUSER]],
	onoffable = true,
	radarDistanceJam = 1000,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 200,
	smoothAnim = true,
	standingmoveorder = 0,
	steeringmode = 1,
	threed = 1,
	turnRate = 825,
	unitname = [[tllconfuser]],
	unitnumber = 863,
	version = 3.1,
	zbuffer = 1,
	featureDefs = nil,
	sounds = {
		canceldestruct = [[cancel2]],
		underattack = [[tllwarning]],
		cant = {
			[1] = [[wearoff]],
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
			[1] = [[varmmove]],
		},
		select = {
			[1] = [[tlljam3]],
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
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllconfuser_dead]],
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
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[2x2a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

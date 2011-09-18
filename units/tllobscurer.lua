-- UNITDEF -- TLLOBSCURER --
--------------------------------------------------------------------------------

local unitName = "tllobscurer"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.041,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.024,
	buildCostEnergy = 972,
	buildCostMetal = 112,
	builder = false,
	buildTime = 6622,
	canAttack = false,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON SMALL]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Mobile Radar Jammer]],
	designation = [[]],
	energyUse = 140,
	explodeAs = [[SMALL_UNITEX]],
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Brouilleur de radar mobile]],
	germandescription = [[Mobiler Radarstörer]],
	maneuverleashlength = 640,
	maxDamage = 832,
	maxSlope = 16,
	maxVelocity = 1.7,
	maxWaterDepth = 0,
	mobilestandorders = 1,
	movementClass = [[TANK3]],
	name = [[Obscurer]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[TLLOBSCURER]],
	onoffable = true,
	radarDistanceJam = 1350,
	selfDestructAs = [[SMALL_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 230,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 512,
	unitname = [[tllobscurer]],
	unitnumber = 838,
	version = 3.1,
	zbuffer = 1,
	featureDefs = nil,
	sounds = {
		activate = [[tlljam2]],
		canceldestruct = [[cancel2]],
		deactivate = [[radjam1]],
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
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 120,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllobscurer_dead]],
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
		hitdensity = 80,
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

-- UNITDEF -- TLLACS --
--------------------------------------------------------------------------------

local unitName = "tllacs"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.007,
	bmcode = 1,
	brakeRate = 0.03,
	buildCostEnergy = 7951,
	buildCostMetal = 998,
	buildDistance = 210,
	builder = true,
	buildTime = 15585,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canreclamate = 1,
	canstop = 1,
	category = [[ALL CONSTR LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTVTOL NOTWEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Tech Level 2]],
	designation = [[]],
	energyMake = 18,
	energyStorage = 50,
	energyUse = 0.1,
	explodeAs = [[SMALL_UNITEX]],
	floater = true,
	footprintX = 4,
	footprintZ = 4,
	frenchdescription = [[Niveau Tech 2]],
	frenchname = [[Navire de construction avancé]],
	germandescription = [[Tech Level 2]],
	germanname = [[Verb. Konstr.-Schiff]],
	maneuverleashlength = 320,
	maxDamage = 2105,
	maxVelocity = 2,
	metalMake = 0.95,
	metalStorage = 50,
	minWaterDepth = 15,
	mobilestandorders = 1,
	movementClass = [[BOAT4]],
	name = [[Advanced Construction Ship]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[TLLACS]],
	selfDestructAs = [[SMALL_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 240,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 350,
	unitname = [[tllacs]],
	unitnumber = 864,
	version = 3.1,
	waterline = 2,
	workerTime = 550,
	zbuffer = 1,
	buildoptions = {
		[1] = [[tlluwfusion]],
		[2] = [[tllauwmex]],
		[3] = [[tllplat]],
		[4] = [[tllsy]],
		[5] = [[tllasy]],
		[6] = [[tllsubpen]],
		[7] = [[tlllmtns]],
		[8] = [[tllnssam]],
		[9] = [[tllatorp]],
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
			[1] = [[sharmmov]],
		},
		select = {
			[1] = [[sharmsel]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = false,
		category = [[tll_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 4,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[TLLACS_dead]],
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
		footprintX = 4,
		footprintZ = 4,
		height = 4,
		hitdensity = 80,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[4x4A]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

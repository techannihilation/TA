-- UNITDEF -- TLLOBSERVER --
--------------------------------------------------------------------------------

local unitName = "tllobserver"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.045,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.018,
	buildCostEnergy = 1009,
	buildCostMetal = 190,
	builder = false,
	buildTime = 3655,
	canAttack = false,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	damageModifier = 0.75,
	defaultmissiontype = [[Standby]],
	description = [[Mobile Radar Kbot]],
	designation = [[]],
	energyMake = 15,
	energyUse = 45,
	explodeAs = [[BIG_UNITEX]],
	footprintX = 2,
	footprintZ = 2,
	frenchdescription = [[Radar KBot]],
	germandescription = [[Mobiler Radar-KBot]],
	maneuverleashlength = 320,
	maxDamage = 805,
	maxSlope = 16,
	maxVelocity = 1.15,
	maxWaterDepth = 0,
	mobilestandorders = 1,
	movementClass = [[kbot2]],
	name = [[Observer]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[TLLOBSERVER]],
	onoffable = true,
	radarDistance = 1800,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 240,
	smoothAnim = true,
	standingmoveorder = 0,
	steeringmode = 1,
	threed = 1,
	turnRate = 750,
	unitname = [[tllobserver]],
	unitnumber = 862,
	version = 3.1,
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
			[1] = [[kbarmmov]],
		},
		select = {
			[1] = [[kbarmsel]],
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
		object = [[tllobserver_dead]],
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

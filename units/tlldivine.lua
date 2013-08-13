-- UNITDEF -- TLLDIVINE --
--------------------------------------------------------------------------------

local unitName = "tlldivine"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.042,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.012,
	buildCostEnergy = 355,
	buildCostMetal = 292,
	isbuilder = false,
	buildTime = 3853,
	canAttack = false,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Mobile Radar]],
	designation = [[]],
	energyUse = 70,
	explodeAs = [[BIG_UNITEX]],
	footprintX = 3,
	footprintZ = 3,
	maneuverleashlength = 320,
	maxDamage = 835,
	maxVelocity = 1.55,
	maxWaterDepth = 0,
	mobilestandorders = 1,
	movementClass = [[TANK3]],
	name = [[Divine]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[TLLDIVINE]],
	onoffable = true,
	radarDistance = 2200,
	selfDestructAs = [[BIG_UNIT]],
	script = [[tlldivine.lua]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 320,
	standingmoveorder = 0,
	steeringmode = 1,
	turnRate = 380,
	unitname = [[tlldivine]],
	unitnumber = 839,
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
		hitdensity = 120,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tlldivine_dead]],
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

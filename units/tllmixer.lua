-- UNITDEF -- TLLMIXER --
--------------------------------------------------------------------------------

local unitName = "tllmixer"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.077,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.017,
	buildCostEnergy = 2181,
	buildCostMetal = 133,
	builder = false,
	buildTime = 6895,
	canAttack = false,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTVTOL NOTWEAPON SMALL]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Radar Jammer Ship]],
	designation = [[]],
	energyUse = 20,
	explodeAs = [[BIG_UNITEX]],
	floater = true,
	footprintX = 4,
	footprintZ = 4,
	frenchdescription = [[Brouilleur de radar]],
	germandescription = [[Radar-Störboot]],
	italiandescription = [[Nave - Crea disturbi Radar]],
	maneuverleashlength = 640,
	maxDamage = 540,
	maxVelocity = 2.6,
	minWaterDepth = 6,
	mobilestandorders = 1,
	movementClass = [[BOAT4]],
	name = [[Mixer]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[TLLMIXER]],
	onoffable = true,
	radarDistanceJam = 715,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 305,
	sonarDistance = 0,
	spanishdescription = [[Buque distorsionador de radar]],
	standingmoveorder = 0,
	steeringmode = 1,
	threed = 1,
	turnRate = 385,
	unitname = [[tllmixer]],
	unitnumber = 909,
	version = 3.1,
	waterline = 4,
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
		blocking = true,
		category = [[tll_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllmixer_dead]],
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
		hitdensity = 100,
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

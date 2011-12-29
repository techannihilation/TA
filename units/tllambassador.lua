-- UNITDEF -- TLLAMBASSADOR --
--------------------------------------------------------------------------------

local unitName = "tllambassador"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.009,
	bmcode = 1,
	brakeRate = 0.0182,
	buildAngle = 16384,
	buildCostEnergy = 4950,
	buildCostMetal = 945,
	builder = false,
	buildTime = 15438,
	canGuard = true,
	canload = 1,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTVTOL NOTWEAPON]],
	collisionVolumeOffsets = [[0 -13 0]],
	collisionVolumeScales = [[82.450546264648 100.45054626465 134.45054626465]],
	collisionVolumeTest = 1,
	collisionVolumeType = [[ellipsoid]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Armored Transport Ship]],
	designation = [[]],
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 0,
	floater = true,
	footprintX = 6,
	footprintZ = 6,
	frenchdescription = [[Cargo]],
	germandescription = [[Transportschiff]],
	italiandescription = [[Nave da trasporto]],
	maneuverleashlength = 640,
	maxDamage = 15200,
	maxVelocity = 1.85,
	minWaterDepth = 12,
	mobilestandorders = 0,
	movementClass = [[DBOAT6]],
	name = [[Ambassador]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[TLLAMBASSADOR]],
	scale = 0.5,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 250,
	spanishdescription = [[Transporte anfibio]],
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	transportCapacity = 20,
	transportSize = 3,
	turnRate = 110,
	unitname = [[tllambassador]],
	unitnumber = 943,
	version = 3.1,
	waterline = 6,
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
		footprintX = 6,
		footprintZ = 6,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllambassador_dead]],
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
		footprintX = 6,
		footprintZ = 6,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[4x4c]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

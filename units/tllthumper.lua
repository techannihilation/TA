-- UNITDEF -- TLLTHUMPER --
--------------------------------------------------------------------------------

local unitName = "tllthumper"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.03,
	bmcode = 1,
	brakeRate = 0.02,
	buildCostEnergy = 5720,
	buildCostMetal = 2480,
	builder = false,
	buildTime = 19280,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[standby]],
	description = [[Very Heavy Assault Tank]],
	designation = [[]],
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	frenchdescription = [[Char d'assaut très lourd]],
	germandescription = [[Überschwerer Gefechtspanzer]],
	italiandescription = [[Carro armato super-pesante da attacco]],
	maneuverleashlength = 300,
	maxDamage = 10800,
	maxSlope = 20,
	maxVelocity = 0.78,
	maxWaterDepth = 25,
	mobilestandorders = 1,
	movementClass = [[HTANK4]],
	name = [[Thumper]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[TLLTHUMPER]],
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 650,
	spanishdescription = [[Tanque súper pesado]],
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 200,
	unitname = [[tllthumper]],
	unitnumber = 834,
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
			[1] = [[tcormove]],
		},
		select = {
			[1] = [[tcorsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[TLL_Thumper]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	TLL_Thumper = {
		areaOfEffect = 311,
		ballistic = true,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH96]],
		gravityaffected = [[true]],
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		name = [[HeavyCannon]],
		noSelfDamage = true,
		range = 730,
		reloadtime = 3.4,
		renderType = 4,
		soundHit = [[xplomed4]],
		soundStart = [[cannhvy2]],
		startsmoke = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 313.9267578125,
		damage = {
			default = 1000,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


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
		hitdensity = 200,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[TLLTHUMPER_dead]],
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
		object = [[4x4C]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

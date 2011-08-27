-- UNITDEF -- TLLLBT --
--------------------------------------------------------------------------------

local unitName = "tlllbt"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 3431,
	buildCostMetal = 2179,
	builder = false,
	buildTime = 15843,
	canAttack = true,
	canGuard = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Plasma Tower]],
	designation = [[]],
	energyUse = 0,
	explodeAs = [[MEDIUM_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Batterie à plasma stationnaire]],
	germandescription = [[Stationäre Plasmawerfer-Batterie]],
	highTrajectory = 2,
	italiandescription = [[Batteria al plasma]],
	maxDamage = 3452,
	maxSlope = 10,
	maxWaterDepth = 0,
	name = [[Reliser]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLLBT]],
	selfDestructAs = [[MEDIUM_BUILDING]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 350,
	spanishdescription = [[Cañón de plasma pesado]],
	standingfireorder = 2,
	threed = 1,
	unitname = [[tlllbt]],
	unitnumber = 807,
	version = 1,
	yardMap = [[ooooooooo]],
	zbuffer = 1,
	featureDefs = nil,
	sounds = {
		canceldestruct = [[cancel2]],
		cloak = [[kloak1]],
		uncloak = [[kloak1un]],
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
			[1] = [[twrturn3]],
		},
		select = {
			[1] = [[twrturn3]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[TINY]],
			def = [[TLLFIXED_GUN]],
			mainDir = [[0 1 0]],
			maxAngleDif = 230,
			onlyTargetCategory = [[NOTVTOL]],
		},
		[2] = {
			badTargetCategory = [[TINY]],
			def = [[TLLFIXED_GUN_HIGH]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	TLLFIXED_GUN = {
		accuracy = 75,
		areaOfEffect = 128,
		ballistic = true,
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.25,
		explosionGenerator = [[custom:FLASH96]],
		gravityaffected = [[true]],
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		name = [[PlasmaCannon]],
		noSelfDamage = true,
		range = 1220,
		reloadtime = 3.25,
		renderType = 4,
		soundHit = [[xplomed2]],
		soundStart = [[cannhvy5]],
		startsmoke = 1,
		targetMoveError = 0.2,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 450,
		damage = {
			commanders = 526,
			default = 263,
			experimental_ships = 526,
			ships = 394.5,
			subs = 5,
		},
	},
	TLLFIXED_GUN_HIGH = {
		accuracy = 75,
		areaOfEffect = 192,
		ballistic = true,
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.5,
		explosionGenerator = [[custom:FLASH96]],
		gravityaffected = [[true]],
		impulseBoost = 0.123,
		impulseFactor = 2,
		name = [[PlasmaCannon]],
		noSelfDamage = true,
		proximityPriority = -2,
		range = 1220,
		reloadtime = 7,
		renderType = 4,
		soundHit = [[xplomed2]],
		soundStart = [[cannhvy5]],
		startsmoke = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 440,
		damage = {
			commanders = 922,
			default = 461,
			experimental_ships = 922,
			ships = 691.5,
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
		description = [[wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 21,
		hitdensity = 105,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tlllbt_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 2,
		hitdensity = 105,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3x3D]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

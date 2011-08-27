-- UNITDEF -- TLLPLASMA --
--------------------------------------------------------------------------------

local unitName = "tllplasma"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 4671,
	buildCostMetal = 2102,
	builder = false,
	buildTime = 18245,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	damageModifier = 0.125,
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Pop-up heavy cannon]],
	designation = [[T-PC-L]],
	downloadable = 1,
	energyUse = 0,
	explodeAs = [[MEDIUM_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Canon lourd Pop-up]],
	germandescription = [[Schwere Tarn-Kanone]],
	italiandescription = [[Cannone pesante a comparsa]],
	maxDamage = 2551,
	maxSlope = 10,
	maxWaterDepth = 0,
	name = [[Happlic]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[tllplasma]],
	selfDestructAs = [[MEDIUM_BUILDING]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 310,
	spanishdescription = [[Cañon de ataque pesado]],
	standingfireorder = 2,
	threed = 1,
	unitname = [[tllplasma]],
	unitnumber = 878,
	version = 3.1,
	workerTime = 0,
	yardMap = [[ooo ooo ooo]],
	zbuffer = 1,
	featureDefs = nil,
	sounds = {
		canceldestruct = [[cancel2]],
		cloak = [[kloak2]],
		uncloak = [[kloak2un]],
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
			[1] = [[servmed1]],
		},
		select = {
			[1] = [[servmed1]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[TINY]],
			def = [[ARMAMB_GUN]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMAMB_GUN = {
		accuracy = 400,
		areaOfEffect = 152,
		ballistic = true,
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.25,
		explosionGenerator = [[custom:FLASH96]],
		gravityaffected = [[true]],
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		minbarrelangle = -35,
		name = [[PopupCannon]],
		noSelfDamage = true,
		predictBoost = 0.2,
		range = 1520,
		reloadtime = 1.8,
		renderType = 4,
		soundHit = [[xplomed2]],
		soundStart = [[cannhvy5]],
		startsmoke = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 452.99005126953,
		damage = {
			default = 345,
			experimental_ships = 690,
			ships = 517.5,
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
		footprintX = 3,
		footprintZ = 3,
		height = 12,
		hitdensity = 103,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllplasma_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Metal Shards]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		hitdensity = 8,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3x3a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

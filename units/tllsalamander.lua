-- UNITDEF -- TLLSALAMANDER --
--------------------------------------------------------------------------------

local unitName = "tllsalamander"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.02,
	bmcode = 1,
	brakeRate = 0.0085,
	buildCostEnergy = 1425,
	buildCostMetal = 428,
	builder = false,
	buildTime = 6351,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Medium Amphibious Tank]],
	designation = [[]],
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Char amphibie]],
	germandescription = [[Amphibienpanzer]],
	italiandescription = [[Carro armato anfibio]],
	maneuverleashlength = 640,
	maxDamage = 3220,
	maxSlope = 12,
	maxVelocity = 1.35,
	maxWaterDepth = 255,
	mobilestandorders = 1,
	movementClass = [[ATANK3]],
	name = [[Salamander]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[TLLSALAMANDER]],
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 325,
	spanishdescription = [[Tanque anfibio]],
	standingfireorder = 2,
	standingmoveorder = 0,
	steeringmode = 1,
	threed = 1,
	turnRate = 880,
	unitname = [[tllsalamander]],
	unitnumber = 837,
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
			[1] = [[tarmmove]],
		},
		select = {
			[1] = [[tarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ARM_PINCER_GAUSS]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARM_PINCER_GAUSS = {
		areaOfEffect = 8,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:LIGHT_PLASMA]],
		impactonly = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		name = [[PincerCannon]],
		noSelfDamage = true,
		range = 305,
		reloadtime = 1.5,
		renderType = 4,
		soundHit = [[xplomed2]],
		soundStart = [[cannhvy1]],
		startsmoke = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 450,
		damage = {
			default = 250,
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
		height = 20,
		hitdensity = 120,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllsalamander_dead]],
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
		object = [[3x3b]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

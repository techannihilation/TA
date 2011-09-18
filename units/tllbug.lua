-- UNITDEF -- TLLBUG --
--------------------------------------------------------------------------------

local unitName = "tllbug"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.4,
	bmcode = 1,
	brakeRate = 0.4,
	buildCostEnergy = 112,
	buildCostMetal = 31,
	builder = false,
	buildTime = 1350,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL TINY WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Fast Scout Kbot]],
	designation = [[]],
	energyMake = 0.4,
	energyUse = 0.4,
	explodeAs = [[SMALL_UNITEX]],
	firestandorders = 1,
	footprintX = 1,
	footprintZ = 1,
	frenchdescription = [[Kbot espion rapide]],
	germandescription = [[Schneller Scout-Kbot]],
	maneuverleashlength = 640,
	maxDamage = 75,
	maxSlope = 255,
	maxVelocity = 4.5,
	maxWaterDepth = 112,
	mobilestandorders = 1,
	movementClass = [[KBOT1]],
	name = [[Bug]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[TLLBUG]],
	selfDestructAs = [[SMALL_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 500,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 2,
	steeringmode = 2,
	threed = 1,
	turnRate = 1300,
	unitname = [[tllbug]],
	unitnumber = 824,
	upright = true,
	version = 3.2,
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
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[TLLLIGHT_PARALYZER]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	TLLLIGHT_PARALYZER = {
		areaOfEffect = 8,
		beamlaser = 1,
		beamTime = 0.1,
		burstrate = 0.2,
		coreThickness = 0.1,
		craterBoost = 0,
		craterMult = 0,
		energypershot = 2,
		explosionGenerator = [[custom:SMALL_YELLOW_BURN]],
		fireStarter = 50,
		impactonly = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		laserFlareSize = 2,
		lineOfSight = true,
		name = [[Laser]],
		noSelfDamage = true,
		paralyzer = true,
		paralyzertime = 38,
		range = 150,
		reloadtime = 0.7,
		renderType = 0,
		rgbColor = [[1 1 0]],
		soundHit = [[lashit]],
		soundStart = [[lasrlit1]],
		soundTrigger = true,
		targetMoveError = 0.1,
		thickness = 0.75,
		tolerance = 10000,
		turret = true,
		weaponType = [[BeamLaser]],
		weaponVelocity = 600,
		damage = {
			commanders = 20,
			default = 400,
			raider_resistant = 200,
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
		footprintX = 1,
		footprintZ = 1,
		height = 12,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllbug_dead]],
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
		footprintX = 1,
		footprintZ = 1,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[1x1b]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

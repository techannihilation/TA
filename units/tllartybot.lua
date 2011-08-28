-- UNITDEF -- TLLARTYBOT --
--------------------------------------------------------------------------------

local unitName = "tllartybot"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.4,
	bmcode = 1,
	brakeRate = 0.18,
	buildCostEnergy = 2161,
	buildCostMetal = 947,
	builder = false,
	buildTime = 10171,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Heavy Gauss Kbot]],
	designation = [[TL-ARTY]],
	energyMake = 2.4,
	energyStorage = 0,
	energyUse = 1.6,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Artillerie Kbot]],
	germandescription = [[Gauss-Kbot]],
	italiandescription = [[Kbot gauss]],
	maneuverleashlength = 640,
	maxDamage = 2115,
	maxSlope = 16,
	maxVelocity = 1.7,
	maxWaterDepth = 25,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[KBOT3]],
	name = [[Troll]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[TLLARTYBOT]],
	ovradjust = 1,
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 400,
	smoothAnim = true,
	spanishdescription = [[Kbot gauss]],
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	threed = 1,
	turnRate = 512,
	unitname = [[tllartybot]],
	unitnumber = 924,
	upright = true,
	version = 1,
	workerTime = 0,
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
			[1] = [[kbcormov]],
		},
		select = {
			[1] = [[kbcorsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[GAUSS]],
			onlyTargetCategory = [[NOTVTOL]],
		},
		[2] = {
			def = [[GAUSS]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	GAUSS = {
		areaOfEffect = 8,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH1nd]],
		impactonly = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		minbarrelangle = -15,
		name = [[GaussCannon]],
		noSelfDamage = true,
		range = 620,
		reloadtime = 3.75,
		renderType = 4,
		soundHit = [[xplomed2]],
		soundStart = [[cannhvy1]],
		startsmoke = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 550,
		damage = {
			default = 300,
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
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllartybot_dead]],
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
		hitdensity = 5,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3x3b]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- CHAMP --
--------------------------------------------------------------------------------

local unitName = "champ"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.011,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.026,
	buildCostEnergy = 22955,
	buildCostMetal = 2126,
	builder = false,
	buildTime = 26678,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	cantBeTransported = true,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Very Heavy Gauss Tank]],
	designation = [[warpacer@aol.com]],
	downloadable = 1,
	energyMake = 5.5,
	energyStorage = 0,
	energyUse = 1,
	explodeAs = [[BIG_UNIT]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	frenchdescription = [[Char Gauss très lourd]],
	frenchname = [[Champion]],
	germandescription = [[Überschwerer Gausspanzer]],
	germanname = [[Champion]],
	hideDamage = false,
	immunetoparalyzer = 1,
	maneuverleashlength = 1200,
	maxDamage = 22245,
	maxSlope = 18,
	maxVelocity = 1,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[htank4]],
	name = [[Champion]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[champ]],
	radarDistance = 0,
	selfDestructAs = [[BIG_UNITEX]],
	shootme = 0,
	side = [[CORE]],
	sightDistance = 350,
	standingfireorder = 2,
	standingmoveorder = 1,
	stealth = true,
	steeringmode = 2,
	threed = 1,
	turnRate = 244,
	unitname = [[champ]],
	unitnumber = 623,
	upright = false,
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
			[1] = [[tarmmove]],
		},
		select = {
			[1] = [[tarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[champ_gauss]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	champ_gauss = {
		areaOfEffect = 35,
		craterBoost = 0,
		craterMult = 0,
		explosionart = [[explode5]],
		explosiongaf = [[fx]],
		id = 229,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lavaexplosionart = [[lavasplashsm]],
		lavaexplosiongaf = [[fx]],
		lineOfSight = true,
		minbarrelangle = -15,
		name = [[Heavy-Gauss]],
		noSelfDamage = true,
		range = 750,
		reloadtime = 1,
		renderType = 4,
		soundHit = [[xplomed2]],
		soundStart = [[cannhvy1]],
		startsmoke = 1,
		turret = true,
		waterexplosionart = [[h2oboom1]],
		waterexplosiongaf = [[fx]],
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
		category = [[arm_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[champ_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

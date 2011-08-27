-- UNITDEF -- NSAAGRIZ --
--------------------------------------------------------------------------------

local unitName = "nsaagriz"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.041,
	bmcode = 1,
	brakeRate = 0.095,
	buildCostEnergy = 791817,
	buildCostMetal = 25892,
	builder = false,
	buildPic = [[krypto-blaster.png]],
	buildTime = 789620,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	cantBeTransported = true,
	category = [[ALL HUGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1998 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	damageModifier = 0.09,
	defaultmissiontype = [[Standby]],
	description = [[Armored Mobile Blaster]],
	designation = [[NSA-AGRIZ]],
	downloadable = 1,
	energyMake = 0.6,
	energyStorage = 0,
	energyUse = 15200,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	frenchdescription = [[Krypto-Blaster]],
	frenchname = [[Krypto-Blaster]],
	germaname = [[Krypto-Blaster]],
	germandescription = [[Krypto-Blaster]],
	healtime = 50,
	immunetoparalyzer = 1,
	italiandescription = [[Krypto-Blaster]],
	italianname = [[Krypto-Blaster]],
	maneuverleashlength = 640,
	maxDamage = 16785,
	maxSlope = 30,
	maxVelocity = 0.9,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestanorders = 1,
	movementClass = [[HTANK4]],
	name = [[Krypto-Blaster]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[NSAAGRIZ]],
	onoffable = true,
	ovradjust = 1,
	radarDistance = 1000,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 240,
	spanishdescription = [[Krypto-Blaster]],
	spanishname = [[Krypto-Blaster]],
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	threed = 1,
	turnRate = 600,
	unitname = [[nsaagriz]],
	unitnumber = 1413,
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
			[1] = [[kbarmmov]],
		},
		select = {
			[1] = [[kbarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[MEDIUM SMALL TINY]],
			def = [[K666BLASTER]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	K666BLASTER = {
		accuracy = 100,
		areaOfEffect = 32,
		beamWeapon = true,
		color = 169,
		color2 = 166,
		duration = 1.79,
		energypershot = 2100,
		explosionart = [[PINKBOOM1]],
		explosiongaf = [[Hellfirelaser]],
		fireStarter = 0,
		id = 255,
		lavaexplosionart = [[lavasplashsm]],
		lavaexplosiongaf = [[fx]],
		lineOfSight = true,
		metalpershot = 0,
		minbarrelangle = 0,
		name = [[Heavy Blaster Doomer's creation]],
		noExplode = true,
		pitchtolerance = 48000,
		range = 1400,
		reloadtime = 0,
		renderType = 7,
		soundHit = [[krypton]],
		soundStart = [[krypto]],
		tolerance = 24000,
		turret = true,
		waterexplosionart = [[PINKBOOM1]],
		waterexplosiongaf = [[Hellfirelaser]],
		weaponType = [[LightningCannon]],
		weaponVelocity = 600,
		damage = {
			default = 1260,
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
		description = [[Blaster Wreckage]],
		featureDead = [[heap]],
		featurereclaimate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 60,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[nsaagriz_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Blaster Debris]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		hitdensity = 5,
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

-- UNITDEF -- ARMAMSPD --
--------------------------------------------------------------------------------

local unitName = "armamspd"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.165,
	amphibious = 1,
	bmcode = 1,
	brakeRate = 0.165,
	buildCostEnergy = 2645,
	buildCostMetal = 353,
	builder = false,
	buildTime = 6711,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[heap]],
	defaultmissiontype = [[Standby]],
	description = [[All-terrain Battle Amphibious Kbot]],
	designation = [[ARM-AMSPD]],
	downloadable = 1,
	energyMake = 0.6,
	energyStorage = 0,
	energyUse = 0.6,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	maneuverleashlength = 640,
	maxDamage = 1987,
	maxVelocity = 1.5,
	maxWaterDepth = 255,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[AMPHKBOT]],
	name = [[Namor]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMAMSPD]],
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 440,
	spanishdescription = [[Kbot Anfíbio Todo-terreno]],
	spanishname = [[Namor]],
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 1015,
	unitname = [[armamspd]],
	unitnumber = 6522,
	version = 1.2,
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
			[1] = [[spider2]],
		},
		select = {
			[1] = [[spider3]],
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
			default = 116,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Heap]],
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[2x2a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- ARMPOD --
--------------------------------------------------------------------------------

local unitName = "armpod"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.152587891,
	bmcode = 1,
	brakeRate = 0.152587891,
	buildCostEnergy = 32425,
	buildCostMetal = 2600,
	builder = false,
	buildTime = 35754,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	cantBeTransported = true,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionvolumeoffsets = [[0 5 2]],
	collisionvolumescales = [[54 81 54]],
	collisionvolumetest = 0,
	collisionvolumetype = [[Ell]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Montros Killer]],
	designation = [[ATAS]],
	energyMake = 0.7,
	energyStorage = 0,
	energyUse = 15,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	frenchdescription = [[Destructeur de Monstro]],
	frenchname = [[Pod]],
	germandescription = [[Monstro Killer]],
	germanname = [[Pod]],
	maneuverleashlength = 640,
	maxDamage = 11548,
	maxVelocity = 0.9,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[HKBOT4]],
	name = [[Pod]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMPOD]],
	onoffable = true,
	radarDistance = 1500,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 210,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 1020,
	unitname = [[armpod]],
	unitnumber = 852456,
	version = 3,
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
			[1] = [[necrok2]],
		},
		select = {
			[1] = [[necrsel2]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ARMPOD_WEAPON]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMPOD_WEAPON = {
		areaOfEffect = 25,
		explosionart = [[explode5]],
		explosiongaf = [[fx]],
		id = 170,
		lavaexplosionart = [[lavasplashsm]],
		lavaexplosiongaf = [[fx]],
		lineOfSight = true,
		minbarrelangle = -15,
		name = [[Gauss Cannon]],
		range = 1000,
		reloadtime = 1.5,
		renderType = 4,
		soundHit = [[xplomed2]],
		soundStart = [[canonpod]],
		startsmoke = 1,
		tolerance = 300,
		turret = true,
		waterexplosionart = [[h2oboom1]],
		waterexplosiongaf = [[fx]],
		weaponType = [[Cannon]],
		weaponVelocity = 600,
		damage = {
			default = 550,
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
		object = [[armpod_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

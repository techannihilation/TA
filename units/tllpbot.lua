-- UNITDEF -- TLLPBOT --
--------------------------------------------------------------------------------

local unitName = "tllpbot"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.21,
	bmcode = 1,
	brakeRate = 0.23,
	buildCostEnergy = 975,
	buildCostMetal = 270,
	builder = false,
	buildTime = 3877,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionVolumeOffsets = [[0 -4 0]],
	collisionVolumeScales = [[31 39 31]],
	collisionVolumeTest = 1,
	collisionVolumeType = [[CYlY]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Rapid Plasma Kbot]],
	designation = [[TL-PBT]],
	energyMake = 0.6,
	energyUse = 0.6,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	maneuverleashlength = 640,
	maxDamage = 1375,
	maxSlope = 14,
	maxVelocity = 1.6,
	maxWaterDepth = 12,
	mobilestandorders = 1,
	movementClass = [[KBOT2]],
	name = [[Rainman]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[TLLpbot]],
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 360,
	standingfireorder = 2,
	standingmoveorder = 0,
	steeringmode = 2,
	threed = 1,
	turnRate = 1020,
	unitname = [[tllpbot]],
	unitnumber = 823,
	upright = true,
	version = 3.1,
	zbuffer = 1,
	featureDefs = nil,
	sounds = {
		canceldestruct = [[cancel2]],
		underattack = [[tllwarning]],
		cant = {
			[1] = [[wearoff]],
		},
		count = {
			[1] = [[tllcount]],
			[2] = [[tllcount]],
			[3] = [[tllcount]],
			[4] = [[tllcount]],
			[5] = [[tllcount]],
			[6] = [[tllcount]],
		},
		ok = {
			[1] = [[tllkbotmove]],
		},
		select = {
			[1] = [[tllunitok]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[TLL_PBOT]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	TLL_PBOT = {
		areaOfEffect = 48,
		ballistic = true,
		cegTag = [[Trail_cannon]],
		craterBoost = 0,
		craterMult = 0,
		gravityaffected = [[TRUE]],
		id = 216,
		impulseBoost = 0,
		impulseFactor = 0,
		minbarrelangle = -35,
		name = [[Light Gauss]],
		nogap = 1,
		range = 365,
		reloadtime = 0.8,
		renderType = 4,
		rgbColor = [[0.81 0.54 0]],
		separation = 0.45,
		size = 1.36,
		sizedecay = -0.15,
		soundHitDry = [[xplosml3]],
		soundStart = [[canlite3]],
		stages = 20,
		startsmoke = 1,
		tolerance = 500,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 250,
		damage = {
			default = 75,
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
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllpbot_dead]],
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
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[2x2d]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

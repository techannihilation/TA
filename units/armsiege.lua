-- UNITDEF -- ARMSIEGE --
--------------------------------------------------------------------------------

local unitName = "armsiege"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.01,
	antiweapons = 1,
	bmcode = 1,
	brakeRate = 0.01,
	buildCostEnergy = 125898,
	buildCostMetal = 5465,
	builder = false,
	buildTime = 40788,
	canAttack = true,
	canGuard = true,
	canHover = false,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL HUGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionVolumeOffsets = [[-1 -6 0]],
	collisionVolumeScales = [[65 48 98]],
	collisionVolumeTest = 1,
	collisionVolumeType = [[ellipsoid]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Mobile Siege Vehicle]],
	designation = [[RM]],
	energyMake = 0.4,
	energyStorage = 0,
	energyUse = 2.4,
	explodeAs = [[ATOMIC_BLAST]],
	firestandorders = 1,
	footprintX = 5,
	footprintZ = 5,
	maneuverleashlength = 640,
	maxDamage = 30600,
	maxSlope = 12,
	maxVelocity = 1.7,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[VHTANK5]],
	name = [[Demolisher]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMSIEGE]],
	radarDistance = 0,
	selfDestructAs = [[ATOMIC_BLASTSML]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 768,
	standingfireorder = 1,
	standingmoveorder = 0,
	steeringmode = 1,
	threed = 1,
	turnRate = 192,
	unitname = [[armsiege]],
	unitnumber = 46,
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
			[1] = [[varmmove]],
		},
		select = {
			[1] = [[varmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[SMALL TINY]],
			def = [[CANNON_SIEGE]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CANNON_SIEGE = {
		accuracy = 750,
		aimrate = 2500,
		areaOfEffect = 239,
		ballistic = true,
		burst = 1,
		burstrate = 1.5,
		cegTag = [[Trail_cannon]],
		craterBoost = 0,
		craterMult = 0,
		energypershot = 0,
		gravityaffected = [[TRUE]],
		holdtime = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		name = [[Plasma Cannon]],
		nogap = 1,
		range = 1120,
		reloadtime = 4.25,
		renderType = 4,
		rgbColor = [[0.88 0.65 0]],
		separation = 0.45,
		size = 2.67,
		sizedecay = -0.15,
		soundHitDry = [[xplomas4]],
		soundStart = [[siege_fire]],
		stages = 20,
		startsmoke = 1,
		tolerance = 1000,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 450,
		damage = {
			default = 1450,
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
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 5,
		footprintZ = 5,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ARMSIEGE_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 5,
		footprintZ = 5,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[5x5a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

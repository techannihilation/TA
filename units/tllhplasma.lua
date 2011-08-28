-- UNITDEF -- TLLHPLASMA --
--------------------------------------------------------------------------------

local unitName = "tllhplasma"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.075,
	bmcode = 1,
	brakeRate = 0.1,
	buildCostEnergy = 5150,
	buildCostMetal = 535,
	builder = false,
	buildTime = 10987,
	canAttack = true,
	canGuard = true,
	canHover = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL HOVER MEDIUM MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Hover plasma tank]],
	designation = [[TLL-PTK]],
	downloadable = 1,
	energyMake = 2.7,
	energyStorage = 0,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Hover-tank]],
	germandescription = [[Schwebepanzer]],
	italiandescription = [[Hovercraft armato]],
	maneuverleashlength = 640,
	maxDamage = 1955,
	maxSlope = 12,
	maxVelocity = 2.3,
	maxWaterDepth = 100,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANKHOVER3]],
	name = [[Rimpler]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[TLLhplasma]],
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 280,
	spanishdescription = [[Tanque aerodeslizador]],
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 280,
	unitname = [[tllhplasma]],
	unitnumber = 17404,
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
			[1] = [[hovmdok1]],
		},
		select = {
			[1] = [[hovmdsl1]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ARM_BULL]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARM_BULL = {
		areaOfEffect = 140,
		ballistic = true,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH72]],
		gravityaffected = [[true]],
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		name = [[PlasmaCannon]],
		noSelfDamage = true,
		range = 460,
		reloadtime = 1.12,
		renderType = 4,
		soundHit = [[xplomed2]],
		soundStart = [[cannon3]],
		startsmoke = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 300,
		damage = {
			default = 240,
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
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllhplasma_dead]],
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
		object = [[3x3d]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

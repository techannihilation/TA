-- UNITDEF -- ARMVISIT --
--------------------------------------------------------------------------------

local unitName = "armvisit"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.1,
	bmcode = 1,
	brakeRate = 0.09,
	buildCostEnergy = 2828,
	buildCostMetal = 208,
	builder = false,
	buildTime = 7650,
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
	description = [[Assault Hovercraft]],
	designation = [[ARMVISIT]],
	downloadable = 1,
	energyMake = 2,
	energyStorage = 0,
	energyUse = 2,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Hovercraft d'assaut]],
	frenchname = [[Visitor]],
	germandescription = [[Angriffs Hovercraft]],
	germanname = [[Visitor]],
	italiandescription = [[Assault Hovercraft]],
	italianname = [[Visitor]],
	maneuverleashlength = 640,
	maxDamage = 1100,
	maxSlope = 16,
	maxVelocity = 2.9,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANKHOVER3]],
	name = [[Visitor]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[ARMVISIT]],
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 280,
	spanishdescription = [[Assault Hovercraft]],
	spanishname = [[Visitor]],
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 260,
	unitname = [[armvisit]],
	unitnumber = 1740,
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
			[1] = [[hovmdok1]],
		},
		select = {
			[1] = [[hovmdsl1]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[EMGX]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	EMGX = {
		areaOfEffect = 8,
		burst = 3,
		burstrate = 0.1,
		craterBoost = 0,
		craterMult = 0,
		endsmoke = 0,
		explosionGenerator = [[custom:EMG_HIT]],
		impactonly = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		intensity = 0.7,
		lineOfSight = true,
		name = [[flash]],
		noSelfDamage = true,
		range = 180,
		reloadtime = 0.31,
		renderType = 4,
		rgbColor = [[1 0.95 0.4]],
		size = 1.75,
		soundStart = [[flashemg]],
		sprayAngle = 1180,
		startsmoke = 0,
		tolerance = 5000,
		turret = true,
		weaponTimer = 0.1,
		weaponType = [[Cannon]],
		weaponVelocity = 500,
		damage = {
			default = 11,
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
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[armvisit_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

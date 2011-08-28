-- UNITDEF -- NSAATORPH --
--------------------------------------------------------------------------------

local unitName = "nsaatorph"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.04,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.08,
	buildCostEnergy = 2575,
	buildCostMetal = 358,
	builder = false,
	buildTime = 7504,
	canAttack = true,
	canGuard = true,
	canHover = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL HOVER MEDIUM MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1998 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Anti-Submarine HoverCraft]],
	designation = [[NSA-ATORPH]],
	downloadable = 1,
	energyMake = 5.6,
	energyStorage = 0,
	energyUse = 5.6,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Hovercraft anti-sous-marin]],
	frenchname = [[Undertow]],
	germaname = [[Undertow]],
	germandescription = [[U-Boot Jäger Hovercraft]],
	italiandescription = [[Anti-Submarine HoverCraft]],
	italianname = [[Undertow]],
	maneuverleashlength = 640,
	maxDamage = 708,
	maxSlope = 16,
	maxVelocity = 2.8,
	maxWaterDepth = 255,
	metalStorage = 0,
	mobilestanorders = 1,
	movementClass = [[TANKHOVER3]],
	name = [[Undertow]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[NSAATORPH]],
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 280,
	sonarDistance = 305,
	spanishdescription = [[Anti-Submarine HoverCraft]],
	spanishname = [[Undertow]],
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 230,
	unitname = [[nsaatorph]],
	unitnumber = 1403,
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
			def = [[ARMHEAVYDEPTHCHARGE]],
			onlyTargetCategory = [[NOTHOVERNOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMHEAVYDEPTHCHARGE = {
		areaOfEffect = 16,
		burnblow = true,
		explosionart = [[explode3]],
		explosiongaf = [[fx]],
		guidance = true,
		id = 17,
		lavaexplosionart = [[lavasplashsm]],
		lavaexplosiongaf = [[fx]],
		lineOfSight = true,
		model = [[DEPTHCHARGE]],
		name = [[Depth Charge]],
		propeller = 1,
		range = 210,
		reloadtime = 1,
		renderType = 1,
		selfprop = true,
		soundHit = [[xplodep2]],
		soundStart = [[torpedo1]],
		startVelocity = 100,
		tolerance = 32767,
		tracks = true,
		turnRate = 10000,
		turret = false,
		waterexplosionart = [[h2oboom1]],
		waterexplosiongaf = [[fx]],
		waterWeapon = true,
		weaponAcceleration = 15,
		weaponTimer = 3,
		weaponType = [[TorpedoLauncher]],
		weaponVelocity = 110,
		damage = {
			default = 70,
			subs = 140,
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
		description = unitDef.name .. [[n Wreckage]],
		featureDead = [[heap]],
		featurereclaimate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 60,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[nsaatorph_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[n Heap]],
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

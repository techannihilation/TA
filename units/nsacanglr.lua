-- UNITDEF -- NSACANGLR --
--------------------------------------------------------------------------------

local unitName = "nsacanglr"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.04,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.23,
	buildCostEnergy = 3103,
	buildCostMetal = 354,
	builder = false,
	buildTime = 7016,
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
	designation = [[NSA-CANGLR]],
	downloadable = 1,
	energyMake = 1.6,
	energyStorage = 0,
	energyUse = 1.6,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Hovercraft anti-sous-marin]],
	frenchname = [[Angler]],
	germandescription = [[Hovercraft U-Boot Jäger]],
	germanname = [[Angler]],
	italiandescription = [[Anti-Submarine HoverCraft]],
	italianname = [[Angler]],
	maneuverleashlength = 640,
	maxDamage = 733,
	maxSlope = 16,
	maxVelocity = 1.6,
	maxWaterDepth = 255,
	metalStorage = 0,
	mobilestanorders = 1,
	movementClass = [[TANKHOVER3]],
	name = [[Angler]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[NSACANGLR]],
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 280,
	sonarDistance = 1805,
	spanishdescription = [[Anti-Submarine HoverCraft]],
	spanishname = [[Angler]],
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 169,
	unitname = [[nsacanglr]],
	unitnumber = 1404,
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
			[1] = [[hovmdok2]],
		},
		select = {
			[1] = [[hovmdsl2]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[COREHEAVYDEPTHCHARGE]],
			onlyTargetCategory = [[NOTHOVERNOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	COREHEAVYDEPTHCHARGE = {
		areaOfEffect = 16,
		burnblow = true,
		explosionart = [[explode3]],
		explosiongaf = [[fx]],
		guidance = true,
		id = 31,
		lavaexplosionart = [[lavasplashsm]],
		lavaexplosiongaf = [[fx]],
		lineOfSight = true,
		model = [[DEPTHCHARGE]],
		name = [[Depth Charge]],
		propeller = 1,
		range = 200,
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
		weaponVelocity = 100,
		damage = {
			default = 80,
			subs = 160,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[core_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[heap]],
		featurereclaimate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 60,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[nsacanglr_dead]],
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

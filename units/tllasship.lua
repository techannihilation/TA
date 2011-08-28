-- UNITDEF -- TLLASSHIP --
--------------------------------------------------------------------------------

local unitName = "tllasship"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.0105,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.03,
	buildAngle = 16384,
	buildCostEnergy = 15112,
	buildCostMetal = 1126,
	buildTime = 23300,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Sub Exterminator]],
	designation = [[TL-ASS]],
	downloadable = 1,
	energyMake = 10,
	energyStorage = 50,
	energyUse = 2,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	floater = true,
	footprintX = 4,
	footprintZ = 4,
	frenchdescription = [[Exterminateur de sous-marins]],
	germandescription = [[U-boot Vernichter]],
	maneuverleashlength = 640,
	maxDamage = 1899,
	maxVelocity = 2.1,
	metalStorage = 1,
	minWaterDepth = 30,
	mobilestandorders = 1,
	movementClass = [[BOAT4]],
	name = [[Petrel]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[TLLASSHIP]],
	ovradjust = 1,
	radarDistance = 0,
	scale = 10,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 270,
	sonarDistance = 650,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 85,
	unitname = [[tllasship]],
	unitnumber = 945,
	version = 3.1,
	waterline = 6,
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
			[1] = [[sharmmov]],
		},
		select = {
			[1] = [[sharmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[TLL_ASEDO]],
			onlyTargetCategory = [[NOTHOVERNOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	TLL_ASEDO = {
		areaOfEffect = 16,
		burnblow = true,
		burst = 5,
		burstrate = 0.2,
		explosionart = [[explode3]],
		explosiongaf = [[fx]],
		guidance = true,
		id = 221,
		lavaexplosionart = [[lavasplashsm]],
		lavaexplosiongaf = [[fx]],
		lineOfSight = true,
		model = [[tlltorpedo2]],
		name = [[guided torpedo pack]],
		propeller = 1,
		range = 600,
		reloadtime = 6,
		renderType = 1,
		selfprop = true,
		soundHit = [[splash]],
		soundStart = [[canlite3]],
		soundTrigger = true,
		sprayAngle = 10000,
		startVelocity = 100,
		tolerance = 6000,
		tracks = true,
		turnRate = 10000,
		turret = true,
		waterexplosionart = [[h2oboom2]],
		waterexplosiongaf = [[CAexp3]],
		waterWeapon = true,
		weaponAcceleration = 15,
		weaponTimer = 5,
		weaponType = [[TorpedoLauncher]],
		weaponVelocity = 135,
		damage = {
			default = 350,
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
		footprintX = 4,
		footprintZ = 4,
		height = 12,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllASSHIP_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Metal Shards]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		hitdensity = 5,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3x3c]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- TLLMANTA --
--------------------------------------------------------------------------------

local unitName = "tllmanta"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.22,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.22,
	buildCostEnergy = 5818,
	buildCostMetal = 1831,
	builder = false,
	buildTime = 19250,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTVTOL SUB WEAPON]],
	collisionvolumeoffsets = [[0 0 0]],
	collisionvolumescales = [[32 22 62]],
	collisionvolumetest = 0,
	collisionvolumetype = [[Ell]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Submarine Killer]],
	designation = [[]],
	explodeAs = [[SMALL_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Destructeur de sous-marins]],
	germandescription = [[U-Boot Jäger]],
	italiandescription = [[Sottomarino killer]],
	maneuverleashlength = 640,
	maxDamage = 1305,
	maxVelocity = 2.45,
	minWaterDepth = 15,
	mobilestandorders = 1,
	movementClass = [[UBOAT3]],
	name = [[Manta]],
	noAutoFire = false,
	noChaseCategory = [[NOTSUBNOTSHIP]],
	objectName = [[TLLMANTA]],
	selfDestructAs = [[SMALL_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 150,
	sonarDistance = 470,
	spanishdescription = [[Caza submarino]],
	standingfireorder = 2,
	standingmoveorder = 2,
	steeringmode = 1,
	threed = 1,
	turnRate = 400,
	unitname = [[tllmanta]],
	unitnumber = 903,
	upright = true,
	version = 3.1,
	waterline = 30,
	zbuffer = 1,
	featureDefs = nil,
	sounds = {
		canceldestruct = [[cancel2]],
		underattack = [[tllwarning]],
		arrived = {
			[1] = [[tllsub2]],
		},
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
			[1] = [[tllsub]],
		},
		select = {
			[1] = [[sucorsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ARMSMART_TORPEDO]],
			onlyTargetCategory = [[NOTHOVERNOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMSMART_TORPEDO = {
		areaOfEffect = 16,
		avoidFriendly = false,
		burnblow = true,
		collideFriendly = false,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH2]],
		guidance = true,
		impactonly = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		model = [[torpedo]],
		name = [[AdvancedTorpedo]],
		noSelfDamage = true,
		propeller = 1,
		range = 600,
		reloadtime = 2,
		renderType = 1,
		selfprop = true,
		soundHit = [[xplodep1]],
		soundStart = [[torpedo1]],
		startVelocity = 120,
		tolerance = 32767,
		tracks = true,
		turnRate = 12000,
		turret = false,
		waterWeapon = true,
		weaponAcceleration = 20,
		weaponTimer = 3,
		weaponType = [[TorpedoLauncher]],
		weaponVelocity = 200,
		damage = {
			default = 800,
			subs = 1600,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[tll_corpses]],
		damage = 0.1402 * unitDef.maxDamage,
		description = [[Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 10,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllmanta_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.0841 * unitDef.maxDamage,
		description = [[Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 20,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3x3c]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

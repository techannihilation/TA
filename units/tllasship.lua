-- UNITDEF -- TLLASSHIP --
--------------------------------------------------------------------------------

local unitName = "tllasship"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.0905,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.13,
	buildAngle = 16384,
	buildCostEnergy = 15100,
	buildCostMetal = 1250,
	buildTime = 23300,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTVTOL WEAPON]],
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
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 1700,
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
	sightDistance = 350,
	sonarDistance = 690,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 385,
	turninplace = 0,
	unitname = [[tllasship]],
	unitnumber = 945,
	waterline = 6,
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
		avoidFriendly = false,
		burnblow = true,
		burst = 5,
		burstrate = 0.2,
		collideFriendly = false,
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.99,
		explosionGenerator = [[custom:FLASH2]],
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		model = [[torpedo]],
		name = [[guided torpedo pack]],
		noSelfDamage = true,
		range = 525,
		reloadtime = 2.5,
		renderType = 1,
		soundHitDry = [[xplodep2]],
		soundStart = [[torpedo1]],
		startVelocity = 140,
		tolerance = 1000,
		tracks = true,
		turnRate = 9000,
		turret = true,
		waterWeapon = true,
		weaponAcceleration = 25,
		flighttime = 1.25,
		weaponTimer = 3,
		weaponType = [[TorpedoLauncher]],
		weaponVelocity = 200,
		damage = {
			default = 250,
			subs = 500,
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

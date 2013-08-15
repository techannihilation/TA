-- UNITDEF -- TLLEQUALIZER --
--------------------------------------------------------------------------------

local unitName = "tllequalizer"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.11,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.25,
	buildAngle = 16384,
	buildCostEnergy = 8805,
	buildCostMetal = 1745,
	builder = false,
	buildTime = 19901,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Cruiser]],
	designation = [[]],
	explodeAs = [[SMALL_UNITEX]],
	firestandorders = 1,
	floatOnWater = true,
	footprintX = 5,
	footprintZ = 5,
	maneuverleashlength = 640,
	maxDamage = 4310,
	maxVelocity = 2.45,
	minWaterDepth = 30,
	mobilestandorders = 1,
	movementClass = [[BOAT5]],
	name = [[Equalizer]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[TLLEQUALIZER]],
	scale = 0.5,
	selfDestructAs = [[SMALL_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 521,
	sonarDistance = 435,
	standingfireorder = 2,
	standingmoveorder = 0,
	steeringmode = 1,
	turnRate = 328,
	unitname = [[tllequalizer]],
	unitnumber = 896,
	waterline = 10,
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
			def = [[COR_CRUS]],
			mainDir = [[0 0 1]],
			maxAngleDif = 290,
			onlyTargetCategory = [[NOTVTOL]],
		},
		[2] = {
			def = [[COR_CRUS]],
			mainDir = [[0 0 -1]],
			maxAngleDif = 290,
			onlyTargetCategory = [[NOTVTOL]],
			slaveTo = 1,
		},
		[3] = {
			def = [[TLL_TORPEDO]],
			onlyTargetCategory = [[NOTHOVERNOTVTOL]],
		},
		[4] = {
			def = [[TLL_TORPEDO]],
			onlyTargetCategory = [[NOTHOVERNOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	COR_CRUS = {
		areaOfEffect = 8,
		beamlaser = 1,
		beamTime = 0.15,
		coreThickness = 0.2,
		craterBoost = 0,
		craterMult = 0,
		energypershot = 50,
		explosionGenerator = [[custom:FLASH1]],
		fireStarter = 90,
		impactonly = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		name = [[HighEnergyLaser]],
		noSelfDamage = true,
		range = 785,
		reloadtime = 0.73,
		renderType = 0,
		rgbColor = [[0 1 0]],
		soundHitDry = [[lasrhit1]],
		soundStart = [[Lasrmas2]],
		targetMoveError = 0.175,
		thickness = 3,
		turret = true,
		weaponType = [[BeamLaser]],
		weaponVelocity = 700,
		damage = {
			default = 185,
			subs = 5,
		},
	},
	TLL_TORPEDO = {
		areaOfEffect = 16,
		avoidFriendly = false,
		burnblow = true,
		collideFriendly = false,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH2]],
		flightTime = 2.3,
		guidance = true,
		impactonly = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		model = [[torpedo]],
		name = [[Torpedo]],
		noSelfDamage = true,
		propeller = 1,
		range = 500,
		reloadtime = 3.9,
		renderType = 1,
		selfprop = true,
		soundHitDry = [[xplodep1]],
		soundStart = [[torpedo1]],
		startVelocity = 100,
		tolerance = 32767,
		turnRate = 8000,
		turret = false,
		waterWeapon = true,
		weaponAcceleration = 15,
		weaponTimer = 3,
		weaponType = [[TorpedoLauncher]],
		weaponVelocity = 160,
		damage = {
			default = 280
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
		footprintX = 5,
		footprintZ = 5,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllequalizer_dead]],
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
		footprintX = 5,
		footprintZ = 5,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[4x4c]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

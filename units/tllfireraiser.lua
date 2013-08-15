-- UNITDEF -- TLLFIRERAISER --
--------------------------------------------------------------------------------

local unitName = "tllfireraiser"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.17,
	bmcode = 1,
	brakeRate = 0.21,
	buildCostEnergy = 841,
	buildCostMetal = 155,
	builder = false,
	buildTime = 2450,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL SMALL WEAPON]],
	collisionVolumeOffsets = [[0 -2 0]],
	collisionVolumeScales = [[33 32 33]],
	collisionVolumeType = [[CylY]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Rocket Kbot]],
	designation = [[]],
	energyMake = 0.6,
	energyUse = 0.6,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	maneuverleashlength = 640,
	maxDamage = 823,
	maxSlope = 14,
	maxVelocity = 1.60,
	maxWaterDepth = 12,
	mobilestandorders = 1,
	movementClass = [[KBOT2]],
	name = [[Fireraiser]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[TLLFIRERAISER]],
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 400,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	turnRate = 1005,
	unitname = [[tllfireraiser]],
	unitnumber = 821,
	upright = true,
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
			[1] = [[kbarmmov]],
		},
		select = {
			[1] = [[kbarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[TLL_KBOT_ROCKET]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	TLL_KBOT_ROCKET = {
		areaOfEffect = 48,
		cegTag = [[Tll_Trail_rocket]],
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:Explosion_Medium_VLight]],
		fireStarter = 70,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		metalpershot = 0,
		model = [[missile]],
		name = [[Rockets]],
		noSelfDamage = true,
		range = 485,
		reloadtime = 3.8,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHitDry = [[xplosml2]],
		soundStart = [[rocklit1]],
		startsmoke = 1,
		startVelocity = 190,
		Texture1 = [[null]],
		Texture2 = [[null]],
		Texture3 = [[null]],
		Texture4 = [[null]],
		turret = true,
		weaponAcceleration = 120,
		weaponTimer = 2,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 190,
		damage = {
			default = 144,
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
		object = [[tllfireraiser_dead]],
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
		object = [[2x2c]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

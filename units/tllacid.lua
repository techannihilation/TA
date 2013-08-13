-- UNITDEF -- TLLACID --
--------------------------------------------------------------------------------

local unitName = "tllacid"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.2,
	badTargetCategory = [[VTOL]],
	bmcode = 1,
	brakeRate = 0.4,
	buildCostEnergy = 40000,
	buildCostMetal = 6000,
	isbuilder = false,
	buildTime = 89500,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Long Range Vertical Missile Vehicle]],
	energyMake = 1,
	energyStorage = 50,
	energyUse = 20,
	explodeAs = [[CORGRIPN_BOMB]],
	firestandorders = 1,
	firestate = 0,
	footprintX = 4,
	footprintZ = 4,
	maneuverleashlength = 640,
	maxDamage = 850,
	maxVelocity = 0.8,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[HTANK4]],
	name = [[Acidic Rain]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[tllacid]],
	selfDestructAs = [[SPYBOMBX]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 390,
	standingfireorder = 0,
	standingmoveorder = 1,
	steeringmode = 1,
	TEDClass = [[TANK]],
	turnRate = 380,
	unitname = [[tllacid]],
	unitnumber = 30132,
	workerTime = 0,
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
			[1] = [[tarmmove]],
		},
		select = {
			[1] = [[tarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[MOBILE]],
			def = [[ACIDRAIN_ROCKET]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ACIDRAIN_ROCKET = {
		areaOfEffect = 480,
		commandfire = true,
		cegTag = [[TLLRAVENTRAIL]],
		craterBoost = 1,
		craterMult = 1,
		edgeEffectiveness = 0.6,
		energypershot = 30000,
		explosionGenerator = [[custom:chemxplo]],
		fireStarter = 0,
		flightTime = 400,
		guidance = true,
		impulseBoost = 0.023,
		impulseFactor = 0.023,
		lineOfSight = true,
		metalpershot = 750,
		model = [[corshiprckt1]],
		name = [[Chemical Weapon]],
		noautorange = 1,
		noSelfDamage = true,
		propeller = 1,
		range = 3000,
		reloadtime = 2,
		renderType = 1,
		selfprop = true,
		shakeduration = 1.5,
		shakemagnitude = 32,
		smokedelay = 0.1,
		smokeTrail = false,
		soundHitDry = [[xplomed4]],
		soundStart = [[misicbm1]],
		startsmoke = 1,
		stockpile = true,
		stockpiletime = 90,
		Texture1 = [[null]],
		Texture2 = [[null]],
		Texture3 = [[null]],
		Texture4 = [[null]],
		tolerance = 4000,
		turnRate = 32768,
		twoPhase = true,
		vlaunch = true,
		weaponAcceleration = 80,
		weaponTimer = 10,
		weaponType = [[StarburstLauncher]],
		weaponVelocity = 700,
		damage = {
			commanders = 250,
			default = 2000,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		catagory = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 12,
		hitdensity = 23,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllacid_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
	heap = {
		blocking = false,
		catagory = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Metal Shards]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		hitdensity = 4,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[4x4a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

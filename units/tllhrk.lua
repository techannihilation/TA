-- UNITDEF -- TLLHRK --
--------------------------------------------------------------------------------

local unitName = "tllhrk"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.11,
	bmcode = 1,
	brakeRate = 0.15,
	buildCostEnergy = 1370,
	buildCostMetal = 642,
	builder = false,
	buildTime = 5519,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[All-Terrain Heavy Rocket Kbot]],
	designation = [[TL-HRK]],
	downloadable = 1,
	energyMake = 0.8,
	energyStorage = 0,
	energyUse = 0.6,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	maneuverleashlength = 640,
	maxDamage = 655,
	maxHeightDif = 14,
	maxVelocity = 1.9,
	maxWaterDepth = 21,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TKBOT3]],
	name = [[Rlik]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[TLLHRK]],
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 400,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	turnRate = 658,
	unitname = [[tllhrk]],
	unitnumber = 932,
	upright = false,
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
			[1] = [[kbcormov]],
		},
		select = {
			[1] = [[kbcorsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[MOBILE]],
			def = [[CORHRK_ROCKET]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORHRK_ROCKET = {
		areaOfEffect = 60,
		cegTag = [[TLLRAVENTRAIL]],
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.5,
		explosionGenerator = [[custom:incendiary_explosion_small]],
		fireStarter = 100,
		flightTime = 10,
		guidance = true,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		metalpershot = 0,
		model = [[vpulse]],
		name = [[Vpulse Rocket]],
		noautorange = 1,
		noSelfDamage = true,
		range = 1420,
		reloadtime = 7,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.5,
		smokeTrail = false,
		soundHitDry = [[vpulsehit]],
		soundStart = [[vpulsefire]],
		startsmoke = false,
		Texture1 = [[null]],
		Texture2 = [[null]],
		Texture3 = [[null]],
		Texture4 = [[null]],
		turnRate = 24384,
		twoPhase = true,
		vlaunch = true,
		weaponAcceleration = 100,
		weaponTimer = 4,
		weaponType = [[StarburstLauncher]],
		weaponVelocity = 800,
		damage = {
			default = 900,
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
		height = 12,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllhrk_dead]],
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
		footprintX = 2,
		footprintZ = 2,
		hitdensity = 5,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[2x2a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- KROGTAAR --
--------------------------------------------------------------------------------

local unitName = "krogtaar"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.144,
	bmcode = 1,
	brakeRate = 0.238,
	buildCostEnergy = 50499,
	buildCostMetal = 6784,
	builder = false,
	buildPic = [[krogtaar.png]],
	buildTime = 101125,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL HUGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Heavy Weapons Mech]],
	energyMake = 3,
	energyStorage = 0,
	energyUse = 3,
	explodeAs = [[CRAWL_BLAST]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	immunetoparalyzer = 1,
	maneuverleashlength = 640,
	mass = 1000000000000,
	maxDamage = 40000,
	maxSlope = 17,
	maxVelocity = 1.33,
	maxWaterDepth = 13,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[HKBOT4]],
	name = [[KrogTaar]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[krogtaar]],
	radarDistance = 0,
	selfDestructAs = [[CRAWL_BLAST]],
	selfDestructCountdown = 10,
	shootme = 1,
	side = [[CORE]],
	sightDistance = 390,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	turnRate = 1058,
	unitname = [[krogtaar]],
	unitnumber = 12323,
	upright = true,
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
			def = [[COR_TAAR_RC]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	COR_TAAR_RC = {
		accuracy = 200,
		areaOfEffect = 64,
		burnblow = true,
		cegTag = [[krogtaarblaster]],
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASHKROGTAAR]],
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		intensity = 4,
		lineOfSight = true,
		model = [[bomb2]],
		name = [[KrogTaarBlaster]],
		noSelfDamage = true,
		range = 465,
		reloadtime = 0.4,
		renderType = 4,
		rgbColor = [[0 0 0]],
		size = 1,
		soundHit = [[xplomed3]],
		soundStart = [[Mavgun2]],
		sprayAngle = 200,
		startsmoke = 1,
		tolerance = 10000,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 400,
		damage = {
			default = 344,
			subs = 5,
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
		description = [[Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[krogtaar_dead]],
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
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 100,
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

-- UNITDEF -- ARMCIPH --
--------------------------------------------------------------------------------

local unitName = "armciph"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.013,
	bmcode = 1,
	brakeRate = 0.098,
	buildCostEnergy = 8523,
	buildCostMetal = 1197,
	builder = false,
	buildTime = 12920,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Heavy Resistant Skirmish Tank]],
	designation = [[ARM-CPH]],
	energyMake = 1,
	energyStorage = 0,
	energyUse = 1,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	frenchdescription = [[Char d'escarmouche moyen]],
	frenchname = [[Cipher]],
	germandescription = [[Mittelschwerer Gefechtspanzer]],
	germanname = [[Cipher]],
	maneuverleashlength = 640,
	maxDamage = 11950,
	maxSlope = 11,
	maxVelocity = 1.703,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANK4]],
	name = [[Cipher]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMCIPH]],
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 235,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 325,
	unitname = [[armciph]],
	unitnumber = 754,
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
			[1] = [[tarmmove]],
		},
		select = {
			[1] = [[tarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[PINKCANNON]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	PINKCANNON = {
		areaOfEffect = 122,
		ballistic = true,
		craterBoost = 0,
		craterMult = 0,
		explosionart = [[explode4]],
		explosiongaf = [[fx]],
		explosionGenerator = [[custom:PINKBOLT]],
		gravityaffected = [[true]],
		impulseBoost = 0,
		impulseFactor = 0,
		intensity = 1,
		lavaexplosionart = [[lavasplash]],
		lavaexplosiongaf = [[fx]],
		name = [[Lighghht Cannon]],
		range = 600,
		reloadtime = 0.5,
		renderType = 4,
		rgbColor = [[1 0 0]],
		rgbColor2 = [[1 1 1]],
		size = 3,
		soundHit = [[xplosml3]],
		soundStart = [[canlite3]],
		sprayAngle = 300,
		startsmoke = 1,
		thickness = 2,
		turret = true,
		waterexplosionart = [[h2o]],
		waterexplosiongaf = [[fx]],
		weaponType = [[Cannon]],
		weaponVelocity = 370,
		damage = {
			default = 225,
			subs = 5,
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
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 2,
		footprintZ = 2,
		height = 14,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[armciph_dead]],
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
		footprintX = 2,
		footprintZ = 2,
		height = 5,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[2x2d]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

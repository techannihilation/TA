-- UNITDEF -- CORMONSTA --
--------------------------------------------------------------------------------

local unitName = "cormonsta"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.652587891,
	bmcode = 1,
	brakeRate = 0.352587891,
	buildCostEnergy = 27415,
	buildCostMetal = 2574,
	builder = false,
	buildTime = 80561,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	cantBeTransported = true,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Defiler Assault]],
	designation = [[ATAS]],
	energyMake = 0.7,
	energyStorage = 0,
	energyUse = 0.7,
	explodeAs = [[MINE_MEDIUM]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	frenchdescription = [[Araigné d'assaut évolué]],
	frenchname = [[Defiler]],
	germandescription = [[Araigné d'assaut évolué]],
	germanname = [[Defiler]],
	healtime = 27,
	maneuverleashlength = 640,
	maxDamage = 18158,
	maxSlope = 40,
	maxVelocity = 0.85,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[HTKBOT4]],
	name = [[Defiler]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORMONSTA]],
	onoffable = true,
	selfDestructAs = [[MINE_MEDIUM]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 550,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 340,
	unitname = [[cormonsta]],
	unitnumber = 852741,
	version = 3,
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
			[1] = [[krogok1]],
		},
		select = {
			[1] = [[krogsel1]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[CORMONSTA_GUN]],
			onlyTargetCategory = [[NOTVTOL]],
		},
		[2] = {
			def = [[SAM2_MISSILE]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORMONSTA_GUN = {
		areaOfEffect = 75,
		explosionart = [[explode5]],
		explosiongaf = [[fx]],
		explosionGenerator = [[custom:PLASMARED21]],
		lavaexplosionart = [[lavasplashsm]],
		lavaexplosiongaf = [[fx]],
		lineOfSight = true,
		minbarrelangle = -15,
		model = [[dragothflame]],
		name = [[Tanker Canon]],
		range = 480,
		reloadtime = 0.37,
		renderType = 1,
		soundHit = [[xplomed21]],
		soundStart = [[DEFILER2]],
		startsmoke = 1,
		tolerance = 500,
		turret = true,
		waterexplosionart = [[h2oboom1]],
		waterexplosiongaf = [[fx]],
		weaponType = [[Cannon]],
		weaponVelocity = 950,
		damage = {
			default = 105,
			subs = 5,
		},
	},
	SAM2_MISSILE = {
		areaOfEffect = 50,
		ballistic = true,
		burnblow = true,
		edgeEffectiveness = 0.9,
		explosionGenerator = [[custom:GDLIGHTROCKET]],
		fireStarter = 70,
		gravityaffected = [[true]],
		guidance = true,
		lavaexplosionart = [[lavasplash]],
		lavaexplosiongaf = [[fx]],
		minbarrelangle = -24,
		model = [[missile10]],
		name = [[Sam Missile]],
		range = 680,
		reloadtime = 2.6,
		renderType = 1,
		selfprop = true,
		soundHit = [[xplomed21]],
		soundStart = [[Rocklit3]],
		startsmoke = 0,
		tolerance = 8000,
		tracks = true,
		turnRate = 24384,
		turret = true,
		waterexplosionart = [[h2o]],
		waterexplosiongaf = [[fx]],
		weaponTimer = 7,
		weaponType = [[Cannon]],
		weaponVelocity = 950,
		damage = {
			default = 880,
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
		footprintX = 9,
		footprintZ = 9,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[cormonsta_dead]],
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
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[2x2f]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

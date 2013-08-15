-- UNITDEF -- ARMROTTWEILER --
--------------------------------------------------------------------------------

local unitName = "armrottweiler"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.01,
	bmcode = 1,
	brakeRate = 0.015,
	buildCostEnergy = 5220,
	buildCostMetal = 650,
	builder = false,
	buildTime = 8540,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionVolumeOffsets = [[0 -3 1]],
	collisionVolumeScales = [[37 22 46]],
	collisionVolumeTest = 1,
	collisionVolumeType = [[CylZ]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Medium Combat Riot Tank]],
	energyMake = 0.8,
	energyStorage = 0,
	energyUse = 0.8,
	explodeAs = [[BIG_TANK]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	leaveTracks = true,
	maneuverleashlength = 640,
	maxDamage = 4520,
	maxHeightDif = 10,
	maxVelocity = 2.3,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANK3]],
	name = [[Rottweiler]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMROTTWEILER]],
	radarDistance = 0,
	selfDestructAs = [[BIG_TANK]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 355,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	trackOffset = 6,
	trackStrength = 6,
	trackStretch = 1,
	trackType = [[StdTank]],
	trackWidth = 34,
	turnRate = 375,
	unitname = [[armrottweiler]],
	unitnumber = 6625,
	workerTime = 0,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:Core_Rear_Muzzle]],
			[2] = [[custom:armrottweiler_mg_flare]],
		},
		pieceExplosionGenerators = { 
			"DEBREE5", 
		}, 
        },
	customparams = {
		RequireTech = [[Advanced T1 Unit Research Centre]],
	},
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
			def = [[ARMROTTWEILER_CANNON]],
			onlyTargetCategory = [[NOTVTOL]],
		},
		[3] = {
			def = [[ARMROTTWEILER_MG]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMROTTWEILER_CANNON = {
		areaOfEffect = 96,
		burnblow = true,
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.75,
		explosionGenerator = [[custom:Explosion_Light_Plasma-2-Orange]],
		impulseBoost = 0.55,
		impulseFactor = 0.55,
		lineOfSight = true,
		name = [[RiotCannon]],
		noSelfDamage = true,
		range = 365,
		reloadtime = 2.5,
		renderType = 4,
		rgbColor = [[0.96 0.79 0]],
		size = 1.82,
		soundHitDry = [[xplosml3]],
		soundStart = [[canlite3]],
		startsmoke = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 550,
		damage = {
			commanders = 250,
			default = 420,
			subs = 5,
		},
	},
	ARMROTTWEILER_MG = {
		areaOfEffect = 8,
		burst = 2,
		explosionGenerator = [[custom:popupshine]],
		id = 243,
		lineOfSight = true,
		model = [[bullet4]],
		name = [[Rogue Gatling Cannon]],
		range = 250,
		reloadtime = 0.2,
		renderType = 1,
		rgbColor = [[0.86 0.62 0]],
		size = 0.82,
		soundHitDry = [[gatlhit]],
		soundStart = [[gungatl]],
		soundTrigger = true,
		sprayAngle = 1024,
		startsmoke = 1,
		tolerance = 6000,
		turret = true,
		weaponTimer = 1,
		weaponType = [[Cannon]],
		weaponVelocity = 650,
		damage = {
			commanders = 6,
			default = 12,
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
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[armrottweiler_dead]],
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

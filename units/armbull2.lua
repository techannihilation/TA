-- UNITDEF -- ARMBULL2 --
--------------------------------------------------------------------------------

local unitName = "armbull2"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.2,
	bmcode = 1,
	brakeRate = 0.3,
	buildCostEnergy = 23541,
	buildCostMetal = 2540,
	isbuilder = false,
	buildTime = 16842,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Very Heavy Assault Tank]],
	designation = [[ARM-HA9]],
	energyMake = 0.5,
	energyStorage = 0,
	energyUse = 0.5,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	maneuverleashlength = 640,
	maxDamage = 10400,
	maxSlope = 12,
	maxVelocity = 1.6,
	maxWaterDepth = 16,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[HTANK3]],
	name = [[Pittbull]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMBULL2]],
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 240,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 350,
	unitname = [[armbull2]],
	unitnumber = 229,
	workerTime = 0,
	customparams = {
		RequireTech = [[Advanced T2 Unit Research Centre]],
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
			def = [[ARM_BULL2]],
			onlyTargetCategory = [[NOTVTOL]],
		},
		[2] = {
			def = [[ARMROGUE_CANNON]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARM_BULL2 = {
		areaOfEffect = 98,
		ballistic = true,
		cegTag = [[Trail_cannon]],
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH2]],
		gravityaffected = [[TRUE]],
		id = 56,
		impulseBoost = 0,
		impulseFactor = 0,
		intensity = 1,
		name = [[Plasma Cannon]],
		nogap = 1,
		range = 480,
		reloadtime = 0.7,
		renderType = 4,
		rgbColor = [[0.88 0.65 0]],
		separation = 0.45,
		size = 1.83,
		sizedecay = -0.15,
		soundHitDry = [[xplomed21]],
		soundStart = [[cannon3]],
		stages = 20,
		startsmoke = 1,
		thickness = 2,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 310,
		damage = {
			default = 325,
			subs = 5,
		},
	},
	ARMROGUE_CANNON = {
		areaOfEffect = 8,
		burst = 3,
		id = 243,
		lineOfSight = true,
		name = [[Rogue Gatling Cannon]],
		range = 350,
		reloadtime = 0.15,
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
		weaponVelocity = 550,
		damage = {
			commanders = 2,
			default = 12,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = true,
		category = [[arm_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[PitBull Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[armbull2_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[PitBull Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 100,
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

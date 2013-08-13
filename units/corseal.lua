-- UNITDEF -- CORSEAL --
--------------------------------------------------------------------------------

local unitName = "corseal"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.0462,
	amphibious = 1,
	bmcode = 1,
	brakeRate = 0.0209,
	buildCostEnergy = 12013,
	buildCostMetal = 450,
	builder = false,
	buildPic = [[CORSEAL.png]],
	buildTime = 8762,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionvolumeoffsets = [[0 -7 0]],
	collisionvolumescales = [[31 31 31]],
	collisionvolumetype = "CylZ",
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Medium Amphibious Tank]],
	energyMake = 0.5,
	energyStorage = 0,
	energyUse = 0.5,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	idleAutoHeal = 5,
	idleTime = 1800,
	leaveTracks = true,
	maneuverleashlength = 640,
	maxDamage = 2340,
	maxSlope = 12,
	maxVelocity = 2.3,
	maxWaterDepth = 255,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[ATANK3]],
	name = [[Croc]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORSEAL]],
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[CORE]],
	sightDistance = 399,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	trackOffset = 6,
	trackStrength = 5,
	trackStretch = 1,
	trackType = [[StdTank]],
	trackWidth = 30,
	turnRate = 487,
	unitname = [[corseal]],
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
			[1] = [[tcormove]],
		},
		select = {
			[1] = [[tcorsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[CORE_CROC]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORE_CROC = {
		areaOfEffect = 64,
		ballistic = true,
		cegTag = [[Trail_cannon]],
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH64]],
		gravityaffected = [[TRUE]],
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		name = [[PlasmaCannon]],
		nogap = 1,
		noSelfDamage = true,
		range = 440,
		reloadtime = 0.9,
		renderType = 4,
		rgbColor = [[0.8 0.53 0]],
		separation = 0.45,
		size = 1.53,
		sizedecay = -0.15,
		soundHitDry = [[xplomed4]],
		soundStart = [[cannon2]],
		stages = 20,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 260,
		damage = {
			default = 116,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = false,
		category = [[corpses]],
		collisionvolumeoffsets = [[-0.710494995117 -1.1132812503e-06 0.9375]],
		collisionvolumescales = [[31.2236328125 16.1107177734 37.8449707031]],
		collisionvolumetype = [[Box]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[HEAP]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CORSEAL_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Heap]],
		energy = 0,
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[2X2E]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

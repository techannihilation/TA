-- UNITDEF -- DECADE --
--------------------------------------------------------------------------------

local unitName = "decade"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.084,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.019,
	buildAngle = 16384,
	buildCostEnergy = 2200,
	buildCostMetal = 395,
	builder = false,
	buildPic = [[DECADE.png]],
	buildTime = 6525,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTVTOL WEAPON]],
	collisionvolumeoffsets = "0 -4 -2",
	collisionvolumescales = "24 24 67",
	collisionvolumetype = "CylZ",
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Corvette]],
	energyMake = 1,
	energyStorage = 0,
	energyUse = 1,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	floater = true,
	footprintX = 4,
	footprintZ = 4,
	iconType = [[sea]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 1600,
	maxVelocity = 3.25,
	metalStorage = 0,
	minWaterDepth = 12,
	mobilestandorders = 1,
	movementClass = [[BOAT4]],
	name = [[Decade]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[DECADE]],
	scale = 0.5,
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[ARM]],
	sightDistance = 429,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 530,
	unitname = [[decade]],
	waterline = 1,
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
			[1] = [[sharmmov]],
		},
		select = {
			[1] = [[sharmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[EMG]],
			onlyTargetCategory = [[NOTVTOL]],
		},
		[2] = {
			def = [[EMG]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	EMG = {
		areaOfEffect = 8,
		avoidFeature = false,
		burst = 3,
		burstrate = 0.1,
		cegTag = [[Trail_emg]],
		craterBoost = 0,
		craterMult = 0,
		endsmoke = 0,
		explosionGenerator = [[custom:EMG_HIT]],
		fireStarter = 100,
		impactonly = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		intensity = 0.7,
		lineOfSight = true,
		name = [[EMG Canon]],
		noSelfDamage = true,
		range = 290,
		reloadtime = 0.3,
		renderType = 4,
		rgbColor = [[0.83 0.57 0]],
		size = 1.75,
		soundStart = [[flashemg]],
		sprayAngle = 1180,
		startsmoke = 0,
		tolerance = 5000,
		turret = true,
		weaponTimer = 0.1,
		weaponType = [[Cannon]],
		weaponVelocity = 500,
		damage = {
			default = 8,
			raider_resistant = 4,
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
		collisionvolumeoffsets = -13.2273,
		collisionvolumescales = [[32.7630615234 17.5484924316 65.1112213135]],
		collisionvolumetype = [[Box]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[DECADE_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

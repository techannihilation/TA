-- UNITDEF -- ARMWAR --
--------------------------------------------------------------------------------

local unitName = "armwar"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.072,
	bmcode = 1,
	brakeRate = 0.238,
	buildCostEnergy = 2944,
	buildCostMetal = 248,
	builder = false,
	buildPic = [[ARMWAR.png]],
	buildTime = 3828,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Medium Infantry Kbot]],
	energyMake = 0.5,
	energyStorage = 0,
	energyUse = 0.5,
	explodeAs = [[SMALL_UNITEX]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 1300,
	maxSlope = 17,
	maxVelocity = 1.5,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[KBOT2]],
	name = [[Warrior]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMWAR]],
	seismicSignature = 0,
	selfDestructAs = [[SMALL_UNIT]],
	side = [[ARM]],
	sightDistance = 350,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	turnRate = 770,
	unitname = [[armwar]],
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
			[1] = [[kbarmmov]],
		},
		select = {
			[1] = [[kbarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ARMWAR_LASER]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMWAR_LASER = {
		areaOfEffect = 8,
		beamlaser = 1,
		beamTime = 0.12,
		coreThickness = 0.175,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:SMALL_RED_BURN]],
		fireStarter = 30,
		impactonly = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		laserFlareSize = 10,
		lineOfSight = true,
		name = [[MediumLaser]],
		noSelfDamage = true,
		range = 330,
		reloadtime = 0.3,
		renderType = 0,
		rgbColor = [[1 0 0]],
		soundHit = [[lasrhit2]],
		soundStart = [[lasrfir3]],
		soundTrigger = true,
		targetMoveError = 0.2,
		thickness = 2,
		tolerance = 10000,
		turret = true,
		weaponType = [[BeamLaser]],
		weaponVelocity = 950,
		damage = {
			default = 55,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = true,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ARMWAR_DEAD]],
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
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[2X2A]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

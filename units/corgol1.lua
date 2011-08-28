-- UNITDEF -- CORGOL1 --
--------------------------------------------------------------------------------

local unitName = "corgol1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.0242,
	bmcode = 1,
	brakeRate = 0.0495,
	buildCostEnergy = 22892,
	buildCostMetal = 2367,
	builder = false,
	buildPic = [[CORGOL.png]],
	buildTime = 36125,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[CORGOL_DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Master Assault Tank]],
	energyMake = 0.5,
	energyStorage = 0,
	energyUse = 0.5,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	idleAutoHeal = 5,
	idleTime = 1800,
	leaveTracks = true,
	maneuverleashlength = 640,
	maxDamage = 13800,
	maxSlope = 12,
	maxVelocity = 1.45,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[HTANK4]],
	name = [[UPG Goliath]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORGOL1]],
	script = [[corgol.cob]],
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[CORE]],
	sightDistance = 395,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	trackOffset = 8,
	trackStrength = 10,
	trackStretch = 1,
	trackType = [[StdTank]],
	trackWidth = 49,
	turnRate = 220,
	unitname = [[corgol1]],
	workerTime = 0,
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:goliathflare]],
		},
	},
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
			badTargetCategory = [[SMALL TINY]],
			def = [[COR_GOL1]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	COR_GOL1 = {
		areaOfEffect = 372,
		ballistic = true,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH96]],
		gravityaffected = [[true]],
		impulseBoost = 0,
		impulseFactor = 0,
		name = [[HeavyCannon]],
		noSelfDamage = true,
		range = 800,
		reloadtime = 4.7,
		renderType = 4,
		soundHit = [[xplomed4]],
		soundStart = [[cannhvy2]],
		startsmoke = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 328.63354492188,
		damage = {
			commanders = 750,
			default = 1600,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	CORGOL_DEAD = {
		blocking = true,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Goliath Wreckage]],
		energy = 0,
		featureDead = [[CORGOL_HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 4,
		footprintZ = 4,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CORGOL_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	CORGOL_HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Goliath Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 4,
		footprintZ = 4,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[4X4C]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

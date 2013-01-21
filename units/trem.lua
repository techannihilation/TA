-- UNITDEF -- TREM --
--------------------------------------------------------------------------------

local unitName = "trem"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.0528,
	bmcode = 1,
	brakeRate = 0.11,
	buildCostEnergy = 45350,
	buildCostMetal = 1951,
	builder = false,
	buildPic = [[TREM.png]],
	buildTime = 31103,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionvolumeoffsets = "0 -5 -3",
	collisionvolumescales = "29 59 46",
	collisionvolumetype = "Box",
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Heavy Artillery Vehicle]],
	energyMake = 2.1,
	energyStorage = 0,
	energyUse = 2.1,
	explodeAs = [[BIG_UNIT]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	highTrajectory = 1,
	idleAutoHeal = 5,
	idleTime = 1800,
	leaveTracks = true,
	maneuverleashlength = 640,
	maxDamage = 2045,
	maxSlope = 14,
	maxVelocity = 1.452,
	maxWaterDepth = 15,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[HTANK4]],
	name = [[Tremor]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[TREM]],
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[CORE]],
	sightDistance = 351,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	trackOffset = -8,
	trackStrength = 8,
	trackStretch = 1,
	trackType = [[StdTank]],
	trackWidth = 28,
	turnRate = 169.4,
	unitname = [[trem]],
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
			def = [[TREM1]],
			mainDir = [[0 0 1]],
			maxAngleDif = 270,
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	TREM1 = {
		accuracy = 1400,
		areaOfEffect = 160,
		ballistic = true,
		cegTag = [[Trail_cannon]],
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH4]],
		gravityaffected = [[TRUE]],
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		minbarrelangle = -35,
		name = [[RapidArtillery]],
		nogap = 1,
		noSelfDamage = true,
		proximityPriority = -3,
		range = 1300,
		reloadtime = 0.4,
		renderType = 4,
		rgbColor = [[0.7 0.37 0]],
		separation = 0.45,
		size = 2.26,
		sizedecay = -0.15,
		soundHitDry = [[xplomed4]],
		soundStart = [[cannhvy2]],
		stages = 20,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 418.92721557617,
		damage = {
			default = 295,
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
		collisionvolumeoffsets = [[1.25984954834 -1.01012474365 0.475593566895]],
		collisionvolumescales = [[55.5426483154 42.2261505127 61.5749359131]],
		collisionvolumetype = [[Box]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 8,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[TREM_DEAD]],
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
		height = 2,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[2X2B]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

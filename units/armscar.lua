  -- UNITDEF -- ARMSCAR --
--------------------------------------------------------------------------------

local unitName = "armscar"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.012,
	bmcode = 1,
	brakeRate = 0.0085,
	buildCostEnergy = 3500,
	buildCostMetal = 490,
	builder = false,
	buildTime = 11840,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Fusilage Combat Tank]],
	designation = [[MAD-ASC]],
	energyMake = 0.8,
	energyUse = 0.8,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 760,
	maxSlope = 12,
	maxVelocity = 1.35,
	maxWaterDepth = 80,
	mobilestandorders = 1,
	movementClass = [[TANK3]],
	name = [[Scar]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMSCAR]],
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 555,
	standingfireorder = 2,
	standingmoveorder = 0,
	steeringmode = 1,
	turnRate = 340,
	unitname = [[armscar]],
	unitnumber = 760,
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
			badTargetCategory = [[SMALL TINY]],
			def = [[ARM_SCARGUN]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARM_SCARGUN = {
		accuracy = 0,
		areaOfEffect = 90,
		ballistic = true,
		burnblow = true,
		cegTag = [[Trail_cannon]],
		craterBoost = 0,
		craterMult = 0,
		gravityaffected = [[TRUE]],
		id = 220,
		impulseBoost = 0,
		impulseFactor = 0,
		name = [[Long Range Tank Cannon]],
		nogap = 1,
		noSelfDamage = true,
		range = 650,
		reloadtime = 14.8,
		renderType = 4,
		rgbColor = [[1 0.95 0.9]],
		separation = 0.45,
		size = 1.77,
		sizedecay = -0.15,
		soundHitDry = [[xplomed4]],
		soundStart = [[Scargun]],
		stages = 20,
		startsmoke = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 1500,
		damage = {
			commanders = 450,
			default = 1480,
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
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[armscar_dead]],
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

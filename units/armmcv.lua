-- UNITDEF -- ARMMCV --
--------------------------------------------------------------------------------

local unitName = "armmcv"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.09,
	activateWhenBuilt = true,
	amphibious = 1,
	bmcode = 1,
	brakeRate = 0.08,
	buildCostEnergy = 184765,
	buildCostMetal = 7851,
	builder = false,
	buildTime = 172624,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	cantBeTransported = true,
	category = [[ALL HUGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionVolumeOffsets = [[0 -10 0]],
	collisionVolumeScales = [[93 74 132]],
	collisionVolumeTest = 1,
	collisionVolumeType = [[ellipsoid]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Mobile Command Vehicle]],
	designation = [[ARM-MCV]],
	downloadable = 1,
	energyMake = 0.5,
	energyStorage = 0,
	energyUse = 40,
	explodeAs = [[ESTOR_BUILDING]],
	firestandorders = 1,
	footprintX = 5,
	footprintZ = 5,
	immunetoparalyzer = 1,
	maneuverleashlength = 640,
	mass = 200000,
	maxDamage = 66495,
	maxSlope = 12,
	maxVelocity = 1.7,
	maxWaterDepth = 255,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[VHTANK5]],
	name = [[Titan]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMMCV]],
	onoffable = true,
	ovradjust = 1,
	radarDistance = 2880,
	selfDestructAs = [[NUCLEAR_Missile]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 640,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 128,
	unitname = [[armmcv]],
	unitnumber = 22134,
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
			[1] = [[tarmmove]],
		},
		select = {
			[1] = [[tarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ARM_BATSAFTX]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARM_BATSAFTX = {
		accuracy = 350,
		areaOfEffect = 96,
		ballistic = true,
		cegTag = [[Trail_cannon]],
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASHSMALLUNIT]],
		gravityaffected = [[TRUE]],
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		minbarrelangle = -25,
		name = [[BattleShipCannon]],
		nogap = 1,
		noSelfDamage = true,
		range = 1300,
		reloadtime = 1.2,
		renderType = 4,
		rgbColor = [[0.86 0.62 0]],
		separation = 0.45,
		size = 1.82,
		sizedecay = -0.15,
		soundHitDry = [[xplomed2]],
		soundStart = [[cannhvy1]],
		stages = 20,
		startsmoke = 1,
		tolerance = 5000,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 470,
		damage = {
			default = 300,
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
		footprintX = 7,
		footprintZ = 7,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[armmcv_dead]],
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
		footprintX = 7,
		footprintZ = 7,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[6x6c]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- ARMRAZ --
--------------------------------------------------------------------------------

local unitName = "armraz"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.206,
	bmcode = 1,
	brakeRate = 0.262,
	buildCostEnergy = 112344,
	buildCostMetal = 3577,
	builder = false,
	buildPic = [[ARMRAZ.png]],
	buildTime = 58566,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL HUGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionvolumeoffsets = [[0.0 -2.0 0.0]],
	collisionvolumescales = [[38.0 58.0 26.0]],
	collisionvolumetype = [[box]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Battle Mech]],
	explodeAs = [[MECH_BLASTSML]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	idleAutoHeal = 5,
	idleTime = 1800,
	immunetoparalyzer = 1,
	maneuverleashlength = 640,
	mass = 200000,
	maxDamage = 15800,
	maxSlope = 15,
	maxVelocity = 2.6,
	maxWaterDepth = 22,
	mobilestandorders = 1,
	movementClass = [[HKBOT4]],
	name = [[Razorback]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMRAZ]],
	seismicSignature = 0,
	selfDestructAs = [[MECH_BLAST]],
	side = [[ARM]],
	sightDistance = 450,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	turnRate = 668,
	unitname = [[armraz]],
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
			[1] = [[mavbok1]],
		},
		select = {
			[1] = [[mavbsel1]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[MECH_RAPIDLASER]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	MECH_RAPIDLASER = {
		['--falloffrate'] = 0.75,
		accuracy = 32,
		areaOfEffect = 32,
		avoidFeature = false,
		beamlaser = 1,
		beamTime = 0.14,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:BURN]],
		fireStarter = 10,
		impulseBoost = 1,
		impulseFactor = 1,
		lineOfSight = true,
		name = [[MechRapidLaser]],
		noSelfDamage = true,
		proximityPriority = 1.5,
		range = 475,
		reloadtime = 0.15,
		renderType = 0,
		rgbColor = [[0.75 0 0]],
		rgbColor2 = [[0.9 0.9 0.6]],
		soundHit = [[lasrhit1]],
		soundStart = [[lasfirerb]],
		soundTrigger = true,
		startsmoke = 1,
		thickness = 3.5,
		tolerance = 20000,
		turret = true,
		weaponType = [[BeamLaser]],
		weaponVelocity = 920,
		damage = {
			default = 125,
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
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ARMRAZ_DEAD]],
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
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3X3B]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

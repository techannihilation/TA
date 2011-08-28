-- UNITDEF -- ARMRAZ1 --
--------------------------------------------------------------------------------

local unitName = "armraz1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.206,
	bmcode = 1,
	brakeRate = 0.262,
	buildCostEnergy = 333286,
	buildCostMetal = 11577,
	builder = false,
	buildPic = [[ARMRAZ.png]],
	buildTime = 388566,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL HUGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionvolumeoffsets = [[0 -15 0]],
	collisionvolumescales = [[115 150 105]],
	collisionvolumetest = 0,
	collisionvolumetype = [[Ell]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Very Heavy Battle Mech]],
	explodeAs = [[MECH_BLASTSML]],
	firestandorders = 1,
	footprintX = 7,
	footprintZ = 7,
	iconType = [[krogoth]],
	idleAutoHeal = 5,
	idleTime = 1800,
	immunetoparalyzer = 1,
	maneuverleashlength = 640,
	mass = 2000000,
	maxDamage = 111500,
	maxSlope = 15,
	maxVelocity = 2.4,
	maxWaterDepth = 22,
	mobilestandorders = 1,
	movementClass = [[HTKBOT7]],
	name = [[Mega Razorback]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMRAZ1]],
	script = [[armraz.cob]],
	seismicSignature = 0,
	selfDestructAs = [[MECH_BLAST]],
	side = [[ARM]],
	sightDistance = 600,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	turnRate = 534,
	unitname = [[armraz1]],
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
			def = [[MECH_RAPIDLASER1]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	MECH_RAPIDLASER1 = {
		areaOfEffect = 24,
		avoidFeature = false,
		beamlaser = 1,
		beamTime = 0.15,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:BURN]],
		fireStarter = 10,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		name = [[MechRapidLaser]],
		noSelfDamage = true,
		proximityPriority = 1.5,
		range = 775,
		reloadtime = 0.07,
		renderType = 0,
		rgbColor = [[1 0 0]],
		soundHit = [[lasrhit1]],
		soundStart = [[lasfirerb]],
		soundTrigger = true,
		startsmoke = 1,
		sweepfire = false,
		thickness = 2,
		tolerance = 20000,
		turret = true,
		weaponTimer = 4,
		weaponType = [[BeamLaser]],
		weaponVelocity = 920,
		damage = {
			default = 210,
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
		footprintX = 6,
		footprintZ = 6,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[armraz1_dead]],
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
		footprintX = 6,
		footprintZ = 6,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[4X4B]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

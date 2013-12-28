-- UNITDEF -- HYPERION --
--------------------------------------------------------------------------------

local unitName = "hyperion"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.08,
	bmcode = 1,
	brakeRate = 0.024,
	buildCostEnergy = 110000,
	buildCostMetal = 66400,
	builder = false,
	buildTime = 1212470,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	cantBeTransported = true,
	category = [[ALL HUGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionVolumeOffsets = [[0 0 0]],
	collisionVolumeScales = [[125 142 92]],
	collisionVolumeTest = 1,
	collisionVolumeType = [[ellipsoid]],
	corpse = [[hyperion_dead]],
	damageModifier = 0.5,
	defaultmissiontype = [[Standby]],
	description = [[Gigantic Siege Kbot]],
	designation = [[CORE-EX1292]],
	downloadable = 1,
	energyMake = 0,
	energyStorage = 20000,
	energyUse = 0,
	explodeAs = [[CRAWL_BLAST]],
	firestandorders = 1,
	footprintX = 5,
	footprintZ = 5,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 162000,
	maxSlope = 17,
	maxVelocity = 1.9,
	maxWaterDepth = 12,
	metalMake = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[VKBOT5]],
	name = [[Hyperion]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[hyperion]],
	radarDistance = 2100,
	selfDestructAs = [[CRAWL_BLAST]],
	shootme = 1,
	sightDistance = 700,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	TEDClass = [[KBOT]],
	turnRate = 480,
	unitname = [[hyperion]],
	unitnumber = 764,
	upright = true,
	workerTime = 0,
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:bluemuzzle]],
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
			[1] = [[krogok1]],
		},
		select = {
			[1] = [[krogsel1]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[KARGANETH_CANNON]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	KARGANETH_CANNON = {
		accuracy = 500,
		areaOfEffect = 350,
		beamlaser = 1,
		beamTime = 0.55,
		burnblow = true,
		cegTag = [[bluelight]],
		coreThickness = 0.45,
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.01,
		endsmoke = 0,
		energypershot = 15000,
		explosionGenerator = [[custom:bigparticleboom]],
		fireStarter = 20,
		id = 168,
		impulseFactor = 0.2,
		largeBeamLaser = true,
		laserFlareSize = 5,
		lineOfSight = true,
		name = [[Karganeth Siege Cannon]],
		noExplode = true,
		range = 750,
		reloadtime = 0.54,
		renderType = 0,
		rgbColor = [[0.10 0.2 1]],
		rgbColor2 = [[.15 .3 1]],
		soundHitDry = [[burn02]],
		soundStart = [[build2]],
		soundTrigger = true,
		startsmoke = 0,
		targetmoveerrorr = 0.1,
		texture1 = [[Type4Beam]],
		texture3 = [[beamrifle]],
		thickness = 14,
		tolerance = 100000,
		turret = true,
		weaponType = [[BeamLaser]],
		weaponVelocity = 1500,
		damage = {
			default = 4500,
			experimental = 9000,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	hyperion_dead = {
		blocking = true,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Karganeth Wreckage]],
		energy = 0,
		featureDead = [[hyperion_heap]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 3,
		footprintZ = 3,
		height = 40,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[HYPERION_DEAD]],
		reclaimable = true,
		world = [[All Worlds]],
	},
	hyperion_heap = {
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
		object = [[3X3A]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

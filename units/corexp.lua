-- UNITDEF -- COREXP --
--------------------------------------------------------------------------------

local unitName = "corexp"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = true,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 32768,
	buildCostEnergy = 2264,
	buildCostMetal = 220,
	builder = false,
	buildPic = [[COREXP.png]],
	buildTime = 2724,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[DEAD]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Armed Metal Extractor]],
	energyStorage = 0,
	energyUse = 5,
	explodeAs = [[MEDIUM_BUILDINGEX]],
	extractsMetal = 0.001,
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	healtime = 12,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 1300,
	maxSlope = 20,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 75,
	name = [[Exploiter]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[COREXP]],
	onoffable = true,
	seismicSignature = 0,
	selfDestructCountdown = 1,
	side = [[CORE]],
	sightDistance = 455,
	smoothAnim = true,
	standingfireorder = 2,
	turnRate = 0,
	unitname = [[corexp]],
	workerTime = 0,
	yardMap = [[ooooooooo]],
	featureDefs = nil,
	sounds = {
		activate = [[mexrun2]],
		canceldestruct = [[cancel2]],
		deactivate = [[mexoff2]],
		underattack = [[warning1]],
		working = [[mexrun2]],
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
			[1] = [[servmed2]],
		},
		select = {
			[1] = [[mexon2]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[HLLT_BOTTOM]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	HLLT_BOTTOM = {
		areaOfEffect = 12,
		avoidFeature = false,
		beamlaser = 1,
		beamTime = 0.12,
		coreThickness = 0.175,
		craterBoost = 0,
		craterMult = 0,
		energypershot = 15,
		explosionGenerator = [[custom:SMALL_RED_BURN]],
		fireStarter = 100,
		impactonly = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		laserFlareSize = 10,
		lineOfSight = true,
		name = [[LightLaser]],
		noSelfDamage = true,
		proximityPriority = 3,
		range = 460,
		reloadtime = 0.38,
		renderType = 0,
		rgbColor = [[1 0 0]],
		soundHit = [[lasrhit2]],
		soundStart = [[lasrfir3]],
		soundTrigger = true,
		targetMoveError = 0.1,
		thickness = 2.5,
		tolerance = 10000,
		turret = true,
		weaponType = [[BeamLaser]],
		weaponVelocity = 2250,
		damage = {
			commanders = 140,
			default = 75,
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
		object = [[COREXP_DEAD]],
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

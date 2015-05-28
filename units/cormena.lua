-- UNITDEF -- CORMENA --
--------------------------------------------------------------------------------

local unitName = "cormena"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.0762939455,
	bmcode = 1,
	brakeRate = 0.0762939455,
	buildCostEnergy = 70341,
	buildCostMetal = 3328,
	builder = false,
	buildTime = 68237,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	cantBeTransported = true,
	category = [[ALL HUGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionVolumeOffsets = [[0 -7 4]],
	collisionVolumeScales = [[62 63 63]],
	collisionVolumeTest = 1,
	collisionVolumeType = [[ellipsoid]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[All-Terrain Long Range Plasma Cannon Kbot]],
	designation = [[COR-MENA]],
	downloadable = 1,
	energyMake = 10,
	energyStorage = 100,
	energyUse = 10,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 3950,
	maxSlope = 10,
	maxVelocity = 0.7629,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TKBOT3]],
	name = [[Menacer]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORMENA]],
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 245,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 510,
	unitname = [[cormena]],
	unitnumber = 20000,
	upright = false,
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
			[1] = [[kbcormov]],
		},
		select = {
			[1] = [[kbcorsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[MENACER]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	MENACER = {
		accuracy = 400,
		aimrate = 2500,
		areaOfEffect = 96,
		ballistic = true,
		cegTag = [[Trail_cannon]],
		craterBoost = 0,
		craterMult = 0,
		energypershot = 1500,
		fireStarter = 50,
		gravityaffected = [[TRUE]],
		holdtime = 1,
		id = 255,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		name = [[Menacer Cannon]],
		nogap = 1,
		range = 3900,
		reloadtime = 9,
		renderType = 4,
		rgbColor = [[1 0.93 0.68]],
		separation = 0.45,
		size = 1.85,
		sizedecay = -0.15,
		soundHitDry = [[xplonuk1]],
		soundStart = [[xplonuk3]],
		stages = 20,
		startsmoke = 1,
		tolerance = 300,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 1000,
		damage = {
			default = 1225,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	corgol_heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Goliath Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 4,
		footprintZ = 4,
		height = 4,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[4X4C]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	dead = {
		blocking = true,
		category = [[core_corpses]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[corgol_heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[cormena_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

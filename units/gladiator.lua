-- UNITDEF -- GLADIATOR --
--------------------------------------------------------------------------------

local unitName = "gladiator"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.06,
	bmcode = 1,
	brakeRate = 0.19,
	buildCostEnergy = 7450,
	buildCostMetal = 520,
	builder = false,
	buildTime = 6574,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionVolumeScales = [[44 32 29]],
	collisionVolumeOffsets = [[0 1 0]],
	collisionVolumeType = [[box]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Medium Infantry Kbot]],
	designation = [[LP-D-X]],
	downloadable = 1,
	energyMake = 0.5,
	energyStorage = 0,
	energyUse = 0.5,
	explodeAs = [[SMALL_UNITEX]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 500,
	maxDamage = 2350,
	maxSlope = 17,
	maxVelocity = 1.25,
	maxWaterDepth = 21,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[KBOT2]],
	name = [[Gladiator]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[Gladiator]],
	radarDistance = 0,
	selfDestructAs = [[SMALL_UNIT]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 410,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	turnRate = 700,
	unitname = [[gladiator]],
	unitnumber = 162,
	upright = true,
	workerTime = 0,
	customparams = {
		RequireTech = [[Advanced T1 Unit Research Centre]],
	},
		sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:Core_Rear_Muzzle]],
		},
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
			[1] = [[kbcormov]],
		},
		select = {
			[1] = [[kbcorsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[CORLEVLR_WEAPON]],
			onlyTargetCategory = [[NOTVTOL]],
		},
		[2] = {
			def = [[Gladiator_Laser]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	local weaponDefs = {
	CORLEVLR_WEAPON = {
		areaOfEffect = 160,
		burnblow = true,
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.75,
		explosionGenerator = [[custom:FLASH64]],
		impulseFactor = 1.5,
		lineOfSight = true,
		name = [[RiotCannon]],
		noSelfDamage = true,
		range = 325,
		reloadtime = 2.6,
		renderType = 4,
		rgbColor = [[0.7 0.37 0]],
		size = 2.26,
		soundHitDry = [[xplosml3]],
		soundStart = [[canlite3]],
		startsmoke = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 550,
		damage = {
			commanders = 197,
			default = 290,
			subs = 5,
		},
	},
	Gladiator_Laser = {
		areaOfEffect = 8,
		beamlaser = 1,
		beamTime = 0.08,
		burnblow = true,
		energypershot = 10,
		explosionGenerator = [[custom:LASER6]],
		fireStarter = 30,
		id = 81,
		impulseFactor = 0,
		laserFlareSize = 10,
		lineOfSight = true,
		name = [[Light Laser]],
		range = 550,
		reloadtime = 0.7,
		renderType = 0,
		rgbColor = [[0.000 1.000 0.612]],
		soundHitDry = [[lasrhit2]],
		soundStart = [[lasrfir3]],
		soundTrigger = true,
		targetmoveerro = 0.2,
		tolerance = 700,
		turret = true,
		weaponType = [[BeamLaser]],
		weaponVelocity = 800,
		damage = {
			default = 75,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[core_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 40,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[Gladiator_dead]],
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
		object = [[3x3a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

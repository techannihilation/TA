-- UNITDEF -- TLLHOVERROCKET --
--------------------------------------------------------------------------------

local unitName = "tllhoverrocket"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.04,
	bmcode = 1,
	brakeRate = 0.09,
	buildCostEnergy = 3412,
	buildCostMetal = 305,
	builder = false,
	buildTime = 12521,
	canAttack = true,
	canGuard = true,
	canHover = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL HOVER MEDIUM MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Hovercraft Vpulse Launcher]],
	designation = [[TLL-MRJ]],
	downloadable = 1,
	energyMake = 2.6,
	energyStorage = 0,
	energyUse = 2.6,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	maneuverleashlength = 640,
	maxDamage = 482,
	maxHeightDif = 16,
	maxVelocity = 2.15,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANKHOVER3]],
	name = [[Vandal]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[tllhoverrocket]],
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 280,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 360,
	unitname = [[tllhoverrocket]],
	unitnumber = 28803,
	workerTime = 0,
	featureDefs = nil,
	sounds = {
		canceldestruct = [[cancel2]],
		underattack = [[tllwarning]],
		cant = {
			[1] = [[wearoff]],
		},
		count = {
			[1] = [[tllcount]],
			[2] = [[tllcount]],
			[3] = [[tllcount]],
			[4] = [[tllcount]],
			[5] = [[tllcount]],
			[6] = [[tllcount]],
		},
		ok = {
			[1] = [[hovmdok1]],
		},
		select = {
			[1] = [[tllhoverok]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[MOBILE]],
			def = [[TLL_Vpulse]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	TLL_Vpulse = {
		areaOfEffect = 126,
		cegTag = [[TLLRAVENTRAIL]],
		fireSubmersed = true,
		fireStarter = 100,
		flightTime = 10,
		guidance = true,
		id = 236,
		lineOfSight = true,
		metalpershot = 0,
		model = [[vpulse]],
		name = [[Vpulse Rocket]],
		noautorange = 1,
		range = 800,
		reloadtime = 10.5,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.5,
		smokeTrail = false,
		soundHitDry = [[vpulsehit]],
		soundStart = [[vpulsefire]],
		startsmoke = 1,
		Texture1 = [[null]],
		Texture2 = [[null]],
		Texture3 = [[null]],
		Texture4 = [[null]],
		tolerance = 4000,
		turnRate = 24384,
		twoPhase = true,
		vlaunch = true,
		weaponAcceleration = 150,
		weaponTimer = 3.5,
		weaponType = [[StarburstLauncher]],
		weaponVelocity = 400,
		damage = {
			default = 400,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[tll_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 200,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllhoverrocket_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 80,
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

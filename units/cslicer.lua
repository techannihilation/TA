-- UNITDEF -- CSLICER --
--------------------------------------------------------------------------------

local unitName = "cslicer"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.5,
	ai_limit = [[limit cslicer 5]],
	ai_weight = [[weight cslicer 5]],
	bmcode = 1,
	brakeRate = 0.19,
	buildCostEnergy = 2567,
	buildCostMetal = 190,
	builder = false,
	buildTime = 2017,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Fast Assault Tank]],
	designation = [[TB-LG]],
	downloadable = 1,
	energyMake = 0.3,
	energyStorage = 0,
	energyUse = 0.3,
	explodeAs = [[SMALL_UNIT]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	frenchdescription = [[Char d'assaut rapide]],
	frenchname = [[Slicer]],
	germandescription = [[Schneller Gefechtspanzer]],
	germanname = [[Slicer]],
	maneuverleashlength = 640,
	maxDamage = 1300,
	maxSlope = 17,
	maxVelocity = 2.5,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANK2]],
	name = [[Slicer]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CSLICER]],
	radarDistance = 0,
	selfDestructAs = [[SMALL_UNIT]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 320,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	threed = 1,
	turnRate = 220,
	unitname = [[cslicer]],
	unitnumber = 905,
	version = 1.2,
	workerTime = 0,
	zbuffer = 1,
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
			def = [[EMG5]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	EMG5 = {
		areaOfEffect = 8,
		burst = 3,
		burstrate = 0.1,
		color = 2,
		explosionart = [[explode5]],
		explosiongaf = [[fx]],
		id = 16,
		lavaexplosionart = [[lavasplashsm]],
		lavaexplosiongaf = [[fx]],
		lineOfSight = true,
		model = [[plasma11]],
		name = [[E.M.G.]],
		range = 180,
		reloadtime = 0.4,
		renderType = 4,
		soundHit = [[lasrhit1]],
		soundStart = [[armsml2]],
		soundTrigger = true,
		sprayAngle = 1024,
		startsmoke = 1,
		tolerance = 6000,
		turret = true,
		waterexplosionart = [[h2oboom1]],
		waterexplosiongaf = [[fx]],
		weaponTimer = 1,
		weaponType = [[EmgCannon]],
		weaponVelocity = 300,
		damage = {
			default = 18,
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
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[cslicer_dead]],
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
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[2x2b]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

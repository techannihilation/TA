-- UNITDEF -- TAWF116 --
--------------------------------------------------------------------------------

local unitName = "tawf116"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.2,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.584,
	buildCostEnergy = 4130,
	buildCostMetal = 947,
	builder = false,
	buildTime = 5700,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	damageModifier = 0.65,
	defaultmissiontype = [[Standby]],
	description = [[Extended Armour Assault Vehicle]],
	designation = [[TAWF-31]],
	energyMake = 1.2,
	energyStorage = 0,
	energyUse = 1.2,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Véhicule d'assaut à blindage évolué]],
	frenchname = [[Seperator]],
	germandescription = [[Angriffsfahrzeug mit Verb. Panzerung]],
	germanname = [[Seperator]],
	maneuverleashlength = 640,
	maxDamage = 2500,
	maxSlope = 15,
	maxVelocity = 1.4451,
	maxWaterDepth = 18,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANK3]],
	name = [[Separator]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[TAWF116]],
	onoffable = true,
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 200,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 330,
	unitname = [[tawf116]],
	version = 3.1,
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
			[1] = [[tarmmove]],
		},
		select = {
			[1] = [[tarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ARM_DISINTEGRATORxxx]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARM_DISINTEGRATORxxx = {
		areaOfEffect = 48,
		avoidFriendly = 1,
		beamWeapon = true,
		craterBoost = 0,
		craterMult = 0,
		energypershot = 400,
		explosionart = [[explode5]],
		explosiongaf = [[fx]],
		explosionGenerator = [[custom:PARALYZER_BLUE]],
		fireStarter = 70,
		id = 22,
		lavaexplosionart = [[lavasplash]],
		lavaexplosiongaf = [[fx]],
		lineOfSight = true,
		model = [[plasmafire]],
		name = [[Disintegrator]],
		noExplode = true,
		range = 300,
		reloadtime = 1.5,
		renderType = 3,
		soundHit = [[xplomas2]],
		soundStart = [[disigun1]],
		soundTrigger = false,
		startsmoke = 1,
		turret = true,
		waterexplosionart = [[h2o]],
		waterexplosiongaf = [[fx]],
		weaponTimer = 4,
		weaponType = [[DGun]],
		weaponVelocity = 200,
		damage = {
			default = 250,
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
		object = [[TAWF116_dead]],
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

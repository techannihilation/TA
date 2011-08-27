-- UNITDEF -- TLLTRAQ --
--------------------------------------------------------------------------------

local unitName = "tlltraq"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.06,
	bmcode = 1,
	brakeRate = 0.21,
	buildCostEnergy = 11234,
	buildCostMetal = 764,
	builder = false,
	buildTime = 23659,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	cloakCost = 50,
	cloakCostMoving = 250,
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Inflitration Kbot]],
	designation = [[TLL-TK]],
	downloadable = 1,
	energyMake = 51,
	energyStorage = 500,
	energyUse = 5,
	explodeAs = [[SMALL_UNIT]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	healtime = 10,
	initCloaked = true,
	maneuverleashlength = 640,
	maxDamage = 1798,
	maxSlope = 19,
	maxVelocity = 1.5,
	maxWaterDepth = 14,
	metalStorage = 0,
	minCloakDistance = 65,
	mobilestandorders = 1,
	movementClass = [[KBOT2]],
	name = [[Tracker]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[TLLTRAQ]],
	onoffable = true,
	radarDistance = 450,
	selfDestructAs = [[BIG_UNITEX]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 250,
	standingfireorder = 2,
	standingmoveorder = 1,
	stealth = true,
	steeringmode = 2,
	threed = 1,
	turnRate = 1005,
	unitname = [[tlltraq]],
	unitnumber = 345665,
	upright = true,
	version = 3,
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
			[1] = [[kbarmmov]],
		},
		select = {
			[1] = [[kbarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[TLLTRAQ_WEAPON]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	TLLTRAQ_WEAPON = {
		areaOfEffect = 12,
		beamlaser = 1,
		beamTime = 0.12,
		color = 96,
		color2 = 98,
		coreThickness = 0.175,
		energypershot = 120,
		explosionart = [[explode5]],
		explosiongaf = [[fx]],
		fireStarter = 90,
		id = 234,
		lavaexplosionart = [[lavasplash]],
		lavaexplosiongaf = [[fx]],
		lineOfSight = true,
		name = [[High Energy Laser]],
		range = 380,
		reloadtime = 0.8,
		renderType = 0,
		soundHit = [[lasrhit1]],
		soundStart = [[lasrhvy3]],
		turret = true,
		waterexplosionart = [[h2o]],
		waterexplosiongaf = [[fx]],
		weaponType = [[BeamLaser]],
		weaponVelocity = 1100,
		damage = {
			default = 330,
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
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tlltraq_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Debris]],
		featurereclamate = [[smudge01]],
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[2x2c]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

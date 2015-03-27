-- UNITDEF -- TLLARIMAN --
--------------------------------------------------------------------------------

local unitName = "tllariman"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.055,
	bmcode = 1,
	brakeRate = 0.04,
	buildCostEnergy = 1106,
	buildCostMetal = 321,
	builder = false,
	buildTime = 3101,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Medium Assault Tank]],
	designation = [[]],
	energyMake = 0.6,
	energyUse = 0.7,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 1700,
	maxSlope = 10,
	maxVelocity = 2.6,
	maxWaterDepth = 12,
	mobilestandorders = 1,
	movementClass = [[TANK3]],
	name = [[Ariman]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[TLLARIMAN]],
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 320,
	standingfireorder = 2,
	standingmoveorder = 0,
	steeringmode = 1,
	turnRate = 625,
	unitname = [[tllariman]],
	unitnumber = 827,
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:Generic_Muzzle]],
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
			[1] = [[tarmmove]],
		},
		select = {
			[1] = [[tarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[LIGHT_CANNON]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	LIGHT_CANNON = {
		areaOfEffect = 12,
		avoidFeature = false,
		ballistic = true,
		cegTag = [[Trail_cannon]],
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:LIGHT_PLASMA_BLING]],
		fireStarter = 100,
		gravityaffected = [[TRUE]],
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		name = [[LightCannon]],
		nogap = 1,
		noSelfDamage = true,
		range = 315,
		reloadtime = 1.3,
		renderType = 4,
		rgbColor = [[0.87 0.63 0]],
		separation = 0.45,
		size = 1.36,
		sizedecay = -0.15,
		soundHitDry = [[xplosml3]],
		soundStart = [[canlite3]],
		stages = 20,
		startsmoke = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 225,
		damage = {
			default = 130,
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
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllariman_dead]],
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
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[2x2e]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

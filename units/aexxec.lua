-- UNITDEF -- AEXXEC --
--------------------------------------------------------------------------------

local unitName = "aexxec"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.4,
	bmcode = 1,
	brakeRate = 0.25,
	buildCostEnergy = 5311,
	buildCostMetal = 675,
	builder = false,
	buildTime = 8500,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionVolumeScales = [[32.564346313477 30.564346313477 26.564346313477]],
	collisionVolumeOffsets = [[0 -2 3]],
	collisionVolumeType = [[box]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Heavy Assault Kbot]],
	designation = [[ARM-KI2]],
	downloadable = 1,
	energyStorage = 0,
	energyUse = 0.5,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	maneuverleashlength = 640,
	mass = 5000,
	maxDamage = 3700,
	maxSlope = 17,
	maxVelocity = 1.05,
	maxWaterDepth = 25,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[HKBOT3]],
	name = [[Exxec]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[AEXXEC]],
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 350,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 700,
	unitname = [[aexxec]],
	unitnumber = 901,
	workerTime = 0,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:aexxec_flare]],
		},
		pieceExplosionGenerators = { 
			"DEBREE5", 
		}, 
        },
	customparams = {
		RequireTech = [[Advanced T1 Unit Research Centre]],
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
			[1] = [[kbarmmov]],
		},
		select = {
			[1] = [[kbarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ARM_EXXEC]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARM_EXXEC = {
		areaOfEffect = 8,
		beamWeapon = true,
		energypershot = 0,
		explosionGenerator = [[custom:exxec]],
		fireStarter = 30,
		lineOfSight = true,
		name = [[Annihilator Weapon]],
		range = 255,
		reloadtime = 0.33,
		renderType = 0,
		rgbColor = [[0.000 0.012 1.000]],
		soundHitDry = [[lasrhvy2]],
		soundStart = [[lasrfast]],
		soundTrigger = true,
		tolerance = 500,
		turret = true,
		weaponType = [[LaserCannon]],
		weaponVelocity = 800,
		damage = {
			commanders = 50,
			default = 150, 
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
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[aexxec_dead]],
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

-- UNITDEF -- CHAMP --
--------------------------------------------------------------------------------

local unitName = "champ"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.06,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.046,
	buildCostEnergy = 80900,
	buildCostMetal = 4950,
	builder = false,
	buildTime = 26678,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionVolumeOffsets = [[0 -2 0]],
	collisionVolumeScales = [[47 27 51]],
	collisionVolumeTest = 1,
	collisionVolumeType = [[box]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Experimantal Hunter Tank]],
	downloadable = 1,
	energyMake = 5.5,
	energyStorage = 0,
	energyUse = 1,
	explodeAs = [[BIG_UNIT]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	idleAutoHeal = 5,
	idleTime = 1800,
	hideDamage = false,
	immunetoparalyzer = 1,
	maneuverleashlength = 1200,
	maxDamage = 28000,
	maxSlope = 18,
	maxVelocity = 1.7,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[htank4]],
	name = [[Champion]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[champ]],
	radarDistance = 0,
	selfDestructAs = [[BIG_UNITEX]],
	shootme = 0,
	side = [[CORE]],
	sightDistance = 350,
	standingfireorder = 2,
	standingmoveorder = 1,
	stealth = true,
	steeringmode = 2,
	turnRate = 244,
	unitname = [[champ]],
	unitnumber = 623,
	upright = false,
	workerTime = 0,
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:akmech_muzzle]],
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
			def = [[champ_gauss]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	champ_gauss = {
		areaOfEffect = 48,
		id = 6,
		impulseFactor = 2,
		lineOfSight = true,
		minbarrelangle = -50,
		name = [[GaussCannon]],
		noExplode = true,
		pitchtolerance = 12000,
		range = 590,
		reloadtime = 1,
		renderType = 4,
		rgbColor = [[1.000 0.047 0.000]],
		soundHitDry = [[xplomed2]],
		soundStart = [[Krogun1]],
		startsmoke = 1,
		tolerance = 2400,
		turret = true,
		weaponType = [[EmgCannon]],
		weaponVelocity = 530,
		damage = {
			default = 120,
			experimental_land = 200,
			experimental_ships = 200,
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
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[champ_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

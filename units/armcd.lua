-- UNITDEF -- ARMCD --
--------------------------------------------------------------------------------

local unitName = "armcd"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.12,
	bmcode = 1,
	brakeRate = 0.25,
	buildCostEnergy = 8928,
	buildCostMetal = 1992,
	builder = false,
	buildTime = 9102,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionVolumeOffsets = [[0 -1 0]],
	collisionVolumeScales = [[30.908721923828 18.908721923828 48.908721923828]],
	collisionVolumeTest = 1,
	collisionVolumeType = [[CylZ]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Heavy Laser Tank]],
	designation = [[ARM-CD]],
	energyMake = 0.4,
	energyStorage = 0,
	energyUse = 0.4,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 490,
	maxDamage = 2350,
	maxSlope = 13,
	maxVelocity = 1.1,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANK3]],
	name = [[Coodos]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMCD]],
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 290,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	turnRate = 480,
	unitname = [[armcd]],
	unitnumber = 2109,
	upright = true,
	workerTime = 0,
	customparams = {
		RequireTech = [[Advanced T2 Unit Research Centre]],
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
			[1] = [[tarmmove]],
		},
		select = {
			[1] = [[tarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[SMALL TINY]],
			def = [[hvy_laser_weapon]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	hvy_laser_weapon = {
		areaOfEffect = 38,
		beamWeapon = true,
		id = 99,
		lineOfSight = true,
		name = [[Heavy Laser]],
		range = 450,
		reloadtime = 0.75,
		renderType = 0,
		rgbColor = [[1.000 0.000 0.412]],
		soundHitDry = [[lashit]],
		soundStart = [[lasrlit1]],
		turret = true,
		weaponType = [[LaserCannon]],
		weaponVelocity = 800,
		damage = {
			commanders = 700,
			default = 2200,
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
		height = 22,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[armcd_dead]],
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
		object = [[3x3b]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

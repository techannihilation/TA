-- UNITDEF -- ARMCLAW --
--------------------------------------------------------------------------------

local unitName = "armclaw"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 1e-013,
	bmcode = 1,
	buildAngle = 8192,
	buildCostEnergy = 1546,
	buildCostMetal = 250,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 4,
	buildingGroundDecalSizeY = 4,
	buildingGroundDecalType = [[armclaw_aoplane.dds]],
	buildPic = [[ARMCLAW.png]],
	buildTime = 4638,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[DEAD]],
	damageModifier = 0.15,
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Pop-up Lightning Turret]],
	designation = [[A-DC]],
	digger = 1,
	downloadable = 1,
	energyMake = 0,
	energyStorage = 15,
	energyUse = 0,
	explodeAs = [[MEDIUM_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	hideDamage = true,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	mass = 10000000000,
	maxDamage = 1200,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Dragon's Claw]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[ARMCLAW]],
	radarDistanceJam = 8,
	seismicSignature = 0,
	selfDestructAs = [[MEDIUM_BUILDING]],
	side = [[ARM]],
	sightDistance = 440,
	smoothAnim = true,
	standingfireorder = 2,
	stealth = true,
	threed = 1,
	turnRate = 1e-013,
	unitname = [[armclaw]],
	upright = true,
	useBuildingGroundDecal = true,
	version = 1,
	workerTime = 0,
	zbuffer = 1,
	featureDefs = nil,
	sounds = {
		canceldestruct = [[cancel2]],
		cloak = [[kloak1]],
		uncloak = [[kloak1un]],
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
			[1] = [[servmed2]],
		},
		select = {
			[1] = [[servmed2]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[DCLAW]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	DCLAW = {
		areaOfEffect = 8,
		beamWeapon = true,
		color = 128,
		color2 = 130,
		craterBoost = 0,
		craterMult = 0,
		duration = 8,
		explosionGenerator = [[custom:LIGHTNING_FLASH]],
		fireStarter = 50,
		impactonly = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		name = [[LightningGun]],
		noSelfDamage = true,
		range = 440,
		reloadtime = 1.15,
		renderType = 7,
		soundHit = [[lashit]],
		soundStart = [[lghthvy1]],
		soundTrigger = true,
		startsmoke = 1,
		turret = true,
		weaponType = [[LightningCannon]],
		weaponVelocity = 450,
		damage = {
			commanders = 390,
			default = 210,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		autoreclaimable = 0,
		blocking = true,
		category = [[corpses]],
		damage = 0.4500 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[ROCKTEETH]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8200 * unitDef.buildCostMetal,
		nodrawundergray = true,
		object = [[ARMDRAG]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	ROCKTEETH = {
		animating = 0,
		animtrans = 0,
		blocking = false,
		category = [[rocks]],
		damage = 500,
		description = [[Rubble]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 2,
		object = [[2X2A]],
		reclaimable = true,
		shadtrans = 1,
		world = [[greenworld]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

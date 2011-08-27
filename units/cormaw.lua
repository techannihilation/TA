-- UNITDEF -- CORMAW --
--------------------------------------------------------------------------------

local unitName = "cormaw"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 1e-013,
	bmcode = 1,
	buildAngle = 8192,
	buildCostEnergy = 1412,
	buildCostMetal = 273,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 4,
	buildingGroundDecalSizeY = 4,
	buildingGroundDecalType = [[cormaw_aoplane.dds]],
	buildPic = [[CORMAW.png]],
	buildTime = 4419,
	canAttack = true,
	canstop = 1,
	category = [[ALL ANTIFLAME NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[DEAD]],
	damageModifier = 0.15,
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Pop-up Flamethrower Turret]],
	designation = [[C-DM]],
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
	maxDamage = 1450,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Dragon's Maw]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CORMAW]],
	radarDistanceJam = 8,
	seismicSignature = 0,
	selfDestructAs = [[MEDIUM_BUILDING]],
	side = [[CORE]],
	sightDistance = 422,
	smoothAnim = true,
	standingfireorder = 2,
	stealth = true,
	threed = 1,
	turnRate = 1e-013,
	unitname = [[cormaw]],
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
			badTargetCategory = [[ANTIFLAME]],
			def = [[DMAW]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	DMAW = {
		areaOfEffect = 64,
		burst = 12,
		burstrate = 0.01,
		craterBoost = 0,
		craterMult = 0,
		endsmoke = 0,
		fireStarter = 100,
		flameGfxTime = 1.9,
		groundbounce = true,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		intensity = 0.9,
		lineOfSight = true,
		name = [[FlameThrower]],
		noSelfDamage = true,
		proximityPriority = 3,
		randomdecay = 0.2,
		range = 410,
		reloadtime = 0.7,
		renderType = 5,
		rgbColor = [[1 0.95 0.9]],
		rgbColor2 = [[0.9 0.85 0.8]],
		sizeGrowth = 1.2,
		smokedelay = 1,
		soundStart = [[Flamhvy1]],
		soundTrigger = false,
		sprayAngle = 9600,
		startsmoke = 0,
		targetMoveError = 0.001,
		tolerance = 2500,
		turret = true,
		weaponTimer = 1,
		weaponType = [[Flame]],
		weaponVelocity = 300,
		damage = {
			commanders = 20,
			default = 25,
			flamethrowers = 8.3333,
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
		damage = 0.4138 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[ROCKTEETH]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.6484 * unitDef.buildCostMetal,
		nodrawundergray = true,
		object = [[CORDRAG]],
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

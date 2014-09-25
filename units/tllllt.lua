-- UNITDEF -- TLLLLT --
--------------------------------------------------------------------------------

local unitName = "tllllt"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 32768,
	buildCostEnergy = 250,
	buildCostMetal = 90,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 4,
	buildingGroundDecalSizeY = 4,
	buildingGroundDecalType = [[tllllt_aoplane.dds]],
	buildPic = [[TLLLLT.png]],
	buildTime = 2900,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionvolumeoffsets = [[0 0 0]],
	collisionvolumescales = [[22 75 22]],
	collisionvolumetest = 1,
	collisionvolumetype = [[box]],
	corpse = [[DEAD]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Light Lightning Tower]],
	energyStorage = 100,
	energyUse = 0,
	explodeAs = [[MEDIUM_BUILDINGEX]],
	firestandorders = 1,
	floater = true,
	footprintX = 2,
	footprintZ = 2,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 710,
	maxSlope = 14,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[LLT]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLLLT]],
	seismicSignature = 0,
	selfDestructAs = [[MEDIUM_BUILDING]],
	side = [[TLL]],
	sightDistance = 494,
	standingfireorder = 2,
	turnRate = 0,
	unitname = [[tllllt]],
	--useBuildingGroundDecal = true,
	workerTime = 0,
	yardMap = [[oooo]],
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:tllllt_glow]],
		},
	},
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
			def = [[SPAM_LIGHTNING]],
			badTargetCategory = [[MEDIUM LARGE HUGE]], 
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	SPAM_LIGHTNING = {
		areaOfEffect = 8,
		beamttl = 10,
		beamWeapon = true,
		burst = 3,
		burstrate = 0.125,
		craterBoost = 0,
		craterMult = 0,
		duration = 1.9,
		energypershot = 2,
		explosionGenerator = [[custom:tllweb_exp]],
		fireStarter = 85,
		id = 225,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		intensity = 12,
		lineOfSight = true,
		metalpershot = 0,
		name = [[Spray Lightning]],
		noSelfDamage = true,
		projectiles = 2,
		range = 350,
		reloadtime = 1.10,
		renderType = 7,
		rgbColor = [[0.6 0.6 0.9]],
		sprayangle = 1500,
		soundHitDry = [[lashit2]],
		soundStart = [[Lghthvy1]],
		texture1 = [[strike]],
		thickness = 2,
		tolerance = 10000,
		turret = true,
		weaponTimer = 1,
		weaponType = [[LightningCannon]],
		weaponVelocity = 2250,
		damage = {
			commanders = 38,
			default = 32,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = true,
		category = [[corpses]],
		collisionvolumeoffsets = [[0 0 0]],
		collisionvolumescales = [[32 40 32]],
		collisionvolumetype = [[CylY]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[TLLLLT_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[2X2B]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

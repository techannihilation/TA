-- UNITDEF -- CORERAD1 --
--------------------------------------------------------------------------------

local unitName = "corerad1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 65536,
	buildCostEnergy = 8723,
	buildCostMetal = 1805,
	builder = false,
	buildPic = [[CORERAD.png]],
	buildTime = 19958,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[CORERAD_DEAD]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Upgraded Bomb-Resistant Medium-Range Missile Battery]],
	energyMake = 0,
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 4600,
	maxSlope = 10,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Upg Eradicator]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CORERAD]],
	seismicSignature = 0,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[CORE]],
	sightDistance = 1100,
	smoothAnim = true,
	standingfireorder = 2,
	turnRate = 0,
	unitname = [[corerad1]],
	workerTime = 0,
	yardMap = [[oooooooooooooooo]],
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
			[1] = [[twrturn3]],
		},
		select = {
			[1] = [[twrturn3]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[SMALLVTOL TINYVTOL]],
			def = [[COR_ERAD2]],
			onlyTargetCategory = [[VTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	COR_ERAD2 = {
		areaOfEffect = 84,
		burnblow = true,
		burst = 4,
		burstrate = 0.4,
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.75,
		explosionGenerator = [[custom:CORE_FIRE_SMALL]],
		fireStarter = 20,
		flightTime = 3,
		guidance = true,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		model = [[missile]],
		name = [[ExplosiveRockets]],
		noSelfDamage = true,
		proximityPriority = -1,
		range = 1700,
		reloadtime = 0.2,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHit = [[xplosml2]],
		soundStart = [[rocklit1]],
		soundTrigger = true,
		startsmoke = 1,
		startVelocity = 750,
		texture2 = [[coresmoketrail]],
		toAirWeapon = true,
		tolerance = 10000,
		tracks = true,
		turnRate = 55000,
		turret = true,
		weaponAcceleration = 150,
		weaponTimer = 3,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 2500,
		damage = {
			bombers = 162,
			default = 5,
			fighters = 108,
			flak_resistant = 108,
			unclassed_air = 108,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	CORERAD_DEAD = {
		blocking = true,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Eradicator Wreckage]],
		energy = 0,
		featureDead = [[CORERAD_HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 4,
		footprintZ = 4,
		height = 20,
		hitdensity = 100,
		metal = 0.5531 * unitDef.buildCostMetal,
		object = [[CORERAD_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	CORERAD_HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Eradicator Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 100,
		metal = 0.4425 * unitDef.buildCostMetal,
		object = [[3X3B]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

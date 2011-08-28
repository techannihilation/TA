-- UNITDEF -- TLLSAM --
--------------------------------------------------------------------------------

local unitName = "tllsam"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 2843,
	buildCostMetal = 479,
	builder = false,
	buildTime = 8413,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[SAM Tower]],
	designation = [[TL-SAM]],
	energyUse = 12,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	maxDamage = 2295,
	maxSlope = 20,
	maxWaterDepth = 0,
	name = [[Wiper]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLSAM]],
	ovradjust = 1,
	radarDistance = 950,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 350,
	standingfireorder = 2,
	threed = 1,
	unitname = [[tllsam]],
	unitnumber = 848,
	version = 3.1,
	workerTime = 0,
	yardMap = [[ooooooooo]],
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
			def = [[PACKO_MISSILE]],
			onlyTargetCategory = [[VTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	PACKO_MISSILE = {
		areaOfEffect = 16,
		burst = 2,
		burstrate = 0.2,
		canattackground = false,
		craterBoost = 0,
		craterMult = 0,
		energypershot = 0,
		explosionGenerator = [[custom:FLASH2]],
		fireStarter = 72,
		flightTime = 2,
		guidance = true,
		impactonly = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		metalpershot = 0,
		model = [[missile]],
		name = [[AA2Missile]],
		noSelfDamage = true,
		proximityPriority = 1,
		range = 1000,
		reloadtime = 1.7,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHit = [[packohit]],
		soundStart = [[packolau]],
		soundTrigger = true,
		startsmoke = 1,
		startVelocity = 520,
		texture2 = [[armsmoketrail]],
		toAirWeapon = true,
		tolerance = 9950,
		tracks = true,
		turnRate = 68000,
		turret = true,
		weaponAcceleration = 160,
		weaponTimer = 2,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 820,
		wobble = 120,
		damage = {
			bombers = 420,
			default = 5,
			fighters = 630,
			flak_resistant = 420,
			unclassed_air = 420,
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
		footprintX = 3,
		footprintZ = 3,
		height = 12,
		hitdensity = 23,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllSAM_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Metal Shards]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		hitdensity = 4,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3x3b]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

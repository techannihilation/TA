-- UNITDEF -- TLLEMP --
--------------------------------------------------------------------------------

local unitName = "tllemp"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 13341,
	buildCostMetal = 1120,
	builder = false,
	buildTime = 59531,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Long range EMP Launcher]],
	designation = [[TL-EMP]],
	downloadable = 1,
	energyMake = 0,
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[ATOMIC_BLASTSML]],
	firestandorders = 1,
	firestate = 0,
	footprintX = 4,
	footprintZ = 4,
	iconType = [[building]],
	maxDamage = 2500,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Freezer]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLEMP]],
	ovradjust = 1,
	radarDistance = 0,
	selfDestructAs = [[NUCLEAR_MISSILE]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 350,
	standingfireorder = 0,
	threed = 1,
	unitname = [[tllemp]],
	unitnumber = 861,
	version = 3.1,
	workerTime = 0,
	yardMap = [[oooo oooo oooo oooo]],
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
			[1] = [[servroc1]],
		},
		select = {
			[1] = [[servroc1]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ARMEMP_WEAPON]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMEMP_WEAPON = {
		areaOfEffect = 200,
		commandfire = true,
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 1,
		energypershot = 23437,
		explosionGenerator = [[custom:EMPLAUNCHER]],
		fireStarter = 0,
		flightTime = 400,
		guidance = true,
		impulseBoost = 0,
		impulseFactor = 0,
		lineOfSight = true,
		metalpershot = 750,
		model = [[empmisl]],
		name = [[EMPMissile]],
		noautorange = 1,
		noSelfDamage = true,
		paralyzer = true,
		paralyzeTime = 35,
		propeller = 1,
		range = 6000,
		reloadtime = 2,
		renderType = 1,
		selfprop = true,
		shakeduration = 1.5,
		shakemagnitude = 32,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHit = [[xplomed4]],
		soundStart = [[misicbm1]],
		startsmoke = 1,
		stockpile = true,
		stockpiletime = 100,
		tolerance = 4000,
		turnRate = 32768,
		twoPhase = true,
		vlaunch = true,
		weaponAcceleration = 180,
		weaponTimer = 5,
		weaponType = [[StarburstLauncher]],
		weaponVelocity = 1200,
		damage = {
			commanders = 300,
			default = 200000,
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
		footprintX = 4,
		footprintZ = 4,
		height = 12,
		hitdensity = 123,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllsilo_dead]],
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
		footprintX = 4,
		footprintZ = 4,
		hitdensity = 4,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[4x4c]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

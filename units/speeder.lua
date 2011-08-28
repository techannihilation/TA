-- UNITDEF -- SPEEDER --
--------------------------------------------------------------------------------

local unitName = "speeder"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.1,
	bmcode = 1,
	brakeRate = 0.09,
	buildCostEnergy = 19864,
	buildCostMetal = 1168,
	builder = false,
	buildTime = 28896,
	canAttack = true,
	canGuard = true,
	canHover = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL HOVER LARGE MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Heavy Laser Hovertank]],
	designation = [[ARM-EW]],
	downloadable = 1,
	energyMake = 2.6,
	energyStorage = 0,
	energyUse = 2.6,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Hovercraft à laser lourd]],
	germandescription = [[Schweres Laser Hovercraft]],
	maneuverleashlength = 640,
	maxDamage = 4300,
	maxSlope = 16,
	maxVelocity = 2.6,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[TANKHOVER3]],
	name = [[Long Tom]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[SPEEDER]],
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 280,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 350,
	unitname = [[speeder]],
	unitnumber = 902,
	version = 1.2,
	workerTime = 0,
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
			[1] = [[hovmdok1]],
		},
		select = {
			[1] = [[hovmdsl1]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ARM_LASERH2]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARM_LASERH2 = {
		areaOfEffect = 14,
		beamlaser = 1,
		beamTime = 0.15,
		coreThickness = 0.2,
		craterBoost = 0,
		craterMult = 0,
		energypershot = 75,
		explosionGenerator = [[custom:GreenLaser]],
		fireStarter = 90,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		laserFlareSize = 10,
		lineOfSight = true,
		name = [[HighEnergyLaser]],
		noSelfDamage = true,
		range = 700,
		reloadtime = 0.6,
		renderType = 0,
		rgbColor = [[0 1 0]],
		soundHit = [[lasrhit1]],
		soundStart = [[Lasrmas2]],
		targetMoveError = 0.2,
		thickness = 3,
		tolerance = 10000,
		turret = true,
		weaponType = [[BeamLaser]],
		weaponVelocity = 2250,
		damage = {
			commanders = 500,
			default = 237,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = false,
		category = [[arm_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Long_Tom Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 5,
		footprintZ = 5,
		height = 4,
		hitdensity = 140,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[speeder_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

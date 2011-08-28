-- UNITDEF -- ARMHH --
--------------------------------------------------------------------------------

local unitName = "armhh"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 1,
	bmcode = 1,
	brakeRate = 0.3,
	buildCostEnergy = 13655,
	buildCostMetal = 1300,
	builder = false,
	buildTime = 26900,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	cantBeTransported = true,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Heavy Assault Kbot]],
	designation = [[HH-HAK]],
	downloadable = 1,
	energyMake = 0,
	energyStorage = 0,
	energyUse = 150,
	explodeAs = [[CRAWL_BLASTSML]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	frenchdescription = [[Heavy Assualt Kbot]],
	frenchname = [[Hell Hound]],
	germandescription = [[Heavy Assualt Kbot]],
	germanname = [[Hell Hound]],
	healtime = 1,
	maneuverleashlength = 640,
	maxDamage = 5500,
	maxSlope = 17,
	maxVelocity = 2.5,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[KBOT2]],
	name = [[Hell Hound]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ArmHH]],
	radarDistance = 0,
	selfDestructAs = [[CRAWL_BLASTSML]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 500,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	threed = 1,
	turnRate = 700,
	unitname = [[armhh]],
	unitnumber = 10004,
	upright = false,
	version = 3,
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
			[1] = [[kbarmmov]],
		},
		select = {
			[1] = [[kbarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[Arm_Laserh3]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	Arm_Laserh3 = {
		accuracy = 0,
		areaOfEffect = 12,
		beamlaser = 1,
		beamTime = 0.3,
		coreThickness = 0.5,
		edgeEffectiveness = 1,
		energypershot = 18,
		explosionGenerator = [[custom:GreenLaser]],
		fireStarter = 80,
		id = 91,
		impulseFactor = 0,
		intensity = 1,
		interceptedByShieldType = 1,
		laserFlareSize = 15,
		name = [[High Energy Laser]],
		range = 450,
		reloadtime = 0.45,
		rgbColor = [[0 0.3 0]],
		rgbColor2 = [[0.3 1 0.3]],
		soundHit = [[lashit]],
		soundStart = [[lghthvy1]],
		soundTrigger = false,
		thickness = 3,
		turret = true,
		weaponType = [[BeamLaser]],
		damage = {
			default = 250,
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
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[armhh_dead]],
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
		footprintX = 4,
		footprintZ = 4,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[4x4a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- CMORTOR --
--------------------------------------------------------------------------------

local unitName = "cmortor"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 4096,
	buildCostEnergy = 31342,
	buildCostMetal = 1987,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 6,
	buildingGroundDecalSizeY = 6,
	buildingGroundDecalType = [[cmortor_aoplane.dds]],
	buildTime = 33833,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Range Mortar Cannon]],
	designation = [[HM-SN11]],
	energyStorage = 10,
	energyUse = 0,
	explodeAs = [[MEDIUM_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	frenchdescription = [[Mortier lourd à courte portée]],
	frenchname = [[Avalanche]],
	germandescription = [[Schwerer Mörser mit kurzer Reichweite]],
	germanname = [[Avalanche]],
	maxDamage = 3611,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Avalanche]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CMORTOR]],
	radarDistance = 0,
	selfDestructAs = [[MEDIUM_BUILDING]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 350,
	standingfireorder = 2,
	threed = 1,
	unitname = [[cmortor]],
	unitnumber = 111,
	useBuildingGroundDecal = true,
	version = 1,
	workerTime = 0,
	yardMap = [[oooo oooo oooo oooo]],
	zbuffer = 1,
	customparams = {
		RequireTech = [[Advanced T1 Unit Research Centre]],
	},
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
			[1] = [[twractv3]],
		},
		select = {
			[1] = [[twractv3]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[TINY]],
			def = [[MORTARTILLERY]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	MORTARTILLERY = {
		areaOfEffect = 70,
		ballistic = true,
		cegTag = [[Trail_cannon]],
		craterBoost = 0,
		craterMult = 0,
		gravityaffected = [[TRUE]],
		id = 169,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		minbarrelangle = -35,
		name = [[Mortar Cannon]],
		nogap = 1,
		range = 1700,
		reloadtime = 2.1,
		renderType = 4,
		rgbColor = [[1 0.88 0.23]],
		separation = 0.45,
		size = 1.58,
		sizedecay = -0.15,
		soundHitDry = [[xplomed4]],
		soundStart = [[cannhvy2]],
		stages = 20,
		startsmoke = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 550,
		damage = {
			default = 300,
			experimental_ships = 600,
			ships = 450,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[core_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[CMortor Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 40,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[cmortor_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Cmortor Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[4x4d]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

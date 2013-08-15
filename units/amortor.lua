-- UNITDEF -- AMORTOR --
--------------------------------------------------------------------------------

local unitName = "amortor"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 4096,
	buildCostEnergy = 29342,
	buildCostMetal = 2010,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 6,
	buildingGroundDecalSizeY = 6,
	buildingGroundDecalType = [[amortor_aoplane.dds]],
	buildTime = 33833,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionVolumeOffsets = [[0 -10 1]],
	collisionVolumeScales = [[48.6 59.6 54.6]],
	collisionVolumeTest = 1,
	collisionVolumeType = [[ellipsoid]],
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
	maxDamage = 3411,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Land Slide]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[AMORTOR]],
	radarDistance = 0,
	selfDestructAs = [[MEDIUM_BUILDING]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 350,
	standingfireorder = 2,
	unitname = [[amortor]],
	unitnumber = 111,
	useBuildingGroundDecal = true,
	workerTime = 0,
	yardMap = [[oooo oooo oooo oooo]],
	customparams = {
		RequireTech = [[Advanced T1 Unit Research Centre]],
	},
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:mediumflare]],
		},
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
		explosionGenerator = [[custom:flash70_fakelight]],
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
		category = [[arm_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[AMortor Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 40,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[amortor_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Amortor Heap]],
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

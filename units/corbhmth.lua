-- UNITDEF -- CORBHMTH --
--------------------------------------------------------------------------------

local unitName = "corbhmth"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = true,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 8192,
	buildCostEnergy = 50000,
	buildCostMetal = 5000,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 8,
	buildingGroundDecalSizeY = 8,
	buildingGroundDecalType = [[corbhmth_aoplane.dds]],
	buildPic = [[CORBHMTH.png]],
	buildTime = 90000,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Geothermal Plasma Battery]],
	energyMake = 1024,
	energyStorage = 2048,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 5,
	footprintZ = 5,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 7500,
	maxSlope = 10,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Behemoth]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CORBHMTH]],
	onoffable = false,
	seismicSignature = 0,
	selfDestructAs = [[ESTOR_BUILDING]],
	side = [[CORE]],
	sightDistance = 650,
	standingfireorder = 2,
	turnRate = 0,
	unitname = [[corbhmth]],
	useBuildingGroundDecal = true,
	workerTime = 0,
	yardMap = [[ooooo ooooo ooGoo ooooo ooooo]],
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:muzzleflaretiny]],
		},
	},
	sounds = {
		canceldestruct = [[cancel2]],
		underattack = [[warning1]],
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		select = {
			[1] = [[geothrm2]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[SMALL TINY]],
			def = [[CORBHMTH_WEAPON1]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORBHMTH_WEAPON1 = {
		accuracy = 780,
		areaOfEffect = 192,
		ballistic = true,
		cegTag = [[Trail_cannon]],
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.7,
		energypershot = 320,
		explosionGenerator = [[custom:FLASHSMALLBUILDINGEX]],
		fireStarter = 99,
		gravityaffected = [[TRUE]],
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		name = [[PlasmaBattery]],
		nogap = 1,
		noSelfDamage = true,
		range = 1780,
		reloadtime = 0.5,
		renderType = 4,
		rgbColor = [[0.72 0.4 0]],
		separation = 0.45,
		size = 2.44,
		sizedecay = -0.15,
		soundHitDry = [[xplolrg3]],
		soundStart = [[xplonuk3]],
		stages = 20,
		startsmoke = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 620,
		damage = {
			commanders = 900,
			default = 450,
			experimental_ships = 900,
			ships = 675,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[corpses]],
		collisionvolumeoffsets = [[1.45333862305 -0.843691186523 0.648628234863]],
		collisionvolumescales = [[83.4941711426 37.581817627 90.826675415]],
		collisionvolumetype = [[Box]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 5,
		footprintZ = 5,
		height = 20,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[CORBHMTH_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 5,
		footprintZ = 5,
		height = 4,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[5X5C]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- CORBHMTH1 --
--------------------------------------------------------------------------------

local unitName = "corbhmth1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = true,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 8192,
	buildCostEnergy = 120000,
	buildCostMetal = 9000,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 8,
	buildingGroundDecalSizeY = 8,
	buildingGroundDecalType = [[corbhmth1_aoplane.dds]],
	buildPic = [[CORBHMTH.png]],
	buildTime = 140000,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[corbhmth_dead]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Geothermal Long Range Plasma Battery]],
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
	name = [[Long Range Behemoth]],
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
	unitname = [[corbhmth1]],
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
			def = [[CORBHMTH_WEAPON2]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORBHMTH_WEAPON2 = {
		accuracy = 780,
		areaOfEffect = 192,
		ballistic = true,
		cegTag = [[Trail_cannon]],
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.7,
		energypershot = 512,
		explosionGenerator = [[custom:FLASHSMALLBUILDINGEX]],
		fireStarter = 99,
		gravityaffected = [[TRUE]],
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		name = [[PlasmaBattery]],
		nogap = 1,
		noSelfDamage = true,
		range = 2580,
		reloadtime = 0.75,
		renderType = 4,
		rgbColor = [[0.9 0.68 0]],
		separation = 0.45,
		size = 2.44,
		sizedecay = -0.15,
		soundHitDry = [[xplolrg3]],
		soundStart = [[xplonuk3]],
		stages = 20,
		startsmoke = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 820,
		damage = {
			commanders = 900,
			default = 1100,
			experimental_ships = 2200,
			ships = 1650,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	corbhmth_dead = {
		blocking = true,
		category = [[corpses]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Behemoth Wreckage]],
		energy = 0,
		featureDead = [[CORBHMTH_HEAP]],
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
	CORBHMTH_HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Behemoth Heap]],
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

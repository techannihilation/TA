-- UNITDEF -- ARMANNI --
--------------------------------------------------------------------------------

local unitName = "armanni"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = true,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 4096,
	buildCostEnergy = 82563,
	buildCostMetal = 3685,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 6,
	buildingGroundDecalSizeY = 6,
	buildingGroundDecalType = [[armanni_aoplane.dds]],
	buildPic = [[ARMANNI.png]],
	buildTime = 52071,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[DEAD]],
	damageModifier = 0.25,
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Tachyon Accelerator]],
	energyStorage = 2000,
	energyUse = 0,
	explodeAs = [[CRAWL_BLASTSML]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 8950,
	maxSlope = 10,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Annihilator]],
	noChaseCategory = [[ALL]],
	objectName = [[ARMANNI]],
	onoffable = true,
	radarDistance = 1500,
	seismicSignature = 0,
	selfDestructAs = [[ATOMIC_BLAST]],
	side = [[ARM]],
	sightDistance = 780,
	smoothAnim = true,
	standingfireorder = 2,
	turnRate = 0,
	unitname = [[armanni]],
	useBuildingGroundDecal = true,
	workerTime = 0,
	yardMap = [[oooooooooooooooo]],
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
			[1] = [[anni]],
		},
		select = {
			[1] = [[anni]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[SMALL TINY]],
			def = [[ATA]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ATA = {
		areaOfEffect = 16,
		beamlaser = 1,
		beamTime = 2,
		coreThickness = 0.2,
		craterBoost = 0,
		craterMult = 0,
		energypershot = 1800,
		explosionGenerator = [[custom:BURN_WHITE]],
		fireStarter = 90,
		impactonly = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		laserFlareSize = 20,
		lineOfSight = true,
		name = [[ATA]],
		noSelfDamage = true,
		range = 1450,
		reloadtime = 10.9,
		renderType = 0,
		rgbColor = [[0 0 1]],
		soundHit = [[xplolrg1]],
		soundStart = [[annigun1]],
		targetMoveError = 0.3,
		thickness = 7,
		tolerance = 10000,
		turret = true,
		weaponType = [[BeamLaser]],
		weaponVelocity = 1400,
		damage = {
			commanders = 2400,
			default = 9000,
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
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ARMANNI_DEAD]],
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
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
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

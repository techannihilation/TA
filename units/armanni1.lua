-- UNITDEF -- ARMANNI1 --
--------------------------------------------------------------------------------

local unitName = "armanni1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = true,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 4096,
	buildCostEnergy = 162563,
	buildCostMetal = 16000,
	builder = false,
	buildPic = [[ARMANNI.png]],
	buildTime = 252071,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[DEAD]],
	damageModifier = 0.25,
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Super Tachyon Accelerator]],
	energyStorage = 2000,
	energyUse = 0,
	explodeAs = [[CRAWL_BLASTSML]],
	firestandorders = 1,
	footprintX = 8,
	footprintZ = 8,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 35000,
	maxSlope = 10,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Advanced Annihilator]],
	noChaseCategory = [[ALL]],
	objectName = [[ARMANNI1]],
	onoffable = true,
	radarDistance = 1500,
	seismicSignature = 0,
	selfDestructAs = [[ATOMIC_BLAST]],
	side = [[ARM]],
	sightDistance = 780,
	smoothAnim = true,
	standingfireorder = 2,
	turnRate = 0,
	unitname = [[armanni1]],
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
			badTargetCategory = [[MEDIUM SMALL TINY]],
			def = [[ATA10]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ATA10 = {
		areaOfEffect = 46,
		avoidFeature = false,
		beamlaser = 1,
		beamTime = 2.2,
		coreThickness = 0.2,
		craterBoost = 0,
		craterMult = 0,
		energypershot = 15000,
		explosionGenerator = [[custom:BURN_WHITE]],
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		laserFlareSize = 20,
		lineOfSight = true,
		name = [[ATA]],
		noSelfDamage = true,
		range = 1750,
		reloadtime = 5.4,
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
			commanders = 1100,
			default = 18000,
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
		damage = 1.1229 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 7,
		footprintZ = 7,
		height = 40,
		hitdensity = 100,
		metal = 0.6492 * unitDef.buildCostMetal,
		object = [[ARMANNI1_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.6737 * unitDef.maxDamage,
		description = unitDef.name .. [[ Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 6,
		footprintZ = 6,
		height = 8,
		hitdensity = 100,
		metal = 0.5194 * unitDef.buildCostMetal,
		object = [[6X6B]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

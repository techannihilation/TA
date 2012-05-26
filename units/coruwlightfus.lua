-- UNITDEF -- CORUWLIGHTFUS --
--------------------------------------------------------------------------------

local unitName = "coruwlightfus"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = true,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 8192,
	buildCostEnergy = 16000,
	buildCostMetal = 2550,
	builder = false,
	buildPic = [[CORUWLIGHTFUS.png]],
	buildTime = 56000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[DEAD]],
	description = [[Produces Energy / Storage]],
	energyMake = 640,
	energyStorage = 1280,
	explodeAs = [[CRAWL_BLASTSML]],
	footprintX = 5,
	footprintZ = 4,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 2750,
	maxSlope = 16,
	maxVelocity = 0,
	metalStorage = 0,
	minWaterDepth = 25,
	name = [[Underwater Light Fusion Plant]],
	noAutoFire = false,
	objectName = [[CORUWLIGHTFUS]],
	seismicSignature = 0,
	selfDestructAs = [[CRAWL_BLAST]],
	side = [[CORE]],
	sightDistance = 143,
	smoothAnim = true,
	turnRate = 0,
	unitname = [[coruwlightfus]],
	workerTime = 0,
	yardMap = [[ooooo ooooo ooooo ooooo]],
	featureDefs = nil,
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
			[1] = [[watfusn2]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = true,
		category = [[corpses]],
		damage = 0.2887 * unitDef.maxDamage,
		description = [[Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 5,
		footprintZ = 4,
		height = 20,
		hitdensity = 100,
		metal = 0.2549 * unitDef.buildCostMetal,
		object = [[CORUWLIGHTFUS_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.2887 * unitDef.maxDamage,
		description = [[Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 4,
		hitdensity = 100,
		metal = 0.1020 * unitDef.buildCostMetal,
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

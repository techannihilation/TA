-- UNITDEF -- CORUWADVES --
--------------------------------------------------------------------------------

local unitName = "coruwadves"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 7822,
	buildCostEnergy = 10032,
	buildCostMetal = 690,
	builder = false,
	buildPic = [[CORUWADVES.png]],
	buildTime = 20416,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[DEAD]],
	description = [[Increases Energy Storage (64000)]],
	designation = [[CP-CAES]],
	downloadable = 1,
	energyStorage = 64000,
	energyUse = 0,
	explodeAs = [[ATOMIC_BLAST]],
	footprintX = 5,
	footprintZ = 5,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 11400,
	maxSlope = 20,
	maxWaterDepth = 9999,
	metalStorage = 0,
	name = [[Hardened Energy Storage]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	noshadow = 1,
	objectName = [[CORUWADVES]],
	seismicSignature = 0,
	selfDestructAs = [[MINE_NUKE]],
	side = [[CORE]],
	sightDistance = 192,
	smoothAnim = true,
	threed = 1,
	unitname = [[coruwadves]],
	version = 1.2,
	workerTime = 0,
	yardMap = [[ooooooooooooooooooooooooo]],
	zbuffer = 1,
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
			[1] = [[storngy2]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = true,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Advanced Energy Storage Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 5,
		footprintZ = 5,
		height = 9,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CORUWADVES_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[all]],
	},
	HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Advanced Energy Storage Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 5,
		footprintZ = 5,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[5X5A]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

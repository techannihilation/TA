-- UNITDEF -- ARMMEX1 --
--------------------------------------------------------------------------------

local unitName = "armmex1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = true,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 8192,
	buildCostEnergy = 5521,
	buildCostMetal = 325,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 5,
	buildingGroundDecalSizeY = 5,
	buildingGroundDecalType = [[armmex1_aoplane.dds]],
	buildPic = [[ARMMEX.png]],
	buildTime = 6200,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[ARMMEX_DEAD]],
	description = [[Overcharged Metal Extractor, Amphibious]],
	energyStorage = 0,
	energyUse = 50,
	explodeAs = [[SMALL_BUILDING]],
	extractsMetal = 0.003,
	footprintX = 3,
	footprintZ = 3,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 570,
	maxSlope = 20,
	maxVelocity = 0,
	maxWaterDepth = 9999,
	metalStorage = 300,
	name = [[Metal Extractor]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[ARMMEX1]],
	onoffable = true,
	script = [[armmex.cob]],
	seismicSignature = 0,
	selfDestructAs = [[SMALL_BUILDING]],
	selfDestructCountdown = 1,
	side = [[ARM]],
	sightDistance = 273,
	smoothAnim = true,
	turnRate = 0,
	unitname = [[armmex1]],
	useBuildingGroundDecal = true,
	workerTime = 0,
	yardMap = [[ooooooooo]],
	featureDefs = nil,
	sounds = {
		activate = [[mexrun1]],
		canceldestruct = [[cancel2]],
		deactivate = [[mexoff1]],
		underattack = [[warning1]],
		working = [[mexrun1]],
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		ok = {
			[1] = [[servmed2]],
		},
		select = {
			[1] = [[mexon1]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	ARMMEX_DEAD = {
		blocking = true,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[ARMMEX_HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ARMMEX_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	ARMMEX_HEAP = {
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

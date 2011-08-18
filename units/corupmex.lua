-- UNITDEF -- CORUPMEX --
--------------------------------------------------------------------------------

local unitName = "corupmex"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 6033,
	buildCostMetal = 1062,
	builder = false,
	buildTime = 96444,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[dead]],
	description = [[Enables jumps on large radius]],
	designation = [[TAL-BME1]],
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[SMALL_BUILDINGEX]],
	footprintX = 3,
	footprintZ = 3,
	iconType = [[building]],
	maxDamage = 1344,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Intelligence Jump]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CORUPMEX]],
	onoffable = true,
	radarDistance = 0,
	selfDestructAs = [[SMALL_BUILDING]],
	side = [[CORE]],
	sightDistance = 273,
	unitname = [[corupmex]],
	unitnumber = 48,
	workerTime = 0,
	yardMap = [[ooooooooo]],
	customparams = {
		providetech = [[Jumpjet]],
		providetechrange = 2000,
	},
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
	dead = {
		blocking = true,
		category = [[corpses]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ werckage]],
		energy = 400,
		featureDead = [[HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 3,
		footprintZ = 3,
		height = 2032,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[CORUPMEX_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	HEAP = {
		blocking = true,
		category = [[heaps]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Debris]],
		energy = 100,
		featurereclamate = [[SMUDGE01]],
		footprintX = 3,
		footprintZ = 3,
		height = 714,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[3X3E]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

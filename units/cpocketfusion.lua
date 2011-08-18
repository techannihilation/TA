-- UNITDEF -- CPOCKETFUSION --
--------------------------------------------------------------------------------

local unitName = "cpocketfusion"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	buildCostEnergy = 4850,
	buildCostMetal = 526,
	builder = false,
	buildTime = 9900,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[dead]],
	description = [[Produces energy]],
	designation = [[APE-FPF]],
	energyMake = 128,
	energyStorage = 128,
	energyUse = 0,
	explodeAs = [[MEDIUM_BUILDINGEX]],
	footprintX = 2,
	footprintZ = 2,
	maxDamage = 1950,
	maxSlope = 20,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Pocket Fusion]],
	noChaseCategory = [[ALL]],
	objectName = [[CPocketFusion]],
	radarDistance = 0,
	selfDestructAs = [[LIGHTSHIPBLAST]],
	side = [[CORE]],
	sightDistance = 150,
	unitname = [[cpocketfusion]],
	workerTime = 0,
	yardMap = [[OOOOOOOOOOOOOOO]],
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
			[1] = [[fusion2]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[core_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CPocketFusion_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- APOCKETFUSION --
--------------------------------------------------------------------------------

local unitName = "apocketfusion"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	buildCostEnergy = 4900,
	buildCostMetal = 400,
	builder = false,
	buildTime = 7100,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	collisionvolumeoffsets = [[0 0 0]],
	collisionvolumescales = [[48 29 22]],
	collisionvolumetest = 1,
	collisionvolumetype = [[Box]],
	corpse = [[dead]],
	description = [[produces 100 energy]],
	designation = [[APE-FPF]],
	energyMake = 100,
	energyStorage = 150,
	energyUse = 0,
	explodeAs = [[MEDIUM_BUILDINGEX]],
	footprintX = 3,
	footprintZ = 2,
	maxDamage = 1650,
	maxSlope = 20,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Pocket Fusion]],
	noChaseCategory = [[ALL]],
	objectName = [[APocketFusion]],
	radarDistance = 0,
	selfDestructAs = [[LIGHTSHIPBLAST]],
	side = [[ARM]],
	sightDistance = 150,
	unitname = [[apocketfusion]],
	workerTime = 0,
	yardMap = [[OOOOOOOOOOOOOOOOOOOO]],
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
			[1] = [[fusion1]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[arm_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[APocketFusion_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

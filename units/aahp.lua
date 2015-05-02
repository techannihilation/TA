-- UNITDEF -- AAHP --
--------------------------------------------------------------------------------

local unitName = "aahp"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildCostEnergy = 35422,
	buildCostMetal = 4200,
	builder = true,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 11,
	buildingGroundDecalSizeY = 11,
	buildingGroundDecalType = [[aahp_aoplane.dds]],
	buildTime = 34521,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[LEVEL1 ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	collisionvolumescales = [[150 42 120]],
	collisionvolumetype = [[Box]],
	corpse = [[dead]],
	description = [[Builds T2 Hovercrafts]],
	designation = [[ARM-H]],
	downloadable = 1,
	energyStorage = 300,
	energyUse = 50,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 10,
	footprintZ = 8,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 5005,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 300,
	mobilestandorders = 1,
	name = [[Advanced Hovercraft Platform]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[AAHP]],
	radarDistance = 50,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[ARM]],
	sightDistance = 220,
	standingfireorder = 2,
	standingmoveorder = 1,
	unitname = [[aahp]],
	unitnumber = 11001,
	useBuildingGroundDecal = true,
	workerTime = 400,
	yardMap = [[ooccccccoo ooccccccoo ooccccccoo ooccccccoo ooccccccoo ooccccccoo ooccccccoo ooccccccoo]],
	customparams = {
		providetech = [[T2 Factory]],
	},
	buildoptions = {
		[1] = [[aach]],
		[2] = [[armhplasma]],
		[3] = [[armvisit]],
		[4] = [[armlashover]],
		[5] = [[nsaatorph]],
		[6] = [[armiguana]],
		[7] = [[speeder]],
		[8] = [[r75v]],
		[9] = [[concealer]],
		[10] = [[devastator]],
		[11] = [[armtem]],
	},
	featureDefs = nil,
	sounds = {
		build = [[hoverok1]],
		canceldestruct = [[cancel2]],
		underattack = [[warning1]],
		unitcomplete = [[untdone]],
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		select = {
			[1] = [[hoversl1]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[arm_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Advanced Hovercraft Plataform Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 10,
		footprintZ = 8,
		height = 20,
		hitdensity = 100,
		metal = 0.6680 * unitDef.buildCostMetal,
		object = [[Aahp_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Advanced Hovercraft Plataform heap]],
		featurereclamate = [[smudge01]],
		footprintX = 8,
		footprintZ = 7,
		height = 4,
		hitdensity = 100,
		metal = 0.5344 * unitDef.buildCostMetal,
		object = [[7x7a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

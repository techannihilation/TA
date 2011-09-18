-- UNITDEF -- CORGANT --
--------------------------------------------------------------------------------

local unitName = "corgant"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	bmcode = 0,
	brakeRate = 0,
	buildCostEnergy = 58524,
	buildCostMetal = 13848,
	builder = true,
	buildingGroundDecalDecaySpeed = 0.01,
	buildingGroundDecalSizeX = 10,
	buildingGroundDecalSizeY = 10,
	buildingGroundDecalType = [[asphalt512c.dds]],
	buildPic = [[CORGANT.png]],
	buildTime = 67321,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	corpse = [[DEAD]],
	description = [[Produces Heavy Level 3 Units]],
	energyStorage = 1400,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 9,
	footprintZ = 9,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 16000,
	maxSlope = 18,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 800,
	mobilestandorders = 1,
	name = [[Experimental Gantry]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CORGANT]],
	radarDistance = 50,
	seismicSignature = 0,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[CORE]],
	sightDistance = 273,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	turnRate = 0,
	unitname = [[corgant]],
	useBuildingGroundDecal = true,
	workerTime = 600,
	yardMap = [[oooooooooooooooooooocccccoooocccccoooocccccoooocccccoooocccccoooocccccoooocccccoo]],
	buildoptions = {
		[1] = [[corkrog]],
		[2] = [[armgor]],
		[3] = [[gorg]],
		[4] = [[macross]],
		[5] = [[cordem]],
		[6] = [[corkarg]],
		[7] = [[shiva]],
		[8] = [[armraven]],
		[9] = [[corjurgen]],
		[10] = [[troman]],
	},
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:GantWhiteLight]],
			[2] = [[custom:YellowLight]],
			[3] = [[custom:WhiteLight]],
		},
	},
	sounds = {
		activate = [[gantok2]],
		build = [[gantok2]],
		canceldestruct = [[cancel2]],
		deactivate = [[gantok2]],
		repair = [[lathelrg]],
		underattack = [[warning1]],
		unitcomplete = [[gantok1]],
		working = [[build]],
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		select = {
			[1] = [[gantsel1]],
		},
	},
}

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
		footprintX = 9,
		footprintZ = 9,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CORGANT_DEAD]],
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
		footprintX = 9,
		footprintZ = 9,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[7X7B]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

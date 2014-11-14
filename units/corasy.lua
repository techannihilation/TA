-- UNITDEF -- CORASY --
--------------------------------------------------------------------------------

local unitName = "corasy"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	bmcode = 0,
	brakeRate = 0,
	buildCostEnergy = 34939,
	buildCostMetal = 4560,
	builder = true,
	buildPic = [[CORASY.png]],
	buildTime = 35696,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[LEVEL1 ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	collisionvolumeoffsets = [[0 -13 -3]],
	collisionvolumescales = [[192 61 180]],
	collisionvolumetype = [[Box]],
	corpse = [[1_DEAD]],
	description = [[Produces Advanced Ships]],
	energyStorage = 200,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 12,
	footprintZ = 12,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 4416,
	maxVelocity = 0,
	metalMake = 1,
	metalStorage = 200,
	minWaterDepth = 30,
	mobilestandorders = 1,
	name = [[Advanced Shipyard]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CORASY]],
	radarDistance = 50,
	seismicSignature = 0,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[CORE]],
	sightDistance = 301.6,
	standingfireorder = 2,
	standingmoveorder = 0,
	turnRate = 0,
	unitname = [[corasy]],
	waterline = 32,
	workerTime = 600,
	yardMap = [[wCCCCCCCCCCwCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCwCCCCCCCCCCw]],
	customparams = {
		providetech = [[T2 Factory]],
	},
	buildoptions = {
		[1] = [[coracsub]],
		[2] = [[cormls]],
		[3] = [[corshark]],
		[4] = [[corssub]],
		[5] = [[corarch]],
		[6] = [[corcrus]],
		[7] = [[corbats]],
		[8] = [[cormship]],
		[9] = [[corcarry]],
		[10] = [[corsjam]],
	},
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:WhiteLight]],
		},
	},
	sounds = {
		build = [[pshpwork]],
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
			[1] = [[pshpactv]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	['1_DEAD'] = {
		blocking = false,
		category = [[corpses]],
		collisionvolumeoffsets = [[0 -13 -3]],
		collisionvolumescales = [[192 61 180]],
		collisionvolumetest = 1,
		collisionvolumetype = [[Box]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		footprintX = 12,
		footprintZ = 12,
		height = 4,
		hitdensity = 100,
		metal = 0.6570 * unitDef.buildCostMetal,
		object = [[CORASY_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

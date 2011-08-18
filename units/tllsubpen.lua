-- UNITDEF -- TLLSUBPEN --
--------------------------------------------------------------------------------

local unitName = "tllsubpen"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildCostEnergy = 520,
	buildCostMetal = 842,
	builder = true,
	buildTime = 6520,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	collisionvolumeoffsets = [[0 0 0]],
	collisionvolumescales = [[129 59 132]],
	collisionvolumetest = 0,
	collisionvolumetype = [[Ell]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Produces Subs]],
	designation = [[TL-SP]],
	energyStorage = 150,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 8,
	footprintZ = 8,
	maxDamage = 3510,
	metalMake = 1.2,
	metalStorage = 150,
	minWaterDepth = 45,
	mobilestandorders = 1,
	name = [[Sub Pen]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	noshadow = 1,
	objectName = [[TLLsubpen]],
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[TLL]],
	sightDistance = 212,
	sonarDistance = 500,
	standingfireorder = 2,
	standingmoveorder = 1,
	threed = 1,
	unitname = [[tllsubpen]],
	unitnumber = 884,
	version = 3.1,
	waterline = 55,
	workerTime = 115,
	yardMap = [[wwwCCCCC wwwCCCCC wwwCCCCC wwwCCCCC wwwCCCCC wwwCCCCC wwwCCCCC wwwCCCCC]],
	zbuffer = 1,
	buildoptions = {
		[1] = [[tllcsub]],
		[2] = [[tllacsub]],
		[3] = [[tllplunger]],
		[4] = [[tllmanta]],
		[5] = [[tllorc]],
		[6] = [[tllwhale]],
		[7] = [[tllsquid]],
		[8] = [[tllshark]],
		[9] = [[tllarchnano]],
		[10] = [[tllamphibot]],
		[11] = [[tllsalamander]],
		[12] = [[tllfirestarter]],
		[13] = [[tllaak]],
	},
	featureDefs = nil,
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
	dead = {
		blocking = true,
		category = [[tll_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 8,
		footprintZ = 8,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllsubpen_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 8,
		footprintZ = 8,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[6x6a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

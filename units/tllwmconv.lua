-- UNITDEF -- TLLWMCONV --
--------------------------------------------------------------------------------

local unitName = "tllwmconv"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 274,
	buildCostMetal = 27,
	builder = false,
	buildTime = 2200,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	description = [[Converts upto 100 Energy into Metal]],
	designation = [[WM-CONV]],
	explodeAs = [[SMALL_BUILDINGEX]],
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Convertisseur d'énergie en métal flottant]],
	frenchname = [[Métallo flottant]],
	germandescription = [[Schwimmende Metallherstellung]],
	germanname = [[Schwimmschmelze]],
	italiandescription = [[Fabbrica metalli]],
	italianname = [[Generatore di Metallo - SN]],
	maxDamage = 120,
	maxSlope = 10,
	minWaterDepth = 10,
	name = [[Metal Producer]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	noshadow = 1,
	objectName = [[tllWMconv]],
	onoffable = true,
	ovradjust = 1,
	selfDestructAs = [[SMALL_BUILDING]],
	side = [[TLL]],
	sightDistance = 200,
	spanishdescription = [[Produce metal]],
	spanishname = [[Productor de Metal - SN]],
	threed = 1,
	unitname = [[tllwmconv]],
	unitnumber = 870,
	version = 3.1,
	waterline = 5,
	yardMap = [[wwwwwwwww]],
	zbuffer = 1,
	featureDefs = nil,
	sounds = {
		activate = [[metlon1]],
		canceldestruct = [[cancel2]],
		deactivate = [[metloff1]],
		underattack = [[warning1]],
		working = [[metlrun1]],
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		select = {
			[1] = [[metlon1]],
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
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 12,
		hitdensity = 102,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllWMconv_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

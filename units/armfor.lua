-- UNITDEF -- ARMFOR --
--------------------------------------------------------------------------------

local unitName = "armfor"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 0,
	buildCostEnergy = 491000,
	buildCostMetal = 4100,
	builder = false,
	buildTime = 250000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	description = [[Advanced Geothermical reactor]],
	designation = [[COR-FOR]],
	energyMake = 5000,
	energyStorage = 5000,
	energyUse = 0,
	explodeAs = [[Nuclear_missile1]],
	footprintX = 4,
	footprintZ = 4,
	frenchdescription = [[Produit de l'énergie]],
	frenchname = [[Foreuse géothermique]],
	germandescription = [[Liefert Energie]],
	germanname = [[Geotherm. Bohrmaschine]],
	maxDamage = 2500,
	maxSlope = 10,
	maxWaterDepth = 0,
	name = [[Atomic Geothermal]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[armFOR]],
	selfDestructAs = [[Nuclear_missile1]],
	side = [[arm]],
	sightDistance = 250,
	threed = 1,
	unitname = [[armfor]],
	unitnumber = 2415,
	version = 1,
	workerTime = 0,
	yardMap = [[oooo oooo oooo oooo]],
	zbuffer = 1,
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
			[1] = [[geothrm1]],
		},
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

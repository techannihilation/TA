-- UNITDEF -- CORECH21 --
--------------------------------------------------------------------------------

local unitName = "corech21"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildCostEnergy = 10000,
	buildCostMetal = 8000,
	builder = false,
	buildTime = 50000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	collisionvolumeoffsets = [[-1 -9 -5]],
	collisionvolumescales = [[64 70 102]],
	collisionvolumetest = 1,
	collisionvolumetype = [[Box]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	description = [[Enable New t2 units]],
	designation = [[LAB-01]],
	energyMake = 0,
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[COMMANDER_BLAST]],
	floater = true,
	footprintX = 5,
	footprintZ = 7,
	frenchdescription = [[Labo de recherche experimentale]],
	frenchname = [[Labo de recherche experimentale]],
	germandescription = [[Experimentelles Forschungslabor]],
	germanname = [[Experimentelles Forschungslabor]],
	maxDamage = 15000,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Advanced Research Center]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[LABORECH]],
	onoffable = true,
	radarDistance = 0,
	selfDestructAs = [[COMMANDER_BLAST]],
	side = [[ARM]],
	sightDistance = 0,
	threed = 1,
	unitname = [[corech21]],
	unitnumber = 7210,
	version = 3.1,
	workerTime = 0,
	yardMap = [[ooooooo ooooooo ooooooo ooooooo ooooooo]],
	zbuffer = 1,
	sounds = {
		activate = [[radar1]],
		canceldestruct = [[cancel2]],
		deactivate = [[radarde1]],
		underattack = [[warning1]],
		working = [[radar1]],
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		select = {
			[1] = [[radar1]],
		},
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

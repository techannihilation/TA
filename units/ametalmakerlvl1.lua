-- UNITDEF -- AMETALMAKERLVL1 --
--------------------------------------------------------------------------------

local unitName = "ametalmakerlvl1"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	buildCostEnergy = 4795,
	buildCostMetal = 143,
	builder = false,
	buildTime = 4000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	description = [[Converts upto 200 Energy to Metal]],
	designation = [[AEM-EMM]],
	energyStorage = 0,
	explodeAs = [[ARMESTOR_BUILDING]],
	floater = true,
	footprintX = 3,
	footprintZ = 3,
	maxDamage = 300.2,
	maxSlope = 10,
	maxWaterDepth = 255,
	metalStorage = 0,
	name = [[T1.5 Metal Maker]],
	noChaseCategory = [[ALL]],
	objectName = [[AMetalMakerLvl1]],
	radarDistance = 0,
	selfDestructAs = [[ARMESTOR_BUILDING]],
	side = [[ARM]],
	sightDistance = 210,
	unitname = [[ametalmakerlvl1]],
	workerTime = 0,
	yardMap = [[OOOOOOOOO]],
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

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

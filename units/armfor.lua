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
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 6,
	buildingGroundDecalSizeY = 6,
	buildingGroundDecalType = [[armfor_aoplane.dds]],
	buildTime = 250000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	description = [[Advanced Geothermical reactor]],
	designation = [[COR-FOR]],
	energyMake = 5000,
	energyStorage = 5000,
	energyUse = 0,
	explodeAs = [[Nuclear_missile1]],
	footprintX = 4,
	footprintZ = 4,
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
	unitname = [[armfor]],
	unitnumber = 2415,
	useBuildingGroundDecal = true,
	workerTime = 0,
	yardMap = [[oooo oooo oooo oooo]],
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

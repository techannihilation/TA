-- UNITDEF -- ARMGMM --
--------------------------------------------------------------------------------

local unitName = "armgmm"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = true,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 16384,
	buildCostEnergy = 33000,
	buildCostMetal = 4100,
	builder = false,
	buildPic = [[ARMGMM.png]],
	buildTime = 63000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	description = [[Safe Geothermal Powerplant]],
	digger = 1,
	energyMake = 1800,
	energyStorage = 3600,
	explodeAs = [[BIG_BUILDINGEX]],
	footprintX = 5,
	footprintZ = 5,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 12500,
	maxSlope = 10,
	maxVelocity = 0,
	maxWaterDepth = 0,
	name = [[Prude]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[ARMGMM]],
	seismicSignature = 0,
	selfDestructAs = [[LARGE_BUILDING]],
	side = [[ARM]],
	sightDistance = 273,
	smoothAnim = true,
	turnRate = 0,
	unitname = [[armgmm]],
	workerTime = 0,
	yardMap = [[ooooo ooooo ooGoo ooooo ooooo]],
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

-- UNITDEF -- CORFMKR --
--------------------------------------------------------------------------------

local unitName = "corfmkr"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = true,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 8192,
	buildCostEnergy = 2186,
	buildCostMetal = 20,
	builder = false,
	buildPic = [[CORFMKR.png]],
	buildTime = 2400,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	description = [[Converts upto 128 Energy to Metal]],
	energyStorage = 0,
	explodeAs = [[ARMESTOR_BUILDINGEX]],
	footprintX = 3,
	footprintZ = 3,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 120,
	maxSlope = 10,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	minWaterDepth = 11,
	name = [[Floating Metal Maker]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CORFMKR]],
	seismicSignature = 0,
	selfDestructAs = [[ARMESTOR_BUILDING]],
	side = [[CORE]],
	sightDistance = 273,
	smoothAnim = true,
	turnRate = 0,
	unitname = [[corfmkr]],
	waterline = 21,
	workerTime = 0,
	yardMap = [[wwwwwwwww]],
	sounds = {
		activate = [[metlon2]],
		canceldestruct = [[cancel2]],
		deactivate = [[metloff2]],
		underattack = [[warning1]],
		working = [[metlrun2]],
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		select = {
			[1] = [[metlon2]],
		},
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

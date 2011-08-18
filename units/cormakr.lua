-- UNITDEF -- CORMAKR --
--------------------------------------------------------------------------------

local unitName = "cormakr"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = true,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 8192,
	buildCostEnergy = 1282,
	buildCostMetal = 7,
	builder = false,
	buildPic = [[CORMAKR.png]],
	buildTime = 1200,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	collisionvolumeoffsets = [[0 -1 0]],
	collisionvolumescales = [[46 22 35]],
	collisionvolumetest = 1,
	collisionvolumetype = [[Box]],
	description = [[Converts upto 64 Energy to Metal]],
	energyStorage = 0,
	explodeAs = [[ARMESTOR_BUILDINGEX]],
	footprintX = 4,
	footprintZ = 3,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 150,
	maxSlope = 10,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Metal Maker]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CORMAKR]],
	seismicSignature = 0,
	selfDestructAs = [[ARMESTOR_BUILDING]],
	side = [[CORE]],
	sightDistance = 273,
	smoothAnim = true,
	turnRate = 0,
	unitname = [[cormakr]],
	workerTime = 0,
	yardMap = [[oooooooooooo]],
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

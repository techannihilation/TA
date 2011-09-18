-- UNITDEF -- CMGEO --
--------------------------------------------------------------------------------

local unitName = "cmgeo"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = true,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 0,
	buildCostEnergy = 94000,
	buildCostMetal = 4900,
	builder = false,
	buildPic = [[CMGEO.png]],
	buildTime = 132000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	description = [[Hazardous Energy Source]],
	energyMake = 3200,
	energyStorage = 3200,
	energyUse = 0,
	explodeAs = [[NUCLEAR_MISSILE]],
	footprintX = 7,
	footprintZ = 5,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 4980,
	maxSlope = 20,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Moho Geothermal Powerplant]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CMGEO]],
	seismicSignature = 0,
	selfDestructAs = [[NUCLEAR_MISSILE]],
	side = [[CORE]],
	sightDistance = 273,
	smoothAnim = true,
	turnRate = 0,
	unitname = [[cmgeo]],
	workerTime = 0,
	yardMap = [[ooooooo ooooooo oGGoooo oGGoooo ooooooo]],
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
			[1] = [[geothrm2]],
		},
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

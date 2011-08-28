-- UNITDEF -- ARMPEEP --
--------------------------------------------------------------------------------

local unitName = "armpeep"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.6,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 11.25,
	buildCostEnergy = 1475,
	buildCostMetal = 30,
	builder = false,
	buildPic = [[ARMPEEP.png]],
	buildTime = 2585,
	canFly = true,
	canGuard = false,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTWEAPON TINYVTOL VTOL]],
	collide = false,
	cruiseAlt = 180,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Scout Plane]],
	energyMake = 0.2,
	energyStorage = 0,
	energyUse = 0.2,
	explodeAs = [[SMALL_UNITEX]],
	footprintX = 2,
	footprintZ = 2,
	iconType = [[air]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 1280,
	maxDamage = 80,
	maxSlope = 10,
	maxVelocity = 13.8,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	name = [[Peeper]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMPEEP]],
	radarDistance = 1140,
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	selfDestructCountdown = 1,
	side = [[ARM]],
	sightDistance = 865,
	smoothAnim = true,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 880,
	unitname = [[armpeep]],
	workerTime = 0,
	sounds = {
		canceldestruct = [[cancel2]],
		underattack = [[warning1]],
		cant = {
			[1] = [[cantdo4]],
		},
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		ok = {
			[1] = [[vtolarmv]],
		},
		select = {
			[1] = [[vtolarac]],
		},
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

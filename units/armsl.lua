-- UNITDEF -- ARMSL --
--------------------------------------------------------------------------------

local unitName = "armsl"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.15,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 5,
	buildCostEnergy = 10090,
	buildCostMetal = 504,
	builder = false,
	buildPic = [[ARMSL.png]],
	buildTime = 15289,
	canFly = true,
	canGuard = true,
	canload = 1,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUMVTOL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTWEAPON VTOL]],
	collide = false,
	collisionVolumeScales = [[52 21 52]],
	collisionVolumeOffsets = [[1 -3 0]],
	collisionVolumeType = [[CylY]],
	cruiseAlt = 150,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Assault Transport]],
	energyMake = 3,
	energyStorage = 0,
	energyUse = 16,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 0,
	footprintX = 4,
	footprintZ = 4,
	hoverattack = true,
	iconType = [[air]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 1280,
	maxDamage = 4100,
	maxSlope = 10,
	maxVelocity = 7,
	maxWaterDepth = 0,
	metalStorage = 0,
	minTransportMass = 50,
	mobilestandorders = 0,
	moverate1 = 1,
	moverate2 = 2,
	name = [[Seahook]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMSL]],
	pitchscale = 1,
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT_VTOL]],
	side = [[CORE]],
	sightDistance = 260,
	standingmoveorder = 1,
	steeringmode = 1,
	transmaxunits = 1,
	transportCapacity = 30,
	transportMass = 5000,
	transportmaxunits = 1,
	transportSize = 15,
	turnRate = 380,
	unitname = [[armsl]],
	upright = true,
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
			[1] = [[vtolcrmv]],
		},
		select = {
			[1] = [[vtolcrac]],
		},
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

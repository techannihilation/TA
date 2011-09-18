-- UNITDEF -- ARMATLAS --
--------------------------------------------------------------------------------

local unitName = "armatlas"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.09,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 2.5,
	buildCostEnergy = 1239,
	buildCostMetal = 64,
	builder = false,
	buildPic = [[ARMATLAS.png]],
	buildTime = 3850,
	canFly = true,
	canGuard = false,
	canload = 1,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTWEAPON TINYVTOL VTOL]],
	collide = false,
	cruiseAlt = 50,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Air Transport]],
	energyMake = 0.6,
	energyStorage = 0,
	energyUse = 0.6,
	explodeAs = [[SMALL_UNITEX]],
	firestandorders = 0,
	footprintX = 3,
	footprintZ = 3,
	iconType = [[air]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 1280,
	maxDamage = 240,
	maxSlope = 10,
	maxVelocity = 10.25,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 0,
	name = [[Atlas]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMATLAS]],
	scale = 0.8,
	seismicSignature = 0,
	selfDestructAs = [[SMALL_UNIT]],
	side = [[ARM]],
	sightDistance = 125,
	smoothAnim = true,
	standingmoveorder = 1,
	steeringmode = 1,
	transmaxunits = 1,
	transportCapacity = 1,
	transportSize = 3,
	turnRate = 550,
	unitname = [[armatlas]],
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

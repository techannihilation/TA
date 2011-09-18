-- UNITDEF -- CORVALK --
--------------------------------------------------------------------------------

local unitName = "corvalk"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.09,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 2.5,
	buildCostEnergy = 1347,
	buildCostMetal = 69,
	builder = false,
	buildPic = [[CORVALK.png]],
	buildTime = 4122,
	canFly = true,
	canGuard = false,
	canload = 1,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTWEAPON TINYVTOL VTOL]],
	collide = false,
	collisionvolumeoffsets = [[0 -3 0]],
	collisionvolumescales = [[27 27 50]],
	collisionvolumetest = 0,
	collisionvolumetype = [[box]],
	cruiseAlt = 50,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Air Transport]],
	energyMake = 0.7,
	energyStorage = 0,
	energyUse = 0.7,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 0,
	footprintX = 3,
	footprintZ = 3,
	iconType = [[air]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 1280,
	maxDamage = 250,
	maxSlope = 10,
	maxVelocity = 10,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 0,
	moverate1 = 1,
	moverate2 = 2,
	name = [[Valkyrie]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORVALK]],
	pitchscale = 1,
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[CORE]],
	sightDistance = 125,
	smoothAnim = true,
	standingmoveorder = 1,
	steeringmode = 1,
	transportCapacity = 1,
	transportSize = 3,
	turnRate = 550,
	unitname = [[corvalk]],
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

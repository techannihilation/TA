-- UNITDEF -- CORAWAC --
--------------------------------------------------------------------------------

local unitName = "corawac"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.096,
	altfromsealevel = 1,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 3.75,
	buildCostEnergy = 7824,
	buildCostMetal = 169,
	builder = false,
	buildPic = [[CORAWAC.png]],
	buildTime = 13264,
	canFly = true,
	canGuard = false,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUMVTOL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTWEAPON VTOL]],
	collide = false,
	cruiseAlt = 210,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Radar/Sonar Plane]],
	energyMake = 20,
	energyStorage = 0,
	energyUse = 20,
	explodeAs = [[BIG_UNITEX]],
	footprintX = 3,
	footprintZ = 3,
	iconType = [[air]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 1280,
	maxDamage = 890,
	maxSlope = 10,
	maxVelocity = 10.7,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	name = [[Vulture]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORAWAC]],
	radarDistance = 2400,
	scale = 1,
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[CORE]],
	sightDistance = 1250,
	smoothAnim = true,
	sonarDistance = 1200,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 402,
	unitname = [[corawac]],
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
			[1] = [[caradsel]],
		},
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

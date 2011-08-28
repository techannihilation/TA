-- UNITDEF -- ARMAWAC --
--------------------------------------------------------------------------------

local unitName = "armawac"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.114,
	altfromsealevel = 1,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 5,
	buildCostEnergy = 8062,
	buildCostMetal = 165,
	builder = false,
	buildPic = [[ARMAWAC.png]],
	buildTime = 12819,
	canFly = true,
	canGuard = false,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUMVTOL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTWEAPON VTOL]],
	collide = false,
	cruiseAlt = 160,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Radar/Sonar Plane]],
	energyMake = 23,
	energyStorage = 0,
	energyUse = 23,
	explodeAs = [[BIG_UNITEX]],
	footprintX = 3,
	footprintZ = 3,
	iconType = [[air]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 1280,
	maxDamage = 800,
	maxSlope = 10,
	maxVelocity = 10.58,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	name = [[Eagle]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMAWAC]],
	radarDistance = 2500,
	scale = 1,
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[ARM]],
	sightDistance = 1275,
	smoothAnim = true,
	sonarDistance = 1200,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 392,
	unitname = [[armawac]],
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
			[1] = [[aaradsel]],
		},
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

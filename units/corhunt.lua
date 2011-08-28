-- UNITDEF -- CORHUNT --
--------------------------------------------------------------------------------

local unitName = "corhunt"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.06,
	altfromsealevel = 1,
	amphibious = 1,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 3.75,
	buildCostEnergy = 6421,
	buildCostMetal = 122,
	builder = false,
	buildPic = [[CORHUNT.png]],
	buildTime = 9512,
	canFly = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	canSubmerge = true,
	category = [[ALL MEDIUMVTOL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTWEAPON VTOL]],
	collide = false,
	cruiseAlt = 190,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Advanced Radar/Sonar Plane]],
	energyMake = 15,
	energyStorage = 0,
	energyUse = 15,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	iconType = [[air]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 1280,
	maxDamage = 660,
	maxSlope = 10,
	maxVelocity = 10.81,
	maxWaterDepth = 255,
	metalStorage = 0,
	mobilestandorders = 1,
	moverate1 = 8,
	name = [[Hunter]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORHUNT]],
	radarDistance = 2200,
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[CORE]],
	sightDistance = 1130,
	smoothAnim = true,
	sonarDistance = 900,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 450,
	unitname = [[corhunt]],
	workerTime = 0,
	sounds = {
		build = [[nanlath1]],
		canceldestruct = [[cancel2]],
		repair = [[repair1]],
		underattack = [[warning1]],
		working = [[reclaim1]],
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
			[1] = [[seasonr2]],
		},
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

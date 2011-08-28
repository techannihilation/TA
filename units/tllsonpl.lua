-- UNITDEF -- TLLSONPL --
--------------------------------------------------------------------------------

local unitName = "tllsonpl"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.08,
	altfromsealevel = 1,
	amphibious = 1,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 4.2,
	buildCostEnergy = 7941,
	buildCostMetal = 151,
	builder = false,
	buildTime = 11646,
	canFly = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	canSubmerge = true,
	category = [[ALL MEDIUMVTOL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTWEAPON VTOL]],
	collide = false,
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	cruiseAlt = 210,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Sonar Aircraft]],
	designation = [[TL-SONP]],
	downloadable = 1,
	energyMake = 12,
	energyStorage = 0,
	energyUse = 12,
	explodeAs = [[BIG_UNITEX]],
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Sonar Aéroporté]],
	germandescription = [[Sonarflugzeug]],
	italiandescription = [[Sonar aerotrasportato]],
	maneuverleashlength = 1280,
	maxDamage = 484,
	maxSlope = 10,
	maxVelocity = 9.65,
	maxWaterDepth = 255,
	metalStorage = 0,
	mobilestandorders = 1,
	name = [[Swallow]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[tllsonpl]],
	scale = 1,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 350,
	sonarDistance = 1550,
	spanishdescription = [[Sonar Aerotransportado]],
	standingmoveorder = 2,
	steeringmode = 1,
	threed = 1,
	turnRate = 455,
	unitname = [[tllsonpl]],
	unitnumber = 928,
	version = 3.1,
	workerTime = 0,
	zbuffer = 1,
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
			[1] = [[vtolarmv]],
		},
		select = {
			[1] = [[seasonr2]],
		},
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

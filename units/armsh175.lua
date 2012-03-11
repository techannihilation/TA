-- UNITDEF -- ARMSH175 --
--------------------------------------------------------------------------------

local unitName = "armsh175"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.4,
	activateWhenBuilt = true,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 3,
	buildCostEnergy = 4567,
	buildCostMetal = 42,
	builder = false,
	buildTime = 2183,
	canAttack = true,
	canFly = true,
	canGuard = false,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTWEAPON SMALLVTOL VTOL]],
	collide = false,
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	cruiseAlt = 100,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Scout Helicopter]],
	designation = [[ARMSH175-1]],
	energyMake = 8,
	energyStorage = 0,
	energyUse = 7,
	explodeAs = [[SMALL_UNITEX]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	frenchdescription = [[Scout Helicopter]],
	frenchname = [[SH-175 Recon]],
	germandescription = [[Scout Helicopter]],
	germanname = [[SH-175 Recon]],
	hoverAttack = true,
	maneuverleashlength = 1024,
	maxDamage = 235,
	maxSlope = 10,
	maxVelocity = 9,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	moverate1 = 8,
	name = [[SH-175 Recon]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMSH175]],
	radarDistance = 1850,
	selfDestructAs = [[SMALL_UNIT]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 400,
	sonarDistance = 0,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 1200,
	unitname = [[armsh175]],
	unitnumber = 75654,
	version = 3,
	workerTime = 0,
	zbuffer = 1,
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

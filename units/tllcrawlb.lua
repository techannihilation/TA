-- UNITDEF -- TLLCRAWLB --
--------------------------------------------------------------------------------

local unitName = "tllcrawlb"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.3,
	bmcode = 1,
	brakeRate = 0.12,
	buildCostEnergy = 1741,
	buildCostMetal = 372,
	builder = false,
	buildTime = 14993,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	defaultmissiontype = [[Standby]],
	description = [[Heavy Crawling Bomb]],
	designation = [[TL-CWB]],
	energyMake = 0.1,
	energyStorage = 0,
	energyUse = 0.1,
	explodeAs = [[CRAWL_BLASTSML]],
	firestandorders = 1,
	footprintX = 1,
	footprintZ = 1,
	frenchdescription = [[Bombe rampante]],
	germandescription = [[Kriech-Bombe]],
	italiandescription = [[Bomba a grappolo]],
	kamikaze = true,
	kamikazeDistance = 42,
	maneuverleashlength = 640,
	maxDamage = 655,
	maxSlope = 32,
	maxVelocity = 2,
	maxWaterDepth = 115,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[kbot1]],
	name = [[Armadillo]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[TLLCRAWLB]],
	ovradjust = 1,
	radarDistance = 0,
	selfDestructAs = [[CRAWL_BLAST]],
	selfDestructCountdown = 1,
	shootme = 1,
	side = [[TLL]],
	sightDistance = 400,
	smoothAnim = true,
	spanishdescription = [[Bomba de asalto]],
	standingfireorder = 0,
	standingmoveorder = 0,
	steeringmode = 1,
	threed = 1,
	turnRate = 512,
	unitname = [[tllcrawlb]],
	unitnumber = 927,
	version = 3.1,
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
			[1] = [[servsml6]],
		},
		select = {
			[1] = [[servsml6]],
		},
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

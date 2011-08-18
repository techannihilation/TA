-- UNITDEF -- TLLSHARK --
--------------------------------------------------------------------------------

local unitName = "tllshark"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.02,
	bmcode = 1,
	brakeRate = 0.1,
	buildCostEnergy = 5643,
	buildCostMetal = 90,
	builder = false,
	buildTime = 8455,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTVTOL NOTWEAPON SMALL SUB]],
	collisionvolumeoffsets = [[0 0 0]],
	collisionvolumescales = [[18 18 28]],
	collisionvolumetest = 0,
	collisionvolumetype = [[Ell]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	defaultmissiontype = [[Standby]],
	description = [[Kamikaze Sub]],
	designation = [[TL-KS]],
	energyMake = 0.5,
	energyStorage = 0,
	energyUse = 0.6,
	explodeAs = [[CRAWL_BLASTSML]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	frenchdescription = [[Sous-marin Kamikaze]],
	frenchname = [[Requin]],
	kamikaze = true,
	kamikazeDistance = 50,
	maneuverleashlength = 640,
	maxDamage = 250,
	maxVelocity = 3.85,
	metalStorage = 0,
	minWaterDepth = 20,
	mobilestandorders = 1,
	movementClass = [[UBOAT2]],
	name = [[Shark]],
	noAutoFire = false,
	noChaseCategory = [[NOTSUBNOTSHIP]],
	objectName = [[TLLSHARK]],
	radarDistance = 0,
	selfDestructAs = [[CRAWL_BLAST]],
	selfDestructCountdown = 2,
	shootme = 1,
	side = [[TLL]],
	sightDistance = 150,
	standingfireorder = 0,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 400,
	unitname = [[tllshark]],
	unitnumber = 906,
	version = 3.1,
	waterline = 30,
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

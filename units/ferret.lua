-- UNITDEF -- FERRET --
--------------------------------------------------------------------------------

local unitName = "ferret"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.2,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 5,
	buildCostEnergy = 8543,
	buildCostMetal = 215,
	builder = false,
	buildTime = 7385,
	canAttack = true,
	canFly = true,
	canGuard = false,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUMVTOL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP VTOL WEAPON]],
	collide = false,
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	cruiseAlt = 60,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Land atack  Helicopter]],
	designation = [[MBHR-5]],
	energyMake = 0.8,
	energyStorage = 0,
	energyUse = 1,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 5,
	frenchdescription = [[Hélicoptère de combat]],
	frenchname = [[Frelon]],
	germandescription = [[Kampfhubschrauber]],
	germanname = [[Brawler]],
	hoverAttack = true,
	maneuverleashlength = 1280,
	maxDamage = 1073,
	maxSlope = 10,
	maxVelocity = 5,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	name = [[Ferret]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[Ferret]],
	radarDistance = 0,
	scale = 1,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 350,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 1600,
	unitname = [[ferret]],
	unitnumber = 260,
	version = 1,
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
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[BBU_MMG]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	BBU_MMG = {
		areaOfEffect = 5,
		explosionart = [[explode2]],
		id = 162,
		lavaexplosionart = [[lavasplash]],
		lavaexplosiongaf = [[fx]],
		lineOfSight = true,
		name = [[Medium Machine Gun]],
		range = 300,
		reloadtime = 0.35,
		renderType = 4,
		soundHit = [[xplosml3]],
		soundStart = [[canlite3]],
		startsmoke = 1,
		tolerance = 9000,
		waterexplosionart = [[h2o]],
		waterexplosiongaf = [[fx]],
		weaponType = [[Cannon]],
		weaponVelocity = 1000,
		damage = {
			bombers = 5,
			commanders = 17.5,
			default = 35,
			fighters = 5,
			flak_resistant = 5,
			unclassed_air = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

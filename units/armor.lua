-- UNITDEF -- ARMOR --
--------------------------------------------------------------------------------

local unitName = "armor"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.2,
	antiweapons = 1,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 6.25,
	buildCostEnergy = 40000,
	buildCostMetal = 2500,
	builder = false,
	buildPic = [[armor.png]],
	buildTime = 25000,
	canAttack = true,
	canFly = true,
	canGuard = true,
	canload = 1,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTWEAPON VTOL]],
	cruiseAlt = 250,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Very Heavy Air Transport, Min load 2000 - Max Load 14000]],
	energyMake = 0.6,
	energyStorage = 0,
	energyUse = 0.6,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	iconType = [[air]],
	idleAutoHeal = 5,
	idleTime = 3000,
	maneuverleashlength = 1280,
	maxDamage = 5000,
	maxSlope = 15,
	maxVelocity = 2.55,
	maxWaterDepth = 0,
	metalStorage = 0,
	minTransportMass = 2000,
	mobilestandorders = 1,
	name = [[Ornith]],
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMOR]],
	radarDistance = 0,
	scale = 0.8,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 660,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	TEDClass = [[VTOL]],
	transportCapacity = 1,
	transportMass = 14000,
	transportSize = 25,
	turnRate = 420,
	unitname = [[armor]],
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

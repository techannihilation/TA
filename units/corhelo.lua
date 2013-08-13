-- UNITDEF -- CORHELO --
--------------------------------------------------------------------------------

local unitName = "corhelo"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.45,
	activateWhenBuilt = true,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 3,
	buildCostEnergy = 3697,
	buildCostMetal = 42,
	isbuilder = false,
	buildTime = 2510,
	canAttack = true,
	canFly = true,
	canGuard = false,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTWEAPON SMALLVTOL VTOL]],
	collide = false,
	cruiseAlt = 60,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Scout helicopter]],
	designation = [[AH-02]],
	energyMake = 0.8,
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[SMALL_UNITEX]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 3,
	hoverAttack = true,
	maneuverleashlength = 600,
	maxDamage = 230,
	maxSlope = 10,
	maxVelocity = 9,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	name = [[Harrier]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[corhelo]],
	radarDistance = 1900,
	scale = 1,
	selfDestructAs = [[SMALL_UNIT_VTOL]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 350,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 455,
	unitname = [[corhelo]],
	unitnumber = 1986,
	upright = true,
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

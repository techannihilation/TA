-- UNITDEF -- TLLRSPLANE --
--------------------------------------------------------------------------------

local unitName = "tllrsplane"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.095,
	altfromsealevel = 10,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 4.5,
	buildCostEnergy = 1822,
	buildCostMetal = 315,
	isbuilder = false,
	buildTime = 15918,
	canFly = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUMVTOL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTWEAPON VTOL]],
	collide = false,
	cruiseAlt = 180,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Radar/Sonar Stealth Plane]],
	designation = [[TL-RSSP]],
	downloadable = 1,
	energyMake = 35,
	energyUse = 35,
	explodeAs = [[BIG_UNITEX]],
	footprintX = 3,
	footprintZ = 3,
	maneuverleashlength = 1280,
	maxDamage = 900,
	maxSlope = 10,
	maxVelocity = 11.2,
	maxWaterDepth = 0,
	mobilestandorders = 1,
	name = [[EC-33]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[TLLRSPLANE]],
	radarDistance = 1850,
	scale = 1,
	selfDestructAs = [[SMALL_UNIT_VTOL]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 350,
	sonarDistance = 1250,
	standingmoveorder = 1,
	stealth = true,
	steeringmode = 1,
	turnRate = 340,
	unitname = [[tllrsplane]],
	unitnumber = 899,
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

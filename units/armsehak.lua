-- UNITDEF -- ARMSEHAK --
--------------------------------------------------------------------------------

local unitName = "armsehak"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.072,
	altfromsealevel = 1,
	amphibious = 1,
	attackrunlength = 120,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 5,
	buildCostEnergy = 6624,
	buildCostMetal = 119,
	builder = false,
	buildPic = [[ARMSEHAK.png]],
	buildTime = 9064,
	canFly = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	canSubmerge = true,
	category = [[ALL MEDIUMVTOL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTWEAPON VTOL]],
	collide = false,
	cruiseAlt = 220,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Advanced Radar/Sonar Plane]],
	energyMake = 12,
	energyStorage = 0,
	energyUse = 12,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	iconType = [[air]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 1280,
	maxDamage = 520,
	maxSlope = 10,
	maxVelocity = 11.27,
	maxWaterDepth = 255,
	metalStorage = 0,
	mobilestandorders = 1,
	name = [[Seahawk]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMSEHAK]],
	radarDistance = 2250,
	scale = 1,
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[ARM]],
	sightDistance = 1100,
	smoothAnim = true,
	sonarDistance = 900,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 402,
	unitname = [[armsehak]],
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

-- UNITDEF -- TLLTPLANE --
--------------------------------------------------------------------------------

local unitName = "tlltplane"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.09,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 1,
	buildCostEnergy = 1292,
	buildCostMetal = 67,
	builder = false,
	buildTime = 5700,
	canFly = true,
	canGuard = true,
	canload = 1,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTWEAPON TINYVTOL VTOL]],
	collide = false,
	cruiseAlt = 70,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Air Transport]],
	designation = [[TL-TP]],
	energyMake = 0.6,
	energyUse = 0.6,
	explodeAs = [[SMALL_UNITEX]],
	firestandorders = 0,
	footprintX = 3,
	footprintZ = 3,
	hoverattack = true,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 1280,
	maxDamage = 344,
	maxSlope = 10,
	maxVelocity = 10.5,
	maxWaterDepth = 0,
	mobilestandorders = 0,
	name = [[Zergon]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[TLLTplane]],
	ovradjust = 1,
	scale = 0.8,
	selfDestructAs = [[SMALL_UNIT_VTOL]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 245,
	standingmoveorder = 1,
	steeringmode = 1,
	transmaxunits = 1,
	transportCapacity = 1,
	transportMass = 6000,
	transportSize = 3,
	turnRate = 356,
	unitname = [[tlltplane]],
	unitnumber = 944,
	workerTime = 0,
	sounds = {
		canceldestruct = [[cancel2]],
		underattack = [[tllwarning]],
		arrived = {
			[1] = [[tllvtolstop3]],
		},
		cant = {
			[1] = [[wearoff]],
		},
		count = {
			[1] = [[tllcount]],
			[2] = [[tllcount]],
			[3] = [[tllcount]],
			[4] = [[tllcount]],
			[5] = [[tllcount]],
			[6] = [[tllcount]],
		},
		ok = {
			[1] = [[tllvtolgo3]],
		},
		select = {
			[1] = [[vtolarac]],
		},
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

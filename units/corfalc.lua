-- UNITDEF -- CORFALC --
--------------------------------------------------------------------------------

local unitName = "corfalc"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.053,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 0.98,
	buildCostEnergy = 1970,
	buildCostMetal = 92,
	isbuilder = false,
	buildTime = 9450,
	canFly = true,
	canGuard = true,
	canload = 1,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	canSubmerge = true,
	category = [[ALL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTWEAPON SMALLVTOL VTOL]],
	collide = false,
	cruiseAlt = 120,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Medium Amphibious Air Transport]],
	designation = [[COR-AAT]],
	energyMake = 0.5,
	energyStorage = 105,
	energyUse = 0.5,
	explodeAs = [[SMALL_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	isAirBase = true,
	maneuverleashlength = 1280,
	maxDamage = 795,
	maxSlope = 10,
	maxVelocity = 11.2,
	maxWaterDepth = 255,
	metalStorage = 105,
	mobilestandorders = 0,
	name = [[Falcon]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORFALC]],
	ovradjust = 1,
	radarDistance = 0,
	scale = 0.8,
	selfDestructAs = [[SMALL_UNIT_VTOL]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 250,
	standingmoveorder = 1,
	steeringmode = 1,
	transmaxunits = 1,
	transportCapacity = 1,
	transportSize = 5,
	turnRate = 109,
	unitname = [[corfalc]],
	unitnumber = 703,
	upright = true,
	workerTime = 0,
	customparams = {
		RequireTech = [[Advanced T1 Unit Research Centre]],
	},
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

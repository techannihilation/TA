-- UNITDEF -- TLLPROB --
--------------------------------------------------------------------------------

local unitName = "tllprob"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 1.4,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 10,
	buildCostEnergy = 821,
	buildCostMetal = 36,
	builder = false,
	buildTime = 2302,
	canFly = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTWEAPON TINYVTOL VTOL]],
	collide = false,
	cruiseAlt = 180,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Air Scout]],
	designation = [[TL-PB]],
	energyMake = 0.1,
	energyStorage = 0,
	explodeAs = [[SMALL_UNITEX]],
	footprintX = 2,
	footprintZ = 2,
	maneuverleashlength = 1280,
	maxDamage = 96,
	maxHeightDif = 10,
	maxVelocity = 11.5,
	maxWaterDepth = 255,
	metalStorage = 0,
	mobilestandorders = 1,
	name = [[Mosquito]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[tllprob]],
	ovradjust = 1,
	radarDistance = 920,
	selfDestructAs = [[SMALL_UNIT_VTOL]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 750,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 800,
	unitname = [[tllprob]],
	unitnumber = 916,
	workerTime = 0,
	sounds = {
		canceldestruct = [[cancel2]],
		underattack = [[tllwarning]],
		arrived = {
			[1] = [[tllvtolstop]],
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
			[1] = [[tllvtolgo]],
		},
		select = {
			[1] = [[vtolarac]],
		},
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

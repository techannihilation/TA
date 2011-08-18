-- UNITDEF -- CORRECL --
--------------------------------------------------------------------------------

local unitName = "correcl"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.038,
	bmcode = 1,
	brakeRate = 0.25,
	buildCostEnergy = 6568,
	buildCostMetal = 416,
	buildDistance = 100,
	builder = true,
	buildPic = [[CORRECL.png]],
	buildTime = 9495,
	canAssist = false,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canreclamate = 1,
	canResurrect = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTVTOL NOTWEAPON SUB]],
	collisionvolumeoffsets = [[0 0 -5]],
	collisionvolumescales = [[60 20 80]],
	collisionvolumetest = 0,
	collisionvolumetype = [[Ell]],
	defaultmissiontype = [[Standby]],
	description = [[Ressurection Sub]],
	energyMake = 2,
	energyStorage = 0,
	energyUse = 2,
	explodeAs = [[SMALL_UNITEX]],
	footprintX = 4,
	footprintZ = 4,
	iconType = [[sea]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 621,
	maxVelocity = 2.47,
	metalStorage = 0,
	minWaterDepth = 20,
	mobilestandorders = 1,
	movementClass = [[UBOAT4]],
	name = [[Death Cavalry]],
	noAutoFire = false,
	noChaseCategory = [[NOTSUBNOTSHIP]],
	objectName = [[CORRECL]],
	resurrect = 1,
	seismicSignature = 0,
	selfDestructAs = [[SMALL_UNIT]],
	side = [[CORE]],
	sightDistance = 156,
	smoothAnim = true,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 282,
	unitname = [[correcl]],
	waterline = 30,
	workerTime = 450,
	sounds = {
		build = [[nanlath1]],
		canceldestruct = [[cancel2]],
		capture = [[capture1]],
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
			[1] = [[suarmmov]],
		},
		select = {
			[1] = [[suarmsel]],
		},
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- CORCUT --
--------------------------------------------------------------------------------

local unitName = "corcut"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.125,
	amphibious = 1,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 3.938,
	buildCostEnergy = 5897,
	buildCostMetal = 220,
	builder = false,
	buildPic = [[CORCUT.png]],
	buildTime = 11970,
	canAttack = true,
	canFly = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	canSubmerge = true,
	category = [[ALL MEDIUMVTOL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP VTOL WEAPON]],
	collide = false,
	cruiseAlt = 100,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Seaplane Gunship]],
	energyMake = 0.6,
	energyStorage = 0,
	energyUse = 0.6,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	hoverAttack = true,
	iconType = [[air]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 1280,
	maxDamage = 580,
	maxSlope = 10,
	maxVelocity = 5.08,
	maxWaterDepth = 255,
	metalStorage = 0,
	mobilestandorders = 1,
	moverate1 = 8,
	name = [[Cutlass]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORCUT]],
	scale = 1,
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[CORE]],
	sightDistance = 595,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 828,
	unitname = [[corcut]],
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
			[1] = [[vtolcrmv]],
		},
		select = {
			[1] = [[seapsel2]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[VTOL_ROCKET2]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	VTOL_ROCKET2 = {
		areaOfEffect = 128,
		burnblow = true,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASHSMALLBUILDINGEX]],
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		name = [[RiotCannon]],
		noSelfDamage = true,
		pitchtolerance = 12000,
		range = 430,
		reloadtime = 1.3,
		renderType = 4,
		soundHit = [[xplosml3]],
		soundStart = [[canlite3]],
		soundTrigger = true,
		startsmoke = 1,
		turret = false,
		weaponType = [[Cannon]],
		weaponVelocity = 600,
		damage = {
			bombers = 5,
			commanders = 52.5,
			default = 105,
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

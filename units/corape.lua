-- UNITDEF -- CORAPE --
--------------------------------------------------------------------------------

local unitName = "corape"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.152,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 3.563,
	buildCostEnergy = 7186,
	buildCostMetal = 345,
	builder = false,
	buildPic = [[CORAPE.png]],
	buildTime = 23111,
	canAttack = true,
	canFly = true,
	canGuard = false,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUMVTOL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP VTOL WEAPON]],
	collide = false,
	cruiseAlt = 100,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Gunship]],
	energyMake = 0.6,
	energyStorage = 0,
	energyUse = 0.6,
	explodeAs = [[GUNSHIPEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	hoverAttack = true,
	iconType = [[air]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 1280,
	maxDamage = 1000,
	maxSlope = 10,
	maxVelocity = 5.19,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	name = [[Rapier]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORAPE]],
	scale = 1,
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[CORE]],
	sightDistance = 550,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 594,
	unitname = [[corape]],
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
			[1] = [[vtolcrmv]],
		},
		select = {
			[1] = [[vtolcrac]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[VTOL_ROCKET]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	VTOL_ROCKET = {
		areaOfEffect = 128,
		burnblow = true,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:KARGMISSILE_EXPLOSION]],
		fireStarter = 70,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		model = [[missile]],
		name = [[RiotRocket]],
		noSelfDamage = true,
		pitchtolerance = 18000,
		range = 410,
		reloadtime = 1.1,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHit = [[explode]],
		soundStart = [[rocklit3]],
		soundTrigger = true,
		startsmoke = 1,
		startVelocity = 300,
		tolerance = 8000,
		turnRate = 9000,
		turret = false,
		weaponAcceleration = 200,
		weaponTimer = 5,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 700,
		wobble = 2500,
		damage = {
			bombers = 5,
			commanders = 61,
			default = 122,
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

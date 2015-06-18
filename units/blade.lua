-- UNITDEF -- BLADE --
--------------------------------------------------------------------------------

local unitName = "blade"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.6,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 3.5,
	buildCostEnergy = 16315,
	buildCostMetal = 892,
	builder = false,
	buildPic = [[BLADE.png]],
	buildTime = 30964,
	canAttack = true,
	canFly = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP VTOL WEAPON]],
	collide = false,
	cruiseAlt = 110,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Rapid Assault Flak Resistant Gunship]],
	energyMake = 0.8,
	energyStorage = 0,
	energyUse = 0.9,
	explodeAs = [[GUNSHIPEX]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	hoverAttack = true,
	iconType = [[air]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 2350,
	maxDamage = 2400,
	maxSlope = 10,
	maxVelocity = 8,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	name = [[Blade]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[BLADE]],
	scale = 1,
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT_VTOL]],
	side = [[ARM]],
	sightDistance = 624,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 720,
	unitname = [[blade]],
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
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[VTOL_SABOT]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	VTOL_SABOT = {
		areaOfEffect = 32,
		collideFriendly = false,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH2]],
		fireStarter = 70,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		model = [[missile]],
		name = [[Sabotrocket]],
		noSelfDamage = true,
		pitchtolerance = 18000,
		range = 420,
		reloadtime = 1.1,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHitDry = [[SabotHit]],
		soundStart = [[SabotFire]],
		soundTrigger = true,
		startsmoke = 1,
		startVelocity = 700,
		texture2 = [[armsmoketrail]],
		tolerance = 8000,
		turnRate = 9000,
		turret = false,
		weaponAcceleration = 300,
		weaponTimer = 5,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 1000,
		damage = {
			bombers = 5,
			commanders = 200,
			default = 400,
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

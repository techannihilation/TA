-- UNITDEF -- BLACKDAWN --
--------------------------------------------------------------------------------

local unitName = "blackdawn"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.1121,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 2.11,
	buildCostEnergy = 27600,
	buildCostMetal = 3850,
	builder = false,
	buildPic = [[blackdawn.png]],
	buildTime = 18657,
	canAttack = true,
	canFly = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP VTOL WEAPON]],
	collide = false,
	cruiseAlt = 55,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Advanced Gunship [Anti T3/T4]],
	designation = [[A1-AA-VTOL]],
	downloadable = 1,
	energyMake = 0.8,
	energyStorage = 0,
	energyUse = 0.9,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	idleAutoHeal = 5,
	idleTime = 1800,
	hoverAttack = true,
	maneuverleashlength = 2350,
	maxDamage = 6590,
	maxSlope = 10,
	maxVelocity = 7,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	name = [[BlackDawn]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[BLACKDAWN]],
	radarDistance = 0,
	scale = 1,
	selfDestructAs = [[BIG_UNIT_VTOL]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 480,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 590,
	unitname = [[blackdawn]],
	unitnumber = 8387,
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
		range = 600,
		reloadtime = 0.5,
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
			commanders = 145,
			default = 245,
			experimental_land = 490,
			experimental_ships = 490,
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

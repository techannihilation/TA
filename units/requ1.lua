-- UNITDEF -- REQU1 --
--------------------------------------------------------------------------------

local unitName = "requ1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.024,
	bmcode = 1,
	brakeRate = 0.008,
	buildCostEnergy = 43467,
	buildCostMetal = 3901,
	builder = false,
	buildPic = [[REQU.png]],
	buildTime = 98945,
	canAttack = true,
	canBuild = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	defaultmissiontype = [[Standby]],
	description = [[Tactical Mobile Nuclear Tank]],
	energyMake = 0,
	energyStorage = 10,
	energyUse = 0.8,
	explodeAs = [[CORGRIPN_BOMB]],
	firestandorders = 1,
	firestate = 0,
	footprintX = 3,
	footprintZ = 3,
	leaveTracks = true,
	maneuverleashlength = 640,
	maxDamage = 2500,
	maxSlope = 12,
	maxVelocity = 0.83,
	maxWaterDepth = 100,
	metalStorage = 2,
	mobilestandorders = 1,
	movementClass = [[TANK3]],
	name = [[Aegis]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[REQU1]],
	radarDistance = 1800,
	selfDestructAs = [[SPYBOMBX]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 390,
	smoothAnim = true,
	standingfireorder = 0,
	standingmoveorder = 1,
	steeringmode = 1,
	trackOffset = 8,
	trackStrength = 10,
	trackStretch = 1,
	trackType = [[StdTank]],
	trackWidth = 50,
	turnRate = 165,
	unitname = [[requ1]],
	unitnumber = 323,
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
			[1] = [[tarmmove]],
		},
		select = {
			[1] = [[tarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[MOBILE]],
			def = [[CORTRON_WEAPON2]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORTRON_WEAPON2 = {
		areaOfEffect = 480,
		commandfire = true,
		craterBoost = 1,
		craterMult = 1,
		edgeEffectiveness = 0.6,
		energypershot = 53437,
		explosionGenerator = [[custom:FLASHNUKE480]],
		fireStarter = 0,
		flightTime = 400,
		guidance = true,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		metalpershot = 750,
		model = [[empmisl1]],
		name = [[TacticalNuke]],
		noautorange = 1,
		noSelfDamage = true,
		propeller = 1,
		range = 3000,
		reloadtime = 2,
		renderType = 1,
		selfprop = true,
		shakeduration = 1.5,
		shakemagnitude = 32,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHit = [[xplomed4]],
		soundStart = [[misicbm1]],
		startsmoke = 1,
		stockpile = true,
		stockpiletime = 90,
		tolerance = 4000,
		turnRate = 32768,
		twoPhase = true,
		vlaunch = true,
		weaponAcceleration = 80,
		weaponTimer = 10,
		weaponType = [[StarburstLauncher]],
		weaponVelocity = 700,
		damage = {
			commanders = 499,
			default = 5000,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

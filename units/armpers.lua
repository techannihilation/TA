-- UNITDEF -- ARMPERS --
--------------------------------------------------------------------------------

local unitName = "armpers"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.23,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 2,
	buildCostEnergy = 12523,
	buildCostMetal = 3925,
	builder = false,
	buildTime = 29826,
	canAttack = true,
	canFly = true,
	canGuard = false,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP VTOL WEAPON]],
	cruiseAlt = 60,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Advanced Gunship [Anti T3/T4]],
	designation = [[AFD-J22]],
	energyMake = 0,
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	hoverAttack = true,
	maneuverleashlength = 3000,
	maxDamage = 6840,
	maxSlope = 10,
	maxVelocity = 7.8,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	name = [[Perseus]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMPERS]],
	radarDistance = 0,
	scale = 1,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 550,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 500,
	unitname = [[armpers]],
	unitnumber = 804,
	version = 2,
	workerTime = 0,
	zbuffer = 1,
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
			def = [[VTOL_ROCKET4]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	VTOL_ROCKET4 = {
		areaOfEffect = 134,
		burnblow = true,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:GDHEAVYROCKET]],
		fireStarter = 70,
		guidance = true,
		id = 135,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		model = [[missile10]],
		name = [[Rockets]],
		noSelfDamage = true,
		range = 730,
		reloadtime = 1.5,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHit = [[explode]],
		soundStart = [[rocklit3]],
		startsmoke = 1,
		startVelocity = 100,
		targetMoveError = 0.2,
		tolerance = 12000,
		tracks = true,
		turnRate = 6000,
		weaponAcceleration = 90,
		weaponTimer = 0.1,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 400,
		damage = {
			bombers = 5,
			commanders = 120,
			default = 450,
			experimental_land = 1200,
			experimental_ships = 1200,
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

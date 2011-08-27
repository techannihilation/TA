-- UNITDEF -- CORSHAD --
--------------------------------------------------------------------------------

local unitName = "corshad"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.084,
	altfromsealevel = 1,
	attackrunlength = 170,
	bmcode = 1,
	brakeRate = 1.5,
	buildCostEnergy = 5595,
	buildCostMetal = 146,
	builder = false,
	buildPic = [[CORSHAD.png]],
	buildTime = 5054,
	canAttack = true,
	canFly = true,
	canGuard = false,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUMVTOL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP VTOL WEAPON]],
	collide = false,
	cruiseAlt = 165,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Bomber]],
	energyMake = 0.9,
	energyStorage = 0,
	energyUse = 0.9,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	iconType = [[air]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 1380,
	maxDamage = 615,
	maxSlope = 10,
	maxVelocity = 8.05,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	name = [[Shadow]],
	noAutoFire = true,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORSHAD]],
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[CORE]],
	sightDistance = 169,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 807,
	unitname = [[corshad]],
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
			def = [[COREBOMB]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	COREBOMB = {
		accuracy = 500,
		areaOfEffect = 188,
		avoidFeature = false,
		burst = 6,
		burstrate = 0.28,
		collideFriendly = false,
		commandfire = true,
		craterBoost = 0,
		craterMult = 0,
		dropped = true,
		edgeEffectiveness = 0.15,
		explosionGenerator = [[custom:T1COREBOMB]],
		gravityaffected = [[true]],
		impulseBoost = 0.3,
		impulseFactor = 0.3,
		interceptedByShieldType = 16,
		manualBombSettings = true,
		model = [[bomb]],
		name = [[Bombs]],
		noSelfDamage = true,
		range = 1280,
		reloadtime = 4,
		renderType = 6,
		soundHit = [[xplomed2]],
		soundStart = [[bombrel]],
		sprayAngle = 300,
		weaponType = [[AircraftBomb]],
		damage = {
			bomb_resistant = 50,
			bombers = 5,
			commanders = 75,
			default = 150,
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

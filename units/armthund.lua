-- UNITDEF -- ARMTHUND --
--------------------------------------------------------------------------------

local unitName = "armthund"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.096,
	altfromsealevel = 1,
	attackrunlength = 170,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 0.5,
	buildCostEnergy = 5075,
	buildCostMetal = 145,
	builder = false,
	buildPic = [[ARMTHUND.png]],
	buildTime = 4778,
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
	energyMake = 1.1,
	energyStorage = 0,
	energyUse = 1.1,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	iconType = [[air]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 1380,
	maxDamage = 560,
	maxSlope = 10,
	maxVelocity = 8.4,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	name = [[Thunder]],
	noAutoFire = true,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMTHUND]],
	scale = 1,
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[ARM]],
	sightDistance = 195,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 829,
	unitname = [[armthund]],
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
			def = [[ARMBOMB]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMBOMB = {
		accuracy = 500,
		areaOfEffect = 188,
		avoidFeature = false,
		burst = 6,
		burstrate = 0.3,
		collideFriendly = false,
		commandfire = true,
		craterBoost = 0,
		craterMult = 0,
		dropped = true,
		edgeEffectiveness = 0.25,
		explosionGenerator = [[custom:T1ARMBOMB]],
		gravityaffected = [[true]],
		impulseBoost = 0.5,
		impulseFactor = 0.5,
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
			bomb_resistant = 48.3333,
			bombers = 5,
			commanders = 72.5,
			default = 145,
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

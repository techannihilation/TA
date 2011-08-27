-- UNITDEF -- ARMPNIX --
--------------------------------------------------------------------------------

local unitName = "armpnix"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.072,
	altfromsealevel = 1,
	attackrunlength = 300,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 5,
	buildCostEnergy = 10624,
	buildCostMetal = 229,
	builder = false,
	buildPic = [[ARMPNIX.png]],
	buildTime = 31064,
	canAttack = true,
	canFly = true,
	canGuard = false,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUMVTOL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP VTOL WEAPON]],
	collide = false,
	cruiseAlt = 220,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Strategic Bomber]],
	energyMake = 1.8,
	energyUse = 1.8,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	iconType = [[air]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 1380,
	maxDamage = 1020,
	maxSlope = 10,
	maxVelocity = 9.37,
	maxWaterDepth = 0,
	mobilestandorders = 1,
	name = [[Phoenix]],
	noAutoFire = true,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMPNIX]],
	scale = 1,
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[ARM]],
	sightDistance = 260,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 402,
	unitname = [[armpnix]],
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
			def = [[ARMADVBOMB]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMADVBOMB = {
		areaOfEffect = 194,
		collideFriendly = false,
		commandfire = true,
		craterBoost = 0,
		craterMult = 0,
		dropped = true,
		edgeEffectiveness = 0.7,
		explosionGenerator = [[custom:BIGBOMB_EXPLOSION]],
		gravityaffected = [[true]],
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		interceptedByShieldType = 16,
		model = [[bomb]],
		name = [[AdvancedBombs]],
		noSelfDamage = true,
		range = 1280,
		reloadtime = 0.14,
		renderType = 6,
		soundHit = [[xplomed2]],
		soundStart = [[bombrel]],
		weaponType = [[AircraftBomb]],
		damage = {
			bomb_resistant = 76.6667,
			bombers = 5,
			commanders = 115,
			default = 230,
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

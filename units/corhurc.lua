-- UNITDEF -- CORHURC --
--------------------------------------------------------------------------------

local unitName = "corhurc"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.06,
	altfromsealevel = 1,
	attackrunlength = 300,
	bmcode = 1,
	brakeRate = 0.625,
	buildCostEnergy = 14365,
	buildCostMetal = 313,
	builder = false,
	buildPic = [[CORHURC.png]],
	buildTime = 34461,
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
	description = [[Heavy Strategic Bomber]],
	energyMake = 0.6,
	energyStorage = 0,
	energyUse = 0.6,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	iconType = [[air]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 1380,
	maxDamage = 1371,
	maxSlope = 10,
	maxVelocity = 9.03,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	name = [[Hurricane]],
	noAutoFire = true,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORHURC]],
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[CORE]],
	sightDistance = 221,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 220,
	unitname = [[corhurc]],
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
			def = [[CORADVBOMB]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORADVBOMB = {
		areaOfEffect = 220,
		collideFriendly = false,
		commandfire = true,
		craterBoost = 0,
		craterMult = 0,
		dropped = true,
		edgeEffectiveness = 0.7,
		explosionGenerator = [[custom:CORE_BIGBOMB_EXPLOSION]],
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
			bomb_resistant = 95.6667,
			bombers = 5,
			commanders = 143.5,
			default = 287,
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

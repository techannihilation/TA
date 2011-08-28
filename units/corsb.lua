-- UNITDEF -- CORSB --
--------------------------------------------------------------------------------

local unitName = "corsb"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.084,
	altfromsealevel = 1,
	amphibious = 1,
	attackrunlength = 260,
	bmcode = 1,
	brakeRate = 1.5,
	buildCostEnergy = 7936,
	buildCostMetal = 182,
	builder = false,
	buildPic = [[CORSB.png]],
	buildTime = 9022,
	canAttack = true,
	canFly = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	canSubmerge = true,
	category = [[ALL MEDIUMVTOL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP VTOL WEAPON]],
	collide = false,
	cruiseAlt = 250,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Seaplane Bomber]],
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
	maxDamage = 760,
	maxSlope = 10,
	maxVelocity = 8.71,
	maxWaterDepth = 255,
	metalStorage = 0,
	mobilestandorders = 1,
	moverate1 = 8,
	name = [[Maelstrom]],
	noAutoFire = true,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORSB]],
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[CORE]],
	sightDistance = 455,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 368,
	unitname = [[corsb]],
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
			def = [[SEAADVBOMB]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	SEAADVBOMB = {
		areaOfEffect = 100,
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
		name = [[SeaAdvancedBombs]],
		noSelfDamage = true,
		range = 1280,
		reloadtime = 0.14,
		renderType = 6,
		soundHit = [[xplomed2]],
		soundStart = [[bombrel]],
		weaponType = [[AircraftBomb]],
		damage = {
			bomb_resistant = 70,
			bombers = 5,
			commanders = 105,
			default = 210,
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

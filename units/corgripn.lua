-- UNITDEF -- CORGRIPN --
--------------------------------------------------------------------------------

local unitName = "corgripn"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.48,
	attackrunlength = 180,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 2.5,
	buildCostEnergy = 16366,
	buildCostMetal = 162,
	buildPic = [[CORGRIPN.png]],
	buildTime = 30522,
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
	description = [[EMP Bomber]],
	energyMake = 15,
	energyUse = 15,
	explodeAs = [[BIG_UNIT]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	iconType = [[air]],
	idleAutoHeal = 5,
	idleTime = 1800,
	immunetoparalyzer = 1,
	maneuverleashlength = 1380,
	maxDamage = 1300,
	maxSlope = 15,
	maxVelocity = 12.08,
	maxWaterDepth = 0,
	mobilestandorders = 1,
	name = [[Stiletto]],
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORGRIPN]],
	seismicSignature = 0,
	selfDestructAs = [[ESTOR_BUILDINGEX]],
	side = [[ARM]],
	sightDistance = 390,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 2,
	stealth = true,
	steeringmode = 1,
	turnRate = 396,
	unitname = [[corgripn]],
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
			def = [[CORGRIPN_BOMB]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORGRIPN_BOMB = {
		areaOfEffect = 240,
		collideFriendly = false,
		commandfire = true,
		craterBoost = 0,
		craterMult = 0,
		dropped = true,
		edgeEffectiveness = 0.75,
		explosionGenerator = [[custom:EMPFLASH240]],
		fireStarter = 90,
		gravityaffected = [[true]],
		impulseBoost = 0,
		impulseFactor = 0,
		interceptedByShieldType = 16,
		model = [[bomb]],
		name = [[EMPbomb]],
		noSelfDamage = true,
		paralyzer = true,
		paralyzeTime = 15,
		range = 1280,
		reloadtime = 0.3,
		renderType = 6,
		soundHit = [[EMGPULS1]],
		soundStart = [[bombrel]],
		tolerance = 7000,
		weaponType = [[AircraftBomb]],
		damage = {
			bomb_resistant = 1333.3333,
			bombers = 5,
			commanders = 2000,
			default = 4000,
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

-- UNITDEF -- TLLABOMBER --
--------------------------------------------------------------------------------

local unitName = "tllabomber"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.03,
	altfromsealevel = 1,
	attackrunlength = 220,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 0.4,
	buildCostEnergy = 4455,
	buildCostMetal = 280,
	builder = false,
	buildTime = 34898,
	canAttack = true,
	canFly = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUMVTOL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP VTOL WEAPON]],
	collide = false,
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	cruiseAlt = 185,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Advanced Bomber]],
	designation = [[TL-ABMB]],
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Bombardier avancé]],
	germandescription = [[Verb. Bomber]],
	maneuverleashlength = 1280,
	maxDamage = 920,
	maxSlope = 10,
	maxVelocity = 10.2,
	maxWaterDepth = 0,
	mobilestandorders = 1,
	name = [[Ghost]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[tllabomber]],
	ovradjust = 1,
	scale = 1,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 350,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	threed = 1,
	turnRate = 245,
	unitname = [[tllabomber]],
	unitnumber = 889,
	version = 3.1,
	workerTime = 0,
	zbuffer = 1,
	sounds = {
		canceldestruct = [[cancel2]],
		underattack = [[tllwarning]],
		arrived = {
			[1] = [[tllvtolstop3]],
		},
		cant = {
			[1] = [[wearoff]],
		},
		count = {
			[1] = [[tllcount]],
			[2] = [[tllcount]],
			[3] = [[tllcount]],
			[4] = [[tllcount]],
			[5] = [[tllcount]],
			[6] = [[tllcount]],
		},
		ok = {
			[1] = [[tllvtolgo3]],
		},
		select = {
			[1] = [[vtolarac]],
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

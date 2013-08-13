-- UNITDEF -- TLLROBBER --
--------------------------------------------------------------------------------

local unitName = "tllrobber"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.2,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 2.5,
	buildCostEnergy = 8067,
	buildCostMetal = 650,
	isbuilder = false,
	buildTime = 17143,
	canFly = true,
	canGuard = true,
	canload = 1,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUMVTOL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP VTOL WEAPON]],
	cruiseAlt = 190,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Heavy Armored Air Transport]],
	designation = [[]],
	energyMake = 3,
	energyStorage = 0,
	energyUse = 21,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 0,
	firestate = 1,
	footprintX = 4,
	footprintZ = 4,
	immunetoparalyzer = 1,
	maneuverleashlength = 1280,
	maxDamage = 2775,
	maxHeightDif = 10,
	maxVelocity = 9.5,
	maxWaterDepth = 0,
	metalStorage = 0,
	minTransportMass = 50,
	mobilestandorders = 0,
	moverate1 = 1,
	moverate2 = 2,
	name = [[Robber]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[TLLROBBER]],
	pitchscale = 1,
	radarDistance = 0,
	selfDestructAs = [[BIG_UNIT_VTOL]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 300,
	standingmoveorder = 1,
	steeringmode = 1,
	transportCapacity = 5,
	transportMass = 5000,
	transportmaxunits = 3,
	transportSize = 25,
	turnRate = 90,
	unitname = [[tllrobber]],
	unitnumber = 926,
	upright = true,
	workerTime = 0,
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
			def = [[TLLVTOL_MISSILE2]],
			onlyTargetCategory = [[VTOL]],
		},
		[2] = {
			def = [[TLLVTOL_MISSILE2]],
			onlyTargetCategory = [[VTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	TLLVTOL_MISSILE2 = {
		areaOfEffect = 48,
		collideFriendly = false,
		craterBoost = 0,
		craterMult = 0,
		fireStarter = 70,
		guidance = true,
		id = 134,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		metalpershot = 0,
		model = [[tllvtolmissile]],
		name = [[Guided Missiles]],
		noSelfDamage = true,
		range = 530,
		reloadtime = 2,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHitDry = [[xplosml2]],
		soundStart = [[Rocklit3]],
		startVelocity = 420,
		texture2 = [[armsmoketrail]],
		tolerance = 8000,
		tracks = true,
		turnRate = 16384,
		weaponAcceleration = 146,
		weaponTimer = 5,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 480,
		damage = {
			bombers = 5,
			commanders = 80,
			default = 160,
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

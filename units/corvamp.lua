-- UNITDEF -- CORVAMP --
--------------------------------------------------------------------------------

local unitName = "corvamp"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.492,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 8.75,
	buildCostEnergy = 15000,
	buildCostMetal = 120,
	buildPic = [[CORVAMP.png]],
	buildTime = 9055,
	canAttack = true,
	canFly = true,
	canGuard = false,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUMVTOL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP VTOL WEAPON]],
	collide = false,
	cruiseAlt = 160,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Stealth Fighter]],
	energyMake = 15,
	energyUse = 15,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	iconType = [[air]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 1280,
	maxDamage = 600,
	maxSlope = 10,
	maxVelocity = 12.7,
	maxWaterDepth = 0,
	mobilestandorders = 1,
	moverate1 = 8,
	name = [[Vamp]],
	noChaseCategory = [[NOTVTOL SUB]],
	objectName = [[CORVAMP]],
	seismicSignature = 0,
	selfDestructAs = [[BIG_UNIT]],
	side = [[CORE]],
	sightDistance = 550,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	stealth = true,
	steeringmode = 1,
	turnRate = 1337,
	unitname = [[corvamp]],
	unitRestricted = 150,
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
			badTargetCategory = [[SMALLVTOL TINYVTOL]],
			def = [[CORVTOL_ADVMISSILE]],
			onlyTargetCategory = [[VTOL]],
		},
		[2] = {
			badTargetCategory = [[SMALLVTOL TINYVTOL]],
			def = [[CORVTOL_ADVMISSILE]],
			onlyTargetCategory = [[VTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORVTOL_ADVMISSILE = {
		areaOfEffect = 35,
		collideFriendly = false,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH2]],
		fireStarter = 70,
		guidance = true,
		impactonly = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		metalpershot = 0,
		model = [[missile]],
		name = [[GuidedMissiles]],
		noSelfDamage = true,
		range = 550,
		reloadtime = 0.5,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHit = [[xplosml2]],
		soundStart = [[Rocklit3]],
		startsmoke = 1,
		startVelocity = 650,
		texture2 = [[coresmoketrail]],
		tolerance = 8000,
		tracks = true,
		turnRate = 36000,
		weaponAcceleration = 250,
		weaponTimer = 7,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 850,
		damage = {
			bombers = 210,
			default = 5,
			fighters = 70,
			flak_resistant = 105,
			unclassed_air = 105,
		},
	},
}
unitDef.weaponDefs = weaponDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

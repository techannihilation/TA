-- UNITDEF -- TLLFIGHT --
--------------------------------------------------------------------------------

local unitName = "tllfight"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.45,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 4,
	buildCostEnergy = 500,
	buildCostMetal = 150,
	buildTime = 9585,
	canAttack = true,
	canFly = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP SMALLVTOL VTOL WEAPON]],
	collide = false,
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	cruiseAlt = 140,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Fighter]],
	designation = [[TL-fg]],
	energyMake = 1,
	energyUse = 1,
	explodeAs = [[SMALL_UNITEX]],
	firestandorders = 1,
	footprintX = 1,
	footprintZ = 1,
	frenchdescription = [[Chasseur]],
	germandescription = [[Jäger]],
	iconType = [[air]],
	idleAutoHeal = 5,
	italiandescription = [[Caccia]],
	maneuverleashlength = 1280,
	maxDamage = 300,
	maxSlope = 10,
	maxVelocity = 9.2,
	maxWaterDepth = 0,
	mobilestandorders = 1,
	moverate1 = 8,
	name = [[Sparrow]],
	noAutoFire = false,
	noChaseCategory = [[NOTVTOL SUB]],
	objectName = [[tllfight]],
	ovradjust = 1,
	radarDistance = 0,
	selfDestructAs = [[SMALL_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 600,
	spanishdescription = [[Caza]],
	standingfireorder = 2,
	standingmoveorder = 2,
	steeringmode = 1,
	threed = 1,
	turnRate = 750,
	unitname = [[tllfight]],
	unitnumber = 917,
	upright = true,
	version = 3.1,
	zbuffer = 1,
	sounds = {
		canceldestruct = [[cancel2]],
		underattack = [[tllwarning]],
		arrived = {
			[1] = [[tllvtolstop]],
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
			[1] = [[tllvtolgo]],
		},
		select = {
			[1] = [[vtolarac]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[TINYVTOL]],
			def = [[TLLVTOL_MISSILE]],
			onlyTargetCategory = [[VTOL]],
		},
		[2] = {
			badTargetCategory = [[TINYVTOL]],
			def = [[TLLVTOL_MISSILE]],
			onlyTargetCategory = [[VTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	TLLVTOL_MISSILE = {
		areaOfEffect = 35,
		collideFriendly = false,
		craterBoost = 0,
		craterMult = 0,
		explosionart = [[explode3]],
		explosiongaf = [[fx]],
		fireStarter = 70,
		guidance = true,
		id = 134,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lavaexplosionart = [[lavasplash]],
		lavaexplosiongaf = [[fx]],
		lineOfSight = true,
		metalpershot = 0,
		model = [[tllvtolmissile]],
		name = [[Guided Missiles]],
		noSelfDamage = true,
		range = 530,
		reloadtime = 1,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHit = [[xplosml2]],
		soundStart = [[Rocklit3]],
		startVelocity = 420,
		texture2 = [[armsmoketrail]],
		tolerance = 8000,
		tracks = true,
		turnRate = 16384,
		waterexplosionart = [[h2o]],
		waterexplosiongaf = [[fx]],
		weaponAcceleration = 146,
		weaponTimer = 5,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 480,
		damage = {
			bombers = 150,
			default = 5,
			fighters = 50,
			flak_resistant = 75,
			unclassed_air = 75,
		},
	},
}
unitDef.weaponDefs = weaponDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- ARMSHOCK1 --
--------------------------------------------------------------------------------

local unitName = "armshock1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.023,
	bmcode = 1,
	brakeRate = 0.1,
	buildCostEnergy = 44739,
	buildCostMetal = 1620,
	builder = false,
	buildPic = [[ARMSHOCK.png]],
	buildTime = 38218,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	defaultmissiontype = [[Standby]],
	description = [[Heavy Plasma Cannon]],
	explodeAs = [[SHOCKER]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	highTrajectory = 2,
	idleAutoHeal = 5,
	idleTime = 1800,
	immunetoparalyzer = 1,
	maneuverleashlength = 640,
	mass = 200000,
	maxDamage = 3900,
	maxSlope = 17,
	maxVelocity = 0.7,
	maxWaterDepth = 0,
	mobilestandorders = 1,
	movementClass = [[HKBOT4]],
	name = [[Medium Vanguard]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMSHOCK1]],
	script = [[armshock.cob]],
	seismicSignature = 0,
	selfDestructAs = [[SHOCKER]],
	side = [[ARM]],
	sightDistance = 625,
	standingfireorder = 2,
	standingmoveorder = 0,
	steeringmode = 1,
	turnRate = 231,
	unitname = [[armshock1]],
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
			[1] = [[kbarmmov]],
		},
		select = {
			[1] = [[kbarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[SHOCKER1]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	SHOCKER1 = {
		areaOfEffect = 196,
		avoidFeature = false,
		avoidFriendly = false,
		ballistic = true,
		cegTag = [[Trail_cannon]],
		collideFriendly = false,
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.5,
		explosionGenerator = [[custom:FLASHSMALLBUILDING]],
		gravityaffected = [[TRUE]],
		heightBoostFactor = 1.15,
		impulseBoost = 0.5,
		impulseFactor = 0.123,
		minbarrelangle = -35,
		name = [[ShockerHeavyCannon]],
		nogap = 1,
		noSelfDamage = true,
		predictBoost = 1,
		range = 820,
		reloadtime = 5.4,
		renderType = 4,
		rgbColor = [[0.73 0.42 0]],
		separation = 0.45,
		size = 2.46,
		sizedecay = -0.15,
		soundHitDry = [[xplomed2]],
		soundStart = [[cannhvy5]],
		stages = 20,
		targetBorder = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 410,
		damage = {
			default = 500,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

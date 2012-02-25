-- UNITDEF -- ARMORION --
--------------------------------------------------------------------------------

local unitName = "armorion"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.45,
	altfromsealevel = 1,
	attackrunlength = 290,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 0.3,
	buildCostEnergy = 13734,
	buildCostMetal = 300,
	builder = false,
	buildPic = [[armorion.png]],
	buildTime = 2400,
	canAttack = true,
	canFly = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP VTOL WEAPON]],
	collide = false,
	cruiseAlt = 220,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Heavy Carpet Bomber]],
	energyMake = 0,
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[BIG_UNIT]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	iconType = [[air]],
	maneuverleashlength = 850,
	maxDamage = 3000,
	maxSlope = 10,
	maxVelocity = 12,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	name = [[Orion]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMORION]],
	scale = 1,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 400,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 100,
	unitname = [[armorion]],
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
			def = [[ORION_BOMB]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ORION_BOMB = {
		areaOfEffect = 300,
		bouncerebound = 0.25,
		bounceslip = 0.7,
		burst = 7,
		burstrate = 0.15,
		collideFriendly = false,
		commandfire = false,
		craterBoost = 2,
		craterMult = 1,
		cylinderTargetting = 0,
		edgeEffectiveness = 0.7,
		explosionGenerator = [[custom:ORIONEXPLO]],
		fireStarter = 10,
		groundbounce = true,
		impulseFactor = 0,
		manualBombSettings = true,
		model = [[bombe]],
		myGravity = 0.2,
		name = [[Heavy Bombs]],
		noSelfDamage = true,
		numbounce = 3,
		range = 1280,
		reloadtime = 5,
		soundHit = [[burn02]],
		soundStart = [[bombrel]],
		sprayAngle = 12000,
		targetBorder = 0,
		waterbounce = true,
		weaponType = [[AircraftBomb]],
		damage = {
			default = 400,
			subs = 0,
			uwbuildings = 0,
		},
	},
}
unitDef.weaponDefs = weaponDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

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
	brakeRate = 1.5,
	buildCostEnergy = 45000,
	buildCostMetal = 2500,
	builder = false,
	buildPic = [[armorion.png]],
	buildTime = 35000,
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
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 850,
	maxDamage = 4500,
	maxSlope = 10.5,
	maxVelocity = 11.9,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	name = [[Orion]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMORION]],
	scale = 1,
	selfDestructAs = [[VBIG_UNIT_VTOL]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 400,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 100,
	unitname = [[armorion]],
	workerTime = 0,
	customparams = {
		RequireTech = [[Advanced T3 Unit Research Centre]],
	},
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
		areaOfEffect = 150,
		bounceExplosionGenerator = [[custom:dust_cloud]],
		bouncerebound = 0.25,
		bounceslip = 0.7,
		burst = 22,
		burstrate = 0.05,
		collideFriendly = false,
		commandfire = false,
		craterBoost = 0.0,
		craterMult = 0.0,
		cylinderTargeting = 0,
		edgeEffectiveness = 0.2,
		explosionGenerator = [[custom:ORIONEXPLO]],
		fireStarter = 10,
		groundbounce = true,
		impulseFactor = 0,
		interceptedByShieldType = 16,
		manualBombSettings = true,
		model = [[bombe]],
		myGravity = 0.2,
		name = [[Heavy Bombs]],
		noSelfDamage = true,
		numbounce = 3,
		range = 1280,
		reloadtime = 20,
		soundHitDry = [[burn02]],
		soundStart = [[bombrel]],
		sprayAngle = 25000,
		targetBorder = 0,
		waterbounce = true,
		weaponType = [[AircraftBomb]],
		damage = {
			bomb_resistant = 200,
			bombers = 5,
			commanders = 200,
			default = 600,
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

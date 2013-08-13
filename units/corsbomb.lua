-- UNITDEF -- CORSBOMB --
--------------------------------------------------------------------------------

local unitName = "corsbomb"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.1,
	bmcode = 1,
	brakeRate = 0.3,
	buildCostEnergy = 95000,
	buildCostMetal = 2900,
	isbuilder = false,
	buildPic = [[corsbomb.png]],
	buildTime = 45000,
	canAttack = true,
	cancloak = true,
	canFly = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP VTOL WEAPON]],
	cloakCost = 500,
	cloakCostMoving = 1750,
	cloakTimeout = 350,
	collide = false,
	cruiseAlt = 220,
	decloakOnFire = true,
	decloakSpherical = true,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Invisible Heavy Bomber]],
	energyMake = 0,
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[BIG_UNITEX]],
	footprintX = 3,
	footprintZ = 3,
	iconType = [[air]],
	idleAutoHeal = 1,
	idleTime = 2200,
	initCloaked = false,
	maxDamage = 5500,
	maxSlope = 30,
	maxVelocity = 6.5,
	maxWaterDepth = 0,
	metalStorage = 0,
	minCloakDistance = 275,
	mobilestandorders = 1,
	name = [[Black Lily]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORSBOMB]],
	scale = 1,
	selfDestructAs = [[BIG_UNIT_VTOL]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 400,
	standingmoveorder = 1,
	stealth = true,
	steeringmode = 1,
	TEDClass = [[VTOL]],
	turnRadius = 1500,
	turnRate = 140,
	unitname = [[corsbomb]],
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
			def = [[NAPALM_BOMB]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	NAPALM_BOMB = {
		areaOfEffect = 300,
		burst = 3,
		burstrate = 0.8,
		collideFriendly = false,
		commandfire = false,
		craterBoost = 2,
		craterMult = 1,
		cylinderTargeting = 0,
		edgeEffectiveness = 0.7,
		explosionGenerator = [[custom:NAPALM_Expl]],
		fireStarter = 10,
		impulseFactor = 0,
		interceptedByShieldType = 16,
		manualBombSettings = true,
		model = [[bombe]],
		myGravity = 0.2,
		name = [[Very Heavy Bombs]],
		noSelfDamage = true,
		range = 1280,
		reloadtime = 10,
		soundHitDry = [[burn02]],
		soundStart = [[bombrel]],
		targetBorder = 0,
		weaponType = [[AircraftBomb]],
		damage = {
			bomb_resistant = 1000,
			bombers = 5,
			commanders = 1000,
			default = 3000,
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

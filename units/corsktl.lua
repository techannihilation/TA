-- UNITDEF -- CORSKTL --
--------------------------------------------------------------------------------

local unitName = "corsktl"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.12,
	bmcode = 1,
	brakeRate = 0.188,
	buildCostEnergy = 24723,
	buildCostMetal = 506,
	builder = false,
	buildPic = [[CORSKTL.png]],
	buildTime = 16975,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	cantBeTransported = true,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	cloakCost = 150,
	cloakCostMoving = 400,
	defaultmissiontype = [[Standby]],
	description = [[Advanced Crawling Bomb]],
	energyMake = 0.2,
	energyStorage = 0,
	energyUse = 0.2,
	explodeAs = [[CRAWL_BLAST]],
	firestandorders = 1,
	firestate = 2,
	footprintX = 2,
	footprintZ = 2,
	idleAutoHeal = 5,
	idleTime = 1800,
	initCloaked = false,
	maneuverleashlength = 140,
	mass = 300000000,
	maxDamage = 320,
	maxSlope = 255,
	maxVelocity = 1.35,
	maxWaterDepth = 30,
	metalStorage = 0,
	minCloakDistance = 60,
	mobilestandorders = 1,
	movementClass = [[AKBOT2]],
	name = [[Skuttle]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORSKTL]],
	seismicSignature = 64,
	selfDestructAs = [[CORMINE6]],
	selfDestructCountdown = 0,
	side = [[CORE]],
	sightDistance = 260,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turninplace = 0,
	turnRate = 1122,
	unitname = [[corsktl]],
	upright = true,
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
			[1] = [[servsml6]],
		},
		select = {
			[1] = [[servsml6]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[CRAWL_DUMMY]],
			onlyTargetCategory = [[NOTVTOL]],
		},
		[2] = {
			def = [[CRAWL_DETONATOR]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CRAWL_DETONATOR = {
		areaOfEffect = 5,
		ballistic = true,
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0,
		explosionGenerator = [[]],
		fireSubmersed = true,
		gravityaffected = [[true]],
		impulseBoost = 0,
		impulseFactor = 0,
		name = [[Mine Detonator]],
		range = 1,
		reloadtime = 0.1,
		renderType = 4,
		weaponType = [[Cannon]],
		weaponVelocity = 1000,
		damage = {
			crawlingbombs = 1000,
			default = 0,
		},
	},
	CRAWL_DUMMY = {
		areaOfEffect = 0,
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0,
		explosionGenerator = [[]],
		fireSubmersed = true,
		impulseBoost = 0,
		impulseFactor = 0,
		name = [[Crawlingbomb Dummy Weapon]],
		range = 80,
		reloadtime = 0.1,
		tolerance = 100000,
		weaponType = [[Melee]],
		weaponVelocity = 100000,
		damage = {
			default = 0,
		},
	},
}
unitDef.weaponDefs = weaponDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

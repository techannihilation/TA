-- UNITDEF -- CORROACH --
--------------------------------------------------------------------------------

local unitName = "corroach"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.12,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.15,
	buildCostEnergy = 5471,
	buildCostMetal = 65,
	builder = false,
	buildPic = [[CORROACH.png]],
	buildTime = 7899,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL SMALL WEAPON]],
	defaultmissiontype = [[Standby]],
	description = [[Crawling Bomb]],
	energyMake = 0.1,
	energyStorage = 0,
	energyUse = 0.1,
	explodeAs = [[CRAWL_BLASTSML]],
	firestandorders = 1,
	firestate = 2,
	footprintX = 2,
	footprintZ = 2,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	mass = 1500,
	maxDamage = 560,
	maxSlope = 32,
	maxVelocity = 2.2,
	maxWaterDepth = 112,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[AKBOT2]],
	name = [[Roach]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[CORROACH]],
	seismicSignature = 0,
	selfDestructAs = [[CRAWL_BLAST]],
	selfDestructCountdown = 0,
	side = [[CORE]],
	sightDistance = 260,
	smoothAnim = true,
	standingfireorder = 0,
	standingmoveorder = 1,
	steeringmode = 1,
	turninplace = 0,
	turnRate = 1507,
	unitname = [[corroach]],
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

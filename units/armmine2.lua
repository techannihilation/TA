-- UNITDEF -- ARMMINE2 --
--------------------------------------------------------------------------------

local unitName = "armmine2"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = false,
	bmcode = 0,
	brakeRate = 0,
	buildCostEnergy = 1000,
	buildCostMetal = 15,
	builder = false,
	buildPic = [[ARMMINE2.png]],
	buildTime = 100,
	canAttack = false,
	canGuard = false,
	canMove = false,
	canPatrol = false,
	canstop = 0,
	category = [[ALL MINE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	cloakCost = 1,
	collide = false,
	collisionvolumeoffsets = [[0 -2 0]],
	collisionvolumescales = [[15 6 15]],
	collisionvolumetest = 1,
	collisionvolumetype = [[Ell]],
	defaultmissiontype = [[Standby_Mine]],
	description = [[Medium Mine]],
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[MINE_MEDIUM]],
	firestandorders = 1,
	firestate = 2,
	footprintX = 1,
	footprintZ = 1,
	iconType = [[building]],
	idleAutoHeal = 10,
	idleTime = 300,
	initCloaked = true,
	maxDamage = 10,
	maxSlope = 40,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	minCloakDistance = 8,
	name = [[Kilo]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[ARMMINE2]],
	onoffable = false,
	seismicSignature = 0,
	selfDestructAs = [[MINE_MEDIUM]],
	selfDestructCountdown = 0,
	side = [[ARM]],
	sightDistance = 83.2,
	smoothAnim = true,
	standingfireorder = 2,
	stealth = true,
	turnRate = 0,
	unitname = [[armmine2]],
	workerTime = 0,
	yardMap = [[o]],
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
			[1] = [[minesel1]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[MINE_DUMMY]],
			onlyTargetCategory = [[NOTVTOL]],
		},
		[2] = {
			def = [[MINE_DETONATOR]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	MINE_DETONATOR = {
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
			default = 0,
			mines = 100,
		},
	},
	MINE_DUMMY = {
		areaOfEffect = 0,
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0,
		explosionGenerator = [[]],
		fireSubmersed = true,
		impulseBoost = 0,
		impulseFactor = 0,
		name = [[Crawlingbomb Dummy Weapon]],
		range = 64,
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

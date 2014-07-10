-- UNITDEF -- ARMPERS --
--------------------------------------------------------------------------------

local unitName = "armpers"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.23,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 2,
	buildCostEnergy = 12523,
	buildCostMetal = 3925,
	builder = false,
	buildTime = 29826,
	canAttack = true,
	canFly = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP VTOL WEAPON]],
	cruiseAlt = 60,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Advanced Gunship [Anti T3/T4]],
	designation = [[AFD-J22]],
	energyMake = 0,
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	idleAutoHeal = 5,
	idleTime = 1800,
	hoverAttack = true,
	maneuverleashlength = 3000,
	maxDamage = 6840,
	maxSlope = 10,
	maxVelocity = 7.8,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	name = [[Perseus]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMPERS]],
	radarDistance = 0,
	scale = 1,
	selfDestructAs = [[BIG_UNIT_VTOL]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 550,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 500,
	unitname = [[armpers]],
	unitnumber = 804,
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
			def = [[VTOL_ROCKET4]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	VTOL_ROCKET4 = {
		areaOfEffect = 98,
		burnblow = true,
		cegTag = [[Core_Trail_rocket]],
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:thermite_explosion]],
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		model = [[missile10]],
		name = [[Axe Missile]],
		noSelfDamage = true,
		pitchtolerance = 12000,
		range = 650,
		reloadtime = 1.5,
		renderType = 4,
		rgbColor = [[0.63 0.25 0]],
		size = 2.06,
		soundHitDry = [[xplosml2]],
		soundStart = [[rocklit1]],
		soundTrigger = true,
		startsmoke = 1,
		startVelocity = 160,
		texture1 = [[null]],
		texture2 = [[null]],
		texture3 = [[null]],
		texture4 = [[null]],
		turret = false,
		turnRate = 30000,
		weaponAcceleration = 120,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 250,
		damage = {
			bombers = 5,
			commanders = 120,
			default = 450,
			experimental_land = 1200,
			experimental_ships = 1200,
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

-- UNITDEF -- ARMPERS --
--------------------------------------------------------------------------------

local unitName = "armpers"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.23,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 2,
	buildCostEnergy = 29650,
	buildCostMetal = 4125,
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
	description = [[Advanced Gunship - Anti T3/T4]],
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
			def = [[ARM_EMCC3]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARM_EMCC3 = {
		areaOfEffect = 8,
		burst = 4,
		burstrate = 0.05,
		id = 229,
		lineOfSight = true,
		name = [[Electro-Magnetic Compression Cannon]],
		range = 600,
		reloadtime = 0.15,
		renderType = 4,
		pitchtolerance = 18000,
		rgbColor = [[1.0 0.5 0.0]],
		soundHitDry = [[lasrhit1]],
		soundStart = [[armsml2]],
		soundTrigger = true,
		startsmoke = 1,
		tolerance = 8000,
		turnrate = 9000,
		turret = false,
		weaponTimer = 1,
		weaponType = [[Cannon]],
		weaponVelocity = 475,
		damage = {
			subs = 5,
			bombers = 1,
			commanders = 15,
			default = 23,
			experimental_land = 50,
			experimental_ships = 50,
			fighters = 1,
			flak_resistant = 15,
			unclassed_air = 1,
		},
	},
}
unitDef.weaponDefs = weaponDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

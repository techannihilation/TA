-- UNITDEF -- ARMCBOMB --
--------------------------------------------------------------------------------

local unitName = "armcbomb"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.085,
	attackrunlength = 170,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 0.35,
	buildCostEnergy = 6537,
	buildCostMetal = 291,
	buildTime = 17814,
	canAttack = true,
	canFly = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUMVTOL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP VTOL WEAPON]],
	collide = false,
	cruiseAlt = 165,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Fast Bomber]],
	designation = [[ARM-CRPT]],
	energyMake = 5,
	energyStorage = 0,
	energyUse = 5,
	explodeAs = [[SMALL_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	maneuverleashlength = 1280,
	maxDamage = 562,
	maxSlope = 10,
	maxVelocity = 12.8,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	moverate1 = 8,
	name = [[Stratos]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[Armcbomb]],
	radarDistance = 0,
	selfDestructAs = [[SMALL_UNIT_VTOL]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 450,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 390,
	unitname = [[armcbomb]],
	unitnumber = 120,
	upright = true,
	customparams = {
		RequireTech = [[Advanced T1 Unit Research Centre]],
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
			def = [[ARM_CARPET_BOMB]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARM_CARPET_BOMB = {
		accuracy = 500,
		areaOfEffect = 190,
		avoidFeature = false,
		burst = 6,
		burstrate = 0.28,
		collideFriendly = false,
		commandfire = false,
		craterBoost = 0,
		craterMult = 0,
		dropped = true,
		gravityaffected = [[true]],
		id = 17,
		interceptedByShieldType = 16,
		manualBombSettings = true,
		model = [[bomb]],
		name = [[Advanced Bombs]],
		noSelfDamage = true,
		range = 1280,
		reloadtime = 5.5,
		renderType = 6,
		soundHitDry = [[xplomed2]],
		soundStart = [[bombrel]],
		sprayAngle = 300,
		weaponType = [[AircraftBomb]],
		damage = {
			bomb_resistant = 86.6667,
			bombers = 5,
			commanders = 130,
			default = 260,
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

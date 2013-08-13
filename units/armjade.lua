-- UNITDEF -- ARMJADE --
--------------------------------------------------------------------------------

local unitName = "armjade"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.142,
	bankscale = 1,
	bmcode = 1,
	brakeRate = 3.85,
	buildCostEnergy = 8450,
	buildCostMetal = 321,
	isbuilder = false,
	buildTime = 9200,
	canAttack = true,
	canFly = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUMVTOL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP VTOL WEAPON]],
	collide = false,
	cruiseAlt = 150,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Laser Gunship]],
	designation = [[ARM-LG]],
	downloadable = 1,
	energyMake = 1,
	energyStorage = 0,
	energyUse = 0.9,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	hoverAttack = true,
	maneuverleashlength = 1280,
	maxDamage = 751,
	maxHeightDif = 10,
	maxVelocity = 6.4,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	name = [[Jade Eagle]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMJADE]],
	ovradjust = 1,
	scale = 1,
	selfDestructAs = [[BIG_UNIT_VTOL]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 400,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 400,
	unitname = [[armjade]],
	unitnumber = 611,
	upright = true,
	workerTime = 0,
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
			def = [[ARMJADE_LASER]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMJADE_LASER = {
		areaOfEffect = 15,
		beamlaser = 1,
		beamTime = 0.3,
		coreThickness = 0.175,
		energypershot = 25,
		fireStarter = 0,
		id = 241,
		laserFlareSize = 9,
		lineOfSight = true,
		name = [[JadeEagle-Laser]],
		pitchtolerance = 12000,
		range = 360,
		reloadtime = 1,
		renderType = 0,
		rgbColor = [[0.000 1.000 0.259]],
		soundHitDry = [[lasrhit1]],
		soundStart = [[Lasrmas2]],
		targetMoveError = 0.15,
		thickness = 2.5,
		tolerance = 6000,
		turret = false,
		weaponType = [[BeamLaser]],
		weaponVelocity = 800,
		damage = {
			bombers = 5,
			commanders = 70,
			default = 140,
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

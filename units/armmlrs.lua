-- UNITDEF -- ARMMLRS --
--------------------------------------------------------------------------------

local unitName = "armmlrs"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.34,
	bmcode = 1,
	brakeRate = 0.009765625,
	buildCostEnergy = 89460,
	buildCostMetal = 6240,
	builder = false,
	buildTime = 53231,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL HUGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionVolumeScales = [[43.4 33.4 63.4]],
	collisionVolumeOffsets = [[0 0 0]],
	collisionVolumeTest = 1,
	collisionVolumeType = [[box]],
	defaultmissiontype = [[Standby]],
	description = [[Multi Launch Rocket System]],
	designation = [[MLRS]],
	downloadable = 1,
	energyMake = 5.5,
	energyStorage = 0,
	energyUse = 4.5,
	explodeAs = [[ATOMIC_BLAST]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	mass = 200000,
	maxDamage = 4512,
	maxSlope = 10,
	maxVelocity = 1.06,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[htank4]],
	name = [[MLRS]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMMLRS]],
	radarDistance = 0,
	selfDestructAs = [[ATOMIC_BLAST]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 2100,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 250,
	unitname = [[armmlrs]],
	unitnumber = 1876,
	workerTime = 0,
	sfxtypes = {
		explosiongenerators = {
			[1] = "custom:muzzle_flare_very_heavy_rocket",
		},
	},
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
			[1] = [[tarmmove]],
		},
		select = {
			[1] = [[tarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[SMALL TINY]],
			def = [[BARRAGE]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	BARRAGE = {
		areaOfEffect = 350,
		burnblow = true,
		burst = 3,
		burstrate = 1.1,
		cegTag = [[Trail_Large_Rocket_New]],
		cruisealt = 120,
		explosionGenerator = [[custom:Explosion_VeryHeavy_Rocket-nix]],
		fireStarter = 80,
		flightTime = 15,
		guidance = true,
		lineOfSight = true,
		metalpershot = 0,
		model = [[rocketo]],
		name = [[Barrarge]],
		proximityPriority = -1,
		range = 2000,
		reloadtime = 30,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.02,
		smokeTrail = true,
		soundHitDry = [[mlrsboom]],
		soundStart = [[mlrsfireshort]],
		soundTrigger = true,
		sprayAngle = 1024,
		startsmoke = 1,
		startVelocity = 150,
		texture1 = [[null]],
		texture2 = [[null]],
		texture3 = [[null]],
		texture4 = [[null]],
		tolerance = 1000,
		tracks = false,
		trajectoryHeight = 1.65,
		turnRate = 5000,
		turret = true,
		weaponAcceleration = 110,
		weaponTimer = 15,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 700,
		damage = {
			default = 3150,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

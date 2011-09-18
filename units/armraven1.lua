-- UNITDEF -- ARMRAVEN1 --
--------------------------------------------------------------------------------

local unitName = "armraven1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.108,
	bmcode = 1,
	brakeRate = 0.188,
	buildCostEnergy = 45625,
	buildCostMetal = 1551,
	builder = false,
	buildPic = [[ARMRAVEN.png]],
	buildTime = 45522,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	defaultmissiontype = [[Standby]],
	description = [[Rocket Kbot]],
	explodeAs = [[MECH_BLAST]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	mass = 200000,
	maxDamage = 3500,
	maxSlope = 20,
	maxVelocity = 1.1,
	maxWaterDepth = 12,
	mobilestandorders = 1,
	movementClass = [[HKBOT4]],
	name = [[Medium Catapult]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMRAVEN1]],
	script = [[armraven.cob]],
	seismicSignature = 0,
	selfDestructAs = [[MECH_BLAST]],
	side = [[CORE]],
	sightDistance = 700,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	turnRate = 979,
	unitname = [[armraven1]],
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
			[1] = [[mavbok1]],
		},
		select = {
			[1] = [[mavbsel1]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[EXP_HEAVYROCKET1]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	EXP_HEAVYROCKET1 = {
		accuracy = 300,
		areaOfEffect = 196,
		avoidFeature = false,
		burst = 16,
		burstrate = 0.12,
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.5,
		explosionGenerator = [[custom:MEDMISSILE_EXPLOSION]],
		fireStarter = 70,
		flightTime = 3,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		metalpershot = 0,
		model = [[exphvyrock]],
		movingAccuracy = 800,
		name = [[RavenCatapultRockets]],
		noSelfDamage = true,
		proximityPriority = -1,
		range = 1050,
		reloadtime = 20,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHit = [[rockhit]],
		soundStart = [[rapidrocket3]],
		sprayAngle = 2000,
		startsmoke = 1,
		startVelocity = 200,
		texture2 = [[coresmoketrail]],
		trajectoryHeight = 1,
		turnRate = 0,
		turret = true,
		weaponAcceleration = 120,
		weaponTimer = 6,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 410,
		wobble = 1800,
		damage = {
			default = 160,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

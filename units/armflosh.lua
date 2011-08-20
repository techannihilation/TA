-- UNITDEF -- ARMFLOSH --
--------------------------------------------------------------------------------

local unitName = "armflosh"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = true,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 2048,
	buildCostEnergy = 29167,
	buildCostMetal = 3645.5,
	builder = false,
	buildPic = [[armflosh.png]],
	buildTime = 61719,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	description = [[Floating Plasma Deflector]],
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	floater = true,
	footprintX = 4,
	footprintZ = 4,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 3260.3,
	maxSlope = 10,
	maxVelocity = 0,
	metalStorage = 0,
	minWaterDepth = 5,
	name = [[Saint]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	norestrict = 1,
	objectName = [[armflosh.s3o]],
	onoffable = true,
	seismicSignature = 0,
	selfDestructAs = [[CRAWL_BLAST]],
	side = [[ARM]],
	sightDistance = 273,
	smoothAnim = true,
	turnRate = 0,
	unitname = [[armflosh]],
	waterline = 2,
	workerTime = 0,
	yardMap = [[oooooooooooooooo]],
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
			[1] = [[drone1]],
		},
		select = {
			[1] = [[drone1]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[REPULSOR]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	REPULSOR = {
		isShield = true,
		name = [[PlasmaRepulsor]],
		range = 400,
		shieldAlpha = 0.35,
		shieldBadColor = [[1 0.2 0.2]],
		shieldEnergyUse = 600,
		shieldForce = 7,
		shieldGoodColor = [[0.2 1 0.2]],
		shieldInterceptType = 1,
		shieldMaxSpeed = 3500,
		shieldPower = 7500,
		shieldPowerRegen = 150,
		shieldPowerRegenEnergy = 562.5,
		shieldRadius = 400,
		shieldRepulser = true,
		smartShield = true,
		visibleShield = true,
		visibleShieldHitFrames = 70,
		visibleShieldRepulse = true,
		weaponType = [[Shield]],
		damage = {
			default = 100,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

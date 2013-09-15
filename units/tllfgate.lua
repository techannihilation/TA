-- UNITDEF -- TLLFGATE --
--------------------------------------------------------------------------------

local unitName = "tllfgate"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = true,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 2048,
	buildCostEnergy = 46000,
	buildCostMetal = 8900,
	builder = false,
	buildPic = [[tllfgate.png]],
	buildTime = 78000,
	category = [[ALL NOTDEFENSE NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	description = [[Floating Plasma Deflector]],
	energyStorage = 2000,
	energyUse = 0,
	explodeAs = [[CRAWL_BLAST]],
	floater = true,
	footprintX = 6,
	footprintZ = 4,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 5600,
	maxSlope = 10,
	maxVelocity = 0,
	metalStorage = 0,
	minWaterDepth = 5,
	name = [[Saint]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	norestrict = 1,
	objectName = [[tllfgate]],
	onoffable = true,
	seismicSignature = 0,
	selfDestructAs = [[MINE_NUKE]],
	side = [[TLL]],
	sightDistance = 273,
	turnRate = 0,
	unitname = [[tllfgate]],
	waterline = 0,
	workerTime = 0,
	yardMap = [[oooooo oooooo oooooo oooooo]],
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
		name = [[PlasmaRepulsor]],
		range = 400,
		shieldAlpha = 0.35,
		shieldBadColor = [[1 0.2 0.2]],
		shieldEnergyUse = 2000,
		shieldForce = 7,
		shieldGoodColor = [[0.2 1 0.2]],
		shieldInterceptType = 1,
		shieldMaxSpeed = 3500,
		shieldPower = 18000,
		shieldPowerRegen = 300,
		shieldPowerRegenEnergy = 1200,
		shieldRadius = 560,
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

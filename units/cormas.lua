-- UNITDEF -- CORMAS --
--------------------------------------------------------------------------------

local unitName = "cormas"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 4096,
	buildCostEnergy = 72968,
	buildCostMetal = 5220,
	builder = false,
	buildTime = 78000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	collisionvolumeoffsets = [[0 16 0]],
	collisionvolumescales = [[76 152 76]],
	collisionvolumetest = 0,
	collisionvolumetype = [[CylY]],
	damageModifier = 0.4,
	description = [[Planet crust deep penetration mine, amphibious]],
	designation = [[AM-EME1]],
	energyMake = 0,
	energyStorage = 0,
	energyUse = 250,
	explodeAs = [[ATOMIC_BLAST]],
	extractsMetal = 0.03,
	footprintX = 7,
	footprintZ = 7,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 2930,
	maxSlope = 20,
	maxWaterDepth = 9999,
	metalStorage = 2500,
	name = [[Dildo]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CORMAS]],
	onoffable = true,
	radarDistance = 0,
	selfDestructAs = [[MINE_NUKE]],
	side = [[CORE]],
	sightDistance = 322,
	unitname = [[cormas]],
	unitnumber = 33644,
	workerTime = 0,
	yardMap = [[ooooooo ooooooo ooooooo ooooooo ooooooo ooooooo ooooooo]],
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[CORMASshield]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORMASshield = {
		isShield = true,
		name = [[ExtractorShield]],
		shieldAlpha = 0.4,
		shieldBadColor = [[0.05 0.05 0.05]],
		shieldEnergyUse = 60,
		shieldGoodColor = [[0.8 0.8 1]],
		shieldInterceptType = -1,
		shieldPower = 5000,
		shieldPowerRegen = 100,
		shieldPowerRegenEnergy = 117.2,
		shieldRadius = 125,
		shieldRepulser = false,
		shieldStartingPower = 5000,
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

-- UNITDEF -- CORFORT --
--------------------------------------------------------------------------------

local unitName = "corfort"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 0,
	buildCostEnergy = 612,
	buildCostMetal = 23,
	builder = false,
	buildPic = [[CORFORT.png]],
	buildTime = 810,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[FORTIFICATION_CORE]],
	description = [[Perimeter Defense]],
	energyMake = 0,
	energyStorage = 0,
	energyUse = 0,
	footprintX = 2,
	footprintZ = 2,
	idleAutoHeal = 5,
	idleTime = 1800,
	isFeature = true,
	levelGround = false,
	maxDamage = 100,
	maxSlope = 24,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Fortification Wall]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CORFORT]],
	seismicSignature = 0,
	side = [[CORE]],
	sightDistance = 130,
	smoothAnim = true,
	turnRate = 0,
	unitname = [[corfort]],
	workerTime = 0,
	yardMap = [[ffff]],
	featureDefs = nil,
}

--------------------------------------------------------------------------------

local featureDefs = {
	FORTIFICATION_CORE = {
		autoreclaimable = 0,
		blocking = true,
		category = [[dragonteeth]],
		collisionvolumeoffsets = [[0 -4 0]],
		collisionvolumescales = [[32 52 32]],
		collisionvolumetest = 1,
		collisionvolumetype = [[Box]],
		damage = 15000,
		description = [[Fortification Wall]],
		featureDead = [[RockTeethx]],
		featurereclamate = [[smudge01]],
		footprintX = 2,
		footprintZ = 2,
		height = 55,
		hitdensity = 100,
		metal = 15,
		nodrawundergray = true,
		object = [[corfort]],
		reclaimable = true,
		reclaimTime = 800,
		seqnamereclamate = [[tree1reclamate]],
		world = [[allworld]],
	},
	RockTeethx = {
		animating = 0,
		animtrans = 0,
		blocking = true,
		category = [[rocks]],
		damage = 5000,
		description = [[Rubble]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 6,
		object = [[2X2A]],
		reclaimable = true,
		shadtrans = 1,
		world = [[greenworld]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

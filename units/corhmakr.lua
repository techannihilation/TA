-- UNITDEF -- CORHMAKR --
--------------------------------------------------------------------------------

local unitName = "corhmakr"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = true,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 8192,
	buildCostEnergy = 161660,
	buildCostMetal = 5280,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 7,
	buildingGroundDecalSizeY = 7,
	buildingGroundDecalType = [[corhmakr_aoplane.png]],
	buildPic = [[corhmakr.png]],
	buildTime = 95000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	collisionvolumeoffsets = [[-2 0 0]],
	collisionvolumescales = [[60 100 60]],
	collisionvolumetype = [[CylY]],
	damageModifier = 0.1,
	description = [[Converts upto 3072 Energy to Metal]],
	energyStorage = 0,
	explodeAs = [[ATOMIC_BLAST]],
	footprintX = 6,
	footprintZ = 6,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 6900,
	maxSlope = 10,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Hardened Metal Maker]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[corhmakr.s3o]],
	script = [[corhmakr.lua]],
	seismicSignature = 0,
	selfDestructAs = [[ATOMIC_BLAST]],
	side = [[CORE]],
	sightDistance = 273,
	turnRate = 0,
	unitname = [[corhmakr]],
	useBuildingGroundDecal = true,
	workerTime = 0,
	yardMap = [[oooooo oooooo oooooo oooooo oooooo oooooo]],
	sounds = {
		activate = [[metlon1]],
		canceldestruct = [[cancel2]],
		deactivate = [[metloff1]],
		underattack = [[warning1]],
		working = [[metlrun1]],
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		select = {
			[1] = [[metlon1]],
		},
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

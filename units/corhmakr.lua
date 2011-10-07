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
	buildCostEnergy = 73482,
	buildCostMetal = 2640,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 7,
	buildingGroundDecalSizeY = 7,
	buildingGroundDecalType = [[corhmakr_aoplane.png]],
	buildPic = [[corhmakr.png]],
	buildTime = 1000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	collisionvolumeoffsets = [[-2 0 0]],
	collisionvolumescales = [[60 100 60]],
	collisionvolumetype = [[CylY]],
	damageModifier = 0.3,
	description = [[Converts upto 1536 Energy to Metal]],
	energyStorage = 0,
	explodeAs = [[ARMESTOR_BUILDINGEX]],
	footprintX = 5,
	footprintZ = 5,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 8500,
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
	selfDestructAs = [[ARMESTOR_BUILDING]],
	side = [[CORE]],
	sightDistance = 273,
	smoothAnim = true,
	turnRate = 0,
	unitname = [[corhmakr]],
        useBuildingGroundDecal = true,
	workerTime = 0,
	yardMap = [[ooooooooo]],
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

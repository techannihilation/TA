-- UNITDEF -- ARMCKMAKR --
--------------------------------------------------------------------------------

local unitName = "armckmakr"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = true,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 8192,
	buildCostEnergy = 22400,
	buildCostMetal = 400,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 4,
	buildingGroundDecalSizeY = 4,
	buildingGroundDecalType = [[armckmakr_aoplane.dds]],
	buildPic = [[armckmakr.png]],
	buildTime = 19000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	cloakCost = 40,
	collisionvolumeoffsets = [[-2 0 0]],
	collisionvolumescales = [[50 23 50]],
	collisionvolumetype = [[CylY]],
	damageModifier = 0.5,
	description = [[Converts upto 400 Energy to Metal]],
	energyStorage = 0,
	explodeAs = [[ARMESTOR_BUILDING]],
	footprintX = 3,
	footprintZ = 3,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 550,
	maxSlope = 10,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	minCloakDistance = 60,
	name = [[Cloakable Metal Maker]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[armckmakr]],
	script = [[armckmakr.lua]],
	seismicSignature = 0,
	selfDestructAs = [[ARMESTOR_BUILDING]],
	side = [[ARM]],
	sightDistance = 273,
	turnRate = 0,
	unitname = [[armckmakr]],
	useBuildingGroundDecal = true,
	workerTime = 0,
	yardMap = [[ooo ooo ooo ooo]],
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

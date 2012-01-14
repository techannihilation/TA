-- UNITDEF -- ARMMAKR --
--------------------------------------------------------------------------------

local unitName = "armckmakr"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = true,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 8192,
	buildCostEnergy = 18400,
	buildCostMetal = 450,
	builder = false,
	buildPic = [[armckmakr.png]],
	buildTime = 22000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	cloakCost = 50,
	collisionvolumeoffsets = [[-2 0 0]],
	collisionvolumescales = [[50 23 50]],
	collisionvolumetype = [[CylY]],
	damageModifier = 0.3,
	description = [[Converts upto 500 Energy to Metal]],
	energyStorage = 0,
	explodeAs = [[ARMESTOR_BUILDINGEX]],
	footprintX = 4,
	footprintZ = 4,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 550,
	maxSlope = 10,
	maxVelocity = 0,
	maxWaterDepth = 0,
	minCloakDistance = 50,
	metalStorage = 0,
	name = [[Cloakable Metal Maker]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[armckmakr]],
	script = [[armckmakr.lua]],
	seismicSignature = 0,
	selfDestructAs = [[ARMESTOR_BUILDING]],
	side = [[ARM]],
	sightDistance = 273,
	smoothAnim = true,
	turnRate = 0,
	unitname = [[armckmakr]],
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
	buildingGroundDecalDecaySpeed=30,
	buildingGroundDecalSizeX=6,
	buildingGroundDecalSizeY=6,
	useBuildingGroundDecal = true,
	buildingGroundDecalType=[[armckmakr_aoplane.dds]],
}
--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

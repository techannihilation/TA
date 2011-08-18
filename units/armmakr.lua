-- UNITDEF -- ARMMAKR --
--------------------------------------------------------------------------------

local unitName = "armmakr"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = true,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 8192,
	buildCostEnergy = 1017,
	buildCostMetal = 5,
	builder = false,
	buildPic = [[ARMMAKR.png]],
	buildTime = 1000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	collisionvolumeoffsets = [[-2 0 0]],
	collisionvolumescales = [[50 23 50]],
	collisionvolumetype = [[CylY]],
	damageModifier = 0.3,
	description = [[Converts upto 50 Energy to Metal]],
	energyStorage = 0,
	explodeAs = [[ARMESTOR_BUILDINGEX]],
	footprintX = 3,
	footprintZ = 3,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 150,
	maxSlope = 10,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Metal Maker]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[ARMMAKR]],
	script = [[armmakr.lua]],
	seismicSignature = 0,
	selfDestructAs = [[ARMESTOR_BUILDING]],
	side = [[ARM]],
	sightDistance = 273,
	smoothAnim = true,
	turnRate = 0,
	unitname = [[armmakr]],
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

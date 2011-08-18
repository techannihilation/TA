-- UNITDEF -- ARMUWFUS1 --
--------------------------------------------------------------------------------

local unitName = "armuwfus1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = true,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 8192,
	buildCostEnergy = 183000,
	buildCostMetal = 16000,
	builder = false,
	buildPic = [[ARMUWFUS.png]],
	buildTime = 300000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	description = [[Produces Highly Energy / Storage]],
	energyMake = 5000,
	energyStorage = 40000,
	explodeAs = [[Nuclear_missile]],
	floater = true,
	footprintX = 10,
	footprintZ = 8,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 9800,
	maxSlope = 10,
	maxVelocity = 0,
	metalStorage = 0,
	minWaterDepth = 2,
	name = [[Advanced Antimater Fusion]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[ARMUWFUS1]],
	script = [[armuwfus1.cob]],
	seismicSignature = 0,
	selfDestructAs = [[NUCLEAR_MISSILE1]],
	side = [[ARM]],
	sightDistance = 143,
	smoothAnim = true,
	turnRate = 0,
	unitname = [[armuwfus1]],
	waterline = 20,
	workerTime = 0,
	yardMap = [[wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww]],
	sounds = {
		canceldestruct = [[cancel2]],
		underattack = [[warning1]],
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		select = {
			[1] = [[watfusn1]],
		},
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

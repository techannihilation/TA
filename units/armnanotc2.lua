-- UNITDEF -- ARMNANOTC2 --
--------------------------------------------------------------------------------

local unitName = "armnanotc2"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	brakeRate = 1.5,
	buildCostEnergy = 72000, --
	buildCostMetal = 2300, --
	buildDistance = 900, --
	builder = true,
	buildPic = [[ARMNANOTC.png]],
	buildTime = 20000, --
	canGuard = true,
	canMove = false,
	canPatrol = true,
	canreclamate = 1,
	canstop = 1,
	cantBeTransported = true,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	defaultmissiontype = [[Standby]],
	description = [[Repairs and builds in large radius]],
	energyStorage = 0,
	energyUse = 125, --
	explodeAs = [[NANOBOOM4]],
	footprintX = 3,
	footprintZ = 3,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 380,
	mass = 1000000000000,
	maxDamage = 1200, --
	maxSlope = 10,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Nano Turret Level 3]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[ARMNANOTC2]],
	script = [[armnanotc.cob]],
	seismicSignature = 0,
	selfDestructAs = [[TINY_BUILDINGEX]],
	side = [[ARM]],
	sightDistance = 380,
	smoothAnim = true,
	steeringmode = 1,
	turnRate = 1,
	unitname = [[armnanotc2]],
	upright = true,
	workerTime = 800, --
	sounds = {
		build = [[nanlath1]],
		canceldestruct = [[cancel2]],
		repair = [[repair1]],
		underattack = [[warning1]],
		working = [[reclaim1]],
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
			[1] = [[varmmove]],
		},
		select = {
			[1] = [[varmsel]],
		},
	},
	buildingGroundDecalDecaySpeed=30,
	buildingGroundDecalSizeX=5,
	buildingGroundDecalSizeY=5,
	useBuildingGroundDecal = true,
	buildingGroundDecalType=[[armnanotc_aoplane.dds]],
}
--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

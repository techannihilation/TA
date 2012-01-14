-- UNITDEF -- CORNANOTC1 --
--------------------------------------------------------------------------------

local unitName = "cornanotc1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	brakeRate = 1.5,
	buildCostEnergy = 20000, --
	buildCostMetal = 680, --
	buildDistance = 450, --
	builder = true,
	buildPic = [[CORNANOTC.png]],
	buildTime = 10000,
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
	energyUse = 50, --
	explodeAs = [[NANOBOOM3]],
	footprintX = 3,
	footprintZ = 3,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 380,
	mass = 1000000000000,
	maxDamage = 700,
	maxSlope = 10,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Nano Turret Level 2]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CORNANOTC1]],
	script = [[cornanotc.cob]],
	seismicSignature = 0,
	selfDestructAs = [[TINY_BUILDINGEX]],
	side = [[CORE]],
	sightDistance = 380,
	smoothAnim = true,
	steeringmode = 1,
	turnRate = 1,
	unitname = [[cornanotc1]],
	upright = true,
	workerTime = 600, --
	sounds = {
		build = [[nanlath2]],
		canceldestruct = [[cancel2]],
		capture = [[capture1]],
		repair = [[repair2]],
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
			[1] = [[vcormove]],
		},
		select = {
			[1] = [[vcorsel]],
		},
	},
	buildingGroundDecalDecaySpeed=30,
	buildingGroundDecalSizeX=5,
	buildingGroundDecalSizeY=5,
	useBuildingGroundDecal = true,
	buildingGroundDecalType=[[cornanotc_aoplane.dds]],
}
--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

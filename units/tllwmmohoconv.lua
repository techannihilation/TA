-- UNITDEF -- TLLWMMOHOCONV --
--------------------------------------------------------------------------------

local unitName = "tllwmmohoconv"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 18000,
	buildCostMetal = 1032,
	builder = false,
	buildTime = 42000,
	category = [[ALL NOTDEFENSE NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	description = [[Converts upto 1000 Energy into Metal]],
	designation = [[WM-CONV]],
	explodeAs = [[ATOMIC_BLASTSML]],
	footprintX = 5,
	footprintZ = 5,
	maxDamage = 1300,
	maxSlope = 10,
	minWaterDepth = 15,
	name = [[Floating Moho Metal Maker]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	noshadow = 1,
	objectName = [[tllwmmohoconv]],
	ovradjust = 1,
	selfDestructAs = [[ATOMIC_BLAST]],
	side = [[TLL]],
	sightDistance = 200,
	unitname = [[tllwmmohoconv]],
	unitnumber = 870,
	waterline = 0,
	yardMap = [[wwwww wwwww wwwww wwwww wwwww]],
	featureDefs = nil,
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

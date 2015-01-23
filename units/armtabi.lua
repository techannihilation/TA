-- UNITDEF -- ARMTABI --
--------------------------------------------------------------------------------

local unitName = "armtabi"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 4096,
	buildCostEnergy = 5000000,
	buildCostMetal = 600000,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 13,
	buildingGroundDecalSizeY = 13,
	buildingGroundDecalType = [[armtabi_aoplane.dds]],
	buildTime = 10000000,
	canAttack = true,
	canGuard = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionSphereScale = 0.7,
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Total Annihilation TSAR bomber (ARMS)]],
	designation = [[ARM-LRNC]],
	energyMake = 0,
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[ATOMIC_NUKE1]],
	firestandorders = 1,
	firestate = 0,
	flankingBonusDir = [[0 1 0 ]],
	flankingBonusMax = 1.1,
	flankingBonusMin = 0.8,
	flankingBonusMode = 3,
	footprintX = 10,
	footprintZ = 10,
	iconType = [[bigstar]],
	idleAutoHeal = 2,
	idleTime = 2200,
	maxDamage = 16500,
	maxSlope = 16,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Tabitha]],
	noChaseCategory = [[ALL]],
	objectName = [[ARMTABI]],
	radarDistance = 0,
	selfDestructAs = [[ATOMIC_NUKE2]],
	selfDestructCountdown = 10,
	shootme = 1,
	side = [[ARM]],
	sightDistance = 275,
	standingfireorder = 2,
	unitname = [[armtabi]],
	unitnumber = 16,
	useBuildingGroundDecal = true,
	workerTime = 0,
	yardMap = [[oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo]],
	sounds = {
		canceldestruct = [[cancel2]],
		underattack = [[warning1]],
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
			[1] = [[servlrg3]],
		},
		select = {
			[1] = [[servlrg3]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ARM_TABITHACANNON]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARM_TABITHACANNON = {
		accuracy = 120,
		aimrate = 2500,
		areaOfEffect = 4360,
		avoidFriendly = false,
		ballistic = true,
		cegTag = [[Trail_cannon]],
		collideFriendly = false,
		comandfire = 1,
		energypershot = 19720000,
		explosionGenerator = [[custom:ARGHNUKE_FX1]],
		fireStarter = 75,
		gravityaffected = [[TRUE]],
		holdtime = 10,
		id = 125,
		metalpershot = 160000,
		model = [[obusnuke]],
		name = [[Tabitha Cannon]],
		nogap = 1,
		range = 8550,
		reloadtime = 2,
		renderType = 4,
		separation = 0.45,
		sizedecay = -0.15,
		soundHitDry = [[bignuke]],
		soundStart = [[xplomas2]],
		stages = 20,
		startsmoke = 1,
		stockpile = true,
		stockpiletime = 280,
		tolerance = 300,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 1380,
		damage = {
			default = 700200,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

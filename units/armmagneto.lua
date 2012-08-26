-- UNITDEF -- ARMMAGNETO --
--------------------------------------------------------------------------------

local unitName = "armmagneto"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildCostEnergy = 40236,
	buildCostMetal = 1980,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 5,
	buildingGroundDecalSizeY = 5,
	buildingGroundDecalType = [[armmagneto_aoplane.dds]],
	buildTime = 34000,
	canAttack = true,
	canGuard = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionVolumeScales = [[58.6 109.6 64.6]],
	collisionVolumeOffsets = [[0 0 1]],
	collisionVolumeTest = 1,
	collisionVolumeType = [[CylY]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[FerroMagnet Paralyzer]],
	designation = [[Ferro-Magnetic Polarizor]],
	energyMake = 8,
	energyStorage = 500,
	energyUse = 30,
	explodeAs = [[CRAWL_BLAST]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Paralyseur ferro-magnetique]],
	frenchname = [[Magnetosphere]],
	germandescription = [[Magnetischer Paralysierer]],
	germanname = [[Magnetosphere]],
	maxDamage = 3600,
	maxSlope = 50,
	maxWaterDepth = 255,
	metalStorage = 500,
	name = [[Magnetosphere]],
	noAutoFire = true,
	noChaseCategory = [[ALL]],
	objectName = [[ARMMAGNETO]],
	onoffable = true,
	radarDistance = 600,
	selfDestructAs = [[CRAWL_BLAST]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 1000,
	sonarDistance = 500,
	standingfireorder = 2,
	threed = 1,
	unitname = [[armmagneto]],
	unitnumber = 1.6346387854368e+017,
	useBuildingGroundDecal = true,
	version = 1,
	workerTime = 0,
	yardMap = [[ooo ooo ooo]],
	zbuffer = 1,
	sounds = {
		canceldestruct = [[cancel2]],
		cloak = [[kloak1]],
		uncloak = [[kloak1un]],
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
			[1] = [[twrturn3]],
		},
		select = {
			[1] = [[twrturn3]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[TINY]],
			def = [[SPHERE]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	SPHERE = {
		areaOfEffect = 200,
		beamWeapon = true,
		color = 96,
		color2 = 98,
		craterBoost = 0,
		craterMult = 0,
		duration = 1,
		energypershot = 900,
		fireStarter = 100,
		id = 221,
		impulseBoost = 0,
		impulseFactor = 0,
		lineOfSight = true,
		name = [[Ferro-Magnet]],
		noExplode = true,
		noSelfDamage = true,
		paralyzer = true,
		paralyzertime = 35,
		range = 1600,
		reloadtime = 10,
		renderType = 7,
		soundHitDry = [[xplomed4]],
		soundStart = [[charge]],
		turret = true,
		weaponType = [[LightningCannon]],
		weaponVelocity = 850,
		damage = {
			commanders = 200,
			default = 15999,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

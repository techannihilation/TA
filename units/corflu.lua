-- UNITDEF -- CORFLU --
--------------------------------------------------------------------------------

local unitName = "corflu"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 4096,
	buildCostEnergy = 1624286,
	buildCostMetal = 387428,
	builder = false,
	buildTime = 968022,
	canAttack = true,
	canGuard = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionSphereScale = 0.7,
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Total Annihilation TSAR Bomber (CORE)]],
	designation = [[COR-LRNC]],
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
	frenchdescription = [[Canon à nuclear de longue portée]],
	frenchname = [[Influence]],
	germandescription = [[Langstrecken-Nuclear-Plasmakanone]],
	germanname = [[Influence]],
	iconType = [[bigstar]],
	idleAutoHeal = 2,
	idleTime = 2200,
	maxDamage = 16500,
	maxSlope = 26,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Influence]],
	noChaseCategory = [[ALL]],
	objectName = [[CORFLU]],
	radarDistance = 0,
	selfDestructAs = [[ATOMIC_NUKE2]],
	selfDestructCountdown = 10,
	shootme = 1,
	side = [[CORE]],
	sightDistance = 175,
	standingfireorder = 2,
	threed = 1,
	unitname = [[corflu]],
	unitnumber = 16,
	version = 1,
	workerTime = 0,
	yardMap = [[oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo]],
	zbuffer = 1,
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
			[1] = [[servlrg4]],
		},
		select = {
			[1] = [[servlrg4]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[COR_FLUCANNON]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	COR_FLUCANNON = {
		accuracy = 150,
		aimrate = 2500,
		areaOfEffect = 4630,
		avoidFriendly = false,
		ballistic = true,
		collideFriendly = false,
		comandfire = 1,
		cruise = 1,
		energypershot = 19720000,
		explosionGenerator = [[custom:ARGHNUKE_FX1]],
		fireStarter = 0,
		gravityaffected = [[true]],
		holdtime = 1,
		id = 140,
		metalpershot = 160000,
		model = [[obusnuke]],
		name = [[Influence Cannon]],
		range = 9000,
		reloadtime = 2,
		renderType = 4,
		soundHit = [[bignuke]],
		soundStart = [[xplomas2]],
		startsmoke = 1,
		stockpile = true,
		stockpiletime = 400,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 1340,
		damage = {
			default = 820800,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

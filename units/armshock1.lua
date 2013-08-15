-- UNITDEF -- ARMSHOCK1 --
--------------------------------------------------------------------------------

local unitName = "armshock1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.023,
	bmcode = 1,
	brakeRate = 0.1,
	buildCostEnergy = 44739,
	buildCostMetal = 1620,
	builder = false,
	buildPic = [[ARMSHOCK.png]],
	buildTime = 38218,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	defaultmissiontype = [[Standby]],
	description = [[Heavy Plasma Cannon]],
	explodeAs = [[SHOCKER]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	highTrajectory = 2,
	idleAutoHeal = 5,
	idleTime = 1800,
	immunetoparalyzer = 1,
	maneuverleashlength = 640,
	mass = 200000,
	maxDamage = 3900,
	maxHeightDif = 17,
	maxVelocity = 0.7,
	maxWaterDepth = 0,
	mobilestandorders = 1,
	movementClass = [[KBOT3]],
	name = [[Medium Vanguard]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[ARMSHOCK1]],
	script = [[armshock.cob]],
	seismicSignature = 0,
	selfDestructAs = [[SHOCKER]],
	side = [[ARM]],
	sightDistance = 625,
	standingfireorder = 2,
	standingmoveorder = 0,
	steeringmode = 1,
	turnRate = 231,
	unitname = [[armshock1]],
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
			[1] = [[kbarmmov]],
		},
		select = {
			[1] = [[kbarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[SHOCKER1]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	SHOCKER1 = {
		areaOfEffect = 140,
		avoidFeature = false,
		avoidFriendly = false,
		ballistic = true,
		cegTag = [[Trail_cannon]],
		collideFriendly = false,
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.5,
		explosionGenerator = [[custom:flash128_fakelight]],
		gravityaffected = [[TRUE]],
		heightBoostFactor = 1.15,
		impulseBoost = 0.5,
		impulseFactor = 0.123,
		minbarrelangle = -35,
		name = [[ShockerHeavyCannon]],
		nogap = 1,
		noSelfDamage = true,
		predictBoost = 1,
		range = 820,
		reloadtime = 5.4,
		renderType = 4,
		rgbColor = [[0.73 0.42 0]],
		separation = 0.45,
		size = 2.46,
		sizedecay = -0.15,
		soundHitDry = [[xplomed2]],
		soundStart = [[cannhvy5]],
		stages = 20,
		targetBorder = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 410,
		damage = {
			default = 500,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = true,
		category = [[corpses]],
		collisionvolumeoffsets = [[-3.37104034424 -1.05229058838 1.8899307251]],
		collisionvolumescales = [[64.0154266357 41.4324188232 55.433883667]],
		collisionvolumetype = [[Box]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ARMSHOCK1_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[4X4D]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

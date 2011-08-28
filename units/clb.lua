-- UNITDEF -- CLB --
--------------------------------------------------------------------------------

local unitName = "clb"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.036,
	bmcode = 1,
	brakeRate = 0.05,
	buildCostEnergy = 92460,
	buildCostMetal = 5060,
	builder = false,
	buildPic = [[clb.png]],
	buildTime = 75049,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL HUGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Mobile LRPC]],
	energyMake = 1,
	energyStorage = 0,
	energyUse = 2,
	explodeAs = [[ATOMIC_BLAST]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	leaveTracks = true,
	maneuverleashlength = 640,
	maxDamage = 6600,
	maxSlope = 10,
	maxVelocity = 1.3,
	maxWaterDepth = 0,
	metalStorage = 0,
	mobilestandorders = 1,
	movementClass = [[tank3]],
	name = [[Mauler]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[clb]],
	radarDistance = 0,
	selfDestructAs = [[ATOMIC_BLAST]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 312,
	smoothAnim = true,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	trackOffset = -10,
	trackStrength = 10,
	trackStretch = 1,
	trackType = [[StdTank]],
	trackWidth = 60,
	turnRate = 132,
	unitname = [[clb]],
	unitnumber = 995,
	upright = true,
	workerTime = 0,
	featureDefs = nil,
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
			[1] = [[tcormove]],
		},
		select = {
			[1] = [[tcorsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[SMALL TINY]],
			def = [[CORE_INTIMIDATOR2]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORE_INTIMIDATOR2 = {
		accuracy = 535,
		aimrate = 2200,
		areaOfEffect = 224,
		ballistic = true,
		collideFriendly = false,
		craterBoost = 0.15,
		craterMult = 0.15,
		energypershot = 5000,
		explosionGenerator = [[custom:FLASHBIGBUILDING]],
		gravityaffected = [[true]],
		holdtime = 1,
		impulseBoost = 0.5,
		impulseFactor = 0.5,
		metalpershot = 10,
		name = [[IntimidatorCannon]],
		noSelfDamage = true,
		range = 6800,
		reloadtime = 7.5,
		renderType = 4,
		soundHit = [[xplonuk1]],
		soundStart = [[xplonuk3]],
		startsmoke = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 958.12316894531,
		damage = {
			default = 1200,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[core_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 30,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[clb_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 5,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[4x4c]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

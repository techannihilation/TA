-- UNITDEF -- CORPCAN --
--------------------------------------------------------------------------------

local unitName = "corpcan"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	antiweapons = 1,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 32700,
	buildCostEnergy = 7500,
	buildCostMetal = 900,
	builder = false,
	buildTime = 85185,
	buildPic = [[armpcan.png]],
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[DEAD]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[A.K. Cannon]],
	energyMake = 0,
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[ATOMIC_BLAST]],
	firestandorders = 0,
	footprintX = 4,
	footprintZ = 4,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 4200,
	maxSlope = 12,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[A.K. Cannon]],
	noChaseCategory = [[ALL]],
	objectName = [[ARMPCAN]],
	script = [[ARMPCAN.COB]],
	seismicSignature = 0,
	selfDestructAs = [[ATOMIC_BLAST]],
	side = [[ARM]],
	sightDistance = 273,
	standingfireorder = 0,
	turnRate = 0,
	unitname = [[corpcan]],
	workerTime = 0,
	yardMap = [[oooooooooooooooo]],
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:berthaflare]],
		},
        },
	customparams = {
		canareaattack = 1,
	},
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:berthaflare]],
		},
	},
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
			def = [[PEEWEE_CANNON]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	PEEWEE_CANNON = {
		accuracy = 500,
		aimrate = 2200,
		areaOfEffect = 20,
		avoidFriendly = false,
		ballistic = true,
		collideFriendly = false,
		craterBoost = 0.15,
		craterMult = 0.15,
		energypershot = 826,
		explosionGenerator = [[custom:DIRT3]],
		gravityaffected = [[false]],
		holdtime = 1,
		impulseBoost = 0.1,
		impulseFactor = 0.1,
		metalpershot = 34,
		model = [[corak_bomb]],
		name = [[A.K. Cannon]],
		noSelfDamage = true,
		range = 3000,
		reloadtime = 7,
		renderType = 4,
		soundHitDry = [[xplonuk1]],
		soundStart = [[xplonuk4]],
		sprayAngle = 1200,
		startsmoke = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 800,
		wobble = 1800,
		damage = {
			default = 0,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = true,
		category = [[corpses]],
		collisionvolumeoffsets = [[3.15924835205 -0.787798413086 6.6563873291]],
		collisionvolumescales = [[81.6838531494 113.772003174 72.5632324219]],
		collisionvolumetype = [[Box]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 3,
		footprintZ = 3,
		height = 40,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CORPCAN_DEAD]],
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
		object = [[3X3E]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

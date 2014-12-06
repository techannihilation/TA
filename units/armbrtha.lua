-- UNITDEF -- ARMBRTHA --
--------------------------------------------------------------------------------

local unitName = "armbrtha"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	antiweapons = 1,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 32700,
	buildCostEnergy = 60680,
	buildCostMetal = 4184,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 6,
	buildingGroundDecalSizeY = 6,
	buildingGroundDecalType = [[armbrtha_aoplane.dds]],
	buildPic = [[ARMBRTHA.png]],
	buildTime = 85185,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[DEAD]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Long Range Plasma Cannon]],
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
	name = [[Big Bertha]],
	noChaseCategory = [[ALL]],
	objectName = [[ARMBRTHA]],
	seismicSignature = 0,
	selfDestructAs = [[ATOMIC_BLAST]],
	side = [[ARM]],
	sightDistance = 273,
	standingfireorder = 0,
	turnRate = 0,
	unitname = [[armbrtha]],
	useBuildingGroundDecal = true,
	--usePieceCollisionVolumes = 1,
	workerTime = 0,
	yardMap = [[oooooooooooooooo]],
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
			def = [[ARM_BERTHACANNON2]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARM_BERTHACANNON2 = {
		accuracy = 500,
		aimrate = 2200,
		areaOfEffect = 192,
		ballistic = true,
		cegTag = [[Trail_cannon_med]],
		collideFriendly = false,
		craterBoost = 0.0,
		craterMult = 0.0,
		energypershot = 5000,
		explosionGenerator = [[custom:flash192_fakelight]],
		gravityaffected = [[TRUE]],
		holdtime = 1,
		impulseBoost = 0.5,
		impulseFactor = 0.5,
		metalpershot = 10,
		name = [[BerthaCannon]],
		nogap = 1,
		noSelfDamage = true,
		range = 5100,
		reloadtime = 7,
		renderType = 4,
		rgbColor = [[0.93 0.74 0]],
		separation = 0.45,
		size = 2.44,
		sizedecay = -0.15,
		soundHitDry = [[xplonuk1]],
		soundStart = [[xplonuk4]],
		stages = 20,
		startsmoke = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 1000,
		damage = {
			commanders = 612.5,
			default = 1225,
			experimental_ships = 2450,
			ships = 1837.5,
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
		object = [[ARMBRTHA_DEAD]],
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

-- UNITDEF -- ARM_IMMOLATOR --
--------------------------------------------------------------------------------

local unitName = "arm_immolator"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 115165,
	buildCostMetal = 2152,
	builder = false,
	buildPic = [[core_immolator.png]],
	buildTime = 43900,
	canAttack = true,
	canGuard = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[core_immolator_dead]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[- Plasma Tower]],
	designation = [[COR-PLAS]],
	downloadable = 1,
	energyStorage = 1200,
	energyUse = 0,
	explodeAs = [[ATOMIC_BLAST]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	healtime = 11,
	iconType = [[building]],
	maxDamage = 2800,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Immolator]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[core_immolator]],
	radarDistance = 0,
	selfDestructAs = [[ATOMIC_BLAST]],
	shootme = 1,
	side = [[Arm]],
	sightDistance = 665,
	standingfireorder = 2,
	threed = 1,
	unitname = [[arm_immolator]],
	unitnumber = 124,
	version = 3,
	workerTime = 0,
	yardMap = [[oooo oooo oooo oooo]],
	zbuffer = 1,
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
			[1] = [[kbcormov]],
		},
		select = {
			[1] = [[kbcorsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[CORE_INTIMIDATOR3]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORE_INTIMIDATOR3 = {
		accuracy = 535,
		aimrate = 2200,
		areaOfEffect = 250,
		ballistic = true,
		craterBoost = 0.15,
		craterMult = 0.15,
		energypershot = 4000,
		explosionGenerator = [[custom:FLASHBIGBUILDING]],
		gravityaffected = [[true]],
		holdtime = 1,
		impulseBoost = 0,
		impulseFactor = 0,
		metalpershot = 1,
		name = [[IntimidatorCannon]],
		noSelfDamage = true,
		range = 5100,
		reloadtime = 9,
		renderType = 4,
		soundHit = [[xplonuk1]],
		soundStart = [[xplonuk3]],
		startsmoke = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 850,
		damage = {
			commanders = 325,
			default = 650,
			experimental_ships = 1300,
			ships = 975,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	core_immolator_dead = {
		blocking = true,
		category = [[core_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[core_immolator_heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[core_immolator_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	core_immolator_heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3x3d]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

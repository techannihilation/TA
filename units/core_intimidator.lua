-- UNITDEF -- CORE_INTIMIDATOR --
--------------------------------------------------------------------------------

local unitName = "core_intimidator"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildCostEnergy = 40670,
	buildCostMetal = 4732,
	builder = false,
	buildPic = [[core_intimidator.png]],
	buildTime = 73020,
	canAttack = true,
	canGuard = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[CORINT_DEAD]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[- Long Range EMP Paralizer]],
	designation = [[F-PS2]],
	downloadable = 1,
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[ATOMIC_BLAST]],
	firestandorders = 1,
	footprintX = 5,
	footprintZ = 5,
	healtime = 11,
	iconType = [[building]],
	immunetoparalyzer = 1,
	maxDamage = 5225,
	maxSlope = 10,
	maxWaterDepth = 33,
	metalStorage = 0,
	name = [[Intimidator Paralizer]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[core_intimidator]],
	radarDistance = 0,
	selfDestructAs = [[ATOMIC_BLAST]],
	shootme = 1,
	side = [[Core]],
	sightDistance = 367.5,
	standingfireorder = 2,
	threed = 1,
	unitname = [[core_intimidator]],
	unitnumber = 113,
	version = 1.2,
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
			[1] = [[servlrg4]],
		},
		select = {
			[1] = [[servlrg4]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[CORE_INTIMIDATOREMP]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORE_INTIMIDATOREMP = {
		accuracy = 300,
		aimrate = 500,
		alphaDecay = 0.01,
		areaOfEffect = 850,
		ballistic = true,
		cegTag = [[vulcanfx1]],
		color = 3,
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 50,
		energypershot = 16300,
		explosionGenerator = [[custom:EMPFLASH240]],
		fireStarter = 50,
		gravityaffected = [[true]],
		groundbounce = false,
		holdtime = 1,
		id = 72,
		impulseBoost = 0,
		impulseFactor = 0,
		name = [[Bertha Cannon]],
		noGap = true,
		paralyzer = true,
		paralyzeTime = 16,
		range = 6750,
		reloadtime = 15.67,
		renderType = 4,
		rgbColor = [[1 0.8 0.5]],
		separation = 0.01,
		size = 4,
		sizeDecay = -0.01,
		soundHit = [[EMGPULS1]],
		soundStart = [[xplonuk4]],
		stages = 20,
		startsmoke = 1,
		tolerance = 7000,
		turret = true,
		waterbounce = false,
		weaponType = [[Cannon]],
		weaponVelocity = 1100,
		damage = {
			default = 1600,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	CORINT_DEAD = {
		blocking = true,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Intimidator Wreckage]],
		energy = 0,
		featureDead = [[CORINT_HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CORINT_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	CORINT_HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Intimidator Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3X3C]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

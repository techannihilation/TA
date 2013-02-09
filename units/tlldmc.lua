-- UNITDEF -- TLLDMC --
--------------------------------------------------------------------------------

local unitName = "tlldmc"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 150000,
	buildCostMetal = 55000,
	builder = false,
	buildPic = [[tlldmc.png]],
	buildTime = 150000,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Dark Matter Cannon]],
	designation = [[ARM-ERC]],
	energyMake = 0,
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[MEDIUM_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 5,
	footprintZ = 5,
	maxDamage = 65000,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[DMC]],
	noAutoFire = true,
	objectName = [[tlldmc]],
	radarDistance = 0,
	selfDestructAs = [[MEDIUM_BUILDING]],
	shootme = 1,
	sightDistance = 1500,
	standingfireorder = 0,
	threed = 1,
	unitname = [[tlldmc]],
	unitnumber = 200000,
	version = 1,
	workerTime = 0,
	yardMap = [[ooooo ooooo ooooo ooooo ooooo]],
	customparams = {
		canareaattack = 1,
	},
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:tlldmc_flare]],
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
			badTargetCategory = [[MEDIUM SMALL TINY]],
			def = [[tlldmc]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	tlldmc = {
		areaOfEffect = 390,
		cegTag = [[Trail_dmc_cannon]],
		collideFriendly = false,
		craterBoost = 0,
		craterMult = 0,
		duration = 0.025,
		energypershot = 390000,
		explosionGenerator = [[custom:Tlldmc_Explosion]],
		fireStarter = 90,
		id = 254,		
		impactonly = 1,
		impulseBoost = 0,
		impulseFactor = 0,
		intensity = 0.75,
		lineOfSight = true,
		name = [[Dark Matter Cannon]],
		nogap = 1,
		noSelfDamage = true,
		range = 1620,
		reloadtime = 16,
		renderType = 0,
		rgbColor = [[1 0.15 0.15]],
		size = 4.5,
		sizedecay = -0.25,
		soundHitDry = [[xplolrg1]],
		soundStart = [[Energy]],
		stages = 20,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 630,
		damage = {
			commanders = 3500,
			default = 12500,
			experimental_land = 65000,
			experimental_ships = 65000,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = false,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[heap]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 3,
		footprintZ = 3,
		height = 40,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[TLLDMC_DEAD]],
		reclaimable = false,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	heap = {
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
		reclaimable = false,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

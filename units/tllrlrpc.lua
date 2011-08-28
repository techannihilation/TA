-- UNITDEF -- TLLRLRPC --
--------------------------------------------------------------------------------

local unitName = "tllrlrpc"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 2760,
	buildCostEnergy = 233949,
	buildCostMetal = 43584,
	builder = false,
	buildTime = 615189,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Rapid-Fire Long Range Laser Cannon]],
	designation = [[TL-RLRC]],
	downloadable = 1,
	energyMake = 200,
	energyUse = 0,
	explodeAs = [[ATOMIC_BLAST]],
	firestandorders = 0,
	firestate = 2,
	footprintX = 5,
	footprintZ = 5,
	iconType = [[building]],
	maxDamage = 41980,
	maxSlope = 10,
	maxWaterDepth = 0,
	name = [[Barret]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[tllrlrpc]],
	onoffable = true,
	selfDestructAs = [[ATOMIC_BLAST]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 210,
	standingfireorder = 0,
	threed = 1,
	unitname = [[tllrlrpc]],
	unitnumber = 900,
	version = 3.1,
	workerTime = 0,
	yardMap = [[ooooo ooooo ooooo ooooo ooooo]],
	zbuffer = 1,
	customparams = {
		canareaattack = 1,
	},
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:tllbarret_effect]],
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
			badTargetCategory = [[TINY]],
			def = [[TLL_Barret]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	TLL_Barret = {
		accuracy = 100,
		areaOfEffect = 180,
		beamWeapon = true,
		color = 128,
		color2 = 130,
		craterBoost = 0,
		craterMult = 0,
		duration = 0.6,
		energypershot = 12000,
		explosionart = [[bio1]],
		explosiongaf = [[CAexp2]],
		explosionGenerator = [[custom:LIGHTNING_FLASH]],
		fireStarter = 90,
		id = 119,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lavaexplosionart = [[lavasplashsm]],
		lavaexplosiongaf = [[fx]],
		lineOfSight = true,
		name = [[Ultra lightning Weapon2]],
		noSelfDamage = true,
		range = 4400,
		reloadtime = 0.6,
		renderType = 7,
		soundHit = [[xplolrg1]],
		soundStart = [[annigun1]],
		tolerance = 500,
		turret = true,
		waterexplosionart = [[H2oboom3]],
		waterexplosiongaf = [[CAexp3]],
		weaponType = [[LightningCannon]],
		weaponVelocity = 560,
		damage = {
			commanders = 600,
			default = 1600,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[tll_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 5,
		footprintZ = 5,
		height = 12,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllrlrpc_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Metal Shards]],
		featureDead = [[heap2]],
		featurereclamate = [[smudge01]],
		footprintX = 5,
		footprintZ = 5,
		hitdensity = 45,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[5x5b]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
	heap2 = {
		blocking = false,
		category = [[heaps]],
		damage = 0.2160 * unitDef.maxDamage,
		description = [[Metal Shards]],
		featurereclamate = [[smudge01]],
		footprintX = 5,
		footprintZ = 5,
		hitdensity = 5,
		metal = 0.5120 * unitDef.buildCostMetal,
		object = [[4x4b]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

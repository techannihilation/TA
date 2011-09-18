-- UNITDEF -- TLLOBLITERATOR --
--------------------------------------------------------------------------------

local unitName = "tllobliterator"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 4096,
	buildCostEnergy = 18025,
	buildCostMetal = 3456,
	builder = false,
	buildTime = 52513,
	canAttack = true,
	canGuard = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	damageModifier = 0.2,
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Energy weapon]],
	designation = [[]],
	energyStorage = 120,
	energyUse = 150,
	explodeAs = [[ATOMIC_BLAST]],
	firestandorders = 1,
	footprintX = 5,
	footprintZ = 4,
	frenchdescription = [[Canon à énergie]],
	germandescription = [[Feuert Energiegeschosse]],
	italiandescription = [[Arma energetica]],
	maxDamage = 16685,
	maxSlope = 10,
	maxWaterDepth = 0,
	name = [[Obliterator]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLOBLITERATOR]],
	onoffable = true,
	radarDistance = 650,
	selfDestructAs = [[CRAWL_BLASTSML]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 680,
	spanishdescription = [[Arma de Energía]],
	standingfireorder = 2,
	threed = 1,
	unitname = [[tllobliterator]],
	unitnumber = 813,
	version = 1,
	yardMap = [[ooooo ooooo ooooo ooooo]],
	zbuffer = 1,
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
			[1] = [[anni]],
		},
		select = {
			[1] = [[anni]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[SMALL TINY]],
			def = [[ATADR]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ATADR = {
		areaOfEffect = 12,
		beamlaser = 1,
		beamTime = 0.9,
		coreThickness = 0.3,
		craterBoost = 0,
		craterMult = 0,
		energypershot = 1000,
		explosionGenerator = [[custom:FLASH3blue]],
		impactonly = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		laserFlareSize = 22,
		lineOfSight = true,
		name = [[ATAD]],
		noSelfDamage = true,
		range = 1200,
		reloadtime = 8.5,
		renderType = 0,
		rgbColor = [[0 0 1]],
		soundHit = [[xplosml3]],
		soundStart = [[annigun1]],
		targetMoveError = 0.3,
		thickness = 5.5,
		tolerance = 10000,
		turret = true,
		weaponType = [[BeamLaser]],
		weaponVelocity = 1500,
		damage = {
			commanders = 999,
			default = 7600,
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
		description = [[wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 5,
		footprintZ = 4,
		height = 21,
		hitdensity = 105,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllobliterator_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[wreckage]],
		featureDead = [[heap2]],
		featurereclamate = [[smudge01]],
		footprintX = 5,
		footprintZ = 4,
		height = 2,
		hitdensity = 105,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[4x4C]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap2 = {
		blocking = false,
		category = [[heaps]],
		damage = 0.2160 * unitDef.maxDamage,
		description = [[wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 4,
		footprintZ = 4,
		height = 2,
		hitdensity = 105,
		metal = 0.5120 * unitDef.buildCostMetal,
		object = [[3x3C]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- TLLTRID --
--------------------------------------------------------------------------------

local unitName = "tlltrid"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 32768,
	buildCostEnergy = 2957,
	buildCostMetal = 741,
	builder = false,
	buildTime = 9705,
	canAttack = true,
	canGuard = true,
	canstop = 1,
	category = [[ALL MEDIUM NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	description = [[Floating Plasma Battery]],
	designation = [[]],
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[MEDIUM_BUILDINGEX]],
	firestandorders = 1,
	floater = true,
	footprintX = 4,
	footprintZ = 4,
	maxDamage = 5210,
	maxSlope = 14,
	minWaterDepth = 5,
	name = [[Trident]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	noshadow = 1,
	objectName = [[tlltrid]],
	onoffable = true,
	selfDestructAs = [[MEDIUM_BUILDING]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 380,
	standingfireorder = 2,
	unitname = [[tlltrid]],
	unitnumber = 882,
	yardMap = [[wwww wwww wwww wwww]],
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:watersplash_large]],
		},
        },
	sounds = {
		canceldestruct = [[cancel2]],
		cloak = [[kloak1]],
		uncloak = [[kloak1un]],
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
			[1] = [[twractv3]],
		},
		select = {
			[1] = [[twractv3]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[TINY]],
			def = [[MINI_ATADR]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	MINI_ATADR = {
		areaOfEffect = 12,
		beamlaser = 1,
		beamTime = 0.7,
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
		name = [[MINI ATAD]],
		noSelfDamage = true,
		range = 1200,
		reloadtime = 8.5,
		renderType = 0,
		rgbColor = [[0 0 1]],
		soundHitDry = [[xplosml3]],
		soundStart = [[annigun1]],
		targetMoveError = 0.3,
		thickness = 3.5,
		tolerance = 10000,
		turret = true,
		weaponType = [[BeamLaser]],
		weaponVelocity = 1500,
		damage = {
			commanders = 999,
			default = 3000,
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
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tlltrid_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[2x2b]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

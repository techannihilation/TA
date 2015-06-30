-- UNITDEF -- TLLPLASMA --
--------------------------------------------------------------------------------

local unitName = "tllplasma"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 14880,
	buildCostMetal = 2100,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 5,
	buildingGroundDecalSizeY = 5,
	buildingGroundDecalType = [[tllplasma_aoplane.dds]],
	buildTime = 18245,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	damageModifier = 0.125,
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Pop-Up Heavy Cannon]],
	designation = [[T-PC-L]],
	downloadable = 1,
	energyUse = 0,
	explodeAs = [[MEDIUM_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 2550,
	maxSlope = 10,
	maxWaterDepth = 0,
	name = [[Happlic]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[tllplasma]],
	selfDestructAs = [[MEDIUM_BUILDING]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 450,
	standingfireorder = 2,
	unitname = [[tllplasma]],
	unitnumber = 878,
	useBuildingGroundDecal = true,
	workerTime = 0,
	yardMap = [[ooo ooo ooo]],
	featureDefs = nil,
	sounds = {
		canceldestruct = [[cancel2]],
		cloak = [[kloak2]],
		uncloak = [[kloak2un]],
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
			[1] = [[servmed1]],
		},
		select = {
			[1] = [[servmed1]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[TINY]],
			def = [[ARMAMB_GUN]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMAMB_GUN = {
		accuracy = 400,
		areaOfEffect = 150,
		ballistic = true,
		cegTag = [[Trail_cannon]],
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.25,
		explosionGenerator = [[custom:FLASH96]],
		gravityaffected = [[TRUE]],
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		minbarrelangle = -35,
		name = [[PopupCannon]],
		nogap = 1,
		noSelfDamage = true,
		predictBoost = 0.2,
		range = 1520,
		reloadtime = 1.6,
		renderType = 4,
		rgbColor = [[0.73 0.42 0]],
		separation = 0.45,
		size = 2.21,
		sizedecay = -0.15,
		soundHitDry = [[xplomed2]],
		soundStart = [[cannhvy5]],
		stages = 20,
		startsmoke = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 450,
		damage = {
			default = 250,
			experimental_ships = 500,
			ships = 400,
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
		height = 12,
		hitdensity = 103,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllplasma_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Metal Shards]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		hitdensity = 8,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3x3a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

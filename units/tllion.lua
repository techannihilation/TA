-- UNITDEF -- TLLION --
--------------------------------------------------------------------------------

local unitName = "tllion"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 1700,
	buildCostEnergy = 1200000,
	buildCostMetal = 258000,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 10,
	buildingGroundDecalSizeY = 10,
	buildingGroundDecalType = [[tllion_aoplane.dds]],
	buildPic = [[tllion.png]],
	buildTime = 999999,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionvolumeoffsets = [[0 -89 0]],
	collisionvolumescales = [[105 182 105]],
	collisionvolumetest = 1,
	collisionvolumetype = [[Ell]],
	corpse = [[dead]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Control station for the orbital Ion Cannon - 40,000 E / Shot]],
	designation = [[TL-EXT]],
	energyMake = 0,
	energyStorage = 0,
	explodeAs = [[CRAWL_BLAST]],
	firestandorders = 1,
	firestate = 0,
	footprintX = 7,
	footprintZ = 7,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 3920,
	maxSlope = 12,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Command Center]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLION]],
	selfDestructAs = [[CRAWL_BLAST]],
	side = [[TLL]],
	sightDistance = 300,
	standingfireorder = 2,
	unitname = [[tllion]],
	useBuildingGroundDecal = true,
	workerTime = 0,
	yardMap = [[yoooyyy yoooooo ooooooo ooooooo yoooooo yoooooy yyooooy ]],
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:Trail_Large_Rocket]],
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
			[1] = [[servroc1]],
		},
		select = {
			[1] = [[servroc1]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[TLL_ION_CANNON]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	TLL_ION_CANNON = {
		alwaysVisible = true,
		paralyzer  = true,
		paralyzeTime = 2,
		areaOfEffect = 1200,
		avoidFeature = false,
		avoidFriendly = false,
		beamlaser = 1,
		beamWeapon = true,
		coreThickness = 0.47,

		duration = 2,
		edgeEffectiveness = 0,
		energypershot = 22000,
		explosionGenerator = [[custom:Explosion_Huge_Tesla]],
		fallOffRate = 0,
		fireStarter = 0,
		flightTime = 0,
		impulseBoost = 0.5,
		intensity = 1,
		interceptedByShieldType = 0,
		largeBeamLaser = true,
		lineOfSight = true,
		minIntensity = 1,
		name = [[Ion Cannon]],
		noautorange = 1,
		range = 32000,
		reloadtime = 1,
		renderType = 0,
		rgbColor = [[0.2 0.2 1]],
		rgbColor2 = [[0.07 1 1]],
		shakeduration = 1,
		shakemagnitude = 20,
		soundHitDry = [[xplolrg1]],
		soundHitVolume = 1,
		soundStart = [[build2]],
		texture1 = [[Type6Beam]],
		texture2 = [[NULL]],
		texture3 = [[NULL]],
		texture4 = [[EMG4]],
		thickness = 100,
		tolerance = 500,
		turret = true,
		weaponTimer = 0,
		weaponType = [[BeamLaser]],
		weaponVelocity = 2500,
		damage = {
			commanders = 1500,
			default = 500000,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 5,
		footprintZ = 5,
		height = 12,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllion_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 5,
		footprintZ = 5,
		hitdensity = 4,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[5x5d]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

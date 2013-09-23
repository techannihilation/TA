-- UNITDEF -- TLLANTINUKE1 --
--------------------------------------------------------------------------------

local unitName = "tllantinuke1"

--------------------------------------------------------------------------------

local unitDef = {
	antiweapons = 1,
	bmcode = 0,
	buildAngle = 4096,
	buildCostEnergy = 174500,
	buildCostMetal = 3285,
	builder = false,
	buildingGroundDecalDecaySpeed = 30,
	buildingGroundDecalSizeX = 6,
	buildingGroundDecalSizeY = 6,
	buildingGroundDecalType = [[tllantinuke_aoplane.dds]],
	buildPic = [[tllantinuke.png]],
	buildTime = 148025,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	damageModifier = 0.8,
	description = [[Fast Anti-Nuke System]],
	designation = [[TL-AMDS]],
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[ATOMIC_BLAST]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	maxDamage = 2795,
	maxSlope = 10,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Advanced Peacemaker]],
	noAutoFire = true,
	noChaseCategory = [[ALL]],
	objectName = [[TLLANTINUKE]],
	ovradjust = 1,
	radarDistance = 0,
	selfDestructAs = [[CRAWL_BLASTSML]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 155,
	standingfireorder = 2,
	unitname = [[tllantinuke1]],
	unitnumber = 860,
	useBuildingGroundDecal = true,
	workerTime = 0,
	yardMap = [[oooo oooo oooo oooo]],
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
			[1] = [[loadwtr2]],
		},
		select = {
			[1] = [[loadwtr2]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[AMD_ROCKET3]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	AMD_ROCKET3 = {
		areaOfEffect = 400,
		coverage = 3000,
		craterBoost = 0,
		craterMult = 0,
		energypershot = 14000,
		explosionGenerator = [[custom:FLASH4]],
		fireStarter = 100,
		flightTime = 120,
		guidance = true,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		interceptor = 3,
		lineOfSight = true,
		metalpershot = 1100,
		model = [[amdrocket]],
		name = [[Rocket]],
		noautorange = 1,
		noSelfDamage = true,
		range = 72000,
		reloadtime = 2,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHitDry = [[xplomed4]],
		soundStart = [[Rockhvy1]],
		startsmoke = 1,
		stockpile = true,
		stockpiletime = 60,
		tolerance = 4000,
		tracks = true,
		turnRate = 99000,
		twoPhase = true,
		vlaunch = true,
		weaponAcceleration = 164,
		weaponTimer = 3,
		weaponType = [[StarburstLauncher]],
		weaponVelocity = 3600,
		damage = {
			default = 15000,
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
		footprintX = 4,
		footprintZ = 4,
		height = 12,
		hitdensity = 123,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllantinuke_dead]],
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
		footprintX = 4,
		footprintZ = 4,
		hitdensity = 4,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[4x4a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

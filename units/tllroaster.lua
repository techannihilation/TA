-- UNITDEF -- TLLROASTER --
--------------------------------------------------------------------------------

local unitName = "tllroaster"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.03,
	bmcode = 1,
	brakeRate = 0.09,
	buildCostEnergy = 8797,
	buildCostMetal = 1155,
	builder = false,
	buildTime = 31208,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Mobile Energy Weapon]],
	designation = [[]],
	energyUse = 7,
	explodeAs = [[CRAWL_BLASTSML]],
	firestandorders = 1,
	footprintX = 4,
	footprintZ = 4,
	maneuverleashlength = 320,
	maxDamage = 2685,
	maxSlope = 12,
	maxVelocity = 1.6,
	maxWaterDepth = 0,
	mobilestandorders = 1,
	movementClass = [[HTANK4]],
	name = [[Roaster]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[TLLROASTER]],
	selfDestructAs = [[ATOMIC_BLAST]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 700,
	standingfireorder = 2,
	standingmoveorder = 0,
	steeringmode = 1,
	turnRate = 200,
	unitname = [[tllroaster]],
	unitnumber = 871,
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
			[1] = [[tarmmove]],
		},
		select = {
			[1] = [[tarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[TLL_OBLITERATOR]],
			onlyTargetCategory = [[NOTVTOL]],
		},
		[2] = {
			def = [[LIGHTNING]],
			mainDir = [[1 0 0]],
			maxAngleDif = 220,
			onlyTargetCategory = [[NOTVTOL]],
		},
		[3] = {
			def = [[LIGHTNING]],
			mainDir = [[-1 0 4]],
			maxAngleDif = 220,
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	LIGHTNING = {
		areaOfEffect = 8,
		beamWeapon = true,
		craterBoost = 0,
		craterMult = 0,
		duration = 10,
		energypershot = 35,
		explosionGenerator = [[custom:ZEUS_FLASH]],
		fireStarter = 50,
		impactonly = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		intensity = 12,
		lineOfSight = true,
		name = [[LightningGun]],
		noSelfDamage = true,
		range = 280,
		reloadtime = 2.0,
		renderType = 7,
		rgbColor = [[0.5 0.5 1]],
		soundHitDry = [[xplomed3]],
		soundStart = [[lghthvy1]],
		soundTrigger = true,
		startsmoke = 1,
		targetMoveError = 0.3,
		texture1 = [[lightning]],
		thickness = 10,
		turret = true,
		weaponType = [[LightningCannon]],
		weaponVelocity = 400,
		damage = {
			default = 200,
			subs = 5,
		},
	},
	TLL_OBLITERATOR = {
		accuracy = 100,
		areaOfEffect = 90,
		beamWeapon = true,
		craterBoost = 0,
		craterMult = 0,
		duration = 1.5,
		energypershot = 1600,
		fireStarter = 90,
		id = 119,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		name = [[Ultra lightning Weapon2]],
		noSelfDamage = true,
		range = 1100,
		reloadtime = 12,
		renderType = 7,
		rgbColor = [[0.000 1.000 0.259]],
		soundHitDry = [[xplolrg1]],
		soundStart = [[annigun1]],
		tolerance = 500,
		turret = true,
		weaponType = [[LightningCannon]],
		weaponVelocity = 560,
		damage = {
			commanders = 1200,
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
		footprintX = 4,
		footprintZ = 4,
		height = 20,
		hitdensity = 105,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[TLLROASTER_dead]],
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
		footprintX = 4,
		footprintZ = 4,
		height = 4,
		hitdensity = 80,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[4x4B]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

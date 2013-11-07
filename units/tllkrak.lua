-- UNITDEF -- TLLKRAK --
--------------------------------------------------------------------------------

local unitName = "tllkrak"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 32768,
	buildCostEnergy = 25000,
	buildCostMetal = 4800,
	builder = false,
	buildTime = 39000,
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
	maxDamage = 8200,
	maxSlope = 14,
	minWaterDepth = 5,
	name = [[KrakeN]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	noshadow = 1,
	objectName = [[tllkrak]],
	onoffable = true,
	selfDestructAs = [[MEDIUM_BUILDING]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 800,
	standingfireorder = 2,
	unitname = [[tllkrak]],
	unitnumber = 882,
	yardMap = [[wwww wwww wwww wwww]],
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:mediumflare]],
			[2] = [[custom:watersplash_large]],
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
			def = [[Floating_Plasma]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	Floating_Plasma = {
		areaOfEffect = 50,
		ballistic = true,
		cegTag = [[Trail_cannon]],
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:flash70_fakelight]],
		gravityaffected = [[TRUE]],
		id = 169,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		minbarrelangle = -35,
		name = [[Mortar Cannon]],
		nogap = 1,
		range = 1320,
		reloadtime = 1.9,
		renderType = 4,
		rgbColor = [[1 0.88 0.23]],
		separation = 0.45,
		size = 1.58,
		sizedecay = -0.15,
		soundHitDry = [[xplomed4]],
		soundStart = [[cannhvy2]],
		stages = 20,
		startsmoke = 1,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 550,
		damage = {
			default = 1000,
			experimental_ships = 2000,
			ships = 1500,
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
		object = [[tllkrak_dead]],
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

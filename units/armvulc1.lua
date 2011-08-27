-- UNITDEF -- ARMVULC1 --
--------------------------------------------------------------------------------

local unitName = "armvulc1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	antiweapons = 1,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 29096,
	buildCostEnergy = 1803644,
	buildCostMetal = 273094,
	builder = false,
	buildPic = [[ARMVULC.png]],
	buildTime = 2772961,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[DEAD]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[T3 Rapid-Fire Long-Range Plasma Cannon]],
	energyMake = 0,
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[ATOMIC_BLAST]],
	firestandorders = 1,
	footprintX = 16,
	footprintZ = 16,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 104440,
	maxSlope = 13,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Super Vulcan]],
	noChaseCategory = [[ALL]],
	objectName = [[ARMVULC1]],
	script = [[armvulc.cob]],
	seismicSignature = 0,
	selfDestructAs = [[ATOMIC_BLAST]],
	side = [[ARM]],
	sightDistance = 273,
	smoothAnim = true,
	standingfireorder = 1,
	turnRate = 0,
	unitname = [[armvulc1]],
	workerTime = 0,
	yardMap = [[oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo]],
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:vulcanflare]],
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
			def = [[ARMVULC_WEAPON1]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARMVULC_WEAPON1 = {
		accuracy = 400,
		areaOfEffect = 224,
		ballistic = true,
		collideFriendly = false,
		color = 2,
		craterBoost = 0.65,
		craterMult = 0.65,
		edgeEffectiveness = 0.75,
		energypershot = 61000,
		explosionGenerator = [[custom:FLASHBIGBUILDING]],
		gravityaffected = [[true]],
		impulseBoost = 0.5,
		impulseFactor = 0.5,
		name = [[RapidfireLRPC]],
		noSelfDamage = true,
		randomdecay = 11,
		range = 9800,
		reloadtime = 0.5,
		renderType = 4,
		soundHit = [[rflrpc3]],
		soundStart = [[XPLONUK4]],
		startsmoke = 1,
		turret = true,
		weaponTimer = 14,
		weaponType = [[Cannon]],
		weaponVelocity = 1350,
		damage = {
			commanders = 3050,
			default = 6100,
			experimental_ships = 12200,
			ships = 9150,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = true,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 14,
		footprintZ = 14,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ARMVULC1_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- CORBUZZ1 --
--------------------------------------------------------------------------------

local unitName = "corbuzz1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	antiweapons = 1,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 29096,
	buildCostEnergy = 1881404,
	buildCostMetal = 273412,
	builder = false,
	buildPic = [[CORBUZZ.png]],
	buildTime = 2780630,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionvolumeoffsets = [[0 -19 0]],
	collisionvolumescales = [[95 184 130]],
	collisionvolumetest = 0,
	collisionvolumetype = [[CylY]],
	corpse = [[DEAD]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[T3 Rapid-Fire Long-Range Plasma Cannon]],
	energyMake = 0,
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[ATOMIC_BLAST]],
	firestandorders = 3,
	footprintX = 16,
	footprintZ = 16,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 104960,
	maxSlope = 13,
	maxVelocity = 0,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Super Buzzsaw]],
	noChaseCategory = [[ALL]],
	objectName = [[CORBUZZ1]],
	script = [[corbuzz.cob]],
	seismicSignature = 0,
	selfDestructAs = [[ATOMIC_BLAST]],
	side = [[CORE]],
	sightDistance = 273,
	smoothAnim = true,
	standingfireorder = 3,
	turnRate = 0,
	unitname = [[corbuzz1]],
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
			[1] = [[servlrg4]],
		},
		select = {
			[1] = [[servlrg4]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[CORBUZZ_WEAPON1]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CORBUZZ_WEAPON1 = {
		accuracy = 450,
		areaOfEffect = 256,
		ballistic = true,
		collideFriendly = false,
		color = 2,
		craterBoost = 0.65,
		craterMult = 0.65,
		edgeEffectiveness = 0.8,
		energypershot = 60500,
		explosionGenerator = [[custom:FLASHBIGBUILDING]],
		gravityaffected = [[true]],
		impulseBoost = 0.5,
		impulseFactor = 0.5,
		name = [[RapidfireLRPC]],
		noSelfDamage = true,
		randomdecay = 11,
		range = 9900,
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
			commanders = 3100,
			default = 6200,
			experimental_ships = 12400,
			ships = 9300,
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
		object = [[CORBUZZ1_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

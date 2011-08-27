-- UNITDEF -- ARMTL --
--------------------------------------------------------------------------------

local unitName = "armtl"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = true,
	bmcode = 0,
	brakeRate = 0,
	buildAngle = 16384,
	buildCostEnergy = 2058,
	buildCostMetal = 302,
	builder = false,
	buildPic = [[ARMTL.png]],
	buildTime = 4120,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	corpse = [[DEAD]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Torpedo Launcher]],
	energyMake = 0.1,
	energyStorage = 0,
	energyUse = 0.1,
	explodeAs = [[MEDIUM_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	iconType = [[building]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maxDamage = 1890,
	maxVelocity = 0,
	metalStorage = 0,
	minWaterDepth = 1,
	name = [[Harpoon]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[ARMTL]],
	seismicSignature = 0,
	selfDestructAs = [[MEDIUM_BUILDING]],
	side = [[ARM]],
	sightDistance = 455,
	smoothAnim = true,
	standingfireorder = 2,
	turnRate = 0,
	unitname = [[armtl]],
	waterline = 12,
	workerTime = 0,
	yardMap = [[wwwwwwwww]],
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
			[1] = [[sharmmov]],
		},
		select = {
			[1] = [[sharmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[COAX_TORPEDO]],
			onlyTargetCategory = [[NOTHOVERNOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	COAX_TORPEDO = {
		areaOfEffect = 16,
		avoidFriendly = false,
		burnblow = true,
		collideFriendly = false,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH2]],
		guidance = true,
		impactonly = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		model = [[torpedo]],
		name = [[Level1TorpedoLauncher]],
		noSelfDamage = true,
		propeller = 1,
		range = 600,
		reloadtime = 1.9,
		renderType = 1,
		selfprop = true,
		soundHit = [[xplodep2]],
		soundStart = [[torpedo1]],
		startVelocity = 200,
		tracks = true,
		turnRate = 2500,
		turret = true,
		waterWeapon = true,
		weaponAcceleration = 40,
		weaponTimer = 3,
		weaponType = [[TorpedoLauncher]],
		weaponVelocity = 320,
		damage = {
			commanders = 260,
			default = 280,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = false,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[ARMTL_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

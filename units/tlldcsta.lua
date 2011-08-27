-- UNITDEF -- TLLDCSTA --
--------------------------------------------------------------------------------

local unitName = "tlldcsta"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 16384,
	buildCostEnergy = 558,
	buildCostMetal = 204,
	builder = false,
	buildTime = 4120,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Depth Charge Launcher]],
	designation = [[TLL-dcs]],
	energyMake = 0.1,
	energyUse = 0.1,
	explodeAs = [[SMALL_UNITEX]],
	firestandorders = 1,
	footprintX = 2,
	footprintZ = 2,
	maxDamage = 1200,
	minWaterDepth = 5,
	name = [[Depth Charge Station]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	noshadow = 1,
	objectName = [[TLLdcsta]],
	ovradjust = 1,
	selfDestructAs = [[SMALL_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 150,
	sonarDistance = 450,
	standingfireorder = 2,
	threed = 1,
	unitname = [[tlldcsta]],
	unitnumber = 879,
	version = 3.1,
	waterline = 11,
	workerTime = 0,
	yardMap = [[wwww]],
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
			[1] = [[sharmmov]],
		},
		select = {
			[1] = [[sharmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[COAX_DEPTHCHARGE]],
			onlyTargetCategory = [[NOTHOVERNOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	COAX_DEPTHCHARGE = {
		avoidFriendly = false,
		bouncerebound = 0.6,
		bounceslip = 0.6,
		burnblow = true,
		collideFriendly = false,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:FLASH2]],
		groundbounce = true,
		guidance = true,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		model = [[depthcharge]],
		name = [[DepthCharge]],
		noSelfDamage = true,
		numbounce = 1,
		propeller = 1,
		range = 580,
		reloadtime = 1.8,
		renderType = 1,
		selfprop = true,
		soundHit = [[xplodep2]],
		soundStart = [[torpedo1]],
		startVelocity = 250,
		tracks = true,
		turnRate = 18000,
		turret = true,
		waterWeapon = true,
		weaponAcceleration = 25,
		weaponTimer = 6,
		weaponType = [[TorpedoLauncher]],
		weaponVelocity = 350,
		damage = {
			commanders = 500,
			default = 200,
			subs = 400,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[tll_corpses]],
		damage = 0.8250 * unitDef.maxDamage,
		description = [[Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 2,
		footprintZ = 2,
		height = 12,
		hitdensity = 103,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tlldcsta_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.4950 * unitDef.maxDamage,
		description = [[Metal Shards]],
		featurereclamate = [[smudge01]],
		footprintX = 2,
		footprintZ = 2,
		hitdensity = 4,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[2x2a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

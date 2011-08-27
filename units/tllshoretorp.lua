-- UNITDEF -- TLLSHORETORP --
--------------------------------------------------------------------------------

local unitName = "tllshoretorp"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 32768,
	buildCostEnergy = 5724,
	buildCostMetal = 602,
	builder = false,
	buildTime = 9911,
	canAttack = true,
	canGuard = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Shore Torpedo Launcher]],
	designation = [[]],
	energyStorage = 200,
	energyUse = 0,
	explodeAs = [[MEDIUM_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 3,
	footprintZ = 3,
	maxDamage = 1380,
	maxSlope = 14,
	maxWaterDepth = 5,
	name = [[Fish Hook]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLshoretorp]],
	selfDestructAs = [[MEDIUM_BUILDING]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 380,
	standingfireorder = 2,
	threed = 1,
	unitname = [[tllshoretorp]],
	unitnumber = 946,
	version = 3.1,
	yardMap = [[ooo ooo ooo]],
	zbuffer = 1,
	featureDefs = nil,
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
			[1] = [[twrturn3]],
		},
		select = {
			[1] = [[twrturn3]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[TINY]],
			def = [[TLL_TORPEDO]],
			onlyTargetCategory = [[NOTHOVERNOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	TLL_TORPEDO = {
		areaOfEffect = 16,
		burnblow = true,
		explosionart = [[explode3]],
		explosiongaf = [[fx]],
		guidance = true,
		id = 182,
		lavaexplosionart = [[lavasplashsm]],
		lavaexplosiongaf = [[fx]],
		lineOfSight = true,
		model = [[tlltorpedo]],
		name = [[Shore Torpedo Launcher]],
		propeller = 1,
		range = 615,
		reloadtime = 3.5,
		renderType = 1,
		selfprop = true,
		soundHit = [[SPLSHBIG]],
		soundStart = [[canlite3]],
		startVelocity = 100,
		tolerance = 6000,
		tracks = true,
		turnRate = 15000,
		turret = true,
		waterexplosionart = [[h2oboom1]],
		waterexplosiongaf = [[CAexp3]],
		waterWeapon = true,
		weaponAcceleration = 15,
		weaponTimer = 8,
		weaponType = [[TorpedoLauncher]],
		weaponVelocity = 150,
		damage = {
			default = 475,
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
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllshoretorp_dead]],
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
		hitdensity = 5,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3x3d]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- TLLSQUID --
--------------------------------------------------------------------------------

local unitName = "tllsquid"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.18,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.33,
	buildCostEnergy = 3175,
	buildCostMetal = 323,
	builder = false,
	buildTime = 13408,
	canAttack = false,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTVTOL NOTWEAPON SUB]],
	collisionvolumeoffsets = [[0 -3 0]],
	collisionvolumescales = [[35 35 65]],
	collisionvolumetest = 0,
	collisionvolumetype = [[Ell]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Sonar Jamming Sub]],
	designation = [[]],
	energyUse = 100,
	explodeAs = [[SMALL_UNITEX]],
	footprintX = 3,
	footprintZ = 3,
	frenchdescription = [[Sous-Marin Brouilleur]],
	germandescription = [[Sonar-Stör-U-Boot]],
	italiandescription = [[Disturbo sonar subacqueo]],
	maneuverleashlength = 640,
	maxDamage = 480,
	maxVelocity = 2.45,
	minWaterDepth = 15,
	mobilestandorders = 1,
	movementClass = [[UBOAT3]],
	name = [[Squid]],
	noAutoFire = false,
	noChaseCategory = [[NOTSUBNOTSHIP]],
	objectName = [[TLLSQUID]],
	onoffable = true,
	radarDistance = 100,
	radarDistanceJam = 475,
	selfDestructAs = [[SMALL_UNIT]],
	shootme = 1,
	side = [[TLL]],
	sightDistance = 150,
	sonarDistance = 120,
	sonarDistanceJam = 475,
	standingmoveorder = 0,
	steeringmode = 1,
	threed = 1,
	turnRate = 580,
	unitname = [[tllsquid]],
	unitnumber = 912,
	upright = true,
	version = 3.1,
	waterline = 30,
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
			[1] = [[suarmmov]],
		},
		select = {
			[1] = [[radjam1]],
		},
	},
}

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
		object = [[tllsquid_dead]],
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
		footprintX = 3,
		footprintZ = 3,
		height = 4,
		hitdensity = 20,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3x3f]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

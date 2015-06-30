-- UNITDEF -- CORSJAM --
--------------------------------------------------------------------------------

local unitName = "corsjam"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.096,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.022,
	buildCostEnergy = 2254,
	buildCostMetal = 135,
	builder = false,
	buildPic = [[CORSJAM.png]],
	buildTime = 7025,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTVTOL SMALL WEAPON]],
	collisionVolumeScales = [[28 28 71]],
	collisionVolumeOffsets = [[0 -8 0]],
	collisionVolumeType = [[CylZ]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Radar Jammer Ship]],
	energyMake = 20,
	energyStorage = 0,
	energyUse = 20,
	explodeAs = [[SMALL_UNITEX]],
	floater = true,
	footprintX = 4,
	footprintZ = 4,
	iconType = [[sea]],
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 570,
	maxVelocity = 2.88,
	metalStorage = 0,
	minWaterDepth = 6,
	mobilestandorders = 1,
	movementClass = [[BOAT4]],
	name = [[Phantom]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[CORSJAM]],
	onoffable = true,
	radarDistanceJam = 900,
	seismicSignature = 0,
	selfDestructAs = [[SMALL_UNIT]],
	side = [[CORE]],
	sightDistance = 403,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 512,
	unitname = [[corsjam]],
	workerTime = 0,
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
			[1] = [[shcormov]],
		},
		select = {
			[1] = [[radjam2]],
		},
	},
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = false,
		category = [[corpses]],
		collisionvolumeoffsets = [[-3.9418182373 0.0506627246094 -0.0]],
		collisionvolumescales = [[41.9625549316 13.4625854492 69.8010559082]],
		collisionvolumetype = [[Box]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		footprintX = 4,
		footprintZ = 4,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CORSJAM_DEAD]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Heap]],
		energy = 0,
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[4X4A]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

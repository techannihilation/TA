-- UNITDEF -- ARMHLS --
--------------------------------------------------------------------------------

local unitName = "armhls"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.12,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.016,
	buildAngle = 16384,
	buildCostEnergy = 5147,
	buildCostMetal = 984,
	builder = false,
	buildTime = 14150,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTVTOL WEAPON]],
	collisionVolumeScales = [[34 34 80]],
	collisionVolumeOffsets = [[0 -5 0]],
	collisionVolumeType = [[CylZ]],
	corpse = [[dead]],
	defaultmissiontype = [[Standby]],
	description = [[Antiswarm Hover Cruiser]],
	designation = [[ARMHLS]],
	energyMake = 2,
	energyStorage = 0,
	energyUse = 2,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	floater = true,
	footprintX = 4,
	footprintZ = 4,
	idleAutoHeal = 5,
	idleTime = 1800,
	maneuverleashlength = 640,
	maxDamage = 2600,
	maxVelocity = 2.8,
	metalStorage = 0,
	minWaterDepth = 12,
	mobilestandorders = 1,
	movementClass = [[BOAT4]],
	name = [[Century]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[ARMHLS]],
	radarDistance = 0,
	scale = 0.5,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[ARM]],
	sightDistance = 530,
	sonarDistance = 305,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 1,
	turnRate = 220,
	unitname = [[armhls]],
	unitnumber = 5963,
	waterline = 1,
	workerTime = 0,
	featureDefs = nil,
	customparams = {
		RequireTech = [[Advanced T1 Unit Research Centre]],
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
			[1] = [[sharmmov]],
		},
		select = {
			[1] = [[sharmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[ARM_LASERAHOVER]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	ARM_LASERAHOVER = {
		areaOfEffect = 14,
		beamlaser = 1,
		beamTime = 0.15,
		coreThickness = 0.2,
		craterBoost = 0,
		craterMult = 0,
		energypershot = 75,
		explosionGenerator = [[custom:LARGE_GREEN_LASER_BURN]],
		fireStarter = 90,
		impactonly = 1,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		laserFlareSize = 10,
		lineOfSight = true,
		name = [[HighEnergyLaser]],
		noSelfDamage = true,
		range = 580,
		reloadtime = 0.7,
		renderType = 0,
		rgbColor = [[0 1 0]],
		soundHitDry = [[lasrhit1]],
		soundStart = [[Lasrmas2]],
		targetMoveError = 0.2,
		thickness = 3,
		tolerance = 10000,
		turret = true,
		weaponType = [[BeamLaser]],
		weaponVelocity = 2250,
		damage = {
			commanders = 75,
			default = 150,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[arm_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[Armhls_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

-- UNITDEF -- NSAAGRIZ --
--------------------------------------------------------------------------------

local unitName = "nsaagriz"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.041,
	bmcode = 1,
	brakeRate = 0.095,
	buildCostEnergy = 791817,
	buildCostMetal = 25892,
	builder = false,
	buildPic = [[krypto-blaster.png]],
	buildTime = 789620,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	cantBeTransported = true,
	category = [[ALL HUGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionVolumeScales = [[80 77 92]],
	collisionVolumeOffsets = [[9 0 0]],
	collisionVolumeType = [[box]],
	corpse = [[dead]],
	damageModifier = 0.09,
	defaultmissiontype = [[Standby]],
	description = [[Armored Mobile Blaster]],
	designation = [[NSA-AGRIZ]],
	downloadable = 1,
	energyMake = 0,
	energyStorage = 0,
	energyUse = 0,
	explodeAs = [[BIG_UNITEX]],
	firestandorders = 1,
	footprintX = 5,
	footprintZ = 5,
	idleAutoHeal = 4,
	idleTime = 2000,
	germaname = [[Krypto-Blaster]],
	healtime = 50,
	immunetoparalyzer = 1,
	maneuverleashlength = 640,
	maxDamage = 16785,
	maxSlope = 30,
	maxVelocity = 0.9,
	maxWaterDepth = 12,
	metalStorage = 0,
	mobilestanorders = 1,
	movementClass = [[VHTANK5]],
	name = [[Krypto-Blaster]],
	noAutoFire = false,
	noChaseCategory = [[SUB VTOL]],
	objectName = [[NSAAGRIZ]],
	onoffable = true,
	ovradjust = 1,
	radarDistance = 1000,
	selfDestructAs = [[BIG_UNIT]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 240,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	turnRate = 600,
	unitname = [[nsaagriz]],
	unitnumber = 1413,
	workerTime = 0,
	customparams = {
		RequireTech = [[Advanced T3 Unit Research Centre]],
	},
	sfxtypes = {
		explosiongenerators = {
		  	[1] = [[custom:tllroaster_muzzle]],
		},
	},
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
			[1] = [[kbarmmov]],
		},
		select = {
			[1] = [[kbarmsel]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[MEDIUM SMALL TINY]],
			def = [[K666BLASTER]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	K666BLASTER = {
		accuracy = 100,
		areaOfEffect = 16,
		largemeamLaser = 1,
		pulseSpeed = 4.0,
		beamtime = 0.6,
		burst = 20,
		burstrate = 0.10,
		beamdecay=0.9,
		beamttl=9,
		duration = 1.79,		
		energypershot = 10000,
		fireStarter = 0,
		lineOfSight = true,
		metalpershot = 0,
		minbarrelangle = 0,
		name = [[Heavy Blaster Doomer's creation]],
		noExplode = true,
		pitchtolerance = 48000,
		range = 1400,
		reloadtime = 1.5,
		renderType = 0,
		rgbColor = [[0.5 0.4 1.0]],
		sprayangle = 800,
		soundHitDry = [[krypton]],
		soundStart = [[krypto]],
		thickness = 20,
		tolerance = 5000,
		texture1 = [[strike]],
		texture2 = [[null]],
		texture3 = [[null]],
		texture4 = [[null]],
		turret = true,
		weaponType = [[BeamLaser]],
		weaponVelocity = 600,
		damage = {
			commanders = 2500,
			default = 15000,
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
		description = [[Blaster Wreckage]],
		featureDead = [[heap]],
		featurereclaimate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		height = 20,
		hitdensity = 60,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[nsaagriz_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = [[Blaster Debris]],
		featurereclamate = [[smudge01]],
		footprintX = 3,
		footprintZ = 3,
		hitdensity = 5,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[3x3a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------

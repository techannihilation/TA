-- UNITDEF -- TLLSEALOCK --
--------------------------------------------------------------------------------

local unitName = "tllsealock"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 0,
  buildCostEnergy    = 6500,
  buildCostMetal     = 2300,
  builder            = false,
  buildTime          = 15000,
  canAttack          = true,
  canstop            = 1,
  category           = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[tllsealock_dead]],
  usePieceCollisionVolumes = 1,
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Floating Gate With Medium Defenses]],
  designation        = [[Sea Lock]],
  downloadable       = 1,
  energyMake         = 0.1,
  energyStorage      = 0,
  energyUse          = 0.1,
  explodeAs          = [[SMALL_UNITEX]],
  firestandorders    = 1,
  footprintX         = 15,
  footprintZ         = 3,
  maxDamage          = 14000,
  metalStorage       = 0,
  minWaterDepth      = 40,
  mobilestandorders  = 1,
  name               = [[Sea Lock]],
  noAutoFire         = false,
  noshadow           = 1,
  objectName         = [[tllsealock]],
  onoffable          = true,
  radarDistance      = 700,
  selfDestructAs     = [[MEDIUM_UNIT]],
  shootme            = 1,
  sightDistance      = 350,
  sonarDistance      = 500,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  threed             = 1,
  unitname           = [[tllsealock]],
  unitnumber         = 4050,
  version            = 1,
  waterline          = 1,
  workerTime         = 0,
  yardMap            = [[wwwYYYYYYYYYwww wwwCCCCCCCCCwww wwwYYYYYYYYYwww]],
  zbuffer            = 1,
  sounds = {
    canceldestruct     = [[cancel2]],
    underattack        = [[warning1]],
    cant = {
      [[cantdo4]],
    },
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    ok = {
      [[sharmmov]],
    },
    select = {
      [[sharmsel]],
    },
  },
  weapons = {
    [1]  = {
      def                = [[GATES_TORPEDO]],
    },
    [2]  = {
      def                = [[GATES_AA]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
	GATES_TORPEDO = {
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
		name = [[AdvancedTorpedo]],
		noSelfDamage = true,
		propeller = 1,
		range = 700,
		reloadtime = 2,
		renderType = 1,
		selfprop = true,
		soundHit = [[xplodep1]],
		soundStart = [[torpedo1]],
		startVelocity = 120,
		tolerance = 32767,
		tracks = true,
		turnRate = 12000,
		turret = false,
		waterWeapon = true,
		weaponAcceleration = 20,
		weaponTimer = 3,
		weaponType = [[TorpedoLauncher]],
		weaponVelocity = 300,
		damage = {
			default = 1000,
		},
	},
  GATES_AA = {
		areaOfEffect = 84,
		burnblow = true,
		burst = 5,
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.75,
		explosionGenerator = [[custom:ARM_FIRE_SMALL]],
		fireStarter = 20,
		flightTime = 3,
		guidance = true,
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		lineOfSight = true,
		model = [[missile]],
		name = [[ExplosiveRockets]],
		noSelfDamage = true,
		proximityPriority = -1,
		range = 1000,
		reloadtime = 0.8,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHit = [[xplosml2]],
		soundStart = [[rocklit1]],
		soundTrigger = true,
		startsmoke = 1,
		startVelocity = 750,
		texture2 = [[armsmoketrail]],
		toAirWeapon = true,
		tolerance = 10000,
		tracks = true,
		turnRate = 25000,
		turret = true,
		weaponAcceleration = 150,
		weaponTimer = 3,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 1500,
		damage = {
			bombers = 300,
			default = 5,
			fighters = 300,
			flak_resistant = 300,
			unclassed_air = 300,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  tllsealock_dead = {
    blocking           = false,
    category           = [[corpses]],
    damage             = 0.6000 * unitDef.maxDamage,
    description        = [[Sea Gate Wreckage]],
    energy             = 0,
    footprintX         = 15,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = 0.8000 * unitDef.buildCostMetal,
    object             = [[TLLSEALOCK_DEAD]],
    reclaimable        = false,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

-- UNITDEF -- TLLDEMON --
--------------------------------------------------------------------------------

local unitName = "tlldemon"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.6,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.6,
  buildCostEnergy    = 70000,
  buildCostMetal     = 6000,
  builder            = false,
  buildTime          = 33000,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  cantBeTransported  = true,
  category           = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Heavy Prototype Anti-Kbot Assault Tank]],
  designation        = [[none]],
  energyMake         = 2,
  energyStorage      = 0,
  energyUse          = 2,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  maneuverleashlength = 640,
  maxDamage          = 26000,
  maxSlope           = 10,
  maxVelocity        = 1,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[HTANK4]],
  name               = [[Demon Slayer Mark II]],
  noAutoFire         = false,
  noChaseCategory    = [[SUB VTOL]],
  objectName         = [[tlldemon]],
  radarDistance      = 0,
  scale              = 1.2,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  sightDistance      = 750,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 400,
  unitname           = [[tlldemon]],
  unitnumber         = 30001,
  version            = 3.0,
  workerTime         = 0,
  zbuffer            = 1,
  sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:dgunflare]],
		},
	},	
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
      [[tcormove]],
    },
    select = {
      [[tcorsel]],
    },
  },
  weapons = {
    [1]  = {
            badTargetCategory  = [[SMALL TINY]],
            def                = [[DEMONSLAYER_CANNON]],
            onlyTargetCategory = [[NOTVTOL]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  DEMONSLAYER_CANNON = {
    accuracy           = 750,
    aimrate            = 2500,
    areaOfEffect       = 500,
    ballistic          = true,
    energypershot      = 200,
	explosionGenerator = [[custom:FLASHNUKE480]],
    gravityaffected    = [[true]],
    holdtime           = 1,
    id                 = 229,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lavaexplosionart   = [[lavasplash]],
    lavaexplosiongaf   = [[fx]],
	smokedelay = 0.01,
	smokeTrail = true,
	model = [[missile10]],
	texture2 = [[armsmoketrail]],
    metalpershot       = 200,
    name               = [[Anti-Dreadnaught Heavy Cannon]],
    range              = 1200,
    reloadtime         = 8,
    renderType         = 4,
    soundHit = [[rockhit]],
    soundStart = [[rapidrocket3]],
    startsmoke         = 1,
    turret             = true,
	trajectoryHeight = 0.5,
	proximityPriority = -1,
	turnRate = 6000,
	waterexplosionart = [[h2o]],
	waterexplosiongaf = [[fx]],
	weaponAcceleration = 120,
	flightTime = 4,
	weaponTimer = 6,
	weaponType = [[MissileLauncher]],
	weaponVelocity = 800,
	startVelocity = 500,
    damage = {
			commanders = 1000,
			default = 5000,
			subs = 5,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    catagory           = [[armcorpses]],
    damage             = 0.6000 * unitDef.maxDamage,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 1,
    hitdensity         = 23,
    metal              = 0.8000 * unitDef.buildCostMetal,
    object             = [[tlldemon_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    catagory           = [[heaps]],
    damage             = 0.3600 * unitDef.maxDamage,
    description        = [[Metal Shards]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    hitdensity         = 4,
    metal              = 0.6400 * unitDef.buildCostMetal,
    object             = [[3x3a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

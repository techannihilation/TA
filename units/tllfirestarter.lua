-- UNITDEF -- TLLFIRESTARTER --
--------------------------------------------------------------------------------

local unitName = "tllfirestarter"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.11,
  badTargetCategory  = [[NOWEAPON]],
  bmcode             = 1,
  brakeRate          = 0.15,
  buildCostEnergy    = 759,
  buildCostMetal     = 112,
  builder            = false,
  buildTime          = 2793,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL LEVEL1 WEAPON NOTAIR NOTSUB MOBILE  ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Amphibious Anti-Air Kbot]],
  designation        = [[]],
  energyMake         = 0.4,
  energyUse          = 0.4,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[Kbot antiaérien]],
  germandescription  = [[Luftabwehr-Kbot]],
  italiandescription = [[Kbot lanciamissili terra-aria]],
  maneuverleashlength = 640,
  maxDamage          = 600,
  maxSlope           = 14,
  maxVelocity        = 1.9,
  maxWaterDepth      = 12,
  mobilestandorders  = 1,
  movementClass      = [[AKBOT2]],
  name               = [[Firestarter]],
  noAutoFire         = false,
  noChaseCategory    = [[NOTAIR]],
  objectName         = [[TLLFIRESTARTER]],
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 500,
  smoothAnim         = true,
  spanishdescription = [[Kbot lanzamisil antiaéreo]],
  standingfireorder  = 2,
  standingmoveorder  = 2,
  steeringmode       = 2,
  threed             = 1,
  turnRate           = 1016,
  unitname           = [[tllfirestarter]],
  unitnumber         = 822,
  upright            = true,
  version            = 3.1,
  zbuffer            = 1,
  sounds = {
    canceldestruct     = [[cancel2]],
    underattack        = [[tllwarning]],
    arrived = {
      [[kbarmstp]],
    },
    cant = {
      [[wearoff]],
    },
    count = {
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
    },
    ok = {
      [[tllkbotmove]],
    },
    select = {
      [[tllunitok]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[NOTAIR]],
      def                = [[ARMKBOT_MISSILE]],
      onlyTargetCategory = [[VTOL]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARMKBOT_MISSILE = {
    areaOfEffect       = 48,
    canattackground    = false,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:FLASH2]],
    fireStarter        = 70,
    flighttimer        = 2,
    guidance           = true,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lineOfSight        = true,
    metalpershot       = 0,
    model              = [[missile]],
    name               = [[Missiles]],
    noSelfDamage       = true,
    range              = 760,
    reloadtime         = 1.8,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = 0.1,
    smokeTrail         = true,
    soundHit           = [[xplosml2]],
    soundStart         = [[rocklit1]],
    startsmoke         = 1,
    startVelocity      = 650,
    texture2           = [[armsmoketrail]],
    toAirWeapon        = true,
    tolerance          = 9000,
    tracks             = true,
    turnRate           = 63000,
    turret             = true,
    weaponAcceleration = 141,
    weaponTimer        = 5,
    weaponType         = [[MissileLauncher]],
    weaponVelocity     = 850,
    damage = {
      default            = 115,
      gunships           = 86,
      hgunships          = 86,
      l1subs             = 5,
      l2bombers          = 210,
      l2subs             = 5,
      l3subs             = 5,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllfirestarter_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2x2b]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

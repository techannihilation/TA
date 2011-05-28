-- UNITDEF -- TLLBUG --
--------------------------------------------------------------------------------

local unitName = "tllbug"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.46,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.25,
  buildCostEnergy    = 112,
  buildCostMetal     = 31,
  builder            = false,
  buildTime          = 1350,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL LEVEL1 WEAPON NOTAIR NOTSUB NOTSTRUCTURE  ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Fast Scout Kbot]],
  designation        = [[]],
  energyMake         = 0.4,
  energyUse          = 0.1,
  explodeAs          = [[SMALL_UNITEX]],
  firestandorders    = 1,
  footprintX         = 1,
  footprintZ         = 1,
  frenchdescription  = [[Kbot espion rapide]],
  germandescription  = [[Schneller Scout-Kbot]],
  maneuverleashlength = 640,
  maxDamage          = 78,
  maxSlope           = 32,
  maxVelocity        = 5.1,
  maxWaterDepth      = 112,
  mobilestandorders  = 1,
  movementClass      = [[KBOT1]],
  name               = [[Bug]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLBUG]],
  selfDestructAs     = [[SMALL_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 498,
  standingfireorder  = 2,
  standingmoveorder  = 2,
  steeringmode       = 2,
  TEDClass           = [[KBOT]],
  threed             = 1,
  turnRate           = 1300,
  unitname           = [[tllbug]],
  unitnumber         = 824,
  upright            = true,
  version            = 3.1,
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
      [[kbarmmov]],
    },
    select = {
      [[kbarmsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[TLLLIGHT_PARALYZER]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  TLLLIGHT_PARALYZER = {
    areaOfEffect       = 8,
    beamWeapon         = true,
    color              = 81,
    duration           = .3,
    explosionart       = [[explode5]],
    explosiongaf       = [[fx]],
    id                 = 167,
    lineOfSight        = true,
    minbarrelangle     = 0,
    name               = [[Light Paralyzer]],
    paralyzer          = true,
    paralyzertime      = 38,
    range              = 200,
    reloadtime         = 1,
    renderType         = 0,
    soundHit           = [[lashit]],
    soundStart         = [[lasrlit1]],
    tolerance          = 500,
    turret             = true,
    waterexplosionart  = [[h2oboom1]],
    waterexplosiongaf  = [[fx]],
    weaponType         = [[LaserCannon]],
    weaponVelocity     = 1000,
    damage = {
      commanders         = 20,
      default            = 150,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = 49,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 1,
    footprintZ         = 1,
    height             = 12,
    hitdensity         = 100,
    metal              = 20,
    object             = [[tllbug_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 11,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 1,
    footprintZ         = 1,
    height             = 4,
    hitdensity         = 100,
    metal              = 8,
    object             = [[1x1b]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

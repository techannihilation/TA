-- UNITDEF -- TLLBUG --
--------------------------------------------------------------------------------

local unitName = "tllbug"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.90,
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
  category           = [[TLL LEVEL1 WEAPON NOTAIR NOTSUB MOBILE  ]],
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
  sightDistance      = 500,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 2,
  steeringmode       = 2,
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
    beamlaser          = 1,
    beamTime           = 0.1,
    burstrate          = 0.2,
    coreThickness      = 0.1,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 2,
    explosionGenerator = [[custom:SMALL_YELLOW_BURN]],
    fireStarter        = 50,
    impactonly         = 1,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    laserFlareSize     = 2,
    lineOfSight        = true,
    name               = [[Laser]],
    noSelfDamage       = true,
    range              = 220,
    reloadtime         = 0.6,
    renderType         = 0,
    rgbColor           = [[1 1 0]],
    paralyzer          = true,
    paralyzertime      = 38,
    range              = 200,
    soundHit           = [[lashit]],
    soundStart         = [[lasrlit1]],
    soundTrigger       = true,
    targetMoveError    = 0.1,
    thickness          = 0.75,
    tolerance          = 10000,
    turret             = true,
    weaponType         = [[BeamLaser]],
    weaponVelocity     = 600,
    damage = {
      commanders         = 20,
      default            = 600,
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
    footprintX         = 1,
    footprintZ         = 1,
    height             = 12,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllbug_dead]],
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
    footprintX         = 1,
    footprintZ         = 1,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
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

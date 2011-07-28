-- UNITDEF -- TLLARES --
--------------------------------------------------------------------------------

local unitName = "tllares"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.05,
  badTargetCategory  = [[NOWEAPON]],
  bmcode             = 1,
  brakeRate          = 0.02,
  buildCostEnergy    = 221,
  buildCostMetal     = 152,
  builder            = false,
  buildTime          = 1851,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL LEVEL1 WEAPON NOTAIR NOTSUB MOBILE  ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Fast Assault Tank]],
  designation        = [[]],
  energyMake         = 0.5,
  energyUse          = 0.5,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[Char d'assaut rapide]],
  germandescription  = [[Schneller Gefechtspanzer]],
  maneuverleashlength = 640,
  maxDamage          = 688,
  maxSlope           = 10,
  maxVelocity        = 3.2,
  maxWaterDepth      = 12,
  mobilestandorders  = 1,
  movementClass      = [[TANK2]],
  name               = [[Ares]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLARES]],
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 400,
  standingfireorder  = 2,
  standingmoveorder  = 2,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 775,
  unitname           = [[tllares]],
  unitnumber         = 828,
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
      [[tarmmove]],
    },
    select = {
      [[tarmsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[ARM_LIGHTCANNON]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARM_LIGHTCANNON = {
    areaOfEffect       = 48,
    avoidFeature       = false,
    ballistic          = true,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:LIGHT_PLASMA]],
    fireStarter        = 100,
    gravityaffected    = [[true]],
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    name               = [[LightCannon]],
    noSelfDamage       = true,
    range              = 350,
    reloadtime         = 1.19,
    renderType         = 4,
    soundHit           = [[xplosml3]],
    soundStart         = [[canlite3]],
    startsmoke         = 1,
    turret             = true,
    weaponType         = [[Cannon]],
    weaponVelocity     = 225,
    damage = {
      default            = 97,
      gunships           = 18,
      hgunships          = 18,
      l1bombers          = 18,
      l1fighters         = 18,
      l1subs             = 5,
      l2bombers          = 18,
      l2fighters         = 18,
      l2subs             = 5,
      l3subs             = 5,
      vradar             = 18,
      vtol               = 18,
      vtrans             = 18,
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
    object             = [[tllares_dead]],
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
    object             = [[2x2e]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

-- UNITDEF -- ARMSCAR --
--------------------------------------------------------------------------------

local unitName = "armscar"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.012,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.0085,
  buildCostEnergy    = 3500,
  buildCostMetal     = 490,
  builder            = false,
  buildTime          = 11840,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL TANK MOBILE WEAPON NOTSUB NOTSHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  damageModifier     = 0.8,
  defaultmissiontype = [[Standby]],
  description        = [[Fusilage Combat Tank]],
  designation        = [[MAD-ASC]],
  energyMake         = 0.8,
  energyUse          = 0.8,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Char d'assaut lourd]],
  frenchname         = [[Scar]],
  germandescription  = [[Schwerer Gefechtspanzer]],
  germanname         = [[Scar]],
  italiandescription = [[Carro armato pesante da assalto]],
  italianname        = [[Scar]],
  maneuverleashlength = 640,
  maxDamage          = 760,
  maxSlope           = 12,
  maxVelocity        = 1.35,
  maxWaterDepth      = 80,
  mobilestandorders  = 1,
  movementClass      = [[TANK3]],
  name               = [[Scar]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[ARMSCAR]],
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 555,
  spanishdescription = [[Tanque de asalto pesado]],
  spanishname        = [[Scar]],
  standingfireorder  = 2,
  standingmoveorder  = 0,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 340,
  unitname           = [[armscar]],
  unitnumber         = 760,
  version            = 1,
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
      def                = [[ARM_SCARGUN]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARM_SCARGUN = {
    accuracy           = 0,
    areaOfEffect       = 90,
    ballistic          = true,
    burnblow           = true,
    craterBoost        = 0,
    craterMult         = 0,
    explosionart       = [[explode3]],
    explosiongaf       = [[fx]],
    gravityaffected    = [[true]],
    id                 = 220,
    impulseBoost       = 0,
    impulseFactor      = 0,
    lavaexplosionart   = [[lavasplash]],
    lavaexplosiongaf   = [[fx]],
    name               = [[Long Range Tank Cannon]],
    noSelfDamage       = true,
    range              = 700,
    reloadtime         = 14,
    renderType         = 4,
    soundHit           = [[xplomed4]],
    soundStart         = [[Scargun]],
    startsmoke         = 1,
    turret             = true,
    waterexplosionart  = [[h2o]],
    waterexplosiongaf  = [[fx]],
    weaponType         = [[Cannon]],
    weaponVelocity     = 1500,
    damage = {
      commanders         = 450,
      default            = 1480,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[arm_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Scar Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[armscar_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Scar Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3c]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

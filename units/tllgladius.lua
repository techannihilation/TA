-- UNITDEF -- TLLGLADIUS --
--------------------------------------------------------------------------------

local unitName = "tllgladius"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.096,
  badTargetCategory  = [[NOWEAPON]],
  bmcode             = 1,
  brakeRate          = 0.051,
  buildCostEnergy    = 168,
  buildCostMetal     = 41,
  builder            = false,
  buildTime          = 1181,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL LEVEL1 WEAPON NOTAIR NOTSUB NOTSTRUCTURE CTRL_G CTRL_W]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Fast Scout Vehicle]],
  designation        = [[TLLFAST]],
  energyMake         = 0.3,
  energyUse          = 0.3,
  explodeAs          = [[SMALL_UNITEX]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[Véhicule d'attaque rapide]],
  germandescription  = [[Schnelles Angriffs-Fahrzeug]],
  italiandescription = [[Veicolo veloce da attacco]],
  maneuverleashlength = 640,
  maxDamage          = 102,
  maxSlope           = 18,
  maxVelocity        = 4.9,
  maxWaterDepth      = 12,
  mobilestandorders  = 1,
  movementClass      = [[TANK2]],
  name               = [[Vampire]],
  noAutoFire         = false,
  noChaseCategory    = [[CTRL_V]],
  objectName         = [[TLLGLADIUS]],
  selfDestructAs     = [[SMALL_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 310,
  spanishdescription = [[Vehículo de ataque rápido]],
  standingfireorder  = 2,
  standingmoveorder  = 2,
  steeringmode       = 1,
  TEDClass           = [[TANK]],
  threed             = 1,
  turnRate           = 550,
  unitname           = [[tllgladius]],
  unitnumber         = 8260,
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
      [[varmmove]],
    },
    select = {
      [[varmsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[CTRL_V]],
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
    damage             = 57,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = 27,
    object             = [[tllgladius_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 38,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = 11,
    object             = [[2x2f]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

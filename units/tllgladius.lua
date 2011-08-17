-- UNITDEF -- TLLGLADIUS --
--------------------------------------------------------------------------------

local unitName = "tllgladius"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.80,
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
  category           = [[TLL LEVEL1 WEAPON NOTAIR NOTSUB MOBILE  ]],
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
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLGLADIUS]],
  selfDestructAs     = [[SMALL_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 480,
  spanishdescription = [[Vehículo de ataque rápido]],
  standingfireorder  = 2,
  standingmoveorder  = 2,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 850,
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
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllgladius_dead]],
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

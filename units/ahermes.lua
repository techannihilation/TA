-- UNITDEF -- AHERMES --
--------------------------------------------------------------------------------

local unitName = "ahermes"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.03,
  ai_limit           = [[limit ahermes 10]],
  ai_weight          = [[weight ahermes 0.3]],
  badTargetCategory  = [[NOTAIR]],
  bmcode             = 1,
  brakeRate          = 0.012,
  buildCostEnergy    = 1710,
  buildCostMetal     = 122,
  builder            = false,
  buildTime          = 5141,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL TANK MOBILE WEAPON NOTSUB NOTSHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Anti-Air Misile tank]],
  designation        = [[ARM-AA2]],
  energyMake         = 0.5,
  energyStorage      = 0,
  energyUse          = 0.5,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Char antiaérien]],
  frenchname         = [[Hermes]],
  germandescription  = [[Luftwabwehr Panzer]],
  germanname         = [[Hermes]],
  maneuverleashlength = 640,
  maxDamage          = 1310,
  maxSlope           = 16,
  maxVelocity        = 2.4,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANK3]],
  name               = [[Hermes]],
  noAutoFire         = false,
  noChaseCategory    = [[NOTAIR]],
  objectName         = [[AHERMES]],
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 745,
  spanishdescription = [[Tanque Antiaéreo]],
  spanishname        = [[Hermes]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 525,
  unitname           = [[ahermes]],
  unitnumber         = 655,
  version            = 3,
  workerTime         = 0,
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
      badTargetCategory  = [[NOTAIR]],
      def                = [[GA2]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  GA2 = {
    areaOfEffect       = 64,
    burst              = 2,
    burstrate          = 0.4,
    canattackground    = false,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 0,
    explosionGenerator = [[custom:FLASH2]],
    fireStarter        = 72,
    guidance           = true,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lineOfSight        = true,
    metalpershot       = 0,
    model              = [[missile]],
    name               = [[AA2Missile]],
    noSelfDamage       = true,
    range              = 840,
    reloadtime         = 0.8,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = 0.1,
    smokeTrail         = true,
    soundHit           = [[packohit]],
    soundStart         = [[packolau]],
    soundTrigger       = true,
    startsmoke         = 1,
    startVelocity      = 520,
    toAirWeapon        = true,
    tolerance          = 9950,
    tracks             = true,
    turnRate           = 68000,
    turret             = true,
    weaponAcceleration = 160,
    weaponTimer        = 5,
    weaponType         = [[MissileLauncher]],
    weaponVelocity     = 820,
    damage = {
      default            = 63,
      gunships           = 40,
      hgunships          = 40,
      l1subs             = 5,
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
    category           = [[arm_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Hermes Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[ahermes_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Hermes Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3d]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

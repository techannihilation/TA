-- UNITDEF -- CORBT --
--------------------------------------------------------------------------------

local unitName = "corbt"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.01,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.03029395,
  buildCostEnergy    = 69701,
  buildCostMetal     = 7673,
  builder            = false,
  buildTime          = 65530,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  cantBeTransported  = true,
  category           = [[ALL TANK WEAPON NOTSUB NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Heavy Weapons Platform]],
  designation        = [[AC-BT]],
  energyMake         = 0,
  energyStorage      = 0,
  energyUse          = 100,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Char d'assaut lourd évolué]],
  frenchname         = [[Sloth]],
  germandescription  = [[mobile Belagerungsplattform]],
  germanname         = [[Sloth]],
  maneuverleashlength = 640,
  maxDamage          = 19212,
  maxSlope           = 12,
  maxVelocity        = 0.9,
  maxWaterDepth      = 20,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[htank4]],
  name               = [[Metron]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[CORBT]],
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[CORE]],
  sightDistance      = 600,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[TANK]],
  threed             = 1,
  turnRate           = 80,
  unitname           = [[corbt]],
  unitnumber         = 317,
  version            = 3.1,
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
      [[tcormove]],
    },
    select = {
      [[tcorsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[CORBT_CANNON]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CORBT_CANNON = {
    areaOfEffect       = 480,
    craterBoost        = 0,
    craterMult         = 0,
    edgeEffectiveness  = 0.1,
    explosionart       = [[rogboom1]],
    explosiongaf       = [[rogboom1]],
    id                 = 239,
    impulseBoost       = 0,
    impulseFactor      = 0,
    lineOfSight        = true,
    model              = [[BTPulse]],
    name               = [[Bt Weapon]],
    noSelfDamage       = true,
    range              = 1900,
    reloadtime         = 14,
    renderType         = 1,
    shakeduration      = 0,
    shakemagnitude     = 0,
    soundHit           = [[xplomed4]],
    soundStart         = [[Big_Cannon]],
    turret             = true,
    waterexplosionart  = [[h2o]],
    waterexplosiongaf  = [[fx]],
    weaponType         = [[Cannon]],
    weaponVelocity     = 600,
    damage = {
      commanders         = 1800,
      default            = 5320,
      t3mechs            = 16300,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 5234,
    description        = [[Metron Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    hitdensity         = 4,
    metal              = 4835,
    object             = [[4x4a]],
    reclamable         = 1,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  dead = {
    blocking           = true,
    category           = [[core_corpses]],
    damage             = 7500,
    description        = [[Metron Wreckage]],
    featureDead        = [[Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = 1849,
    object             = [[CORBT_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[allworlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

-- UNITDEF -- TANKANOTOR --
--------------------------------------------------------------------------------

local unitName = "tankanotor"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.012,
  badTargetCategory  = [[NOTAIR]],
  bmcode             = 1,
  brakeRate          = 0.01,
  buildCostEnergy    = 19602,
  buildCostMetal     = 3902,
  builder            = false,
  buildTime          = 26784,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL TANK WEAPON NOTSUB NOTAIR]],
  collisionVolumeScales = [[41.810501098633 45.810501098633 69.810501098633]],
  collisionVolumeOffsets = [[0 -13 0]],
  collisionVolumeTest = 1,
  collisionVolumeType = [[CylZ]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Heavy Rocket Tank]],
  designation        = [[TANKANOTOR]],
  energyMake         = 25,
  energyStorage      = 0,
  energyUse          = 25,
  explodeAs          = [[BIG_UNIT]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Char lance roquettes lourd]],
  frenchname         = [[Tankanotor]],
  germandescription  = [[Schwerer Raketenpanzer]],
  germanname         = [[Tankanotor]],
  maneuverleashlength = 640,
  maxDamage          = 5800,
  maxSlope           = 10,
  maxVelocity        = 1.3,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[HTANK4]],
  name               = [[Tankanotor]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TANKANOTOR]],
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 750,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 450,
  unitname           = [[tankanotor]],
  unitnumber         = 7066,
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
      [[tarmmove]],
    },
    select = {
      [[tarmsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[NOTAIR]],
      def                = [[TANKANOTOR_MISSILES]],
    },
    [2]  = {
      def                = [[TANKANOTOR_MISSILES]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  TANKANOTOR_MISSILES = {
    areaOfEffect       = 320,
    burst              = 2,
    burstrate          = .24,
    craterBoost        = 0,
    craterMult         = 0,
    explosionart       = [[bigboom]],
    explosiongaf       = [[towers]],
    fireStarter        = 20,
    flightTime         = 5,
    guidance           = true,
    id                 = 233,
    impulseBoost       = 0,
    impulseFactor      = 0,
    lavaexplosionart   = [[lavasplashlg]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    model              = [[missileH2]],
    name               = [[Heavy Rocket]],
    range              = 1230,
    reloadtime         = 7.0,
    renderType         = 1,
    shakeduration      = 1,
    shakemagnitude     = 3,
    smokedelay         = 0.1,
    smokeTrail         = true,
    soundHit           = [[tankahit]],
    soundStart         = [[TAWF114a]],
    startsmoke         = 1,
    startVelocity      = 40,
    tolerance          = 1200,
    tracks             = true,
    trajectoryHeight   = 1,
    turnRate           = 43300,
    turret             = true,
    waterexplosionart  = [[h2oboom2]],
    waterexplosiongaf  = [[fx]],
    weaponAcceleration = 200,
    weaponTimer        = 8,
    weaponType         = [[MissileLauncher]],
    weaponVelocity     = 500,
    damage = {
      default            = 1150,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  ["dead"] = {
    blocking           = true,
    category           = [[arm_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Tankanotor Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 10,
    hitdensity         = 23,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tankanotor_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  ["heap"] = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Debris]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 10,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2X2F]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

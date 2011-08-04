-- UNITDEF -- ARMSIEGE --
--------------------------------------------------------------------------------

local unitName = "armsiege"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.01,
  antiweapons        = 1,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.01,
  buildCostEnergy    = 125898,
  buildCostMetal     = 5465,
  builder            = false,
  buildTime          = 40788,
  canAttack          = true,
  canGuard           = true,
  canHover           = false,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL TANK WEAPON NOTSUB NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Mobile Siege Vehicle]],
  designation        = [[RM]],
  energyMake         = 0.4,
  energyStorage      = 0,
  energyUse          = 2.4,
  explodeAs          = [[ATOMIC_BLAST]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  maneuverleashlength = 640,
  maxDamage          = 30600,
  maxSlope           = 12,
  maxVelocity        = 1.7,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[HTANK4]],
  name               = [[Demolisher]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[ARMSIEGE]],
  radarDistance      = 0,
  selfDestructAs     = [[ATOMIC_BLASTSML]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 768,
  standingfireorder  = 1,
  standingmoveorder  = 0,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 192,
  unitname           = [[armsiege]],
  unitnumber         = 46,
  version            = 1,
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
      badTargetCategory  = [[VTOL]],
      def                = [[CANNON_SIEGE]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CANNON_SIEGE = {
    accuracy           = 750,
    aimrate            = 2500,
    areaOfEffect       = 239,
    ballistic          = true,
    burst              = 2,
    burstrate          = 1.5,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 0,
    explosionart       = [[lrpcboom]],
    explosiongaf       = [[lrpcboom]],
    gravityaffected    = [[true]],
    holdtime           = 1,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lavaexplosionart   = [[lavasplashlg]],
    lavaexplosiongaf   = [[fx]],
    name               = [[Plasma Cannon]],
    range              = 1120,
    reloadtime         = 8.5,
    renderType         = 4,
    soundHit           = [[xplomas4]],
    soundStart         = [[siege_fire]],
    startsmoke         = 1,
    tolerance          = 1000,
    turret             = true,
    waterexplosionart  = [[h2oboom2]],
    waterexplosiongaf  = [[fx]],
    weaponType         = [[Cannon]],
    weaponVelocity     = 450,
    damage = {
      default            = 1450,
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
    description        = [[Demolisher Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[ARMSIEGE_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Demolisher Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[5x5a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

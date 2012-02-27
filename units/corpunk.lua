-- UNITDEF -- CORPUNK --
--------------------------------------------------------------------------------

local unitName = "corpunk"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.5,
  badTargetCategory  = [[ANTIGATOR]],
  bmcode             = 1,
  brakeRate          = 0.5,
  buildCostEnergy    = 150,
  buildCostMetal     = 10,
  builder            = false,
  buildPic           = [[CORPUNK.png]],
  buildTime          = 200,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[MOBILE LEVEL1 NOTAIR ALL]],
  corpse             = [[ARMFLEA_DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[Stealthy Scout Kbot]],
  energyMake         = 0.4,
  energyStorage      = 0,
  energyUse          = 0.4,
  explodeAs          = [[TINY_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 1,
  footprintZ         = 1,
  idleAutoHeal       = 5,
  idleTime           = 250,
  maneuverleashlength = 640,
  mass               = 20,
  maxDamage          = 50,
  maxSlope           = 255,
  maxVelocity        = 4.4,
  maxWaterDepth      = 16,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[KBOT1]],
  name               = [[Punkie]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[CORPUNK]],
  seismicSignature   = 0,
  selfDestructAs     = [[TINY_BUILDINGEX]],
  side               = [[COR]],
  sightDistance      = 650,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  stealth            = true,
  steeringmode       = 2,
  TEDClass           = [[KBOT]],
  turnRate           = 1672,
  unitname           = [[corpunk]],
  workerTime         = 0,
  wpri_badtargetcategory = [[ANTIGATOR]],
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
      [[servtny1]],
    },
    select = {
      [[servtny1]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  ARMFLEA_DEAD = {
    blocking           = false,
    category           = [[corpses]],
    damage             = 30,
    description        = [[Wreckage]],
    energy             = 0,
    featureDead        = [[ARMFLEA_HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 1,
    footprintZ         = 1,
    height             = 20,
    hitdensity         = 100,
    metal              = 4,
    object             = [[ARMFLEA_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  ARMFLEA_HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 15,
    description        = [[Wreckage]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 1,
    footprintZ         = 1,
    height             = 4,
    hitdensity         = 100,
    metal              = 2,
    object             = [[1X1A]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

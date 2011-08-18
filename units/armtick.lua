-- UNITDEF -- ARMTICK --
--------------------------------------------------------------------------------

local unitName = "armtick"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.18,
  ai_limit           = [[limit ARMTICK 0]],
  ai_weight          = [[weight ARMTICK 0]],
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.6,
  buildCostEnergy    = 1419,
  buildCostMetal     = 102,
  buildDistance      = 60,
  builder            = true,
  buildTime          = 9254,
  canAttack          = false,
  canCapture         = false,
  canGuard           = true,
  canMove            = true,
  canreclamate       = 1,
  canResurrect       = true,
  canstop            = 1,
  category           = [[ALL TANK MOBILE WEAPON NOTSUB NOTSHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[All-terrain Resurrection Kbot]],
  designation        = [[ARM-PASPD2]],
  downloadable       = 1,
  energyStorage      = 0,
  energyUse          = 0.4,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  maneuverleashlength = 640,
  maxDamage          = 472,
  maxSlope           = 14,
  maxVelocity        = 1.8,
  maxWaterDepth      = 22,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TKBOT3]],
  name               = [[Tick]],
  noAutoFire         = true,
  objectName         = [[ARMTICK]],
  ovradjust          = 1,
  radarDistance      = 50,
  resurrect          = 1,
  selfDestructAs     = [[BIG_UNITEX]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 140,
  spanishdescription = [[Kbot Todo-terreno de Captura]],
  spanishname        = [[Garrapata]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  stealth            = true,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 925,
  unitname           = [[armtick]],
  unitnumber         = 4244,
  version            = 1.2,
  workerTime         = 200,
  wpri_badtargetcategory = [[VTOL]],
  zbuffer            = 1,
  sounds = {
    build              = [[nanlath1]],
    canceldestruct     = [[cancel2]],
    capture            = [[capture1]],
    repair             = [[repair1]],
    underattack        = [[warning1]],
    working            = [[reclaim1]],
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
      [[spider2]],
    },
    select = {
      [[spiderse]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[arm_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Tick Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[armtick_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Tick Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2x2d]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

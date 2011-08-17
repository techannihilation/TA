-- UNITDEF -- ARMREZSPD --
--------------------------------------------------------------------------------

local unitName = "armrezspd"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.15,
  ai_limit           = [[limit ARMREZSPD 0]],
  ai_weight          = [[weight ARMREZSPD 0]],
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.15,
  buildCostEnergy    = 1410,
  buildCostMetal     = 108,
  buildDistance      = 65,
  builder            = true,
  buildTime          = 8580,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canreclamate       = 1,
  canResurrect       = true,
  canstop            = 1,
  category           = [[ALL TANK MOBILE WEAPON NOTSUB NOTSHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[All-terrain Resurrection Kbot]],
  designation        = [[ARM-RESSPD]],
  energyMake         = 0.7,
  energyStorage      = 65,
  energyUse          = 0.7,
  explodeAs          = [[BIG_UNITEX]],
  footprintX         = 3,
  footprintZ         = 3,
  maneuverleashlength = 640,
  maxDamage          = 456,
  maxVelocity        = 1.49,
  maxWaterDepth      = 24,
  metalStorage       = 25,
  mobilestandorders  = 1,
  movementClass      = [[TKBOT3]],
  name               = [[Mother]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[ARMREZSPD]],
  radarDistance      = 50,
  resurrect          = 1,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 0,
  side               = [[ARM]],
  sightDistance      = 300,
  spanishdescription = [[Kbot Todo-terreno Resurrector]],
  spanishname        = [[Madre]],
  standingmoveorder  = 1,
  stealth            = true,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 1020,
  unitname           = [[armrezspd]],
  unitnumber         = 4331,
  version            = 1.2,
  workerTime         = 200,
  wpri_badtargetcategory = [[VTOL]],
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
      [[necrok1]],
    },
    select = {
      [[necrsel1]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[arm_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Mother Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 40,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[ARMREZSPD_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Mother Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2x2a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

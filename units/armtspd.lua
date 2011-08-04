-- UNITDEF -- ARMTSPD --
--------------------------------------------------------------------------------

local unitName = "armtspd"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.10,
  ai_limit           = [[limit ARMTSPD 0]],
  ai_weight          = [[weight ARMTSPD 0.0]],
  bmcode             = 1,
  brakeRate          = 0.11,
  buildCostEnergy    = 6186,
  buildCostMetal     = 506,
  builder            = false,
  buildTime          = 19156,
  canAttack          = false,
  canGuard           = true,
  canload            = 1,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  cantBeTransported  = true,
  category           = [[ALL TANK MOBILE WEAPON NOTSUB NOTSHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[All-terrain Transport Kbot]],
  designation        = [[ARM-TSPD]],
  energyMake         = 2.6,
  energyStorage      = 60,
  energyUse          = 2.5,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  maneuverleashlength = 640,
  maxDamage          = 4036,
  maxVelocity        = 1.3,
  maxWaterDepth      = 255,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TKBOT3]],
  name               = [[Nemphis]],
  noAutoFire         = false,
  objectName         = [[ARMTSPD]],
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 245,
  spanishdescription = [[Kbot Todo-terreno de Transporte]],
  spanishname        = [[Nexo]],
  standingfireorder  = 1,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  transportCapacity  = 6,
  transportmaxunits  = 7,
  transportSize      = 3,
  turnRate           = 975,
  unitname           = [[armtspd]],
  unitnumber         = 6567,
  version            = 1.2,
  workerTime         = 0,
  zbuffer            = 1,
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[arm_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Nemphis Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 40,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[armTspd_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Nemphis Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

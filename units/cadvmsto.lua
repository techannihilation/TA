-- UNITDEF -- CADVMSTO --
--------------------------------------------------------------------------------

local unitName = "cadvmsto"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 41722,
  buildCostMetal     = 2195,
  builder            = false,
  buildTime          = 66125,
  category           = [[CORE LEVEL2 NOWEAPON  NOTAIR NOTSUB]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Storage 100.000]],
  designation        = [[CMS-1]],
  downloadable       = 1,
  energyStorage      = 0,
  explodeAs          = [[SMALL_BUILDINGEX]],
  footprintX         = 7,
  footprintZ         = 6,
  maxDamage          = 66104,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 100000,
  name               = [[T3 Metal Storage]],
  noAutoFire         = false,
  objectName         = [[cadvmsto]],
  radarDistance      = 0,
  selfDestructAs     = [[SMALL_BUILDING]],
  side               = [[CORE]],
  sightDistance      = 300,
  threed             = 1,
  unitname           = [[cadvmsto]],
  unitnumber         = 996,
  upright            = true,
  version            = 1,
  workerTime         = 0,
  yardMap            = [[oooooooooooooooo]],
  zbuffer            = 1,
  sounds = {
    canceldestruct     = [[cancel2]],
    underattack        = [[warning1]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[stormtl2]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[core_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[T3 Metal Storage Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 6,
    footprintZ         = 4,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[cadvmsto_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[T3 Metal Storage Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 5,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[4x4b]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

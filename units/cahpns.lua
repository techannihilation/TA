-- UNITDEF -- CAHPNS --
--------------------------------------------------------------------------------

local unitName = "cahpns"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildCostEnergy    = 16527,
  buildCostMetal     = 2957,
  builder            = true,
  buildTime          = 17520,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[CORE PLANT LEVEL3 NOWEAPON NOTAIR NOTSUB]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Builds T2 Hovercraft]],
  designation        = [[COR-HNS]],
  downloadable       = 1,
  energyStorage      = 300,
  energyUse          = 50,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 12,
  footprintZ         = 9,
  frenchdescription  = [[Construit des Hovercrafts]],
  frenchname         = [[Plate-forme de constr. évoluée NS]],
  germandescription  = [[Baut Hovercrafts]],
  germanname         = [[Verb. Hovercraft-Plattform NS]],
  italiandescription = [[Costruisce Hovercraft]],
  italianname        = [[Piattaforma Hovercraft Spec. NS]],
  maxDamage          = 5205,
  maxWaterDepth      = 0,
  metalStorage       = 300,
  minWaterDepth      = 30,
  mobilestandorders  = 1,
  name               = [[Advanced Hovercraft Platform - NS]],
  noAutoFire         = false,
  noshadow           = 1,
  objectName         = [[CAHPNS]],
  radarDistance      = 0,
  radarDistanceJam   = 20,
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[CORE]],
  sightDistance      = 220,
  spanishdescription = [[Construye hovercrafts]],
  spanishname        = [[Plataforma Av. Hovercraft NS]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  threed             = 1,
  unitname           = [[cahpns]],
  unitnumber         = 11006,
  version            = 1.2,
  waterline          = 10,
  workerTime         = 400,
  yardMap            = [[wCCCCCCCCCCw CCCCCCCCCCCC CCCCCCCCCCCC CCCCCCCCCCCC CCCCCCCCCCCC CCCCCCCCCCCC CCCCCCCCCCCC CCCCCCCCCCCC wCCCCCCCCCCw]],
  zbuffer            = 1,
  buildoptions = {
    [[cach]],
    [[watcher]],
    [[blotter]],
    [[nsacbehe]],
    [[cormatch]],
    [[corhover3g]],
    [[nsacanglr]],
    [[corfrog]],
    [[coradon]],
  },
  sounds = {
    build              = [[hoverok2]],
    canceldestruct     = [[cancel2]],
    underattack        = [[warning1]],
    unitcomplete       = [[untdone]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[hoversl2]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[arm_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Advanced Hovercraft Plataform NS Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 10,
    footprintZ         = 8,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[Cahpns_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Advanced Hovercraft Plataform NS Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 8,
    footprintZ         = 7,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[7x7a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

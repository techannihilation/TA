-- UNITDEF -- AAHPNS --
--------------------------------------------------------------------------------

local unitName = "aahpns"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildCostEnergy    = 13277,
  buildCostMetal     = 3007,
  builder            = true,
  buildTime          = 16220,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ARM PLANT LEVEL3 NOWEAPON NOTAIR NOTSUB]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Builds T2 Hovercraft]],
  designation        = [[ARM-HNS]],
  downloadable       = 1,
  energyStorage      = 300,
  energyUse          = 50,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 10,
  footprintZ         = 8,
  frenchdescription  = [[Construit des Hovercrafts]],
  frenchname         = [[Plate-forme de constr. évoluée NS]],
  germandescription  = [[Baut Hovercrafts]],
  germanname         = [[Verb. Hovercraft-Plattform NS]],
  italiandescription = [[Costruisce Hovercraft]],
  italianname        = [[Piattaforma Hovercraft Spec. NS]],
  maxDamage          = 5005,
  maxWaterDepth      = 0,
  metalStorage       = 300,
  minWaterDepth      = 30,
  mobilestandorders  = 1,
  name               = [[Advanced Hovercraft Platform - NS]],
  noAutoFire         = false,
  noshadow           = 1,
  objectName         = [[AAHPNS]],
  radarDistance      = 0,
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[ARM]],
  sightDistance      = 220,
  spanishdescription = [[Construye hovercrafts]],
  spanishname        = [[Plataforma Av. Hovercraft NS]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  stealth            = true,
  threed             = 1,
  unitname           = [[aahpns]],
  unitnumber         = 11002,
  version            = 1.2,
  waterline          = 15,
  workerTime         = 400,
  yardMap            = [[wCCCCCCCCw CCCCCCCCCC CCCCCCCCCC CCCCCCCCCC CCCCCCCCCC CCCCCCCCCC CCCCCCCCCC CCCCCCCCCC wCCCCCCCCw]],
  zbuffer            = 1,
  buildoptions = {
    [[aach]],
    [[r75-v]],
    [[concealer]],
    [[armhplasma]],
    [[armvisit]],
    [[armlashover]],
    [[nsaatorph]],
    [[devastator]],
    [[armiguana]],
    [[speeder]],
    [[armtem]],
  },
  sounds = {
    build              = [[hoverok1]],
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
      [[hoversl1]],
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
    object             = [[Aahpns_dead]],
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

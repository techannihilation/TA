-- UNITDEF -- TLLRADAR --
--------------------------------------------------------------------------------

local unitName = "tllradar"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 150,
  buildCostMetal     = 95,
  builder            = false,
  buildTime          = 1372,
  category           = [[TLL LEVEL1 NOWEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Radar Tower]],
  designation        = [[]],
  energyMake         = 5,
  energyUse          = 8,
  explodeAs          = [[SMALL_BUILDINGEX]],
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[Niveau Tech 1]],
  frenchname         = [[Tour radar  ]],
  germandescription  = [[Tech Level 1]],
  germanname         = [[Radarturm]],
  iconType           = [[building]],
  italiandescription = [[Torretta radar]],
  italianname        = [[Torre Radar]],
  maxDamage          = 93,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  name               = [[Radar Tower]],
  noAutoFire         = false,
  objectName         = [[TLLRADAR]],
  onoffable          = true,
  radarDistance      = 1940,
  selfDestructAs     = [[SMALL_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 350,
  spanishdescription = [[Torre de Radar ]],
  spanishname        = [[Torre de Radar ]],
  TEDClass           = [[SPECIAL]],
  threed             = 1,
  unitname           = [[tllradar]],
  unitnumber         = 809,
  version            = 1,
  yardMap            = [[oooo]],
  zbuffer            = 1,
  sounds = {
    activate           = [[radar1]],
    canceldestruct     = [[cancel2]],
    deactivate         = [[radarde1]],
    underattack        = [[warning1]],
    working            = [[radar1]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[radar1]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = 70,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = 61,
    object             = [[tllradar_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 50,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = 24,
    object             = [[2x2b]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

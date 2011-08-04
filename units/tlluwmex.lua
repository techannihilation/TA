-- UNITDEF -- TLLUWMEX --
--------------------------------------------------------------------------------

local unitName = "tlluwmex"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 2447,
  buildCostMetal     = 44,
  builder            = false,
  buildTime          = 3644,
  category           = [[TLL   LEVEL1 NOWEAPON NOTAIR NOTSUB]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Extracts Metal]],
  designation        = [[TL-UM]],
  downloadable       = 1,
  energyUse          = 2.1,
  explodeAs          = [[SMALL_BUILDINGEX]],
  extractsMetal      = 0.001098,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Extracteur de métal sous-marin]],
  frenchname         = [[Extracteur sous-marin]],
  germandescription  = [[Unterwasser-Metallgewinnung]],
  germanname         = [[Tauchschmelze]],
  iconType           = [[building]],
  italiandescription = [[Estrattore di Metallo sottomarino]],
  italianname        = [[Estr. Metallo subacqueo]],
  maxDamage          = 348,
  maxSlope           = 24,
  minWaterDepth      = 20,
  name               = [[Underwater Metal Extractor]],
  noAutoFire         = false,
  objectName         = [[TLLUWMEX]],
  onoffable          = true,
  selfDestructAs     = [[SMALL_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 100,
  spanishdescription = [[Extractor de metal submarino]],
  spanishname        = [[Extractor de Metal]],
  threed             = 1,
  unitname           = [[tlluwmex]],
  unitnumber         = 898,
  version            = 3.1,
  workerTime         = 0,
  yardMap            = [[ooooooooo]],
  zbuffer            = 1,
  sounds = {
    activate           = [[waterex1]],
    canceldestruct     = [[cancel2]],
    deactivate         = [[waterex1]],
    underattack        = [[warning1]],
    working            = [[waterex1]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[waterex1]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 12,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tlluwmex_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Metal Shards]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    hitdensity         = 4,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

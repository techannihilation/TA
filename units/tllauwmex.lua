-- UNITDEF -- TLLAUWMEX --
--------------------------------------------------------------------------------

local unitName = "tllauwmex"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 6045,
  buildCostMetal     = 750,
  builder            = false,
  buildTime          = 47519,
  category           = [[TLL METAL EXTRACTOR LEVEL3 NOWEAPON NOTAIR NOTSUB]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Advanced Metal Extractor/ Storage]],
  designation        = [[TL-AUM]],
  downloadable       = 1,
  energyUse          = 21,
  explodeAs          = [[SMALL_BUILDINGEX]],
  extractsMetal      = 0.0042,
  footprintX         = 5,
  footprintZ         = 5,
  frenchdescription  = [[Extracteur de métal sous-marin]],
  frenchname         = [[Extracteur sous-marin]],
  germandescription  = [[Unterwasser-Metallgewinnung]],
  germanname         = [[Tauchschmelze]],
  italiandescription = [[Estrattore di Metallo sottomarino]],
  italianname        = [[Estr. Metallo subacqueo]],
  maxDamage          = 3307,
  maxSlope           = 24,
  minWaterDepth      = 20,
  name               = [[Advanced Underwater Mex]],
  noAutoFire         = false,
  objectName         = [[TLLAUWMEX]],
  onoffable          = true,
  selfDestructAs     = [[SMALL_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 130,
  spanishdescription = [[Extractor de metal submarino]],
  spanishname        = [[Extractor de Metal]],
  TEDClass           = [[METAL]],
  threed             = 1,
  unitname           = [[tllauwmex]],
  unitnumber         = 908,
  version            = 3.1,
  workerTime         = 0,
  yardMap            = [[ooooooooooooooooooooooooo]],
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
    damage             = 2112,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 12,
    hitdensity         = 100,
    metal              = 481,
    object             = [[tllauwmex_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 1221,
    description        = [[Metal Shards]],
    featurereclamate   = [[smudge01]],
    footprintX         = 5,
    footprintZ         = 5,
    hitdensity         = 5,
    metal              = 186,
    object             = [[5x5a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

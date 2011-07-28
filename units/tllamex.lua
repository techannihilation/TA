-- UNITDEF -- TLLAMEX --
--------------------------------------------------------------------------------

local unitName = "tllamex"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 2048,
  buildCostEnergy    = 5953,
  buildCostMetal     = 542,
  builder            = false,
  buildTime          = 14530,
  category           = [[TLL   LEVEL3 NOWEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Advanced Metal Extractor/ Storage]],
  designation        = [[AM-MME]],
  energyUse          = 30,
  explodeAs          = [[SMALL_BUILDINGEX]],
  extractsMetal      = 0.0042,
  footprintX         = 5,
  footprintZ         = 5,
  frenchdescription  = [[Extracteur de métal évolué]],
  frenchname         = [[Mine Moho]],
  germandescription  = [[Verbesserter Metallextractor]],
  germanname         = [[Moho-Mine]],
  iconType           = [[building]],
  italiandescription = [[Estrattore di metallo avanzato]],
  italianname        = [[Estrattore Moho]],
  maxDamage          = 3557,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 1250,
  name               = [[Moho Mine]],
  noAutoFire         = false,
  objectName         = [[TLLAMEX]],
  onoffable          = true,
  ovradjust          = 1,
  selfDestructAs     = [[SMALL_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 210,
  spanishdescription = [[Extractor avanzado de metal]],
  spanishname        = [[Mina Moho]],
  threed             = 1,
  unitname           = [[tllamex]],
  unitnumber         = 910,
  version            = 3.1,
  workerTime         = 0,
  yardMap            = [[ooooooooooooooooooooooooo]],
  zbuffer            = 1,
  sounds = {
    activate           = [[mohorun1]],
    canceldestruct     = [[cancel2]],
    deactivate         = [[mohooff1]],
    underattack        = [[warning1]],
    working            = [[mohorun1]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    ok = {
      [[twractv2]],
    },
    select = {
      [[mohoon1]],
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
    footprintX         = 5,
    footprintZ         = 5,
    height             = 12,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllamex_dead]],
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
    footprintX         = 5,
    footprintZ         = 5,
    hitdensity         = 4,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[5x5b]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

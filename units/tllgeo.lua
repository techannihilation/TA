-- UNITDEF -- TLLGEO --
--------------------------------------------------------------------------------

local unitName = "tllgeo"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 3568,
  buildCostMetal     = 1680,
  builder            = false,
  buildTime          = 16078,
  category           = [[TLL ENERGY METAL LEVEL2 NOWEAPON NOTAIR NOTSUB]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Produces Energy/Metal]],
  designation        = [[]],
  energyMake         = 900,
  energyStorage      = 2100,
  energyUse          = 450,
  explodeAs          = [[LARGE_BUILDINGEX]],
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Produit de l'énergie/Metal]],
  frenchname         = [[Centrale géothermique]],
  germandescription  = [[Liefert Energie/Metal]],
  germanname         = [[Geotherm. Kraftwerk]],
  iconType           = [[building]],
  italiandescription = [[Produce energia/Metal]],
  italianname        = [[Stabilimento Geotermico]],
  makesMetal         = 9,
  maxDamage          = 3440,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 600,
  name               = [[Geothermal Supply Lab]],
  noAutoFire         = false,
  objectName         = [[TLLGEO]],
  onoffable          = false,
  selfDestructAs     = [[NUCLEAR_MISSILE]],
  side               = [[TLL]],
  sightDistance      = 210,
  spanishdescription = [[Genera energía/Metal]],
  spanishname        = [[Planta Geotérmica]],
  TEDClass           = [[ENERGY]],
  threed             = 1,
  unitname           = [[tllgeo]],
  unitnumber         = 803,
  version            = 1,
  yardMap            = [[GGGGGGGGGGGGGGGG]],
  zbuffer            = 1,
  sounds = {
    activate           = [[tllgeo]],
    canceldestruct     = [[cancel2]],
    deactivate         = [[tllgeooff]],
    underattack        = [[tllwarning]],
    count = {
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
    },
    select = {
      [[tllgeosel]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = 1352,
    description        = [[wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 21,
    hitdensity         = 105,
    metal              = 1074,
    object             = [[tllmex_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 1523,
    description        = [[wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 2,
    hitdensity         = 105,
    metal              = 413,
    object             = [[4x4a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

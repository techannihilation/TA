-- UNITDEF -- TLLMOHOGEO --
--------------------------------------------------------------------------------

local unitName = "tllmohogeo"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 68068,
  buildCostMetal     = 4392,
  builder            = false,
  buildTime          = 81028,
  category           = [[TLL ALL NOTSUB NOWEAPON NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[tllgeo_dead]],
  description        = [[Hazardous Geothermal Lab Produces Energy/Metal]],
  designation        = [[]],
  energyMake         = 2500,
  energyStorage      = 2250,
  energyUse          = 1250,
  explodeAs          = [[NUCLEAR_MISSILE]],
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Produit de l'énergie/Metal]],
  frenchname         = [[Centrale géothermique]],
  germandescription  = [[Liefert Energie/Metal]],
  germanname         = [[Geotherm. Kraftwerk]],
  iconType           = [[building]],
  italiandescription = [[Produce energia/Metal]],
  italianname        = [[Stabilimento Geotermico]],
  makesMetal         = 18,
  maxDamage          = 6220,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 600,
  name               = [[Moho Geothermal Supply Lab]],
  noAutoFire         = false,
  objectName         = [[TLLMOHOGEO]],
  onoffable          = false,
  selfDestructAs     = [[NUCLEAR_MISSILE]],
  side               = [[TLL]],
  sightDistance      = 210,
  spanishdescription = [[Genera energía/Metal]],
  spanishname        = [[Planta Geotérmica]],
  threed             = 1,
  unitname           = [[tllmohogeo]],
  unitnumber         = 803,
  version            = 1,
  yardMap            = [[GGGGGGGGGGGGGGGG]],
  zbuffer            = 1,
  sfxtypes = {
    explosiongenerators = {
      [[custom:PILOT]],
    },
  },
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
  tllgeo_dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[wreckage]],
    featureDead        = [[tllgeo_heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 21,
    hitdensity         = 105,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllmex_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  tllgeo_heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 2,
    hitdensity         = 105,
    metal              = unitDef.buildCostMetal*0.64,
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

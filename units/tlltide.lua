-- UNITDEF -- TLLTIDE --
--------------------------------------------------------------------------------

local unitName = "tlltide"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 485,
  buildCostMetal     = 95,
  builder            = false,
  buildTime          = 2290,
  category           = [[TLL  LEVEL1 NOWEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Produces Energy]],
  designation        = [[TLL-TID]],
  energyUse          = 0,
  explodeAs          = [[SMALL_BUILDINGEX]],
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Produit de l'énergie]],
  frenchname         = [[Centrale marémotrice]],
  germandescription  = [[Liefert Energie]],
  germanname         = [[Gezeitenkraftwerk]],
  italiandescription = [[Produce energia]],
  italianname        = [[Generatore a Maree]],
  iconType           = [[building]],
  maxDamage          = 258,
  maxSlope           = 10,
  minWaterDepth      = 12,
  name               = [[Tidal Generator]],
  noAutoFire         = false,
  noshadow           = 1,
  objectName         = [[tllTIDE]],
  onoffable          = true,
  ovradjust          = 1,
  selfDestructAs     = [[SMALL_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 100,
  sonarDistance      = 0,
  spanishdescription = [[Produce energía]],
  spanishname        = [[Generador Maremotriz]],
  threed             = 1,
  tidalGenerator     = 1,
  unitname           = [[tlltide]],
  unitnumber         = 854,
  version            = 3.1,
  waterline          = 12,
  workerTime         = 0,
  yardMap            = [[wwwwwwwww]],
  zbuffer            = 1,
  sounds = {
    canceldestruct     = [[cancel2]],
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
      [[tlltidal]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = false,
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
    object             = [[tlltide_dead]],
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
    hitdensity         = 24,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3b]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

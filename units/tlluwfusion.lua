-- UNITDEF -- TLLUWFUSION --
--------------------------------------------------------------------------------

local unitName = "tlluwfusion"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 14500,
  buildCostMetal     = 4100,
  builder            = false,
  buildTime          = 120000,
  category           = [[TLL  LEVEL3 NOWEAPON NOTAIR NOTSUB]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Produces Energy/ Storage]],
  designation        = [[TL-UWF]],
  downloadable       = 1,
  energyMake          = 1000,
  explodeAs          = [[ATOMIC_BLAST]],
  footprintX         = 6,
  footprintZ         = 4,
  frenchdescription  = [[Produit de l'énergie]],
  frenchname         = [[Centrale Atom. sous-marine]],
  germandescription  = [[Liefert Energie]],
  germanname         = [[Unterwasser-Fusionsreaktor]],
  iconType           = [[building]],
  italiandescription = [[Impianto di Fusione sottomarino]],
  italianname        = [[Impianto di Fusione]],
  maxDamage          = 3311,
  maxSlope           = 10,
  maxWaterDepth      = 255,
  minWaterDepth      = 34,
  name               = [[Underwater Fusion Plant]],
  noAutoFire         = false,
  objectName         = [[tllUWFUSion]],
  selfDestructAs     = [[NUCLEAR_MISSILE]],
  side               = [[TLL]],
  sightDistance      = 110,
  spanishdescription = [[Planta de fusión submarina]],
  spanishname        = [[Planta de Fusión]],
  threed             = 1,
  unitname           = [[tlluwfusion]],
  unitnumber         = 867,
  version            = 3.1,
  workerTime         = 0,
  yardMap            = [[oooooooooooooooooooooooo]],
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
      [[tlluwfusion]],
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
    footprintX         = 6,
    footprintZ         = 4,
    height             = 12,
    hitdensity         = 123,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tlluwfusion_dead]],
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
    footprintX         = 6,
    footprintZ         = 4,
    hitdensity         = 4,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[4x4d]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

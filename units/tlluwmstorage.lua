-- UNITDEF -- TLLUWMSTORAGE --
--------------------------------------------------------------------------------

local unitName = "tlluwmstorage"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 1388,
  buildCostMetal     = 358,
  builder            = false,
  buildTime          = 3849,
  category           = [[TLL  NOWEAPON NOTAIR NOTSUB  ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Increases Metal Storage (4100)]],
  designation        = [[TL-UWMS]],
  downloadable       = 1,
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[SMALL_BUILDINGEX]],
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Augmente Stockage Métal]],
  frenchname         = [[Dépôt de Métal Sous-Marin]],
  germandescription  = [[Größere Metallvorräte]],
  germanname         = [[U-Metalllager]],
  iconType           = [[building]],
  italiandescription = [[Deposito di metallo sottomarino]],
  italianname        = [[Deposito di metallo sub]],
  maxDamage          = 1725,
  maxSlope           = 20,
  metalStorage       = 4100,
  minWaterDepth      = 28,
  name               = [[Underwater Metal Storage]],
  noAutoFire         = false,
  objectName         = [[TLLUWMStorage]],
  radarDistance      = 0,
  selfDestructAs     = [[SMALL_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 140,
  spanishdescription = [[Incrementa el almacenaje de metal]],
  spanishname        = [[Almacén Metal Subacuático]],
  threed             = 1,
  unitname           = [[tlluwmstorage]],
  unitnumber         = 856,
  version            = 3.1,
  workerTime         = 0,
  yardMap            = [[oooooooooooooooo]],
  zbuffer            = 1,
  sounds = {
    canceldestruct     = [[cancel2]],
    underattack        = [[warning1]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[stormtl1]],
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
    footprintX         = 4,
    footprintZ         = 4,
    height             = 12,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tlluwmstorage_dead]],
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
    footprintX         = 4,
    footprintZ         = 4,
    hitdensity         = 4,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[4x4a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

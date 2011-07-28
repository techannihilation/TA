-- UNITDEF -- TLLMSTOR --
--------------------------------------------------------------------------------

local unitName = "tllmstor"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 4096,
  buildCostEnergy    = 580,
  buildCostMetal     = 215,
  builder            = false,
  buildTime          = 3125,
  category           = [[TLL  LEVEL1 NOWEAPON  NOTAIR NOTSUB]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Increases Metal Storage (4000)]],
  designation        = [[TL-MS]],
  energyUse          = 0,
  explodeAs          = [[SMALL_BUILDINGEX]],
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Augmente le stockage de métal]],
  frenchname         = [[Dépôt de métal]],
  germandescription  = [[Vergrößert Lager für Metallvorräte]],
  germanname         = [[Metallspeicher]],
  iconType           = [[building]],
  italiandescription = [[Aumenta l'immagazzinamento del metallo]],
  italianname        = [[Deposito di Metallo]],
  maxDamage          = 1811,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 4000,
  name               = [[Metal Storage]],
  noAutoFire         = false,
  objectName         = [[tllMSTOR]],
  ovradjust          = 1,
  selfDestructAs     = [[SMALL_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 210,
  spanishdescription = [[Incrementa capacidad de alm. metal]],
  spanishname        = [[Almacén de Metal]],
  threed             = 1,
  unitname           = [[tllmstor]],
  unitnumber         = 893,
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
    blocking           = true,
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
    object             = [[tllmstor_dead]],
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
    object             = [[4x4b]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

-- UNITDEF -- TLLESTOR --
--------------------------------------------------------------------------------

local unitName = "tllestor"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 4096,
  buildCostEnergy    = 1470,
  buildCostMetal     = 245,
  builder            = false,
  buildTime          = 3710,
  category           = [[TLL  LEVEL1 NOWEAPON  NOTAIR NOTSUB]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Increases Energy Storage (20000)]],
  designation        = [[TL-ES]],
  energyStorage      = 20000,
  energyUse          = 0,
  explodeAs          = [[ESTOR_BUILDINGEX]],
  footprintX         = 6,
  footprintZ         = 4,
  frenchdescription  = [[Augmente le stockage d'énergie]],
  frenchname         = [[Dépôt d'énergie]],
  germandescription  = [[Vergrößert Lager für Energievorräte]],
  germanname         = [[Energiespeicher]],
  italiandescription = [[Aumenta l'immagazzinamento di energia]],
  italianname        = [[Deposito Energetico]],
  iconType           = [[building]],
  maxDamage          = 1900,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  name               = [[Energy Storage]],
  noAutoFire         = false,
  objectName         = [[TLLESTOR]],
  ovradjust          = 1,
  selfDestructAs     = [[CRAWL_BLASTSML]],
  side               = [[TLL]],
  sightDistance      = 210,
  spanishdescription = [[Incrementa capacidad de alm.energía]],
  spanishname        = [[Almacén de Energía]],
  threed             = 1,
  unitname           = [[tllestor]],
  unitnumber         = 892,
  version            = 3.1,
  workerTime         = 0,
  yardMap            = [[oooooo oooooo oooooo oooooo]],
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
      [[storngy1]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Energy Storage Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 12,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllestor_dead]],
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
    object             = [[4x4c]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

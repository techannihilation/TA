-- UNITDEF -- TLLADVSOLAR --
--------------------------------------------------------------------------------

local unitName = "tlladvsolar"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,      
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 1600,
  buildCostMetal     = 395,
  builder            = false,
  buildTime          = 7000,
  category           = [[TLL  LEVEL1 NOWEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  damageModifier     = .25,
  description        = [[Produces Energy]],
  designation        = [[AE-WPG]],
  digger             = 1,
  energyMake         = 75,
  energyStorage      = 100,
  energyUse          = 0,
  explodeAs          = [[SMALL_BUILDINGEX]],
  footprintX         = 5,
  footprintZ         = 5,
  frenchdescription  = [[Produit de l'énergie]],
  frenchname         = [[Capteur solaire/éolienne]],
  germandescription  = [[Gewinnt Energie]],
  germanname         = [[Verb. Solar-/Wind- Energieerzeuger]],
  iconType           = [[building]],
  maxDamage          = 1376,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Advanced Solar/Wind Generator]],
  noAutoFire         = false,
  objectName         = [[Tlladvsolar]],
  onoffable          = true,
  ovradjust          = 1,
  radarDistance      = 0,
  selfDestructAs     = [[SMALL_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 210,
  threed             = 1,
  unitname           = [[tlladvsolar]],
  unitnumber         = 846,
  version            = 3.1,
  windGenerator      = 25,
  workerTime         = 0,
  yardMap            = [[oooooo oooooo oooooo oooooo oooooo oooooo]],
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
      [[windgen1]],
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
    hitdensity         = 23,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tlladvsolar_dead]],
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

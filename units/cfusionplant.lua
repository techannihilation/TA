-- UNITDEF -- CFUSIONPLANT --
--------------------------------------------------------------------------------

local unitName = "cfusionplant"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 90096,
  buildCostEnergy    = 1110690,
  buildCostMetal     = 34356,
  builder            = false,
  buildTime          = 1583000,
  category           = [[ALL NOTSUB NOWEAPON SPECIAL NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Produces 20000 energy]],
  energyMake         = 20000,
  energyStorage      = 20000,
  energyUse          = 0,
  explodeAs          = [[SUPERBLAST_BUILDING]],
  floater            = true,
  footprintX         = 9,
  footprintZ         = 9,
  iconType           = [[building]],
  maxDamage          = 30000.0,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Mega Fusion Reactor]],
  noAutoFire         = false,
  objectName         = [[CFusionPlant]],
  radarDistance      = 0,
  seismicSignature   = 0,
  selfDestructAs     = [[SUPERBLAST_BUILDING]],
  side               = [[CORE]],
  sightDistance      = 300,
  smoothAnim         = true,
  TEDClass           = [[ENERGY]],
  threed             = 1,
  turnRate           = 0,
  unitname           = [[cfusionplant]],
  unitnumber         = 106,
  version            = 1,
  workerTime         = 0,
  yardMap            = [[ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo]],
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
      [[fusion2]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[core_corpses]],
    damage             = 1600400,
    description        = [[Mega Fusion Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 20,
    hitdensity         = 100,
    metal              = 20289,
    object             = [[CFusionPlant_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 840000,
    description        = [[Mega Fusion Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 4,
    hitdensity         = 100,
    metal              = 7590,
    object             = [[CFusionPlant_heap]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

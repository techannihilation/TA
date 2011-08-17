-- UNITDEF -- TLLMEGACOLDFUS --
--------------------------------------------------------------------------------

local unitName = "tllmegacoldfus"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 4096,
  buildCostEnergy    = 290000,
  buildCostMetal     = 50000,
  builder            = false,
  buildTime          = 1500000,
  category           = [[ALL NOTLAND NOTSUB NOWEAPON NOTSHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Produces Energy/ Storage]],
  designation        = [[TL-CF]],
  downloadable       = 1,
  energyMake         = 14500,
  energyStorage      = 29000,
  energyUse          = 0,
  explodeAs          = [[SUPERBLAST_BUILDING]],
  footprintX         = 7,
  footprintZ         = 7,
  frenchdescription  = [[Produit de l'énergie]],
  iconType           = [[building]],
  maxDamage          = 11380,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Mega Fusion Reactor]],
  noAutoFire         = false,
  objectName         = [[TLLMEGACOLDFUS]],
  radarDistance      = 0,
  selfDestructAs     = [[SUPERBLAST_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 210,
  threed             = 1,
  unitname           = [[tllmegacoldfus]],
  unitnumber         = 922,
  version            = 3.1,
  workerTime         = 0,
  yardMap            = [[ooooooo ooooooo ooooooo ooooooo ooooooo ooooooo ooooooo]],
  zbuffer            = 1,
  sfxtypes = {
    explosiongenerators = {
      [[custom:SmallWhiteLight]],
    },
  },
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
      [[fusion1]],
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
    object             = [[tllmegacoldfus_dead]],
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
    hitdensity         = 5,
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

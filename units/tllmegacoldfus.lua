-- UNITDEF -- TLLMEGACOLDFUS --
--------------------------------------------------------------------------------

local unitName = "tllmegacoldfus"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 4096,
  buildCostEnergy    = 938045,
  buildCostMetal     = 45575,
  builder            = false,
  buildTime          = 1200000,
  category           = [[ALL NOTLAND NOTSUB NOWEAPON NOTSHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Produces Hightly Energy/ Storage]],
  designation        = [[TL-CF]],
  downloadable       = 1,
  energyMake         = 21000,
  energyStorage      = 21000,
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
  name               = [[Advanced Fusion Reactor]],
  noAutoFire         = false,
  objectName         = [[TLLMEGACOLDFUS]],
  radarDistance      = 0,
  selfDestructAs     = [[SUPERBLAST_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 210,
  TEDClass           = [[ENERGY]],
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
    damage             = 3540,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 12,
    hitdensity         = 100,
    metal              = 28651,
    object             = [[tllmegacoldfus_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 2234,
    description        = [[Metal Shards]],
    featurereclamate   = [[smudge01]],
    footprintX         = 5,
    footprintZ         = 5,
    hitdensity         = 5,
    metal              = 10590,
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

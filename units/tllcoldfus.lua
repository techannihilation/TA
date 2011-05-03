-- UNITDEF -- TLLCOLDFUS --
--------------------------------------------------------------------------------

local unitName = "tllcoldfus"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 4096,
  buildCostEnergy    = 38045,
  buildCostMetal     = 10575,
  builder            = false,
  buildTime          = 122321,
  category           = [[ALL NOTLAND NOTSUB NOWEAPON NOTSHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Produces Hightly Energy/ Storage]],
  designation        = [[TL-CF]],
  downloadable       = 1,
  energyMake         = 3100,
  energyStorage      = 28000,
  energyUse          = 0,
  explodeAs          = [[CRBLMSSL]],
  footprintX         = 5,
  footprintZ         = 5,
  frenchdescription  = [[Produit de l'énergie]],
  iconType           = [[building]],
  maxDamage          = 11380,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Advanced Fusion Reactor]],
  noAutoFire         = false,
  objectName         = [[TLLCOLDFUS]],
  radarDistance      = 0,
  selfDestructAs     = [[CRBLMSSL1]],
  side               = [[TLL]],
  sightDistance      = 210,
  TEDClass           = [[ENERGY]],
  threed             = 1,
  unitname           = [[tllcoldfus]],
  unitnumber         = 922,
  version            = 3.1,
  workerTime         = 0,
  yardMap            = [[ooooo ooooo ooooo ooooo ooooo]],
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
    metal              = 6619,
    object             = [[tllcoldfus_dead]],
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
    metal              = 2525,
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

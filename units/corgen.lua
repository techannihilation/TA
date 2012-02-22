-- UNITDEF -- CORGEN --
--------------------------------------------------------------------------------

local unitName = "corgen"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 0,
  buildCostEnergy    = 16032,
  buildCostMetal     = 1540,
  builder            = false,
  buildPic           = [[CORGEN.DDS]],
  buildTime          = 36875,
  category           = [[CORE ENERGY LEVEL2 NOWEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights 	reserved.]],
  corpse             = [[dead]],
  description        = [[Produces Energy]],
  energyMake         = 450,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Produit de l'énergie]],
  frenchname         = [[Foreuse géothermique]],
  germandescription  = [[Liefert Energie]],
  germanname         = [[Geotherm. Bohrmaschine]],
  maxDamage          = 2200,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  name               = [[Energy Driller]],
  noAutoFire         = false,
  objectName         = [[corgen]],
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[CORE]],
  sightDistance      = 550,
  TEDClass           = [[ENERGY]],
  threed             = 1,
  unitname           = [[corgen]],
  unitnumber         = 2415,
  version            = 1,
  workerTime         = 0,
  yardMap            = [[oooo oooo oooo oooo]],
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
      [[geothrm2]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[core_corpses]],
    damage             = 153,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = 592,
    object             = [[3x3d]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 79,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = 291,
    object             = [[3x3d]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

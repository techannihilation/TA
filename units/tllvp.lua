-- UNITDEF -- TLLVP --
--------------------------------------------------------------------------------

local unitName = "tllvp"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildAngle         = 1024,
  buildCostEnergy    = 1150,
  buildCostMetal     = 675,
  builder            = true,
  buildTime          = 5850,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL LEVEL1 NOWEAPON NOTAIR NOTSUB PLANT ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Produces Vehicles]],
  designation        = [[]],
  energyStorage      = 100,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 8,
  footprintZ         = 6,
  frenchdescription  = [[Niveau Tech 1]],
  frenchname         = [[Usine de véhicules ]],
  germandescription  = [[Tech Level 1]],
  germanname         = [[Fahrzeugfabrik]],
  italiandescription = [[Produce veicoli]],
  italianname        = [[Fabbrica Veicoli]],
  iconType           = [[building]],
  maxDamage          = 2818,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 100,
  mobilestandorders  = 1,
  name               = [[Vehicle Plant]],
  noAutoFire         = false,
  objectName         = [[TLLVP]],
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 210,
  spanishdescription = [[Produce vehículos]],
  spanishname        = [[Planta Constr. Vehículos ]],
  standingfireorder  = 2,
  standingmoveorder  = 2,
  threed             = 1,
  unitname           = [[tllvp]],
  unitnumber         = 825,
  version            = 3.1,
  workerTime         = 220,
  yardMap            = [[ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo]],
  zbuffer            = 1,
  buildoptions = {
    [[tllcv]],
    [[tllgladius]],
    [[tllares]],
    [[tllsalamander]],
    [[tllariman]],
    [[tllannouncer]],
    [[tllhoplit]],
  },
  sounds = {
    build              = [[pvehwork]],
    canceldestruct     = [[cancel2]],
    underattack        = [[warning1]],
    unitcomplete       = [[untdone]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[pvehactv]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 8,
    footprintZ         = 6,
    height             = 21,
    hitdensity         = 105,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllvp_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[wreckage]],
    featureDead        = [[heap2]],
    featurereclamate   = [[smudge01]],
    footprintX         = 8,
    footprintZ         = 6,
    height             = 2,
    hitdensity         = 105,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[6x6C]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap2 = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.216,
    description        = [[wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 8,
    footprintZ         = 6,
    height             = 2,
    hitdensity         = 105,
    metal              = unitDef.buildCostMetal*0.512,
    object             = [[4x4C]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

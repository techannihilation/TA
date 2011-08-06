-- UNITDEF -- COREVP --
--------------------------------------------------------------------------------

local unitName = "corevp"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildAngle         = 1024,
  buildCostEnergy    = 21713,
  buildCostMetal     = 7268,
  builder            = true,
  buildingGroundDecalDecaySpeed = 3000,
  buildingGroundDecalSizeX = 10,
  buildingGroundDecalSizeY = 9,
  buildingGroundDecalType = [[asphalt512.dds]],
  buildTime          = 70500,
  canMove            = false,
  canPatrol          = true,
  canstop            = 1,
  category           = [[CORE PLANT LEVEL3 NOWEAPON NOTAIR NOTSUB]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Produces T3 Vehicles]],
  designation        = [[COREVP]],
  energyStorage      = 500,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 8,
  footprintZ         = 8,
  frenchdescription  = [[Produit des véhicules]],
  frenchname         = [[Usine de véhicules extrême]],
  germandescription  = [[Baut Fahrzeuge]],
  germanname         = [[Extreme Fahrzeugfabrik]],
  maxDamage          = 13910,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 500,
  mobilestandorders  = 1,
  name               = [[Experimental Vehicle Plant]],
  noAutoFire         = false,
  objectName         = [[COREVP]],
  radarDistance      = 0,
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[CORE]],
  sightDistance      = 230,
  sortbias           = 0,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  threed             = 1,
  unitname           = [[corevp]],
  unitnumber         = 8444,
  useBuildingGroundDecal = true,
  version            = 1,
  workerTime         = 250,
  yardMap            = [[cccccccc cccccccc cccccccc cccccccc cccccccc cccccccc cccccccc cccccccc]],
  zbuffer            = 1,
  buildoptions = {
    [[clb]],
    [[armtigre2]],
    [[armmcv]],
    [[rockblack]],
    [[corbt]],
    [[cormachn]],
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
    category           = [[arm_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Experimental Vehicle Plant Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 8,
    footprintZ         = 8,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[corevp_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Experimental Vehicle Plant Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 8,
    footprintZ         = 7,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[6x6d]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

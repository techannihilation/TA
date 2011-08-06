-- UNITDEF -- TLLSY --
--------------------------------------------------------------------------------

local unitName = "tllsy"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildCostEnergy    = 790,
  buildCostMetal     = 630,
  builder            = true,
  buildTime          = 6090,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL LEVEL1 NOWEAPON NOTAIR PLANT ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Produces Ships]],
  designation        = [[]],
  energyStorage      = 100,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 8,
  footprintZ         = 8,
  frenchdescription  = [[Niveau Tech 1]],
  frenchname         = [[Chantier naval  ]],
  germandescription  = [[Tech Level 1]],
  germanname         = [[Werft]],
  italiandescription = [[Produce navi]],
  italianname        = [[Cantiere Navale]],
  maxDamage          = 2510,
  metalMake          = 0.5,
  metalStorage       = 100,
  minWaterDepth      = 30,
  mobilestandorders  = 1,
  name               = [[Shipyard]],
  noAutoFire         = false,
  noshadow           = 1,
  objectName         = [[TLLSY]],
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 213,
  spanishdescription = [[Produce buques]],
  spanishname        = [[Astillero]],
  standingfireorder  = 2,
  standingmoveorder  = 2,
  threed             = 1,
  unitname           = [[tllsy]],
  unitnumber         = 849,
  version            = 3.1,
  waterline          = 22,
  workerTime         = 210,
  yardMap            = [[wCCCCCCw CCCCCCCC wCCCCCCC wCCCCCCC wCCCCCCC wCCCCCCC CCCCCCCC wCCCCCCw]],
  zbuffer            = 1,
  buildoptions = {
    [[tllcs]],
    [[tllotter]],
    [[tllboat2]],
    [[tllviolator]],
    [[tllambassador]],
    [[tllplunger]],
   },
  sounds = {
    build              = [[pshpwork]],
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
      [[pshpactv]],
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
    footprintZ         = 8,
    height             = 21,
    hitdensity         = 105,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllsy_dead]],
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
    footprintZ         = 8,
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
    footprintZ         = 8,
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

-- UNITDEF -- TLLASY --
--------------------------------------------------------------------------------

local unitName = "tllasy"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildCostEnergy    = 2580,
  buildCostMetal     = 2621,
  builder            = true,
  buildTime          = 13590,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL LEVEL2 NOWEAPON NOTAIR PLANT ]],
  collisionvolumeoffsets = [[0 0 0]],
  collisionvolumescales = [[152 103 143]],
  collisionvolumetest = 0,
  collisionvolumetype = [[Ell]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Produces T2 Ships]],
  designation        = [[]],
  energyStorage      = 200,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 9,
  footprintZ         = 9,
  frenchdescription  = [[Niveau Tech 2]],
  frenchname         = [[Chantier naval évolué]],
  germandescription  = [[Tech Level 2]],
  germanname         = [[Verbesserte Werft]],
  maxDamage          = 2901,
  metalMake          = 1,
  metalStorage       = 200,
  minWaterDepth      = 30,
  mobilestandorders  = 1,
  name               = [[Advanced Shipyard]],
  noAutoFire         = false,
  noshadow           = 1,
  objectName         = [[TLLASY]],
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 245,
  standingfireorder  = 2,
  standingmoveorder  = 2,
  threed             = 1,
  unitname           = [[tllasy]],
  unitnumber         = 858,
  version            = 3.1,
  waterline          = 22,
  workerTime         = 620,
  yardMap            = [[wCCCCCCCw wCCCCCCCw wCCCCCCCw wCCCCCCCw wCCCCCCCw wCCCCCCCw wCCCCCCCw wCCCCCCCw wCCCCCCCw]],
  zbuffer            = 1,
  buildoptions = {
    [[tllacs]],
    [[tllacsub]],
    [[tllcsub]],
    [[tllasship]],
    [[tllbats2]],
    [[tllsting]],
    [[tllequalizer]],
    [[tllviking]],
    [[tllgiant]],
    [[tllvisitor]],
    [[tllmixer]],
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
    object             = [[tllasy_dead]],
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

-- UNITDEF -- TLLALAB --
--------------------------------------------------------------------------------

local unitName = "tllalab"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildAngle         = 2048,
  buildCostEnergy    = 3794,
  buildCostMetal     = 2351,
  builder            = true,
  buildTime          = 16211,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL LEVEL2 NOWEAPON NOTAIR NOTSUB PLANT ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Produces T2 Kbots]],
  designation        = [[]],
  energyStorage      = 200,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 8,
  footprintZ         = 7,
  iconType           = [[building]],
  frenchdescription  = [[Niveau Tech 2]],
  frenchname         = [[Labo de Kbots évolué]],
  germandescription  = [[Tech Level 2]],
  germanname         = [[Verb. Kbot-Labor]],
  maxDamage          = 3311,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 200,
  mobilestandorders  = 1,
  name               = [[Advanced Kbot Lab]],
  noAutoFire         = false,
  objectName         = [[TLLALAB]],
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 220,
  standingfireorder  = 2,
  standingmoveorder  = 2,
  threed             = 1,
  unitname           = [[tllalab]],
  unitnumber         = 816,
  version            = 3.1,
  workerTime         = 400,
  yardMap            = [[ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo]],
  zbuffer            = 1,
  buildoptions = {
    [[tllack]],
    [[tllburner]],
    [[tllarchnano]],
    [[tllamphibot]],
    [[tllhrk]],
    [[tllbind]],
    [[tllcrawlb]],
    [[tllsniper]],
    [[tllartybot]],
    [[tllaak]],
    [[tlltraq]],
    [[tlldecom]],
    [[tllturtle]],
    [[tllobserver]],
    [[tllconfuser]],
  },
  sounds = {
    build              = [[plabwork]],
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
      [[plabactv]],
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
    object             = [[tllalab_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 8,
    footprintZ         = 8,
    height             = 2,
    hitdensity         = 105,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[7x7C]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

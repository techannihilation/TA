-- UNITDEF -- TLLLAB --
--------------------------------------------------------------------------------

local unitName = "tlllab"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildAngle         = 2096,
  buildCostEnergy    = 850,
  buildCostMetal     = 555,
  builder            = true,
  buildTime          = 5160,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL LEVEL1 NOWEAPON NOTAIR NOTSUB PLANT ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Produces Kbots]],
  designation        = [[]],
  energyStorage      = 100,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 6,
  footprintZ         = 6,
  iconType           = [[building]],
  frenchdescription  = [[Niveau Tech 1]],
  frenchname         = [[Labo de Kbots ]],
  germandescription  = [[Tech Level 1]],
  germanname         = [[Kbot-Labor]],
  italiandescription = [[Produce Kbot]],
  italianname        = [[Laboratorio Kbot]],
  maxDamage          = 2107,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 100,
  mobilestandorders  = 1,
  name               = [[Kbot Lab]],
  noAutoFire         = false,
  objectName         = [[TLLLAB]],
  scale              = 0.75,
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 223,
  spanishdescription = [[Produce Kbots]],
  spanishname        = [[Laboratorio Kbot]],
  standingmoveorder  = 2,
  threed             = 1,
  unitname           = [[tlllab]],
  unitnumber         = 811,
  version            = 3,
  workerTime         = 210,
  yardMap            = [[occccooccccooccccooccccooccccoocccco]],
  zbuffer            = 1,
  buildoptions = {
    [[tllck]],
    [[tllsham]],
    [[tllprivate]],
    [[tllfireraiser]],
    [[tllpbot]],
    [[tllfirestarter]],
    [[tlllasbot]],
    [[tllbug]],
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
    footprintX         = 6,
    footprintZ         = 6,
    height             = 21,
    hitdensity         = 105,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tlllab_dead]],
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
    footprintX         = 6,
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
    footprintX         = 6,
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

-- UNITDEF -- COREHPAD --
--------------------------------------------------------------------------------

local unitName = "corehpad"

--------------------------------------------------------------------------------

local unitDef = {
  ai_limit           = [[limit COREHPAD 3]],
  ai_weight          = [[weight COREHPAD 2]],
  bmcode             = 0,
  buildCostEnergy    = 17570,
  buildCostMetal     = 1250,
  builder            = true,
  buildTime          = 19981,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[CORE PLANT NOWEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Produces Helicopters]],
  designation        = [[CHP-01]],
  energyStorage      = 240,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 7,
  footprintZ         = 6,
  frenchdescription  = [[Niveau Tech 1]],
  frenchname         = [[Usine aéronautique]],
  germandescription  = [[Tech Level 1]],
  germanname         = [[Flugzeugfabrik]],
  maxDamage          = 1810,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 100,
  mobilestandorders  = 1,
  name               = [[Helipad (CORE)]],
  noAutoFire         = false,
  objectName         = [[COREHPAD]],
  radarDistance      = 800,
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[CORE]],
  sightDistance      = 225,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  threed             = 1,
  unitname           = [[corehpad]],
  unitnumber         = 100897,
  version            = 1,
  workerTime         = 190,
  yardMap            = [[ooooooo ooooooo occccco occccco occccco occccco]],
  zbuffer            = 1,
  buildoptions = {
    [[corhelo]],
    [[armtys]],
    [[chopper]],
    [[apache]],
  },
  sounds = {
    build              = [[pairwork]],
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
      [[pairactv]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[arm_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Helipad (CORE) Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CoreHPAD_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Helipad (CORE) Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[6x6a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

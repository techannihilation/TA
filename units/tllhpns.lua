-- UNITDEF -- TLLHPNS --
--------------------------------------------------------------------------------

local unitName = "tllhpns"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildCostEnergy    = 588,
  buildCostMetal     = 1033,
  builder            = true,
  buildTime          = 11007,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL PLANT LEVEL2 NOWEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Builds Hovercraft]],
  designation        = [[TLL-HP]],
  downloadable       = 1,
  energyStorage      = 200,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 8,
  footprintZ         = 7,
  frenchdescription  = [[Construit des Hovercrafts]],
  frenchname         = [[Plate-forme de construction Navy]],
  germandescription  = [[Baut Hovercrafts]],
  germanname         = [[Hovercraft-Plattform]],
  italiandescription = [[Costruisce Hovercraft]],
  italianname        = [[Piattaforma Hovercraft]],
  maxDamage          = 3888,
  maxWaterDepth      = 0,
  metalStorage       = 200,
  minWaterDepth      = 30,
  mobilestandorders  = 1,
  name               = [[Hovercraft Platform - NS]],
  noAutoFire         = false,
  noshadow           = 1,
  objectName         = [[tllHPNS]],
  radarDistance      = 0,
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[tll]],
  sightDistance      = 220,
  spanishdescription = [[Construye hovercrafts]],
  spanishname        = [[Plataforma Hovercraft]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  threed             = 1,
  unitname           = [[tllhpns]],
  unitnumber         = 26003,
  version            = 1.2,
  waterline          = 9,
  workerTime         = 500,
  yardMap            = [[wwCCCCww wwCCCCww wwCCCCww wwCCCCww wwCCCCww wwCCCCww wwCCCCww wwCCCCww]],
  zbuffer            = 1,
  buildoptions = {
    [[tllchover]],
    [[tllhoverlight]],
    [[tllhplasma]],
    [[tllhoverrocket]],
    [[tllhovermissile]],
    [[tllhovergauss]],
    [[tllsalamander]],

  },
  sounds = {
    build              = [[hoverok1]],
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
      [[hoversl1]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 8,
    footprintZ         = 7,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllhpns_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 8,
    footprintZ         = 7,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[7x7d]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------

-- UNITDEF -- TLLHP --
--------------------------------------------------------------------------------

local unitName = "tllhp"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildCostEnergy    = 1531,
  buildCostMetal     = 1155,
  builder            = true,
  buildTime          = 14105,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL PLANT LEVEL2 NOWEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Builds Hovercraft]],
  designation        = [[TLL-HP2]],
  downloadable       = 1,
  energyStorage      = 200,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 8,
  footprintZ         = 7,
  frenchdescription  = [[Construit des Hovercrafts]],
  frenchname         = [[Plate-forme de construction]],
  germandescription  = [[Baut Hovercrafts]],
  germanname         = [[Hovercraft-Plattform]],
  italiandescription = [[Costruisce Hovercraft]],
  italianname        = [[Piattaforma Hovercraft]],
  maxDamage          = 3102,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 200,
  mobilestandorders  = 1,
  name               = [[Hovercraft Platform]],
  noAutoFire         = false,
  objectName         = [[TLLHP]],
  radarDistance      = 0,
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 240,
  spanishdescription = [[Construye hovercrafts]],
  spanishname        = [[Plataforma Hovercraft]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  threed             = 1,
  unitname           = [[tllhp]],
  unitnumber         = 19103,
  version            = 1.2,
  workerTime         = 400,
  yardMap            = [[ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo]],
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
    build              = [[hoverok2]],
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
      [[hoversl2]],
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
    object             = [[tllhp_dead]],
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
